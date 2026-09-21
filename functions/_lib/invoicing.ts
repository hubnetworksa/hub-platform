// Issues a real invoice for a completed payment: a numbered, branded PDF,
// stored in R2 (so the owner and the admin can always redownload it) and
// emailed to the business owner with a copy to the site's own inbox.
//
// Called right after a `payments` row is inserted, from the two places a
// payment can complete: functions/api/subscribe/notify.ts (an existing
// business upgrading its tier, or buying a sponsorship slot) and
// src/lib/business-submission.ts (a tier chosen and paid for at signup,
// applied once the listing is approved). Both call sites already verified
// the PayFast ITN before getting here — this module only turns an already-
// confirmed payment into a document, and never decides whether a payment is
// genuine.
import type { D1Database, R2Bucket } from '@cloudflare/workers-types';
import { buildInvoicePdf, type InvoiceLine } from './invoice-pdf';
import { sendEmail } from './send-email';
import { getSite } from './site';
import { TIER_NAMES, sponsorProductLabel, isSponsorProductType, type SponsorProductType } from './pricing';

export interface InvoicingEnv {
  DB: D1Database;
  MEDIA: R2Bucket;
  RESEND_API_KEY?: string;
  SITE: string;
}

const CITY_CODE: Record<string, string> = { capetown: 'CPT', pretoria: 'PTA', polokwane: 'PLK' };

function invoiceNumberFor(siteSlug: string, paymentId: number, paidAt: Date): string {
  const code = CITY_CODE[siteSlug] ?? siteSlug.slice(0, 3).toUpperCase();
  return `INV-${code}-${paidAt.getUTCFullYear()}-${String(paymentId).padStart(6, '0')}`;
}

function toBase64(bytes: Uint8Array): string {
  // No Buffer in the Workers runtime (no nodejs_compat here) and btoa() only
  // accepts Latin1 strings, so build the binary string in chunks to stay
  // well under any call-stack argument limit — invoices are a few KB, but
  // this stays correct at any size.
  let binary = '';
  const chunk = 0x8000;
  for (let i = 0; i < bytes.length; i += chunk) {
    binary += String.fromCharCode(...bytes.subarray(i, i + chunk));
  }
  return btoa(binary);
}

/** The site's own small logo mark (not the big photographic hero banner —
 *  see invoice-pdf.ts for why), already deployed as a public static file.
 *  Functions have no filesystem access to it, so it's fetched over HTTPS
 *  from the live site itself. Never blocks invoice generation: a failed
 *  fetch just means the invoice renders without a logo. */
async function fetchLogo(domain: string): Promise<Uint8Array | null> {
  try {
    const res = await fetch(`https://${domain}/logo-icon.png`);
    if (!res.ok) return null;
    return new Uint8Array(await res.arrayBuffer());
  } catch {
    return null;
  }
}

const fmtShort = (iso: string | null): string =>
  iso ? new Date(iso.includes('T') ? iso : iso.replace(' ', 'T') + 'Z').toLocaleDateString('en-ZA', { day: 'numeric', month: 'short', year: 'numeric' }) : '';

/**
 * Builds and stores the invoice for a payment, and emails it. Safe to call
 * more than once for the same payment (a PayFast ITN can be resent): it
 * does nothing if that payment already has an invoice_number. Never throws
 * — a failure here must not break the payment webhook or the listing
 * approval it's attached to; callers should still `await` it (so R2/DB
 * writes finish before the response is sent) but need no try/catch of
 * their own.
 */
export async function issueInvoice(env: InvoicingEnv, paymentId: number): Promise<void> {
  try {
    const db = env.DB;
    const payment = await db
      .prepare(
        `SELECT p.id, p.amount_cents, p.status, p.paid_at, p.invoice_number, p.pf_payment_id,
                s.tier, s.product_type, s.product_target, s.started_at, s.current_period_end,
                b.id AS business_id, b.name AS business_name, b.address AS business_address, b.owner_user_id,
                u.email AS owner_email
         FROM payments p
         JOIN subscriptions s ON s.id = p.subscription_id
         JOIN businesses b ON b.id = s.business_id
         LEFT JOIN users u ON u.id = b.owner_user_id
         WHERE p.id = ?`
      )
      .bind(paymentId)
      .first<{
        id: number; amount_cents: number; status: string; paid_at: string; invoice_number: string | null; pf_payment_id: string | null;
        tier: number; product_type: string; product_target: string | null; started_at: string | null; current_period_end: string | null;
        business_id: number; business_name: string; business_address: string | null; owner_user_id: number | null; owner_email: string | null;
      }>();
    if (!payment || payment.invoice_number || payment.status !== 'COMPLETE') return;

    const site = getSite(env.SITE);
    const paidAt = new Date(payment.paid_at.includes('T') ? payment.paid_at : payment.paid_at.replace(' ', 'T') + 'Z');
    const invoiceNumber = invoiceNumberFor(site.slug, payment.id, paidAt);

    const description = payment.product_type === 'tier' || !isSponsorProductType(payment.product_type)
      ? `${TIER_NAMES[payment.tier] ?? 'Plan'} plan`
      : sponsorProductLabel(payment.product_type as SponsorProductType, payment.product_target);
    const period = payment.started_at && payment.current_period_end
      ? `${fmtShort(payment.started_at)} – ${fmtShort(payment.current_period_end)} (monthly)`
      : 'Monthly subscription';
    const lines: InvoiceLine[] = [{ description: `${description} — ${payment.business_name}`, detail: period, amountCents: payment.amount_cents }];

    const pdfBytes = await buildInvoicePdf({
      siteName: site.siteName,
      domain: site.domain,
      contactEmail: site.contactEmail,
      accentRgb: site.theme.accentRgb,
      navyRgb: site.theme.navyRgb,
      logoPng: await fetchLogo(site.domain),
      registeredAddress: site.invoicing?.registeredAddress ?? null,
      vatNumber: site.invoicing?.vatNumber ?? null,
      registrationNumber: site.invoicing?.registrationNumber ?? null,
      invoiceNumber,
      issuedAt: paidAt,
      billToName: payment.business_name,
      billToDetail: payment.business_address,
      billToEmail: payment.owner_email,
      lines,
      vatRatePercent: site.invoicing?.vatNumber ? 15 : 0,
      paymentMethod: 'PayFast',
      paymentReference: payment.pf_payment_id,
      paidAt,
    });

    const pdfKey = `invoices/${invoiceNumber}.pdf`;
    await env.MEDIA.put(pdfKey, pdfBytes, { httpMetadata: { contentType: 'application/pdf' } });

    await db
      .prepare(`UPDATE payments SET invoice_number = ?, invoice_pdf_key = ?, invoiced_at = datetime('now') WHERE id = ? AND invoice_number IS NULL`)
      .bind(invoiceNumber, pdfKey, payment.id)
      .run();

    const attachments = [{ filename: `${invoiceNumber}.pdf`, content: toBase64(pdfBytes), contentType: 'application/pdf' }];
    const amountRand = `R${(payment.amount_cents / 100).toLocaleString('en-ZA', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
    const dashboardUrl = `https://${site.domain}/my-businesses/edit/?id=${payment.business_id}#billing`;

    if (payment.owner_email) {
      await sendEmail(env, {
        from: `${site.siteName} <${site.contactEmail}>`,
        to: payment.owner_email,
        subject: `Your ${site.siteName} invoice ${invoiceNumber}`,
        text: `Thanks for your payment.\n\nInvoice: ${invoiceNumber}\nFor: ${description} — ${payment.business_name}\nAmount: ${amountRand}\n\nThe invoice is attached as a PDF, and you can download it again any time from your dashboard: ${dashboardUrl}`,
        html: `<div style="font-family:sans-serif;max-width:520px"><h2>Thanks for your payment</h2><p>Invoice <strong>${invoiceNumber}</strong> for ${description} — ${payment.business_name}.</p><p>Amount paid: <strong>${amountRand}</strong></p><p>The invoice is attached as a PDF. You can download it again any time from <a href="${dashboardUrl}">your dashboard</a>.</p></div>`,
        attachments,
      });
    }

    // A copy for the site's own records — the admin Invoices tab also lists and
    // can redownload every invoice from R2, but a copy in the inbox is the
    // simplest "save it to mine" the owner asked for, and needs no extra UI.
    await sendEmail(env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: site.contactEmail,
      subject: `[Invoice] ${invoiceNumber} — ${payment.business_name}`,
      text: `${description} — ${payment.business_name}\nAmount: ${amountRand}\nOwner: ${payment.owner_email ?? 'no account email on file'}\n\nStored at R2 key: ${pdfKey}`,
      attachments,
    });
  } catch (err) {
    // Never let invoicing break the payment webhook or a listing approval.
    console.error('issueInvoice failed', paymentId, err);
  }
}

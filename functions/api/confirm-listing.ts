import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { generateUniqueSlug, insertApprovedBusiness } from '../../src/lib/business-submission';
import { getSite } from '../_lib/site';
import { triggerRebuild } from '../_lib/deploy-hook';
import { sendEmail } from '../_lib/send-email';
import { ownerConfirmEmailHtml } from '../_lib/email-template';
import { logActivity } from '../_lib/activity-log';

interface Env {
  DB: D1Database;
  SITE: string;
  GITHUB_DISPATCH_TOKEN?: string;
  RESEND_API_KEY?: string;
}

interface PendingRow {
  id: number;
  name: string;
  category_slug: string;
  suburb_slug: string;
  address: string | null;
  phone: string | null;
  email: string | null;
  website: string | null;
  description: string;
  submitted_by_user_id: number | null;
  chosen_tier: number;
  m_payment_id: string | null;
  payment_status: string | null;
}

// This is the ADMIN's approve/reject step (reached from the emailed review
// link — see functions/verify-listing.ts). Approving does NOT publish
// directly — it hands off to the business owner for a second confirmation
// (see functions/owner-confirm-listing.ts + functions/api/owner-confirm-listing.ts),
// unless no owner email was given at all, in which case there's no one to
// confirm with and it publishes immediately as before.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const form = await context.request.formData();
  const token = String(form.get('token') ?? '');
  const action = String(form.get('action') ?? '');
  const db = context.env.DB;

  const row = await db
    .prepare(
      `SELECT id, name, category_slug, suburb_slug, address, phone, email, website, description,
              submitted_by_user_id, chosen_tier, m_payment_id, payment_status
       FROM pending_submissions WHERE token = ?`
    )
    .bind(token)
    .first<PendingRow>();

  if (!row) {
    return html(site, `<h1>Already handled</h1><p>This submission was already actioned — no action taken.</p>`);
  }

  if (action !== 'approve') {
    await db.prepare('DELETE FROM pending_submissions WHERE id = ?').bind(row.id).run();
    const refundNote = row.payment_status === 'paid' ? ` PAID (tier ${row.chosen_tier}, m_payment_id ${row.m_payment_id}) — needs a manual PayFast refund.` : '';
    await logActivity(db, 'submission_rejected', row.name, `Rejected by admin.${refundNote}`);
    return html(site, `<h1>Rejected</h1><p>"${escapeHtml(row.name)}" was not published.</p>`);
  }

  // No email on file — there's no owner to confirm with, so publish
  // immediately rather than block on a step that can never happen.
  if (!row.email) {
    await db.prepare('DELETE FROM pending_submissions WHERE id = ?').bind(row.id).run();

    const category = await db.prepare('SELECT id FROM categories WHERE slug = ?').bind(row.category_slug).first<{ id: number }>();
    const suburb = await db.prepare('SELECT id FROM suburbs WHERE slug = ?').bind(row.suburb_slug).first<{ id: number }>();
    if (!category || !suburb) {
      return html(site, `<h1>Couldn't publish</h1><p>The category or suburb on this submission no longer exists.</p>`);
    }
    const slug = await generateUniqueSlug(db, row.name, row.suburb_slug);
    if (!slug) {
      return html(site, `<h1>Couldn't publish</h1><p>Ran out of unique slug attempts for "${escapeHtml(row.name)}".</p>`);
    }
    await insertApprovedBusiness(db, {
      slug,
      name: row.name,
      suburbId: suburb.id,
      categoryId: category.id,
      address: row.address,
      phone: row.phone,
      website: row.website,
      email: row.email,
      description: row.description,
      ownerUserId: row.submitted_by_user_id,
      chosenTier: row.chosen_tier,
      paidMPaymentId: row.payment_status === 'paid' ? row.m_payment_id : null,
    });
    await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
    await logActivity(db, 'submission_approved', row.name, 'No email on file — published immediately.');

    return html(site, `<h1>Published!</h1><p>No contact email was given on this submission, so it published immediately: <a href="https://${site.domain}/business/${slug}/">view listing</a></p>`);
  }

  // Has an email — hand off to the owner for confirmation instead of
  // publishing directly. Row stays in pending_submissions (not deleted)
  // until the owner confirms or disputes.
  const ownerToken = crypto.randomUUID();
  await db
    .prepare(`UPDATE pending_submissions SET owner_confirm_token = ?, admin_approved_at = datetime('now') WHERE id = ?`)
    .bind(ownerToken, row.id)
    .run();

  const ownerConfirmUrl = `https://${site.domain}/owner-confirm-listing?token=${ownerToken}`;
  const detailLines = [
    `Name: ${row.name}`,
    row.address && `Address: ${row.address}`,
    row.phone && `Phone: ${row.phone}`,
    row.website && `Website: ${row.website}`,
    `Description: ${row.description}`,
  ].filter(Boolean);
  const bodyText = [
    `Hi,`,
    ``,
    `Someone listed "${row.name}" on ${site.siteName} — before it goes live, please confirm the details below are correct:`,
    ``,
    ...detailLines,
    ``,
    `Confirm or dispute here: ${ownerConfirmUrl}`,
  ].join('\n');
  const subject = `Please confirm your ${site.siteName} listing: ${row.name}`;

  const ownerHtml = ownerConfirmEmailHtml(site, {
    businessName: row.name,
    address: row.address,
    phone: row.phone,
    website: row.website,
    description: row.description,
    confirmUrl: ownerConfirmUrl,
  });

  const emailResult = await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: row.email,
    subject,
    text: bodyText,
    html: ownerHtml,
  });

  // TEMP: a separate copy while trusting the flow on the first few real
  // approvals — remove once confirmed reliable (user request, 2026-09-09).
  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: 'ethanmglindeque@gmail.com',
    subject: `[monitor copy] ${subject}`,
    text: bodyText,
    html: ownerHtml,
  });

  if (emailResult.sent) {
    await logActivity(db, 'submission_approved', row.name, `Awaiting owner confirmation — emailed ${row.email}.`);
    return html(site, `<h1>Approved — awaiting owner confirmation</h1><p>"${escapeHtml(row.name)}" won't publish yet. An email has been sent to <strong>${escapeHtml(row.email)}</strong> asking them to confirm the details before it goes live.</p>`);
  }

  // The email could not be sent (no RESEND_API_KEY for this site, or Resend
  // refused it). Nothing opens the admin's mail app — the message is shown here
  // instead so it can be copied and sent another way.
  return html(site, `
    <h1>Approved — but the email could not be sent</h1>
    <p>"${escapeHtml(row.name)}" won't publish until the owner confirms, but the confirmation email to <strong>${escapeHtml(row.email)}</strong> was not delivered (email sending is not set up or failed for this site). Send the message below to them another way:</p>
    <p><strong>Subject:</strong> ${escapeHtml(subject)}</p>
    <pre style="white-space:pre-wrap;background:#f4f4f4;padding:12px;border-radius:8px">${escapeHtml(bodyText)}</pre>
  `);
};

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}

function html(site: { siteName: string }, body: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${site.siteName}</title>
    <style>body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33}
    a{color:#1d6fe0}</style></head><body>${body}</body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}

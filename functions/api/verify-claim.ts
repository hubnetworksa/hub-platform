import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { logActivity } from '../_lib/activity-log';
import { sendEmail } from '../_lib/send-email';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// The claim link is valid for 14 days.
const MAX_AGE_DAYS = 14;

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const form = await context.request.formData();
  const token = String(form.get('token') ?? '');
  const action = String(form.get('action') ?? '');

  const claim = token
    ? await db
        .prepare(
          `SELECT bc.id, bc.business_id, bc.user_id, bc.status, bc.contact_name, bc.contact_email, bc.created_at,
                  b.name AS business_name, b.owner_user_id, u.email AS claimant_email
           FROM business_claims bc
           JOIN businesses b ON b.id = bc.business_id
           JOIN users u ON u.id = bc.user_id
           WHERE bc.verify_token = ?`
        )
        .bind(token)
        .first<{
          id: number;
          business_id: number;
          user_id: number;
          status: string;
          contact_name: string | null;
          contact_email: string | null;
          created_at: string;
          business_name: string;
          owner_user_id: number | null;
          claimant_email: string;
        }>()
    : null;

  if (!claim || claim.status !== 'pending') {
    return page(site, 'Nothing to confirm', 'This claim was already handled, or the link is not valid.');
  }

  const ageDays = (Date.now() - Date.parse(claim.created_at.replace(' ', 'T') + 'Z')) / 86_400_000;
  if (ageDays > MAX_AGE_DAYS) {
    return page(site, 'Link expired', 'This confirmation link has expired. Ask the claimant to submit the claim again.');
  }

  if (action !== 'confirm') {
    await db.prepare("UPDATE business_claims SET status = 'rejected', reviewed_at = datetime('now'), verify_token = NULL WHERE id = ?").bind(claim.id).run();
    await logActivity(db, 'claim_rejected', claim.business_name, `Claim by ${claim.claimant_email} declined from the business's own email address.`);
    return page(site, 'Claim declined', 'Thanks — nothing has changed and the listing stays unclaimed.');
  }

  if (claim.owner_user_id) {
    return page(site, 'Already claimed', 'This business has already been claimed by someone else.');
  }

  await db.batch([
    db.prepare("UPDATE business_claims SET status = 'approved', reviewed_at = datetime('now'), email_verified_at = datetime('now'), verify_token = NULL WHERE id = ?").bind(claim.id),
    db.prepare('UPDATE businesses SET owner_user_id = ? WHERE id = ? AND owner_user_id IS NULL').bind(claim.user_id, claim.business_id),
  ]);
  await logActivity(db, 'claim_approved', claim.business_name, `Claim by ${claim.claimant_email} verified from the business's own email address.`);

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: claim.contact_email || claim.claimant_email,
    subject: `Your claim on "${claim.business_name}" is verified`,
    text: `Good news${claim.contact_name ? `, ${claim.contact_name}` : ''} — the business email address confirmed your claim on "${claim.business_name}".\n\nYou can now edit the listing from My businesses: https://${site.domain}/my-businesses/`,
  });

  return page(site, 'Claim confirmed', 'Thank you. The claimant can now manage this listing from their account.');
};

function page(site: { siteName: string }, title: string, message: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex"><title>${title} — ${site.siteName}</title>
    <style>body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33;line-height:1.55}</style></head>
    <body><h1>${title}</h1><p>${message}</p></body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}

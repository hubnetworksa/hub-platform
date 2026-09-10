import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { logActivity } from '../_lib/activity-log';

interface Env {
  DB: D1Database;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const form = await context.request.formData();
  const token = String(form.get('token') ?? '');
  const action = String(form.get('action') ?? '');
  const db = context.env.DB;

  const claim = await db
    .prepare("SELECT bc.id, bc.business_id, bc.user_id, bc.status, b.name AS business_name, u.email AS claimant_email FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id WHERE bc.review_token = ?")
    .bind(token)
    .first<{ id: number; business_id: number; user_id: number; status: string; business_name: string; claimant_email: string }>();

  if (!claim || claim.status !== 'pending') {
    return html(`<h1>Already handled</h1><p>This claim was already actioned — no action taken.</p>`);
  }

  if (action !== 'approve') {
    await db.prepare("UPDATE business_claims SET status = 'rejected', reviewed_at = datetime('now') WHERE id = ?").bind(claim.id).run();
    await logActivity(db, 'claim_rejected', claim.business_name, `Claim by ${claim.claimant_email} rejected.`);
    return html(`<h1>Claim rejected</h1><p>The business remains unclaimed.</p>`);
  }

  await db.prepare("UPDATE business_claims SET status = 'approved', reviewed_at = datetime('now') WHERE id = ?").bind(claim.id).run();
  await db.prepare('UPDATE businesses SET owner_user_id = ? WHERE id = ?').bind(claim.user_id, claim.business_id).run();
  await logActivity(db, 'claim_approved', claim.business_name, `Claim by ${claim.claimant_email} approved.`);

  return html(`<h1>Claim approved</h1><p>The business is now linked to that account.</p>`);
};

function html(body: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Claim reviewed</title>
    <style>body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33}
    a{color:#1d6fe0}</style></head><body>${body}</body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}

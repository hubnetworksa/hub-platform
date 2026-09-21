import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { logActivity } from '../_lib/activity-log';

interface Env {
  DB: D1Database;
}

// Mirrors functions/api/review-claim.ts for events.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const form = await context.request.formData();
  const token = String(form.get('token') ?? '');
  const action = String(form.get('action') ?? '');
  const db = context.env.DB;

  const claim = await db
    .prepare("SELECT ec.id, ec.event_id, ec.user_id, ec.status, e.title AS event_title, u.email AS claimant_email FROM event_claims ec JOIN events e ON e.id = ec.event_id JOIN users u ON u.id = ec.user_id WHERE ec.review_token = ?")
    .bind(token)
    .first<{ id: number; event_id: number; user_id: number; status: string; event_title: string; claimant_email: string }>();

  if (!claim || claim.status !== 'pending') {
    return html(`<h1>Already handled</h1><p>This claim was already actioned — no action taken.</p>`);
  }

  if (action !== 'approve') {
    await db.prepare("UPDATE event_claims SET status = 'rejected', reviewed_at = datetime('now') WHERE id = ?").bind(claim.id).run();
    await logActivity(db, 'event_claim_rejected', claim.event_title, `Claim by ${claim.claimant_email} rejected.`);
    return html(`<h1>Claim rejected</h1><p>The event remains unclaimed.</p>`);
  }

  await db.prepare("UPDATE event_claims SET status = 'approved', reviewed_at = datetime('now') WHERE id = ?").bind(claim.id).run();
  await db.prepare('UPDATE events SET event_owner_user_id = ? WHERE id = ?').bind(claim.user_id, claim.event_id).run();
  await logActivity(db, 'event_claim_approved', claim.event_title, `Claim by ${claim.claimant_email} approved.`);

  return html(`<h1>Claim approved</h1><p>The event is now linked to that account.</p>`);
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

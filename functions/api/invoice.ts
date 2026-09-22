import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
}

// Serves one invoice PDF (see functions/_lib/invoicing.ts). Only the
// business's/event's own owner or an admin may fetch it — never
// guessable/public like the ordinary /media/ path, same pattern as
// claim-document/[[path]].ts.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return new Response('Please log in first.', { status: 401 });

  const params = new URL(context.request.url).searchParams;
  const paymentId = Number(params.get('paymentId'));
  const eventPaymentId = Number(params.get('eventPaymentId'));
  if (!paymentId && !eventPaymentId) return new Response('Missing paymentId.', { status: 400 });

  const row = eventPaymentId
    ? await db
        .prepare(
          `SELECT ep.invoice_number, ep.invoice_pdf_key, e.event_owner_user_id AS owner_user_id
           FROM event_payments ep
           JOIN events e ON e.id = ep.event_id
           WHERE ep.id = ?`
        )
        .bind(eventPaymentId)
        .first<{ invoice_number: string | null; invoice_pdf_key: string | null; owner_user_id: number | null }>()
    : await db
        .prepare(
          `SELECT p.invoice_number, p.invoice_pdf_key, b.owner_user_id
           FROM payments p
           JOIN subscriptions s ON s.id = p.subscription_id
           JOIN businesses b ON b.id = s.business_id
           WHERE p.id = ?`
        )
        .bind(paymentId)
        .first<{ invoice_number: string | null; invoice_pdf_key: string | null; owner_user_id: number | null }>();

  if (!row || !row.invoice_pdf_key) return new Response('No invoice found for that payment.', { status: 404 });
  if (row.owner_user_id !== user.id && !isAdminEmail(user.email)) return new Response('Not your invoice.', { status: 403 });

  const object = await context.env.MEDIA.get(row.invoice_pdf_key);
  if (!object) return new Response('Not found', { status: 404 });

  const headers = new Headers();
  object.writeHttpMetadata(headers as unknown as Headers);
  headers.set('etag', object.httpEtag);
  headers.set('Content-Type', 'application/pdf');
  headers.set('Content-Disposition', `inline; filename="${row.invoice_number ?? 'invoice'}.pdf"`);
  headers.set('Cache-Control', 'private, no-store');

  return new Response(object.body as unknown as BodyInit, { headers });
};

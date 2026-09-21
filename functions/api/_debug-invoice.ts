import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { issueInvoice } from '../_lib/invoicing';
import { sendEmail } from '../_lib/send-email';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
  RESEND_API_KEY?: string;
  SITE: string;
}

// TEMPORARY — for manual local testing only, deleted before commit.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const paymentId = Number(new URL(context.request.url).searchParams.get('paymentId'));
  const keyPresent = Boolean(context.env.RESEND_API_KEY);
  const probe = keyPresent
    ? await sendEmail(context.env, {
        from: 'TheCapeTownHub <hello@thecapetownhub.com>',
        to: 'ethanmglindeque@gmail.com',
        subject: '[debug] RESEND_API_KEY probe from Ethan preview',
        text: 'If you got this, Preview has a working RESEND_API_KEY.',
      })
    : { sent: false };
  await issueInvoice(context.env, paymentId);
  const row = await context.env.DB.prepare('SELECT invoice_number, invoice_pdf_key, invoiced_at FROM payments WHERE id = ?').bind(paymentId).first();
  return new Response(JSON.stringify({ keyPresent, probeSent: probe.sent, invoice: row }), { headers: { 'Content-Type': 'application/json' } });
};

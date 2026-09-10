import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';
import { sendEmail } from '../_lib/send-email';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
  SITE: string;
  RESEND_API_KEY?: string;
}

const MAX_FILES = 5;
const MAX_FILE_BYTES = 10 * 1024 * 1024; // 10MB per file

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  let form: FormData;
  try {
    form = await context.request.formData();
  } catch {
    return json({ ok: false, error: 'Invalid submission.' }, 400);
  }

  const businessId = Number(form.get('businessId'));
  if (!businessId) return json({ ok: false, error: 'Choose a business to claim.' }, 400);

  const business = await db.prepare('SELECT id, name, owner_user_id FROM businesses WHERE id = ?').bind(businessId).first<{ id: number; name: string; owner_user_id: number | null }>();
  if (!business) return json({ ok: false, error: 'Business not found.' }, 404);
  if (business.owner_user_id) return json({ ok: false, error: 'This business has already been claimed.' }, 400);

  const existingClaim = await db.prepare("SELECT 1 FROM business_claims WHERE business_id = ? AND status = 'pending'").bind(businessId).first();
  if (existingClaim) return json({ ok: false, error: 'A claim on this business is already pending review.' }, 400);

  const files = form.getAll('documents').filter((f): f is File => f instanceof File && f.size > 0);
  if (files.length === 0) return json({ ok: false, error: 'Upload at least one supporting document.' }, 400);
  if (files.length > MAX_FILES) return json({ ok: false, error: `Upload at most ${MAX_FILES} files.` }, 400);
  if (files.some((f) => f.size > MAX_FILE_BYTES)) return json({ ok: false, error: 'Each file must be under 10MB.' }, 400);

  const claimUuid = crypto.randomUUID();
  const documentKeys: string[] = [];
  for (const file of files) {
    const key = `claim-documents/${claimUuid}/${crypto.randomUUID()}-${file.name}`;
    await context.env.MEDIA.put(key, await file.arrayBuffer(), { httpMetadata: { contentType: file.type || 'application/octet-stream' } });
    documentKeys.push(key);
  }

  const reviewToken = crypto.randomUUID();
  await db
    .prepare('INSERT INTO business_claims (business_id, user_id, document_keys, review_token) VALUES (?, ?, ?, ?)')
    .bind(businessId, user.id, JSON.stringify(documentKeys), reviewToken)
    .run();

  const reviewUrl = `https://${site.domain}/review-claim?token=${reviewToken}`;
  const documentLinks = documentKeys
    .map((key, i) => `Document ${i + 1}: https://${site.domain}/claim-document/${key}?token=${reviewToken}`)
    .join('\n');

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `Business claim to review: ${business.name}`,
    text: `${user.email} wants to claim "${business.name}".\n\n${documentLinks}\n\nReview and approve/reject here: ${reviewUrl}`,
  });

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}

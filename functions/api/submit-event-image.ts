import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSite } from '../_lib/site';
import { getSessionUser } from '../_lib/auth';
import { rateLimited, json } from '../_lib/messages';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
  SITE: string;
}

const MAX_FILE_BYTES = 5 * 1024 * 1024; // 5MB — a 1200x630 poster is a few hundred KB; this is a generous ceiling
const ALLOWED_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp']);

// Uploads an organiser's event poster for the "List your event free" form
// (src/pages/events/add.astro) — an upload, not a pasted link, so we always
// have a real copy of the image rather than trusting a URL that can 404 or
// change later. Requires a session, exactly like submit-event.ts: without
// one this was free anonymous image hosting straight into the production
// bucket (every such upload orphaned, since the matching submit is 401).
// The rate limit stays as a second guard against a logged-in user filling R2.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);
  if (await rateLimited(db, context.request, site.slug, 'submit-event-image', 10)) {
    return json({ ok: false, error: 'Too many uploads from your connection. Please try again in an hour.' }, 429);
  }

  let form: FormData;
  try {
    form = await context.request.formData();
  } catch {
    return json({ ok: false, error: 'Invalid upload.' }, 400);
  }

  const file = form.get('photo');
  if (!(file instanceof File) || file.size === 0) return json({ ok: false, error: 'Choose a poster image to upload.' }, 400);
  if (file.size > MAX_FILE_BYTES) return json({ ok: false, error: 'That image is over 5MB — please use a smaller file.' }, 400);
  if (!ALLOWED_TYPES.has(file.type)) return json({ ok: false, error: 'Please upload a JPG, PNG or WEBP image.' }, 400);

  const ext = file.type === 'image/png' ? 'png' : file.type === 'image/webp' ? 'webp' : 'jpg';
  const key = `event-submissions/${crypto.randomUUID()}.${ext}`;
  await context.env.MEDIA.put(key, await file.arrayBuffer(), { httpMetadata: { contentType: file.type } });

  return json({ ok: true, url: `/media/${key}` });
};

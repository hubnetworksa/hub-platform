import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../../_lib/auth';
import { json } from '../../_lib/messages';
import { getSite } from '../../_lib/site';
import { createRep, repShareUrl } from '../../_lib/reps';
import { logActivity } from '../../_lib/activity-log';
import { sendEmail } from '../../_lib/send-email';
import { repWelcomeEmailHtml, repWelcomeEmailText } from '../../_lib/email-template';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'unauthorized' }, 401);

  const site = getSite(context.env.SITE);
  const before = await db.prepare('SELECT id FROM sales_reps WHERE user_id = ?').bind(user.id).first<{ id: number }>();
  const rep = await createRep(db, user.id);
  const created = !before;
  const shareUrl = repShareUrl(site, rep.code);

  if (created) {
    try {
      await logActivity(db, 'rep_joined', null, `${user.email} became a sales rep (${rep.code}).`);
    } catch {
      /* history is best-effort */
    }
    try {
      const data = { code: rep.code, shareUrl, dashboardUrl: `https://${site.domain}/rep-dashboard/` };
      await sendEmail(context.env, {
        from: `${site.siteName} <${site.contactEmail}>`,
        to: user.email,
        subject: `Your ${site.siteName} rep code`,
        text: repWelcomeEmailText(site, data),
        html: repWelcomeEmailHtml(site, data),
      });
    } catch {
      /* never block joining on an email */
    }
  }
  return json({ ok: true, code: rep.code, shareUrl, created });
};

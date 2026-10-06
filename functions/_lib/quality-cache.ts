import type { D1Database } from '@cloudflare/workers-types';

// Hub Admin's Listings screen caches each city's quality report for up to a
// day (admin-app/functions/api/listings.ts), refreshing early only through a
// rate-limited "Recheck now" click. A native-admin action here (hide, mark
// closed, delete, edit) changes what that report should say but never
// touches Hub Admin's own database, so without this marker the cached
// report would keep the old answer — e.g. a duplicate pair that's since
// been hidden — for up to a day. Every such action bumps this timestamp;
// Hub Admin compares it against its cache's own age and refreshes early
// when it's newer, regardless of the usual windows. Same site_settings
// key/value shape as the rebuild-debounce markers in deploy-hook.ts.
export async function markBusinessesChanged(db: D1Database): Promise<void> {
  await db
    .prepare(
      `INSERT INTO site_settings (key, value, updated_at) VALUES ('meta_businesses_changed_ms', ?, datetime('now'))
       ON CONFLICT(key) DO UPDATE SET value = excluded.value, updated_at = excluded.updated_at`
    )
    .bind(String(Date.now()))
    .run();
}

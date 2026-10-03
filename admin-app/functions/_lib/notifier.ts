import { hubSites, type Env } from './sites';
import { siteQueue, QUEUES, type QueueItem } from './queues';
import { pushToSubscribers } from './webpush';

// Finds items that arrived in any site's "needs attention" queues since the
// last check and, if there are any, records one notification and pushes it to
// every device that wants those types. Run every 5 minutes by the notifier
// Worker (admin-app/notifier/).
//
// "Seen up to" is kept per site and queue type (settings key
// seen:<site>:<type>, the newest created_at already announced). The very
// first check for a site/type only records where things stand, so turning
// this on never floods anyone with old items.

const LABELS = Object.fromEntries(QUEUES.map(([type, label]) => [type, label]));

function plural(n: number, word: string): string {
  const lower = word.toLowerCase();
  return n === 1 ? `1 ${lower}` : `${n} ${lower.endsWith('y') ? `${lower.slice(0, -1)}ies` : `${lower}s`}`;
}

export async function checkAndNotify(env: Env): Promise<{ newItems: number; sent: number }> {
  const db = env.ADMIN_DB;
  const seenRows = (await db.prepare(`SELECT key, value FROM settings WHERE key LIKE 'seen:%'`).all<{ key: string; value: string }>()).results ?? [];
  const seen = new Map(seenRows.map((r) => [r.key, r.value]));
  const fresh: QueueItem[] = [];
  const marks: [string, string][] = [];

  for (const site of hubSites(env)) {
    const items = await siteQueue(site);
    for (const [type] of QUEUES) {
      const key = `seen:${site.slug}:${type}`;
      const ofType = items.filter((i) => i.type === type);
      const newest = ofType.reduce((m, i) => (i.created_at > m ? i.created_at : m), '');
      const mark = seen.get(key);
      if (mark === undefined) {
        // First look at this site/type: start from now, announce nothing.
        marks.push([key, newest || new Date().toISOString().replace('T', ' ').slice(0, 19)]);
        continue;
      }
      const added = ofType.filter((i) => i.created_at > mark);
      if (added.length) {
        fresh.push(...added);
        marks.push([key, newest]);
      }
    }
  }

  for (const [key, value] of marks) {
    await db
      .prepare(`INSERT INTO settings (key, value) VALUES (?, ?) ON CONFLICT(key) DO UPDATE SET value = excluded.value, updated_at = datetime('now')`)
      .bind(key, value)
      .run();
  }
  if (!fresh.length) return { newItems: 0, sent: 0 };

  const sites = hubSites(env);
  const city = (slug: string) => sites.find((s) => s.slug === slug)?.city ?? slug;
  const byType = new Map<string, QueueItem[]>();
  for (const it of fresh) byType.set(it.type, [...(byType.get(it.type) ?? []), it]);
  const types = [...byType.keys()];

  let title: string;
  let body: string;
  if (fresh.length === 1) {
    const it = fresh[0];
    title = `${it.label} · ${city(it.site)}`;
    body = it.detail ? `${it.title} (${it.detail})` : it.title;
  } else {
    title = `${fresh.length} new items need attention`;
    body = types
      .map((t) => {
        const list = byType.get(t)!;
        const cities = [...new Set(list.map((i) => city(i.site)))].join(', ');
        return `${plural(list.length, LABELS[t] ?? t)} (${cities})`;
      })
      .join(' · ');
  }
  const url = types.length === 1 ? `/#/?type=${types[0]}` : '/#/';
  await db.prepare('INSERT INTO notifications (title, body, url, types) VALUES (?, ?, ?, ?)').bind(title.slice(0, 120), body.slice(0, 300), url, JSON.stringify(types)).run();
  await db.prepare(`DELETE FROM notifications WHERE created_at < datetime('now', '-60 days')`).run();
  const { sent } = await pushToSubscribers(db, types);
  return { newItems: fresh.length, sent };
}

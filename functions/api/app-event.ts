import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { rateLimited } from '../_lib/messages';

interface Env {
  DB: D1Database;
  SITE: string;
}

// Anonymous installed-app counter behind the admin dashboard's "App installs"
// tiles. Fired by src/components/InstallPrompt.astro: 'install' when the
// browser reports the app was installed, 'open' at most once a day per device
// while the site runs as an installed app. device_id is a random id the phone
// generated for itself — no IP address, user id or other personal data is
// stored (the IP is only hashed transiently by rateLimited).
const EVENTS = new Set(['install', 'open']);
const PLATFORMS = new Set(['android', 'ios', 'desktop', 'other']);
const DEVICE_ID = /^[A-Za-z0-9_-]{16,64}$/;

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const done = () => new Response(null, { status: 204 });
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return done(); // beacons never get an error page rendered at them
  }
  if (!body || typeof body !== 'object') return done();

  const event = typeof body.event === 'string' ? body.event : '';
  const deviceId = typeof body.device_id === 'string' ? body.device_id : '';
  const platform = typeof body.platform === 'string' && PLATFORMS.has(body.platform) ? body.platform : 'other';
  if (!EVENTS.has(event) || !DEVICE_ID.test(deviceId)) return done();

  const db = context.env.DB;
  if (await rateLimited(db, context.request, context.env.SITE ?? 'site', 'app-event', 30)) return done();

  if (event === 'install') {
    // One install per device, however many times the browser re-reports it.
    await db
      .prepare(
        `INSERT INTO app_events (event, device_id, platform)
         SELECT 'install', ?1, ?2
         WHERE NOT EXISTS (SELECT 1 FROM app_events WHERE device_id = ?1 AND event = 'install')`
      )
      .bind(deviceId, platform)
      .run();
  } else {
    await db.prepare(`INSERT INTO app_events (event, device_id, platform) VALUES ('open', ?, ?)`).bind(deviceId, platform).run();
  }
  return done();
};

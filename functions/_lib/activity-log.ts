import type { D1Database } from '@cloudflare/workers-types';

// One row per admin-facing decision, written right before the
// pending_submissions/business_claims row that recorded it gets deleted —
// those tables hold working state only, this is what survives as history.
export async function logActivity(db: D1Database, kind: string, businessName: string | null, detail: string): Promise<void> {
  await db.prepare('INSERT INTO activity_log (kind, business_name, detail) VALUES (?, ?, ?)').bind(kind, businessName, detail).run();
}

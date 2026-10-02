// Unconfirmed email/password sign-ups that nobody finished: shared by the
// nightly tidy (scripts/tidy-expired.mjs) and its tests. An account counts as
// stale when it never confirmed its email within STALE_DAYS, is not a Google
// account or the admin, and has nothing attached to it (no business, claim,
// review or submission), so deleting it loses no one's work.
export const STALE_UNVERIFIED_DAYS = 7;

const ATTACHED = [
  ['businesses', 'owner_user_id'],
  ['business_claims', 'user_id'],
  ['event_claims', 'user_id'],
  ['pending_submissions', 'submitted_by_user_id'],
  ['event_submissions', 'submitted_by_user_id'],
  ['events', 'event_owner_user_id'],
  ['reviews', 'user_id'],
];

export const staleUnverifiedWhere = `
  u.email_verified_at IS NULL
  AND u.google_sub IS NULL
  AND lower(u.email) <> 'hubnetworksa@gmail.com'
  AND datetime(u.created_at) < datetime('now', '-${STALE_UNVERIFIED_DAYS} days')
  ${ATTACHED.map(([t, c]) => `AND NOT EXISTS (SELECT 1 FROM ${t} x WHERE x.${c} = u.id)`).join('\n  ')}`;

export const staleUnverifiedIds = `SELECT u.id FROM users u WHERE ${staleUnverifiedWhere}`;

/** Statements that remove the stale accounts (child rows first). */
export const deleteStaleUnverifiedStatements = [
  `DELETE FROM sessions WHERE user_id IN (${staleUnverifiedIds});`,
  `DELETE FROM auth_tokens WHERE user_id IN (${staleUnverifiedIds});`,
  `DELETE FROM announcement_sends WHERE user_id IN (${staleUnverifiedIds});`,
  `DELETE FROM users WHERE id IN (${staleUnverifiedIds});`,
];

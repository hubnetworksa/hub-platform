-- Email/password sign-ups must confirm their address by link before the
-- account can be used (functions/api/register.ts, functions/verify-email.ts).
-- NULL = unconfirmed. Everyone who exists today is backfilled as confirmed so
-- no current customer (or the admin account) is locked out; Google accounts
-- are confirmed on creation because Google already verified the address.
ALTER TABLE users ADD COLUMN email_verified_at TEXT;
UPDATE users SET email_verified_at = COALESCE(created_at, datetime('now'));

-- auth_tokens gets a second purpose, 'email_verify'. SQLite can't alter a
-- CHECK constraint, so the table is rebuilt (live password-reset links are
-- copied across).
CREATE TABLE auth_tokens_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  purpose TEXT NOT NULL CHECK (purpose IN ('password_reset', 'email_verify')),
  token_hash TEXT NOT NULL UNIQUE,
  expires_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
INSERT INTO auth_tokens_new (id, user_id, purpose, token_hash, expires_at, created_at)
  SELECT id, user_id, purpose, token_hash, expires_at, created_at FROM auth_tokens;
DROP TABLE auth_tokens;
ALTER TABLE auth_tokens_new RENAME TO auth_tokens;
CREATE INDEX idx_auth_tokens_user ON auth_tokens(user_id, purpose);

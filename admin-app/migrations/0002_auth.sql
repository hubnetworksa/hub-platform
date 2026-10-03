-- Hub Admin's own login: username + password, and passkeys (fingerprint /
-- face unlock) per device. Replaces Cloudflare Access.

CREATE TABLE admin_users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL UNIQUE COLLATE NOCASE,
  password_hash TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  last_login_at TEXT
);

-- Only a SHA-256 of each session token is stored, so a copy of this table
-- can't be used to sign in.
CREATE TABLE admin_sessions (
  token_hash TEXT PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  expires_at TEXT NOT NULL,
  last_seen_at TEXT NOT NULL DEFAULT (datetime('now')),
  method TEXT NOT NULL DEFAULT 'password'
);
CREATE INDEX idx_admin_sessions_user ON admin_sessions (user_id);

-- WebAuthn passkeys. id = the credential id (base64url); public_key = SPKI
-- (base64url); alg = COSE algorithm (-7 ES256, -257 RS256).
CREATE TABLE passkeys (
  id TEXT PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
  public_key TEXT NOT NULL,
  alg INTEGER NOT NULL,
  sign_count INTEGER NOT NULL DEFAULT 0,
  name TEXT NOT NULL DEFAULT 'Passkey',
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  last_used_at TEXT
);

-- One-time WebAuthn challenges (5 minutes).
CREATE TABLE auth_challenges (
  challenge TEXT PRIMARY KEY,
  kind TEXT NOT NULL CHECK (kind IN ('register', 'login')),
  user_id INTEGER,
  expires_at TEXT NOT NULL
);

-- Failed sign-in / setup / recovery attempts, for rate limiting.
CREATE TABLE auth_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  kind TEXT NOT NULL,
  ip_hash TEXT NOT NULL,
  username TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_auth_attempts ON auth_attempts (kind, ip_hash, created_at);

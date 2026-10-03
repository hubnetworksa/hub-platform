-- One-time invite links for adding another admin (e.g. Guy). The link holds
-- a random token; only its SHA-256 is stored. 48 hours, single use. The
-- invited person chooses their own password, so nobody else ever knows it.
CREATE TABLE admin_invites (
  token_hash TEXT PRIMARY KEY,
  username TEXT NOT NULL COLLATE NOCASE,
  created_by INTEGER NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  expires_at TEXT NOT NULL,
  used_at TEXT
);
CREATE INDEX idx_admin_invites_username ON admin_invites (username);

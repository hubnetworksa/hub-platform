-- Core schema: suburbs, categories, businesses, and the business<->category
-- join table (a business can carry up to 3 categories, one marked primary,
-- matching Polokwane.info's multi-category listing pattern).

CREATE TABLE suburbs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  region TEXT NOT NULL CHECK (region IN ('pretoria', 'centurion', 'gauteng-other')),
  bio TEXT,
  landmarks TEXT, -- JSON array of strings
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE businesses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  suburb_id INTEGER NOT NULL REFERENCES suburbs(id),
  address TEXT,
  phone TEXT,
  website TEXT,
  email TEXT,
  description TEXT NOT NULL,
  lat REAL,
  lng REAL,
  -- JSON array of the URLs a fact was actually fetched from. Required for
  -- any row written by the research routine; self-submitted rows may carry
  -- a single "owner-submitted" marker instead. Never a Google Maps/Places URL.
  source_urls TEXT NOT NULL,
  -- 'published' = live on the site. 'rejected' = kept for audit/dedupe only,
  -- never rendered. There is no pending/review state by design (see plan).
  status TEXT NOT NULL DEFAULT 'published' CHECK (status IN ('published', 'rejected')),
  origin TEXT NOT NULL CHECK (origin IN ('seed_import', 'agent_research', 'owner_submitted')),
  verified_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE business_categories (
  business_id INTEGER NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  is_primary INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (business_id, category_id)
);

CREATE INDEX idx_businesses_suburb ON businesses(suburb_id);
CREATE INDEX idx_businesses_status ON businesses(status);
CREATE INDEX idx_business_categories_category ON business_categories(category_id);

-- Google Visibility monitor: Google's own index verdict (Search Console URL
-- Inspection API), checked live per published business page on Pretoria and
-- Polokwane (Cape Town excluded per the brief). Filled by
-- admin-app/functions/api/gsv/run.ts every ~3 hours; read by the #/gsv screen.

-- One row per business URL ever discovered. Rows are never deleted when a
-- business is unpublished/closed, so history survives.
CREATE TABLE gsv_urls (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  site TEXT NOT NULL,                 -- 'pretoria' | 'polokwane'
  business_id INTEGER NOT NULL,       -- id in that city's own D1
  slug TEXT NOT NULL,
  name TEXT NOT NULL,
  url TEXT NOT NULL,                  -- https://<domain>/business/<slug>/
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','indexed','not_indexed','unknown')),
  coverage_state TEXT,                -- Google's raw text, e.g. "Submitted and indexed"
  last_attempt_at TEXT,
  last_success_at TEXT,
  consecutive_not_indexed INTEGER NOT NULL DEFAULT 0,
  total_indexed_checks INTEGER NOT NULL DEFAULT 0,
  total_not_indexed_checks INTEGER NOT NULL DEFAULT 0,
  claimed_at TEXT,                    -- in-flight marker, prevents double-processing
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE(site, url)
);
CREATE INDEX idx_gsv_urls_due ON gsv_urls(site, status, last_attempt_at);

-- Every individual Inspection API call, for the per-URL history panel.
-- Pruned past 180 days by run.ts.
CREATE TABLE gsv_checks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gsv_url_id INTEGER NOT NULL REFERENCES gsv_urls(id),
  checked_at TEXT NOT NULL DEFAULT (datetime('now')),
  status TEXT NOT NULL,
  coverage_state TEXT,
  duration_ms INTEGER,
  error TEXT
);
CREATE INDEX idx_gsv_checks_url_time ON gsv_checks(gsv_url_id, checked_at DESC);

-- Daily per-site rollup for the trend chart.
CREATE TABLE gsv_daily (
  day TEXT NOT NULL, site TEXT NOT NULL,
  indexed INTEGER, not_indexed INTEGER, unknown INTEGER, pending INTEGER, checked INTEGER,
  PRIMARY KEY (day, site)
);

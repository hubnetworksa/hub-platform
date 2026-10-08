-- Daily snapshot per site of how Google sees it, so indexing-state trends exist
-- from the day this was added. Filled by notify/report.ts when the daily Google
-- report arrives; read by the Site recovery screen.
CREATE TABLE recovery_daily (
  day TEXT NOT NULL,
  site TEXT NOT NULL,
  impressions INTEGER,
  clicks INTEGER,
  pages_seen INTEGER,
  position REAL,
  indexed_sample INTEGER,
  sampled INTEGER,
  key_pages_indexed INTEGER,
  sitemap_urls INTEGER,
  PRIMARY KEY (day, site)
);

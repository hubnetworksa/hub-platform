-- Local news: short articles the daily news agent writes in its own words
-- from facts it has corroborated across independent sources (never copied
-- text — see ROUTINE.news.<city>.md). Each row credits and links its
-- sources; `verification_json` is the audit trail of every source read.
-- Admin can remove an article from the admin News tab.
CREATE TABLE news (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  category TEXT NOT NULL DEFAULT 'Community',
  published_date TEXT NOT NULL,
  source_name TEXT NOT NULL,
  source_url TEXT NOT NULL,
  summary TEXT NOT NULL,
  body TEXT NOT NULL,
  image_url TEXT,
  image_credit TEXT,
  image_source TEXT,
  verification_json TEXT NOT NULL DEFAULT '[]',
  source TEXT NOT NULL DEFAULT 'agent',
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_news_date ON news(published_date);

-- Regulated South African fuel prices (announced monthly, effective the first
-- Wednesday). One row per month + region + grade; the news routine inserts
-- them from the official announcement. Cape Town is 'coastal', Pretoria and
-- Polokwane are 'inland'.
CREATE TABLE fuel_prices (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  period TEXT NOT NULL,
  region TEXT NOT NULL,
  grade TEXT NOT NULL,
  price_cents INTEGER NOT NULL,
  change_cents INTEGER NOT NULL DEFAULT 0,
  source_url TEXT NOT NULL,
  verification_json TEXT NOT NULL DEFAULT '[]',
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (period, region, grade)
);

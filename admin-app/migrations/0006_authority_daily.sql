-- Domain authority (Open PageRank, 0-10) per site per day, filled from the
-- daily Google report.
CREATE TABLE authority_daily (
  day TEXT NOT NULL,
  site TEXT NOT NULL,
  score REAL NOT NULL,
  rank INTEGER,
  PRIMARY KEY (day, site)
);

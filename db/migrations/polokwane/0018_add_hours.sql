-- Free-text trading hours (e.g. "Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun
-- Closed"), nullable -- most businesses won't have this until the
-- description-enrichment job (or manual research) fills it in.
ALTER TABLE businesses ADD COLUMN hours TEXT;

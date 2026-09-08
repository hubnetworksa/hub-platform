-- Adds a category for the museums/heritage sites listed on the Tourism
-- Information page (see src/pages/pretoria-tourism-information.astro) —
-- nothing in the existing taxonomy fits a museum or national monument.

INSERT INTO categories (slug, name) VALUES
  ('museums-heritage-sites', 'Museums & Heritage Sites');

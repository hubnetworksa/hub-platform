-- Starting suburb/area list from the build plan's Geographic Scope section.
-- This is data, not code — adding more areas later is just another INSERT,
-- not a migration.

INSERT INTO suburbs (slug, name, region) VALUES
  ('pretoria-central', 'Pretoria Central', 'pretoria'),
  ('centurion', 'Centurion', 'centurion'),
  ('akasia', 'Akasia', 'pretoria'),
  ('montana', 'Montana', 'pretoria'),
  ('silverlakes', 'Silver Lakes', 'pretoria'),
  ('faerie-glen', 'Faerie Glen', 'pretoria'),
  ('menlyn', 'Menlyn', 'pretoria'),
  ('waterkloof', 'Waterkloof', 'pretoria'),
  ('hatfield', 'Hatfield', 'pretoria'),
  ('atteridgeville', 'Atteridgeville', 'pretoria'),
  ('mamelodi', 'Mamelodi', 'pretoria'),
  ('soshanguve', 'Soshanguve', 'pretoria'),
  ('hammanskraal', 'Hammanskraal', 'pretoria'),
  ('cullinan', 'Cullinan', 'pretoria'),
  ('bronkhorstspruit', 'Bronkhorstspruit', 'pretoria'),
  ('midrand', 'Midrand', 'gauteng-other');

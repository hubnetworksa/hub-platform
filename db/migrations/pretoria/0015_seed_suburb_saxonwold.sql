-- Adds Saxonwold (Johannesburg) under region 'gauteng-other', the same
-- pattern already used for Midrand, so the Ditsong Museum of Military
-- History can have a real, correctly-located listing rather than being
-- misassigned to a Pretoria suburb.

INSERT INTO suburbs (slug, name, region) VALUES
  ('saxonwold', 'Saxonwold', 'gauteng-other');

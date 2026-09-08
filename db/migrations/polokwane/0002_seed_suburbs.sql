-- Starting suburb/area list for Polokwane and the greater Capricorn District.
-- This is data, not code — adding more areas later is just another INSERT,
-- not a migration. Owner should review/correct this list (names, spellings,
-- which region each falls under) — it was drafted, not sourced from a
-- definitive municipal list.
--
-- region 'polokwane'    = suburbs of the city itself
-- region 'seshego'      = the Seshego township cluster ~8km west
-- region 'limpopo-other'= outlying towns kept for correctly-located listings

INSERT INTO suburbs (slug, name, region) VALUES
  ('polokwane-central', 'Polokwane Central', 'polokwane'),
  ('bendor', 'Bendor', 'polokwane'),
  ('bendor-park', 'Bendor Park', 'polokwane'),
  ('flora-park', 'Flora Park', 'polokwane'),
  ('fauna-park', 'Fauna Park', 'polokwane'),
  ('sterpark', 'Sterpark', 'polokwane'),
  ('ivy-park', 'Ivy Park', 'polokwane'),
  ('welgelegen', 'Welgelegen', 'polokwane'),
  ('nirvana', 'Nirvana', 'polokwane'),
  ('westenburg', 'Westenburg', 'polokwane'),
  ('ladanna', 'Ladanna', 'polokwane'),
  ('superbia', 'Superbia', 'polokwane'),
  ('penina-park', 'Penina Park', 'polokwane'),
  ('serala-view', 'Serala View', 'polokwane'),
  ('annadale', 'Annadale', 'polokwane'),
  ('dalmada', 'Dalmada', 'polokwane'),
  ('broadlands', 'Broadlands', 'polokwane'),
  ('southern-gateway', 'Southern Gateway', 'polokwane'),
  ('eduan-park', 'Eduan Park', 'polokwane'),
  ('thornhill-estate', 'Thornhill Estate', 'polokwane'),
  ('moregloed', 'Moregloed', 'polokwane'),
  ('hospark', 'Hospital Park', 'polokwane'),
  ('capricorn', 'Capricorn', 'polokwane'),
  ('extension-71', 'Extension 71', 'polokwane'),
  ('extension-76', 'Extension 76', 'polokwane'),
  ('seshego', 'Seshego', 'seshego'),
  ('seshego-zone-1', 'Seshego Zone 1', 'seshego'),
  ('seshego-zone-4', 'Seshego Zone 4', 'seshego'),
  ('mankweng', 'Mankweng', 'limpopo-other'),
  ('lebowakgomo', 'Lebowakgomo', 'limpopo-other');

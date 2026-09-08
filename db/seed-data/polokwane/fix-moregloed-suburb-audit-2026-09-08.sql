-- Suburb audit (2026-09-08): businesses filed under Moregloed that are
-- actually in Polokwane Central. Moregloed is the residential pocket on the
-- Ireland / Johnson / Webster / Kleinberg streets; the Grobler Street retail
-- strip (Palm/Checkers Centre, Library Gardens, and the standalone Grobler
-- St shops) is Polokwane Central per Waze/Google geocoding, Property24
-- ("44c Grobler Street, Polokwane Central"; "Hans van Rensburg Street,
-- Polokwane Central") and owner local knowledge (Bradlows @ Grobler &
-- Market = CBD).
--
-- suburb_id 1 = polokwane-central, 21 = moregloed.  Slugs keep their
-- "-moregloed" suffix (identity is by slug; changing it would break the
-- routine's matching) — only suburb_id changes.

UPDATE businesses SET suburb_id = 1 WHERE slug IN (
  'bradlows-moregloed',
  'japie-visser-pharmacy-moregloed',
  'vleislapa-moregloed',
  'med-express-pharmacy-moregloed',
  'palm-health-moregloed',
  'checkers-palm-centre-moregloed',
  'freelance-photo-centre-moregloed',
  'italfurn-furniture-moregloed',
  'key-sound-centre-moregloed',
  'mini-printers-moregloed',
  'romans-pizza-palm-centre-moregloed',
  'skydiva-hair-moregloed',
  'galitos-library-gardens-moregloed',
  'i-d-studio-photos-and-photocopies-moregloed'
);

-- Palm Centre (same intersection / same physical centre as the separate
-- "Checkers Centre" row — a likely duplicate to reconcile later) sits in
-- the CBD, not Moregloed.
UPDATE shopping_centers SET suburb_id = 1 WHERE slug = 'palm-centre-moregloed';

UPDATE shopping_centers SET description =
  'A convenience centre on the corner of Hans van Rensburg and Grobler Streets in the northern part of the Polokwane CBD, with a Checkers supermarket and everyday shops and services.'
WHERE slug = 'palm-centre-moregloed';

-- Left as Moregloed (confirmed): 61 on Ireland Guest House, Woofels Doggie
-- Parlour, Sidze Guest House, Body Base Studio, Ligthelm Accountants.
-- Needs manual review (sources split Moregloed vs Bendor): Laerskool
-- Pietersburg-Oos, 102 Kleinenberg St.

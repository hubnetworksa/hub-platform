-- Websites checked on 2026-09-20: two domains do not exist, one serves a 404 and one a 500.
UPDATE businesses SET website = NULL WHERE slug IN ('arc-zonnebloem','amare-bantry-bay','lees-chinese-bergvliet','apnisleep-sea-point');

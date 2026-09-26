-- Makro Polokwane — user asked "is Makro listed?" (2026-09-26). It wasn't:
-- Makro has published listings in Pretoria but none in Polokwane.
--
-- www.makro.co.za (the store finder the user asked to use) is blocked by
-- this sandbox's network egress proxy, a known limitation (see
-- ROUTINE.polokwane.md, "A known environment limitation"). Falling back to
-- the routine's documented fallback — explicit WebSearch snippets as
-- sources, same 2-independent-source bar as any other new business:
--   1. dir.alltrack.org's directory listing states the exact pairing
--      "Makro 1 Marmer St, Polokwane, Limpopo. Post Code: 0700
--      Tel: 015 101 100" — name, address and phone all together, for this
--      specific branch.
--   2. Waze's own place listing independently confirms name + address:
--      "Makro Store Polokwane, 1 Marmer St, Magna Via, Polokwane".
-- (Deliberately NOT using the 0860 600 999 number surfaced elsewhere —
-- that's Makro's national customer-service line, not verified as this
-- branch's own number, per the routine's chain cross-check rule.)
--
-- Magna Via is treated as part of Bendor elsewhere in this dataset (see
-- db/routine-updates/polokwane/2026-09-16T13-05-30.sql, Vertex Boreholes),
-- so this follows that precedent rather than adding a new suburb.
--
-- No verified lat/lng found in either source — left NULL rather than
-- guessed, consistent with other entries added this way (e.g. Food Lover's
-- Market The Farmyard).

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'makro-polokwane-bendor', 'Makro Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '1 Marmer St, Magna Via, Bendor, Polokwane, 0700', '015 101 100', 'https://www.makro.co.za/pages/store-finder', NULL,
  'Makro Polokwane is a large-format wholesale and retail warehouse store in the Magna Via area of Polokwane, stocking groceries, liquor, electronics, homeware, DIY and bulk goods.',
  NULL, NULL,
  '["https://dir.alltrack.org/view/274458-1-makro", "https://www.waze.com/live-map/directions/makro-store-polokwane-marmer-st-1-magna-via,-polokwane?to=place.w.19334681.193150205.1885229"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'makro-polokwane-bendor'),
        (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

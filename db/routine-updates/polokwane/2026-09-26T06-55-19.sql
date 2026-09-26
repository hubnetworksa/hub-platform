-- Applies the seed-data written earlier today for Makro Polokwane /
-- Magna Via Industrial. These already live permanently as documentation
-- under db/seed-data/polokwane/ (makro-polokwane-2026-09-26.sql,
-- fix-vertex-boreholes-magna-via-2026-09-26.sql,
-- magna-via-bio-2026-09-26.sql) but that directory is never applied to
-- the live D1 database by CI -- only db/routine-updates/<site>/ is
-- (see .github/workflows/deploy.yml, "Apply pending routine SQL
-- updates"). Re-filed here, verbatim, purely so the next deploy actually
-- runs them against the live database; this file is deleted by that same
-- deploy step once applied, same as any other routine update.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'makro-polokwane-magna-via', 'Makro Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'magna-via'),
  '1 Marmer St, Magna Via, Polokwane, 0700', '015 101 100', 'https://www.makro.co.za/pages/store-finder', NULL,
  'Makro Polokwane is a large-format wholesale and retail warehouse store in the Magna Via area of Polokwane, stocking groceries, liquor, electronics, homeware, DIY and bulk goods.',
  NULL, NULL,
  '["https://dir.alltrack.org/view/274458-1-makro", "https://www.waze.com/live-map/directions/makro-store-polokwane-marmer-st-1-magna-via,-polokwane?to=place.w.19334681.193150205.1885229"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'makro-polokwane-magna-via'),
        (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

UPDATE businesses
SET suburb_id = (SELECT id FROM suburbs WHERE slug = 'magna-via')
WHERE slug = 'vertex-boreholes-bendor';

UPDATE suburbs SET bio = 'Magna Via Industrial is a large industrial and commercial precinct on the N1 corridor south of the Polokwane CBD, zoned for warehousing, manufacturing, builder''s yards and light service trades.

Property listings describe it as one of Polokwane''s most active and fastest-growing industrial hubs, run as a secure, professionally managed park -- a step up from the older, informal industrial areas closer to the city centre.

It is a working, not residential, area: home to warehouses, distribution depots and large-format retail such as Makro Polokwane, alongside couriers, manufacturers and trade suppliers.

It suits businesses needing bulk storage, distribution access or workshop space close to the N1, rather than anyone looking to live there.' WHERE slug = 'magna-via' AND (bio IS NULL OR bio = '');

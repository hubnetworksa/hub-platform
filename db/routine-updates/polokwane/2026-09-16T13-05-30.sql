-- Borehole & Water Services: 2 verified businesses, both well-established
-- (Bona Manzi has 32+ years of local news coverage in the Review/Citizen).

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vertex-boreholes-bendor', 'Vertex Boreholes',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '4 Soomaiya Street, Magna Via, Bendor, 0700', '015 298 8270', NULL, NULL,
  'A borehole water drilling and pump installation company on Soomaiya Street in Bendor.',
  NULL, NULL,
  '["https://www.vertexboreholes.co.za/", "https://rsa.worldorgs.com/catalog/polokwane/manufacturer/vertex-drill-rigs"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vertex-boreholes-bendor'),
  (SELECT id FROM categories WHERE slug = 'borehole-water-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bona-manzi-water-drilling-ladanna', 'Bona Manzi Water Drilling',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '26 Railway Street, Ladanna, 0699', '015 293 0509', NULL, NULL,
  'A borehole drilling, water pump and tank installation company on Railway Street in Ladanna, established in 1985.',
  NULL, NULL,
  '["https://bonamanzidrilling.co.za/", "https://za.polomap.com/polokwane/13340"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bona-manzi-water-drilling-ladanna'),
  (SELECT id FROM categories WHERE slug = 'borehole-water-services'),
  1
);

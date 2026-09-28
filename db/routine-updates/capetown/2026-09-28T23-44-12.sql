-- Jobs 1-2: Simon's Town -- 2 new businesses, no new shopping centres

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simons-town-bottle-store-simons-town', "Simon's Town Bottle Store",
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '98 St George''s Street, Simon''s Town, Cape Town, 7995', '021 786 1438', NULL, NULL,
  "Simon's Town Bottle Store is a liquor store in Simon's Town.",
  NULL, NULL,
  '["https://www.yellosa.co.za/company/756859/simons-town-bottle-store", "https://www.brabys.com/za/western-cape/simons-town/bottle-stores-off-sales-retail/simons-town-bottle-store"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simons-town-bottle-store-simons-town'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simons-town-guest-house-simons-town', "Simon's Town Guest House",
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '20 Bennett Close, Cairnside, Simon''s Town, Cape Town, 7975', '021 786 5552', 'https://www.simonstownguesthouse.co.za/', NULL,
  "Simon's Town Guest House is a guesthouse in Simon's Town.",
  NULL, NULL,
  '["https://www.simonstownguesthouse.co.za/contact/contact-us/", "https://cape-town.infoisinfo.co.za/card/simons-town-guest-house/404737"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simons-town-guest-house-simons-town'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

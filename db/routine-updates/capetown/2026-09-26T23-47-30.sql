-- Jobs 1-2: Observatory suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hawkes-and-findlay-observatory', 'Hawkes & Findlay',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '57 Station Road, cnr Station and Lower Main Roads, Observatory, Cape Town', '021 447 2150', NULL, NULL,
  'Hawkes & Findlay is an old-fashioned hardware store in Observatory, stocking tools, paint, plumbing and gardening supplies since 1972.',
  NULL, NULL,
  '["https://www.facebook.com/HawkesAndFindlayHardware/", "https://www.cybo.com/ZA-biz/hawkes-findlay", "https://za.africabz.com/western-cape/hawkes-findlay-37786"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hawkes-and-findlay-observatory'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'reverie-social-table-observatory', 'Reverie Social Table',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '226A Lower Main Road, Observatory, Cape Town', '021 447 3219', NULL, NULL,
  'Reverie Social Table is an intimate chef''s table restaurant in Observatory, serving a multi-course tasting menu with South African wine pairings around one communal table.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/reverie-social-table/", "https://www.capetown.travel/listing/reverie-social-table/", "https://www.reverie.capetown/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'reverie-social-table-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

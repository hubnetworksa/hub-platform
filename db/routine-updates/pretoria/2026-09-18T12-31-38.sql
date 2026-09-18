-- Karenpark checkpoint (job 1/2)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'karenpark-crossing-karenpark', 'Karenpark Crossing',
  (SELECT id FROM suburbs WHERE slug = 'karenpark'),
  'Cnr Doreg & Heinrich Avenue, Karen Park, Akasia, 0182', NULL, NULL,
  '["https://pretoria.co.za/listing/karenpark-crossing-shopping-centre-2/", "https://www.guzzle.co.za/malls/456/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'wonderpark-shopping-centre-karenpark', 'Wonderpark Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'karenpark'),
  'Cnr Brits Road & Heinrich Avenue, Karenpark, Pretoria, 0118', NULL, NULL,
  '["https://wonderparkcentre.co.za/", "https://emira.co.za/portfolio/wonderpark-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'superspar-karen-park-karenpark', 'SUPERSPAR Karen Park',
  (SELECT id FROM suburbs WHERE slug = 'karenpark'),
  (SELECT id FROM shopping_centers WHERE slug = 'karenpark-crossing-karenpark'),
  'Cnr Heinrich & Doreg Avenue, Karen Park Ext 3, Karen Park, Akasia, 0182', '012 549 1211', NULL, NULL,
  'SUPERSPAR Karen Park is a supermarket in Karenpark Crossing shopping centre, Karen Park, Akasia.',
  NULL, NULL,
  '["https://www.spar.co.za/Home/Store-View/SUPERSPAR-Karen-Park-Gauteng", "https://www.thinklocal.co.za/biz/karenpark-superspar-akasia"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'superspar-karen-park-karenpark'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jordan-footwear-factory-outlet-goodwood', 'Jordan Footwear Factory Outlet',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '124 Voortrekker Road, Goodwood, Cape Town, 7460', '021 592 6548', NULL, NULL,
  'Jordan Footwear Factory Outlet is a factory shoe shop in Goodwood, stocking Jordan, Bolton, Barker and Watson footwear brands.',
  NULL, NULL,
  '["https://factoryshops.co.za/jordan-footwear-factory-outlet-goodwood/", "https://za.africabz.com/western-cape/jordan-footwear-69228"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jordan-footwear-factory-outlet-goodwood'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-goodwood-mall-goodwood', 'Clicks Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Goodwood Mall, Cnr MacDonald Street & Voortrekker Road, Goodwood, Cape Town, 7460', '021 591 3980', NULL, NULL,
  'Clicks Goodwood Mall is a pharmacy and health, beauty and homeware retail store inside Goodwood Mall.',
  NULL, NULL,
  '["https://clicks.co.za/store/Goodwood-Mall/1979", "https://www.tiendeo.co.za/stores/cape-town/clicks-goodwood-mall-cnr-macdonald-street-voortrekker-roads/55867"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

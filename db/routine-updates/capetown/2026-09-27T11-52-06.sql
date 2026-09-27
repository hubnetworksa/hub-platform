-- Job 1: diep-river suburb research -- 3 new standalone businesses, no shopping centres

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'diep-river-roadworthy-centre-cc-diep-river', 'Diep River Roadworthy Centre CC',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '127 Main Road, Diep River, Cape Town, 7800', '021 715 7911', NULL, NULL,
  'Diep River Roadworthy Centre CC is a vehicle testing and roadworthy certification centre on Main Road, Diep River.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/diep-river-roadworthy-centre-cc/660807", "https://www.cylex.net.za/company/diep-river-roadworthy-centre-cc-23823854.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'diep-river-roadworthy-centre-cc-diep-river'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'snow-white-laundry-service-diep-river', 'Snow White Laundry Service',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '185 Main Road, Diep River, Cape Town, 7945', '021 713 3045', NULL, NULL,
  'Snow White Laundry Service is a laundry and dry-cleaning service on Main Road, Diep River, offering a drop-and-go wash service.',
  NULL, NULL,
  '["https://www.snowwhite.co.za/contact-us.html", "https://za.africabz.com/western-cape/snow-white-laundry-294666"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'snow-white-laundry-service-diep-river'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-mens-room-diep-river', 'The Men''s Room',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '1 Main Road, Diep River, Cape Town, 7945', '021 713 1212', NULL, NULL,
  'The Men''s Room is a barbershop offering cuts, trims and shaves on Main Road, Diep River.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099855645999104", "http://www.mensroom.co.za/Contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-mens-room-diep-river'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

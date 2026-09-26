INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jem-hair-and-beauty-studio-strandfontein', 'JEM Hair and Beauty Studio',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Shop 3, corner Dennegeur Avenue & Admiral''s Hill Drive, Strandfontein, Cape Town, 7798', '064 502 9750', NULL, NULL,
  'JEM Hair and Beauty Studio is a hair and beauty salon at Shop 3, corner Dennegeur Avenue and Admiral''s Hill Drive, in Strandfontein.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/jem-hair-and-beauty-studio-strandfontein-hill-drive-cape-town-Wq8XNX", "https://beautycafe.co.za/jem-hair-and-beauty-studio/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jem-hair-and-beauty-studio-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'be-dazzle-hair-beauty-and-slimming-salon-strandfontein', 'Be-Dazzle Hair Beauty and Slimming Salon',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Bangladesh Centre, Dennegeur Road, Strandfontein, Cape Town, 7798', '021 393 2220', 'https://be-dazzle.co.za/', NULL,
  'Be-Dazzle Hair Beauty and Slimming Salon is a hair, beauty and slimming salon in the Bangladesh Centre on Dennegeur Road, in Strandfontein.',
  NULL, NULL,
  '["https://be-dazzle.co.za/contact/", "https://www.findmy.co.za/services/business/be-dazzle-strandfontein/8078"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'be-dazzle-hair-beauty-and-slimming-salon-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'umami-sushi-kommetjie', 'Umami Sushi',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 4545', NULL, NULL,
  'Umami Sushi is a Japanese and Asian-inspired restaurant at Imhoff Farm, founded in 2015, serving sushi and seafood dishes with fine dining, takeaways and functions in a garden courtyard setting.',
  NULL, NULL,
  '["https://imhofffarm.co.za/umami-sushi/", "https://www.eatout.co.za/venue/umami-sushi/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'umami-sushi-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rummage-preloved-kommetjie', 'Rummage Preloved',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Shop 24, Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '082 586 5538', NULL, NULL,
  'Rummage Preloved is a pre-loved and vintage clothing shop at Imhoff Farm, stocking a frequently changing selection of second-hand clothes and vintage finds.',
  NULL, NULL,
  '["https://imhofffarm.co.za/rummage-preloved/", "https://tlnbester.wixsite.com/rummagecoop/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rummage-preloved-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

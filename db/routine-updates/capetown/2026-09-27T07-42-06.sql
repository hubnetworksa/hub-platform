INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bruegels-pizza-studio-mowbray', 'Bruegels Pizza Studio',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '99 Durban Road, Little Mowbray, Cape Town, 7700', '+27 21 685 6046', NULL, NULL,
  'Bruegels Pizza Studio is a pizzeria in Little Mowbray serving handmade pizza cooked in a traditional wood-burning oven.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/bruegels-65163", "https://www.eatout.co.za/venue/bruegelspizza-studio/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bruegels-pizza-studio-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'roseberry-mowbray', 'Roseberry',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  'Shop 75, 75 Durban Road, Mowbray, Cape Town, 7700', '+27 72 175 4026', NULL, NULL,
  'Roseberry is a Chinese and sushi restaurant in Mowbray offering dine-in and takeaway.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/roseberry-186639", "https://www.eatout.co.za/venue/roseberry/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'roseberry-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'johns-touch-hair-and-beauty-salon-mowbray', 'John''s Touch Hair and Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '38 Saint Peter''s Road, Mowbray, Cape Town, 7700', '+27 71 249 5088', NULL, NULL,
  'John''s Touch Hair and Beauty Salon is a hairdressing and beauty salon in Mowbray.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/johns-touch-hair-and-beauty-salon-saint-peters-road-cape-town-X4rLXZ", "https://www.facebook.com/Johnstouch.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'johns-touch-hair-and-beauty-salon-mowbray'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

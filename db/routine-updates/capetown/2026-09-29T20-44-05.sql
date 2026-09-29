INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bruegels-pizza-studio-mowbray', 'Bruegels Pizza Studio',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '99 Durban Road, Little Mowbray, Cape Town, 7700', '021 685 6046', NULL, NULL,
  'Bruegels Pizza Studio is a pizzeria in Little Mowbray serving fresh, handmade pizza cooked in a traditional wood-burning oven.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/bruegelspizza-studio/", "https://southafricafirm.com/western-cape/bruegels-65163"]',
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
  'the-spot-mowbray', 'The Spot',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '98 Main Road, Mowbray, Cape Town', '+27 69 721 5820', NULL, NULL,
  'The Spot is a barbershop on Main Road in Mowbray.',
  NULL, NULL,
  '["https://www.fresha.com/a/the-spot-mowbray-cape-town-98-main-road-ujxvlrf4", "https://thespot.capetown/pages/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-spot-mowbray'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-riverside-mall-rondebosch', 'Checkers',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Riverside Mall, Cnr Main & Rosendal Roads, Rondebosch, Cape Town, 7700', '021 659 1180', NULL, NULL,
  'Checkers is a supermarket and anchor tenant of Riverside Mall in Rondebosch.',
  NULL, NULL,
  '["https://brabys.com/south-africa/cape-town/verified-business/checkers-rondebosch", "https://www.openhours-southafrica.com/en/cape-town/checkers-rondebosch"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-riverside-mall-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-riverside-mall-rondebosch', 'Absa',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop 1, Riverside Mall, Cnr Belmont & Main Roads, Rondebosch, Cape Town', '021 658 4900', NULL, NULL,
  'Absa is a bank branch inside Riverside Mall in Rondebosch.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/absa-bank-shop-riverside-shopping-centre-cnr-belmont-and-main-roads-rondebosch/60432", "https://absa.banklocationmaps.co.za/en/branch/930586-absa-branch-shop-1-riverside-shopping-centre-cnr-belmont-and-main-roads"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-riverside-mall-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

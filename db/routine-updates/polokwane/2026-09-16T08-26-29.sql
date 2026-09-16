INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bendor-shopping-centre-bendor', 'Bendor Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '379 De Wet Drive, Bendor Park, Polokwane, 0700', NULL, NULL,
  '["https://www.sluurpy.co.za/polokwane/restaurant/8451300/pregos-take-away", "https://www.instagram.com/reel/DVF-WunCOah/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'freshwell-bendor', 'Freshwell',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'bendor-shopping-centre-bendor'),
  'Bendor Shopping Centre, 379 De Wet Drive, Bendor Park, Polokwane, 0700', '015 296 1276', NULL, NULL,
  'Freshwell is a family grocer and butchery in Bendor Shopping Centre, Bendor Park, selling quality meats and everyday grocery essentials.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/freshwell-28973", "https://www.brabys.com/za/limpopo/polokwane/bendor/supermarkets/freshwell"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'freshwell-bendor'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pregos-bendor', 'Prego''s',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'bendor-shopping-centre-bendor'),
  'Bendor Shopping Centre, 379 De Wet Drive, Bendor Park, Polokwane, 0700', '015 296 2830', NULL, NULL,
  'Prego''s is a takeaway restaurant in Bendor Shopping Centre, Bendor Park, serving prego rolls, burgers and fish and chips.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/pregos-164332", "https://www.sluurpy.co.za/polokwane/restaurant/8451300/pregos-take-away"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pregos-bendor'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

-- Southfield suburb checkpoint (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shaheems-barber-southfield', 'Shaheem''s Barber',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '229 Victoria Road, Southfield, Cape Town, 7880', '076 248 4560', NULL, NULL,
  'Shaheem''s Barber is a barbershop on Victoria Road in Southfield offering haircuts, beard trims and head shaves.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/shaheems-barber-victoria-road-cape-town-ZDj55z", "https://www.yep.co.za/biz/store/iyp/15818881_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shaheems-barber-southfield'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southfield-pawn-shop-southfield', 'Southfield Pawn Shop',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  'Nobbies Corner, 107 Victoria Road, Southfield, Cape Town, 7800', '021 705 4879', NULL, NULL,
  'Southfield Pawn Shop is a pawnbroker on the corner of Victoria Road in Southfield.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/southfield-pawn-shop", "https://textmap.co.za/3/10848"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'southfield-pawn-shop-southfield'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

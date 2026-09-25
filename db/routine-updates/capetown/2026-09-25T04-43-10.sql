-- Jobs 1-2: suburb research -- brooklyn (1 new business)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pro-fit-exhausts-brooklyn', 'Pro-Fit Exhausts',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '283 Koeberg Road, Brooklyn, Cape Town, 7405', '021 511 4664', 'https://www.pro-fitexhausts.co.za/', NULL,
  'Pro-Fit Exhausts is an exhaust specialist on Koeberg Road in Brooklyn, building and installing stainless steel standard and performance exhaust systems for all vehicle makes.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pro-fit-exhausts-138616", "https://www.cybo.com/ZA-biz/pro-fit-exhausts_1c"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pro-fit-exhausts-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

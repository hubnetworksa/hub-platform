-- Jobs 1-2: Bothasig suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-barbers-range-bothasig', 'The Barber''s Range Bothasig',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 8, Bothasig Square, Vryburger Avenue, Bothasig, Cape Town, 7441', '074 657 5173', 'https://thebarbersrange.co.za/barbers-cape-town-branches/bothasig-barber/', NULL,
  'The Barber''s Range Bothasig is a barbershop and hair salon inside Bothasig Square.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/the-barbers-range-bothasig-vryburger-avenue-kaapstad-30AyDN", "https://za.africabz.com/western-cape/the-barbers-range-bothasig-48887"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-barbers-range-bothasig'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lizelle-van-viegen-physiotherapist-bothasig', 'Lizelle Van Viegen Physiotherapist',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  '54 Vryburger Avenue, Bothasig, Cape Town, 7441', '021 558 8580', NULL, NULL,
  'Lizelle Van Viegen Physiotherapist is a physiotherapy practice in Bothasig, offering physiotherapy and dry needling.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/lizelle-van-viegen-physiotherapist-vryburger-avenue-cape-town-loPyMe", "https://www.yep.co.za/biz/store/iyp/7505413_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lizelle-van-viegen-physiotherapist-bothasig'),
  (SELECT id FROM categories WHERE slug = 'physiotherapists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-kenilworth-kenilworth', 'PostNet Kenilworth',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenilworth-centre-kenilworth'),
  'Shop 80, Kenilworth Centre, 1 Doncaster Road, Kenilworth, Cape Town, 7708', '021 671 1192', NULL, NULL,
  'PostNet Kenilworth is a PostNet store offering printing, copying and courier services, in Kenilworth Centre, Kenilworth.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/kenilworth", "https://www.cylex.net.za/company/postnet-kenilworth-17494643.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-kenilworth-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-kenilworth-kenilworth', 'Nedbank Kenilworth',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenilworth-centre-kenilworth'),
  'Shop 66 & 67, Upper Level, Kenilworth Centre, 1 Doncaster Road, Kenilworth, Cape Town, 7708', '021 670 2400', NULL, NULL,
  'Nedbank Kenilworth is a Nedbank bank branch in Kenilworth Centre, Kenilworth.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/nedbank-kenilworth", "https://www.callupcontact.com/b/Banks/Nedbank_KENILWORTH/1065"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-kenilworth-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

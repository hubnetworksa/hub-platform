INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dentalwize-brighton-square-kraaifontein', 'DentalWize Kraaifontein',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'brighton-square-shopping-centre-kraaifontein'),
  'Shop 12B, Brighton Square Shopping Centre, Brighton Road, Kraaifontein, Cape Town, 7570', '021 224 0682', NULL, NULL,
  'DentalWize Kraaifontein is a dental practice inside Brighton Square Shopping Centre in Kraaifontein.',
  NULL, NULL,
  '["https://dentalwize.com/kraaifontein/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1779684"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dentalwize-brighton-square-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mostert-partners-kraaifontein', 'Mostert & Partners',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '192 9th Avenue, Belmont Park, Kraaifontein, Cape Town, 7570', '021 988 3702', NULL, NULL,
  'Mostert & Partners is a law firm in Belmont Park, Kraaifontein, offering attorney, notary and conveyancing services.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/6855163_2", "https://www.thinklocal.co.za/biz/mostert-partners-kraaifontein"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mostert-partners-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

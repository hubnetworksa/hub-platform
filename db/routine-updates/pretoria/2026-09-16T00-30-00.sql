INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'erasmia-pharmacy-erasmia', 'Erasmia Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'erasmia'),
  '381 Willem Erasmus St, Erasmia, Centurion, 0183', '012 370 1756', NULL, NULL,
  'Erasmia Pharmacy is a pharmacy operating at the KWIKSPAR Erasmia site, in Erasmia.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/erasmia-pharmacy-at-spar-52358", "https://za.asklaila.com/listing/Pretoria/centurion/erasmia-pharmacy/L1Dwfpzh/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'erasmia-pharmacy-erasmia'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'erasmia-akhalwayas-erasmia', 'Erasmia Akhalwayas',
  (SELECT id FROM suburbs WHERE slug = 'erasmia'),
  (SELECT id FROM shopping_centers WHERE slug = 'shezan-centre-erasmia'),
  '361 Grey St, Shezan Centre, Erasmia, Centurion, 0046', '012 370 4970', NULL, NULL,
  'Erasmia Akhalwayas is a takeaway restaurant in Shezan Centre, Erasmia.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/erasmia-akhalwayas-47405", "https://personlookup.co.za/reverse/0123704970"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'erasmia-akhalwayas-erasmia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

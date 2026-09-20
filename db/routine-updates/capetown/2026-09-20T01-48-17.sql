INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'esacks-pharmacy-hanover-park', "Esack's Pharmacy",
  (SELECT id FROM suburbs WHERE slug = 'hanover-park'),
  'Shop 6b, Town Centre, Surran Road, Hanover Park, Cape Town, 7780',
  '021 691 8117', NULL, NULL,
  "Esack's Pharmacy is a community pharmacy in the Town Centre on Surran Road in Hanover Park.",
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/7483096_2", "https://za.polomap.com/cape-town/815"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'esacks-pharmacy-hanover-park'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

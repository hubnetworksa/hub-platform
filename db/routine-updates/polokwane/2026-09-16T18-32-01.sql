INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boss-recruitment-bendor', 'Boss Recruitment',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '11 Pierre Street, IT Park, Bendor, Polokwane, 0700', '015 298 8539', 'https://bossrecruitment.co.za', NULL,
  'Boss Recruitment is a recruitment agency in Bendor placing candidates in jobs across Limpopo.',
  NULL, NULL,
  '["https://bossrecruitment.co.za/contact-us/", "https://za.polomap.com/polokwane/13030"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boss-recruitment-bendor'),
  (SELECT id FROM categories WHERE slug = 'recruitment-hr-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'adega-portuguese-restaurant-bendor', 'Adega Portuguese Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Cnr Pierre & Neethling Streets, Hampton Court, Bendor, Polokwane, 0700', '015 296 0805', 'https://adega.co.za', NULL,
  'Adega Portuguese Restaurant is an award-winning Portuguese cuisine restaurant in Bendor, offering dining and function facilities.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/adega-restaurant-polokwane/", "https://adega.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'adega-portuguese-restaurant-bendor'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

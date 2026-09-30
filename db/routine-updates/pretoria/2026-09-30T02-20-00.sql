INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'parkview-shopping-centre-moreleta-park', 'Parkview Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'moreleta-park'),
  'Cnr Garsfontein & Netcare Roads, Moreleta Park, Pretoria, 0044', NULL, NULL,
  '["https://clicks.co.za/store/Parkview/1664", "https://www.specsavers.co.za/store/moreleta-plaza"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'netcare-pretoria-east-hospital-moreleta-park', 'Netcare Pretoria East Hospital',
  (SELECT id FROM suburbs WHERE slug = 'moreleta-park'),
  'Cnr Garsfontein & Netcare Roads, Moreleta Park, Pretoria, 0044', '012 422 2300', NULL, NULL,
  'Netcare Pretoria East Hospital is a private hospital with 358 beds, two intensive care units, 13 operating theatres and a 24-hour accident and emergency unit with a helipad, on the corner of Garsfontein and Netcare Roads in Moreleta Park.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/besienswaardighede/pretoria-east-private-hospital", "https://www.bupaglobal.com/en/facilities/1002023/netcare-pretoria-east-hospital"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'netcare-pretoria-east-hospital-moreleta-park'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

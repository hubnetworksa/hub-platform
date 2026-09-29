INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'klein-bosheuwel-guest-house-bishopscourt', 'Klein Bosheuwel Guest House',
  (SELECT id FROM suburbs WHERE slug = 'bishopscourt'),
  '51A Klaassens Road, Bishopscourt, Cape Town, 7708', '+27 21 762 2323', 'https://www.kleinbosheuwel.co.za/', 'kleinbosheuwel@iafrica.com',
  'Klein Bosheuwel Guest House is a bed and breakfast guest house in Bishopscourt, Cape Town.',
  NULL, NULL,
  '["https://www.kleinbosheuwel.co.za/", "https://www.tripadvisor.com/Hotel_Review-g312660-d1402941-Reviews-Klein_Bosheuwel_Guest_House-Constantia_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'klein-bosheuwel-guest-house-bishopscourt'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

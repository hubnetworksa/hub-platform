INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dental-360-mankweng', 'Dental 360',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'paledi-mall-mankweng'),
  'Shop 33A, Paledi Mall, Mankweng, Polokwane, 0727', '+27 15 151 0964', 'https://dental360.africa/', 'dental360rsa@gmail.com',
  'Dental 360 is a general and aesthetic dental practice inside Paledi Mall in Mankweng, offering a range of dentistry services to the surrounding Turfloop and University of Limpopo community.',
  NULL, NULL,
  '["https://dental360.africa/", "https://www.facebook.com/dental360.africa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dental-360-mankweng'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

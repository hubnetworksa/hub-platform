INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mnc-dental-clinic-lebowakgomo', 'MNC Dental Clinic',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 52A, Mall@Lebo, Cnr R518 & R579, Lebowakgomo, 0737', '073 507 1869', NULL, NULL,
  'MNC Dental Clinic is a dental practice inside Mall@Lebo, Lebowakgomo.',
  NULL, NULL,
  '["https://www.medicaldirectory.co.za/home/company/7638023", "https://www.meditrader.co.za/m-n-c-dental-clinic-dentist-dental-surgeon-lebowakgomo-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mnc-dental-clinic-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

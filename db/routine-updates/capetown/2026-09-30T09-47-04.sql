-- Jobs 1-2: khayelitsha

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-kct-mall-khayelitsha', 'Clicks KCT Mall Khayelitsha',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'khayelitsha-mall-khayelitsha'),
  'Shop 11, KCT Mall, Julius Tsolo Street, Khayelitsha, Cape Town, 7784', '021 488 8121', NULL, NULL,
  'Clicks KCT Mall Khayelitsha is a health, beauty and pharmacy retailer, in Khayelitsha Mall.',
  NULL, NULL,
  '["https://clicks.co.za/store/KCT-Mall-Khayelitsha/2068", "https://www.thebusinessdirectory.co.za/listings/clicks-kct-mall-khayelitsha/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-kct-mall-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-khayelitsha-mall-khayelitsha', 'Mr Price Khayelitsha Mall',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'khayelitsha-mall-khayelitsha'),
  'Shop 54, Khayelitsha Mall, 119 Julius Tsolo Street, Khayelitsha, Cape Town, 7784', '021 361 4204', NULL, NULL,
  'Mr Price Khayelitsha Mall is a fashion and homeware retailer, in Khayelitsha Mall.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/khayelitsha/mr-price-shop-khayelitsha-mall-julius-tsolo-monzamo-mongo/17033", "https://www.thinklocal.co.za/biz/mr-price-khayelitsha-khayelitsha-western-cape"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-khayelitsha-mall-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'site-b-youth-clinic-khayelitsha', 'Site B Youth Clinic',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  'Corner of Pama and Lwandle Road, Site B, Khayelitsha, Cape Town, 7784', '021 444 2809', NULL, NULL,
  'Site B Youth Clinic is a public health clinic in Khayelitsha offering general primary healthcare, HIV care, family planning and STI services.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/See-all-city-facilities/Our-service-facilities/Clinics%20and%20healthcare%20facilities/site-b-youth-centre", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=161350"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'site-b-youth-clinic-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

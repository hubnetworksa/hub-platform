-- Manenberg: general suburb research (job 1) + one more Nyanga Junction Shopping Centre tenant missed by last run's sweep
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'duinefontein-service-station-manenberg', 'Duinefontein Service Station',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  'Duinefontein Road, Manenberg, Cape Town, 7767', '021 691 0871', NULL, NULL,
  'Duinefontein Service Station is a Caltex-branded fuel station on Duinefontein Road in Manenberg.',
  NULL, NULL,
  '["https://www.fueldirectory.co.za/listing-contact.php?listings_id=8365", "https://www.yep.co.za/biz/store/iyp/16272852_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'duinefontein-service-station-manenberg'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'micro-kem-pharmacy-nyanga-junction-manenberg', 'Micro Kem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nyanga-junction-shopping-centre-manenberg'),
  'Shop 11, Nyanga Junction Shopping Centre, Duinefontein Road, Manenberg, Cape Town, 7764', '021 691 1715', NULL, NULL,
  'Micro Kem Pharmacy is a pharmacy in Nyanga Junction Shopping Centre, Manenberg.',
  NULL, NULL,
  '["https://readymap.co.za/4/772", "https://za.polomap.com/cape-town/965"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'micro-kem-pharmacy-nyanga-junction-manenberg'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

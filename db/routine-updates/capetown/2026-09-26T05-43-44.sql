INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steenberg-pharmacy-steenberg', 'Steenberg Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  'Shop No 3-4 Somerset Building, Military Road, Steenberg, Cape Town', '021 701 7326', NULL, NULL,
  'Steenberg Pharmacy is a pharmacy offering primary healthcare and wellness services on Military Road, in Steenberg.',
  NULL, NULL,
  '["https://www.ai-doctors.co.za/ZACD9EQ", "https://distributors.oxygenproducts.org/listing/steenberg-pharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steenberg-pharmacy-steenberg'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coniston-motors-steenberg', 'Coniston Motors',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  'Cnr Military Road & Prince George Drive, Steenberg, Cape Town, 7945', '021 701 5861', NULL, NULL,
  'Coniston Motors is a Caltex-branded fuel station and garage at the corner of Military Road and Prince George Drive, in Steenberg.',
  NULL, NULL,
  '["https://www.gps-data-team.com/where/south_africa/petrol/Caltex-SA/Coniston-Motors.html", "https://www.fueldirectory.co.za/listing.php?listings_id=7688"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coniston-motors-steenberg'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

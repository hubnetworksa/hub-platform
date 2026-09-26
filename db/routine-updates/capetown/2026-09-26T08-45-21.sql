INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-care-pharmacy-parklands', 'Cape Care Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  '6D Village on Main, Parklands Main Road, Parklands, Cape Town, 7441', '021 556 6626', 'https://www.capecarepharm.co.za/', 'info@capecarepharm.co.za',
  'Cape Care Pharmacy is a community pharmacy in Village on Main, Parklands, Cape Town, open seven days a week including public holidays.',
  NULL, NULL,
  '["https://www.capecarepharm.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=407431", "https://vymaps.com/ZA/Cape-Care-Pharmacy-2111321189161196/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-care-pharmacy-parklands'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'parklands-pharmacy-parklands', 'Parklands Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  '29 Sterling Crescent, Parklands, Cape Town, 7441', '021 945 8946', 'https://parklandspharmacy.co.za/', 'Parklandsdispensary@gmail.com',
  'Parklands Pharmacy is a community dispensary and pharmacy in Parklands, Cape Town.',
  NULL, NULL,
  '["https://parklandspharmacy.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1795934"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'parklands-pharmacy-parklands'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-parklands-red-parklands', 'Virgin Active Parklands RED',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'piazza-centre-parklands'),
  'Shop 24, Parklands Piazza, Corner Parklands Main & Link Roads, Parklands, Cape Town, 7441', '021 495 8946', 'https://www.virginactive.co.za/gyms/parklands', NULL,
  'Virgin Active Parklands RED is a gym inside Parklands Piazza in Parklands, Cape Town, part of the Virgin Active health club chain.',
  NULL, NULL,
  '["https://www.virginactive.co.za/gyms/parklands", "https://za.africabz.com/western-cape/virgin-active-parklands-red-18591", "https://za.readymap.info/4/9288"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-parklands-red-parklands'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

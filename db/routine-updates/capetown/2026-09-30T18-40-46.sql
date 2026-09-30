INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-delft-mall-delft', 'Steers Delft Mall',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 1, Delft Mall, Corner Hindle Road and Delft Main Road, Delft, Cape Town, 7100', '021 201 1287', NULL, NULL,
  'Steers Delft Mall is a flame-grilled burger and chicken takeaway restaurant, in Delft Mall, Delft.',
  NULL, NULL,
  '["https://locations.steers.co.za/restaurants-DelftMall-SteersDelftMall", "https://www.tripadvisor.com/Restaurant_Review-g312659-d17788143-Reviews-Steers-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cyster-medical-delft', 'Cyster Medical',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop V6, Delft Mall, Cnr Hindle & Delft Main Road, Delft, Cape Town, 7100', '021 954 1990', NULL, NULL,
  'Cyster Medical is a general practice, in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=299191", "https://sabusinesslistings.co.za/listings/cyster-medical/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cyster-medical-delft'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'delft-community-health-centre-delft', 'Delft Community Health Centre',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  'Cnr Delft Main Road & Voorbrug Road, Delft, Cape Town, 7100', '021 954 2237', NULL, NULL,
  'Delft Community Health Centre is a public primary healthcare clinic, in Delft.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=110059", "https://d7.westerncape.gov.za/facility/delft-community-health-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'delft-community-health-centre-delft'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

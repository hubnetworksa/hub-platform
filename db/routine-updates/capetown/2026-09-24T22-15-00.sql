-- Jobs 1-2: Brackenfell
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'panarottis-brackenfell', 'Panarottis Brackenfell',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-shopping-centre-brackenfell'),
  'Shop 33, Brackenfell Shopping Centre, Old Paarl Road, Brackenfell, Cape Town, 7560', '021 879 9261', NULL, NULL,
  'Panarottis Brackenfell is an Italian restaurant serving pizza and pasta at Brackenfell Shopping Centre.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g4007388-d27949883-Reviews-Panarottis_Brackenfell-Brackenfell_Western_Cape.html", "https://www.panarottis.com/za/restaurants/western-cape/panarottis-brackenfell/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'panarottis-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-brackenfell-mall-brackenfell', 'Steers Brackenfell Mall',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-shopping-centre-brackenfell'),
  'Shop 29, The Brackenfell Shopping Centre, Old Paarl Road, Brackenfell, Cape Town, 7560', '021 982 5937', NULL, NULL,
  'Steers Brackenfell Mall is a fast-food restaurant serving flame-grilled burgers and chicken at Brackenfell Shopping Centre.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g4007388-d17788181-Reviews-Steers-Brackenfell_Western_Cape.html", "https://location.steers.co.za/brackenfell-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-brackenfell-mall-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'essential-health-pharmacy-brackenfell', 'Essential Health Pharmacy Brackenfell',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Essential Health Building, Cnr Old Paarl Road & Jeanette Street, Springbokpark, Brackenfell, Cape Town, 7560', '021 981 1824', NULL, NULL,
  'Essential Health Pharmacy Brackenfell is a branch of the Essential Health Pharmacy Group, an independent chain of community pharmacies, in Springbokpark.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Essential-Health-Pharmacy--Brackenfell-160929/", "https://za.africabz.com/western-cape/essential-health-pharmacy-41654"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'essential-health-pharmacy-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

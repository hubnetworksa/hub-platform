INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barksole-howard-centre-pinelands', 'Barksole',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G34, Howard Centre, Howard Drive, Pinelands, Cape Town', '021 531 9494', NULL, NULL,
  'Barksole is a key cutting, shoe repair, luggage repair, dry cleaning and engraving service centre, in Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://barksole.co.za/store-locator/pinelands/", "https://opening-hours.co.za/04058432/Barksole"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barksole-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-central-square-pinelands', 'Clicks Central Square Pinelands',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'central-square-pinelands'),
  'Shop 6, Central Buildings, Central Square, Forrest Drive, Pinelands, Cape Town, 7405', '021 531 5929', NULL, NULL,
  'Clicks Central Square Pinelands is a pharmacy and retail store in Central Square, Pinelands.',
  NULL, NULL,
  '["https://clicks.co.za/store/Central-Square-%E2%80%93-Pinelands/1522", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=257317"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-central-square-pinelands'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-fish-central-square-pinelands', 'Mr Fish',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'central-square-pinelands'),
  'St Stephens Road, Central Square Shopping Centre, Pinelands, Cape Town, 7405', '021 531 6692', NULL, NULL,
  'Mr Fish is a fish and chips takeaway in Central Square, Pinelands.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2712907-d21297387-Reviews-Mr_Fish-Pinelands_Western_Cape.html", "https://www.hotfrog.co.za/company/745130df0f90494dd4f896d6d357d56e/mr-fish/pinelands/restaurants"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-fish-central-square-pinelands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

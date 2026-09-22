INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'neighbourhood-cafe-ramasibi-panorama', 'Neighbourhood Cafe @ Ramasibi',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '83 Uys Krige Drive, Panorama, Cape Town, 7500', '082 774 5392', NULL, NULL,
  'Neighbourhood Cafe @ Ramasibi is a cafe and restaurant in Panorama serving all-day breakfast, pizzas and burgers, open seven days a week.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2427781-d15227962-Reviews-Neighbourhood_Cafe_Ramasibi-Panorama_Western_Cape.html", "https://ramasibi.co.za/neighbourhood-cafe-panorama/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'neighbourhood-cafe-ramasibi-panorama'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'restore-dental-studio-panorama', 'Restore Dental Studio',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Shop 11, Panorama Healthcare Centre, 60 Hennie Winterbach Street, Panorama, Cape Town, 7500', '021 911 3124', NULL, NULL,
  'Restore Dental Studio is a dental practice inside Panorama Healthcare Centre in Panorama.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1249493984931840/restore-dental-studio/cape-town/dental-care", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=223591"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'restore-dental-studio-panorama'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

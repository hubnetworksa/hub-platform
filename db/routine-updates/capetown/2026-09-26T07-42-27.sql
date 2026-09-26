INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'village-harbour-and-pizza-house-strandfontein', 'The Village Harbour & Pizza House',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  '9 Blackberry Mall Road, Strandfontein Village, Cape Town, 7798', '063 285 9467', NULL, NULL,
  'The Village Harbour & Pizza House is a pizza and seafood takeaway restaurant in Strandfontein, Cape Town.',
  NULL, NULL,
  '["https://heypizza.co.za/01854024/The_Village_Harbour_&_Pizza_House", "https://www.facebook.com/villageharbourandpizzahouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'village-harbour-and-pizza-house-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bp-wavecrest-motors-strandfontein', 'BP Wavecrest Motors',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  '37 Wavecrest Avenue, Strandfontein, Cape Town, 7788', '021 393 2114', NULL, NULL,
  'BP Wavecrest Motors is a fuel station in Strandfontein, Cape Town.',
  NULL, NULL,
  '["https://www.fueldirectory.co.za/listing.php?listings_id=5356", "https://vymaps.com/ZA/BP-Wavecrest-Motors-957846340978512/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bp-wavecrest-motors-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

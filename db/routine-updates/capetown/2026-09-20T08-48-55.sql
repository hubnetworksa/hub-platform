INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-pescado-simons-town', 'Cafe Pescado',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '118 St Georges Street, Simon''s Town, Cape Town, 7975', '021 786 2272', NULL, NULL,
  'Cafe Pescado is a family-friendly pizza and seafood restaurant in Simon''s Town, opposite Jubilee Square.',
  NULL, NULL,
  '["https://www.simonstown.com/business-directory/cafe-pescado/", "https://pescados.co.za/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-pescado-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simons-town-boat-company-simons-town', 'Simon''s Town Boat Company',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '2 Wharf Street, Simon''s Town, Cape Town, 7975', '083 257 7760', NULL, NULL,
  'Simon''s Town Boat Company runs licensed boat tours from Simon''s Town to Boulders Penguin Colony, Seal Island and Cape Point, with seasonal whale watching.',
  NULL, NULL,
  '["https://www.boatcompany.co.za/contact-us/", "https://www.simonstown.com/listing/simons-town-boat-company/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simons-town-boat-company-simons-town'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-lighthouse-cafe-simons-town', 'The Lighthouse Cafe',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '90 St Georges Street, Simon''s Town, Cape Town, 7975', '087 700 6421', NULL, NULL,
  'The Lighthouse Cafe is a breakfast, lunch and supper restaurant in Simon''s Town with views over the beach.',
  NULL, NULL,
  '["https://www.thelighthousecafe.co.za/", "https://www.simonstown.com/business-directory/the-lighthouse-cafe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-lighthouse-cafe-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'harbour-bay-mall-simons-town', 'Harbour Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'Cnr Main Road & Dido Valley Road, Simon''s Town, Cape Town', NULL, NULL,
  '["https://www.harbourbay.co.za/", "https://evendo.com/locations/south-africa/cape-peninsula/shop/harbour-bay-mall"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cattle-baron-simons-town', 'Cattle Baron Simonstown',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  (SELECT id FROM shopping_centers WHERE slug = 'harbour-bay-mall-simons-town'),
  'Harbour Bay Mall, Cnr Main Road & Dido Valley Road, Simon''s Town, Cape Town, 7975', '021 612 0903', NULL, NULL,
  'Cattle Baron Simonstown is a branch of the South African steakhouse chain, in Harbour Bay Mall.',
  NULL, NULL,
  '["https://www.cattlebaron.co.za/cattle-baron-simons-town-harbour-bay/", "https://www.simonstown.com/listing/cattle-baron/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cattle-baron-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

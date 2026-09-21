INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'doncaster-motors-kenilworth', 'Doncaster Motors',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  'Cnr Doncaster Rd & Punters Way, Kenilworth, Cape Town, 7708', '021 674 0719', NULL, NULL,
  'Doncaster Motors is a Caltex fuel station with a FreshStop convenience store in Kenilworth.',
  NULL, NULL,
  '["https://caltex.co.za/amenities/ucount/page/27/", "https://www.yep.co.za/biz/store/iyp/10421387_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'doncaster-motors-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tah-kenilworth', 'TAH Kenilworth',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '47 Kenilworth Road, Kenilworth, Cape Town, 7708', '021 671 5018', NULL, NULL,
  'TAH Kenilworth is a small animal veterinary practice in Kenilworth, established more than 50 years ago.',
  NULL, NULL,
  '["https://tah.co.za/kenilworth/", "https://veterinary.co.za/find-a-vet/tah-kenilworth/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tah-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

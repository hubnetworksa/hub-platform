-- Jobs 1-2: westlake
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-steenberg-westlake', 'Virgin Active Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  'Otto Close, Westlake Business Park, Westlake, Cape Town, 7945', '021 702 0268', NULL, NULL,
  'Virgin Active Steenberg is a gym located in Westlake Business Park, Westlake.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/virgin-active-steenberg-26206", "https://za.gymcity.info/virgin-active-steenberg-1544438"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-steenberg-westlake'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

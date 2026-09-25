INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sasol-maitland-maitland', 'Sasol Maitland',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  'Cnr 5th Avenue & Voortrekker Road, Maitland, Cape Town, 7405', '021 593 2948', NULL, NULL,
  'Sasol Maitland is a 24-hour fuel station and forecourt on the corner of 5th Avenue and Voortrekker Road, Maitland.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/24535", "https://www.sayellow.com/view/south-africa/sasol-maitland-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sasol-maitland-maitland'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'atlantic-meat-maitland', 'Atlantic Meat',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '287 Voortrekker Road, Maitland, Cape Town, 7405', '021 510 6629', NULL, NULL,
  'Atlantic Meat is a butchery on Voortrekker Road in Maitland, Cape Town.',
  NULL, NULL,
  '["https://www.foodbevg.com/ZA/Cape-Town/387922421366077/Atlantic-Meat", "https://www.thinklocal.co.za/biz/atlantic-meat-maitland"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'atlantic-meat-maitland'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

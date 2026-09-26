INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kleinberg-primary-school-ocean-view', 'Kleinberg Primary School',
  (SELECT id FROM suburbs WHERE slug = 'ocean-view'),
  'Aquila Way, Ocean View, Cape Town, 7975', '021 783 1741', NULL, NULL,
  'Kleinberg Primary School is a public primary school in Ocean View.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/ocean-view/primary-school/kleinberg-primary-school", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/KLEINBERG_PRIMARY_SCHOOL/7239"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kleinberg-primary-school-ocean-view'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-view-secondary-school-ocean-view', 'Ocean View Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'ocean-view'),
  'Hydra Avenue, Ocean View, Cape Town, 7975', '021 783 1623', NULL, NULL,
  'Ocean View Secondary School is a public secondary school in Ocean View.',
  NULL, NULL,
  '["https://www.school-register.co.za/school/ocean-view-secondary-school/", "https://www.waze.com/live-map/directions/za/wc/cape-town/ocean-view-secondary-school?to=place.ChIJM7WdNERrzB0ReTK5YKZFJso"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-view-secondary-school-ocean-view'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

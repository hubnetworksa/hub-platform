INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wizard-pets-grassy-park', 'Wizard Pets',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  '22 Delia Road, Grassy Park', '021 705 0054', NULL, NULL,
  'Wizard Pets is a pet supply retailer in Grassy Park, stocking leashes, harnesses, puppy kits and toys.',
  NULL, NULL,
  '["https://pawsza.com/pet-shops/cape-town/grassy-park-pets/", "https://cape-town.infoisinfo.co.za/search/pet-shop/b/grassy-park"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wizard-pets-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

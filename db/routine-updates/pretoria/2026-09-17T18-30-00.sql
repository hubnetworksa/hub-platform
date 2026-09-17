INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wollies-animal-shelter-hesteapark', 'Wollies Animal Shelter',
  (SELECT id FROM suburbs WHERE slug = 'hesteapark'),
  '101 Rooikat Street, Hesteapark, Pretoria North', '079 916 4602', 'https://wollies.org', NULL,
  'Wollies Animal Shelter is an animal rescue and rehoming shelter in Hesteapark, Pretoria North.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/wollies-animal-shelter-65816", "https://www.africabizinfo.com/ZA/wollies-animal-project-079-916-4602"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wollies-animal-shelter-hesteapark'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

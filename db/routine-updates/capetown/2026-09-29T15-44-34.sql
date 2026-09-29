INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hypermed-pharmacy-green-point', 'Hypermed Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  'Corner York and Main Road, Green Point, Cape Town, 8005', '021 434 1414', NULL, NULL,
  'Hypermed Pharmacy is a retail pharmacy on the corner of York and Main Road, in Green Point.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/green-point/pharmacies/hypermed-pharmacy", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88430"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hypermed-pharmacy-green-point'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tah-green-point-green-point', 'TAH Green Point',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '86 High Level Road, Green Point, Cape Town, 8051', '021 434 5475', NULL, NULL,
  'TAH Green Point is a veterinary hospital and vet shop on High Level Road, in Green Point.',
  NULL, NULL,
  '["https://tah.co.za/green-point/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=197021"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tah-green-point-green-point'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

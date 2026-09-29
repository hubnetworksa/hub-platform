INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'petworld-xxl-diep-river', 'Petworld XXL Diep River',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '89 Main Road, Diep River, Cape Town, 7800', '021 300 3036', 'https://petworld.co.za/pages/petworld-xxl-diep-river', 'diepriver@petworld.co.za',
  'Petworld XXL Diep River is a large pet supplies store on Main Road, Diep River, stocking a wide range of pet food and products.',
  NULL, NULL,
  '["https://petworld.co.za/pages/petworld-xxl-diep-river", "https://www.cybo.com/ZA-biz/petworld-xxl-diep-rivier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'petworld-xxl-diep-river'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'perky-pets-and-vet-diep-river', 'Perky Pets and Vet',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '186 Main Road, Diep River, Cape Town, 7800', '021 712 8283', NULL, NULL,
  'Perky Pets and Vet is a two-storey pet supplies store on Main Road, Diep River, with an on-site veterinary practice and grooming parlour.',
  NULL, NULL,
  '["https://topvet.net/practices/south-africa/western-cape/cape-town/perky-pets-and-vet-26567", "https://southafricafirm.com/western-cape/perky-pets-3945"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'perky-pets-and-vet-diep-river'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wink-cafe-eaton-square-diep-river', 'WINK Café (Eaton Square)',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '167 Main Road, Diep River, Cape Town', '087 012 5722', NULL, NULL,
  'WINK Café (Eaton Square) is a café on Main Road, Diep River, serving breakfast and lunch.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/wink-eaton-square/", "https://www.sa-venues.com/visit/winkateatonsquare/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wink-cafe-eaton-square-diep-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pho-bun-vietnamese-kitchen-diep-river', 'Pho & Bun Vietnamese Kitchen',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '67 Main Road, Diep River, Cape Town, 7800', '069 433 2600', NULL, NULL,
  'Pho & Bun Vietnamese Kitchen is a halal Vietnamese restaurant on Main Road, Diep River, serving dishes such as spring rolls and rice stir-fries.',
  NULL, NULL,
  '["https://hungryforhalaal.co.za/listing/pho-bun-vietnamese-kitchen-diep-river/", "https://www.ubereats.com/za/store/pho-and-bun-halal-vietnamese-kitchen/fF8x067cSQmExr7-k6INyA"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pho-bun-vietnamese-kitchen-diep-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

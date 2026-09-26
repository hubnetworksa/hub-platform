INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-charlesville-matroosfontein', 'Shoprite Charlesville',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'charlesville-mall-matroosfontein'),
  'Metlife Centre, Cnr Valhalla Drive & Charles Calvert Road, Charlesville, Matroosfontein, Cape Town, 7490', '021 935 5260', NULL, NULL,
  'Shoprite Charlesville is a supermarket anchoring Charlesville Mall in Matroosfontein, Cape Town.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/shoprite-charlesville-174551", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Charlesville/4770"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-charlesville-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-r-lalloo-matroosfontein', 'Dr R Lalloo',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'charlesville-mall-matroosfontein'),
  '22 Valhalla Road, 4A Metropolitan Centre, Charlesville, Matroosfontein, Cape Town, 7490', '021 934 0765', NULL, NULL,
  'Dr R Lalloo is a dental practice in the Charlesville complex in Matroosfontein, Cape Town.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/bonteheuwel/charlesville/dentists/dr-r-lalloo", "https://www.searchinafrica.com/business/5816671/south-africa/western-cape/bonteheuwel/charlesville/valhalla-dve/dentists/dental-surgeons/dr-r-lalloo", "https://www.africanadvice.com/1248821/Dentists/Western_Cape/Dr_R_Lalloo/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-r-lalloo-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

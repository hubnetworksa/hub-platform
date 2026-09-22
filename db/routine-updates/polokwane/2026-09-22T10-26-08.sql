INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-baobab-gardens-thornhill-estate', 'McDonald''s Baobab Gardens',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Aloe Vera Street, Baobab Gardens, Polokwane, 0699', '015 296 9280', 'https://www.mcdonalds.co.za/location/mcdonalds-baobab-gardens', NULL,
  'McDonald''s Baobab Gardens is a fast-food restaurant serving the McDonald''s menu from the Baobab Gardens commercial precinct in Thornhill, Polokwane.',
  NULL, NULL,
  '["https://www.mcdonalds.co.za/location/mcdonalds-baobab-gardens", "https://www.tripadvisor.co.za/Restaurant_Review-g312624-d28144147-Reviews-McDonald_s_Baobab_Garden-Polokwane_Limpopo_Province.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-baobab-gardens-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bathroom-bizarre-baobab-thornhill-estate', 'Bathroom Bizarre Baobab',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Cnr Munnik Avenue & Aloe Vera Street, Baobab Gardens, Polokwane, 0699', '015 265 7014', 'https://bathroom.co.za/bathroom-bizarre-baobab/', NULL,
  'Bathroom Bizarre Baobab is a bathroom fittings and sanitaryware retailer in the Baobab Gardens commercial precinct, Thornhill, Polokwane.',
  NULL, NULL,
  '["https://bathroom.co.za/bathroom-bizarre-baobab/", "https://www.hotfrog.co.za/company/c0a0371db82e5721e0a5e196f50eccbc/bathroom-bizarre-baobab/polokwane/plumbing-piping"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bathroom-bizarre-baobab-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'builders-express-baobab-thornhill-estate', 'Builders Express Baobab',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Cnr Munnik Avenue & De Wet Drive, Baobab Gardens, Polokwane, 0699', '015 007 1450', 'https://www.builders.co.za/', NULL,
  'Builders Express Baobab is a hardware and building-supplies store in the Baobab Gardens commercial precinct, Thornhill, Polokwane.',
  NULL, NULL,
  '["https://www.lifeisagarden.co.za/builders-express-baobab/", "https://m2north.com/companies/builderswarehouse/bexbaobabpolokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'builders-express-baobab-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zebbies-lighting-polokwane-thornhill-estate', 'Zebbies Lighting Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  '37 Clivicola Street, Baobab Gardens, Polokwane, 0700', '015 004 0886', 'https://www.zebbies.com/pages/polokwane', NULL,
  'Zebbies Lighting Polokwane is a lighting retailer in the Baobab Gardens commercial precinct, Thornhill, Polokwane.',
  NULL, NULL,
  '["https://www.zebbies.com/pages/polokwane", "https://www.homeimprovement4u.co.za/directory/zebbies-lighting-polokwane-43570.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zebbies-lighting-polokwane-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tile-africa-polokwane-north-thornhill-estate', 'Tile Africa Polokwane North',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Munnik Avenue, Baobab Gardens, De Wet Drive, Polokwane, 0699', '015 817 3805', 'https://www.tileafrica.co.za/', NULL,
  'Tile Africa Polokwane North is a tile, bathroom and flooring showroom in the Baobab Gardens commercial precinct, Thornhill, Polokwane.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/tile-africa-polokwane-north-264368", "https://finfloor.co.za/distributors__trashed/distributor-limpopo-polokwane-north-tile-africa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tile-africa-polokwane-north-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'furniture-mart-baobab-thornhill-estate', 'Furniture Mart Baobab',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  '15 Clivicola Street, Baobab Gardens, Polokwane, 0699', '010 745 6214', 'https://furnituremart.co.za/', NULL,
  'Furniture Mart Baobab is a furniture wholesaler in the Baobab Gardens commercial precinct, Thornhill, Polokwane.',
  NULL, NULL,
  '["https://furnituremart.co.za/contact-us/", "https://www.guzzle.co.za/furniture-mart/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'furniture-mart-baobab-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

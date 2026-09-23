INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'john-montague-centre-montague-gardens', 'John Montague Centre',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '19 Montague Drive, Montague Gardens, Cape Town, 7441', NULL, NULL,
  '["https://www.johnmontaguecentre.co.za/", "https://clicks.co.za/store/Montague-Gardens/2215"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-montague-gardens-montague-gardens', 'Clicks Pharmacy Montague Gardens',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'john-montague-centre-montague-gardens'),
  'Shop 1, John Montague Centre, 19 Montague Drive, Montague Gardens, Cape Town, 7441', '021 488 8270', NULL, 'CLK2215MGR@clicks.co.za',
  'Clicks Pharmacy Montague Gardens is a pharmacy and health and beauty retailer inside the John Montague Centre.',
  NULL, NULL,
  '["https://clicks.co.za/store/Montague-Gardens/2215", "https://www.infobel.com/en/southafrica/clicks_pharmacy_montague_gardens/montague_gardens/ZA102899280-0214888270/businessdetails.aspx"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-montague-gardens-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'montague-gardens-convenience-centre-montague-gardens', 'Montague Gardens Convenience Centre',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  'Corner of Montague Drive and Alternator Avenue, Montague Gardens, Cape Town, 7441', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/montague-gardens-convenience-centre.html", "https://commercialspace.co.za/properties/montague-gardens-convenience-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'first-battery-centre-montague-gardens-montague-gardens', 'First Battery Centre Montague Gardens',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'montague-gardens-convenience-centre-montague-gardens'),
  'Shop 1, Montague Gardens Convenience Centre, Cnr Montague Drive & Alternator Ave, Montague Gardens, Cape Town, 7441', '021 551 3530', NULL, 'batterycentre-mg@vodamail.co.za',
  'First Battery Centre Montague Gardens sells and fits car and truck batteries, inside the Montague Gardens Convenience Centre.',
  NULL, NULL,
  '["https://www.battery.co.za/store/first-battery-centre-montague-gardens/", "https://za.polomap.com/cape-town/192750"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'first-battery-centre-montague-gardens-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'britos-meat-centre-montague-gardens', 'Brito''s Meat Centre',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'montague-gardens-convenience-centre-montague-gardens'),
  '24 Montague Drive, Montague Gardens, Milnerton, Cape Town, 7441', '021 552 4343', NULL, 'britosmontaguegardens@stores.britos.co.za',
  'Brito''s Meat Centre is a butchery inside the Montague Gardens Convenience Centre.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/milnerton/montague-gdns-ind/butchers-retail/britos-meat-centre", "https://za.africabz.com/western-cape/britos-meat-centre-montague-gardens-205250"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'britos-meat-centre-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'iron-horse-relocations-montague-gardens', 'Iron Horse Relocations',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '1 Esso Road, Unit 6 Pelican Park, Montague Gardens, Cape Town, 7441', '072 130 2869', 'https://www.ironhorserelocations.com', 'philip@ironhorserelocations.com',
  'Iron Horse Relocations is a house moving and office furniture removals company based in Montague Gardens.',
  NULL, NULL,
  '["https://www.homify.co.za/professionals/5207804/iron-horse-relocations-house-moving-office-furniture-removals-company-cape-town", "https://givingmore.co.za/iron-horse-relocations"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'iron-horse-relocations-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

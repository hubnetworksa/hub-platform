-- Suburb sweep: Bellville

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jumbo-clothing-bellville', 'Jumbo Clothing',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  '26 Voortrekker Road, Bellville, 7530', '021 917 1138', NULL, NULL,
  'Jumbo Clothing is a clothing retailer on Voortrekker Road in Bellville.',
  NULL, NULL,
  '["https://foursquare.com/v/jumbo-clothing/5dc2ee9b021f6100086d47b6", "https://www.brabys.com/za/western-cape/bellville/clothing-retailers/jumbo-clothing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jumbo-clothing-bellville'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

-- New shopping centre discovered via general suburb research (Jumbo Clothing search
-- turned up HK Computers at "Shop 2 Tygerberg Ctr, 20 Voortrekker Rd")
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tygerberg-sentrum-bellville', 'Tygerberg Sentrum', (SELECT id FROM suburbs WHERE slug = 'bellville'),
  '16 Voortrekker Road, Bellville, 7530', NULL, NULL,
  '["https://www.emporis.com/buildings/179438/tygerberg-centre-cape-town-south-africa", "http://www.mapknows.co.za/cape-town/hk-computers-40504/"]',
  'mall'
);

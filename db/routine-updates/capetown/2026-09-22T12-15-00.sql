INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tah-kenridge-kenridge', 'TAH Kenridge',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  '78 De Bron Avenue, Kenridge, Durbanville, Cape Town, 7550', '021 914 0886', NULL, NULL,
  'TAH Kenridge is a veterinary hospital and vetshop in Kenridge, offering dog and cat hospital wards, a laboratory and a retail pharmacy.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/tah-kenridge-81432", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=196922"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tah-kenridge-kenridge'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hillside-properties-kenridge', 'Hillside Properties',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 12, IPIC Shopping Centre Kenridge, Door De Kraal Avenue, Kenridge, Durbanville, Cape Town, 7550', '021 914 4444', NULL, NULL,
  'Hillside Properties is a family-owned estate agency in IPIC Shopping Centre Kenridge, selling and renting residential property in the greater Durbanville area.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/hillside-properties-durbanville", "https://www.africanadvice.com/1374408/Real_Estate_Brokers_And_Agencies/Western_Cape/Hillside_Properties/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hillside-properties-kenridge'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

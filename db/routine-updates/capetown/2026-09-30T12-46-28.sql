-- Eerste River suburb research (job 1/2): new shopping centre + tenant discovery
-- across Eerste River City Centre, Eerste Rivier Mall, Grand Central Shopping Centre and new Maxi Centre

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'maxi-centre-eerste-river', 'Maxi Centre',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  'Plein Street, Eerste River, Cape Town', NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/maxi-centre-plein-street-eerste-river", "https://www.tiendeo.co.za/stores/eerste-river/cash-crusaders-shop-no-maxi-centre-plein-street/22154"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-eerste-rivier-service-centre-eerste-river', 'Standard Bank Eerste Rivier Service Centre',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-river-city-centre-eerste-river'),
  'Shop 23-25, Eerste River City Centre, Main Road, Eerste River, Cape Town', '021 902 8100', NULL, NULL,
  'Standard Bank Eerste Rivier Service Centre is a bank branch in Eerste River City Centre, Eerste River.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/516597/standard-bankeerste-rivier-service-centre-", "https://www.cylex.net.za/company/standard-bank-17706441.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'standard-bank-eerste-rivier-service-centre-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hungry-lion-eerste-river-eerste-river', 'Hungry Lion Eerste River',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-mall-eerste-river'),
  '23 Plein Street, Shop 14, Eersterivier Mall, Eerste River, Cape Town, 7100', '021 902 1064', NULL, NULL,
  'Hungry Lion Eerste River is a fried chicken fast-food outlet in Eersterivier Mall, Eerste River.',
  NULL, NULL,
  '["https://stores.hungrylion.co.za/details/eerste-river", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d23734033-Reviews-Hungry_Lion_Eerste_River-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hungry-lion-eerste-river-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-home-grand-central-eerste-river', 'PEP HOME Grand Central',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'grand-central-shopping-centre-eerste-river'),
  'Shop 23, Grand Central Shopping Centre, 50 Plein Street, Eerste River, Cape Town, 7100', '021 902 0160', NULL, NULL,
  'PEP HOME Grand Central is a home goods and homeware retail store in Grand Central Shopping Centre, Eerste River.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-home-n-grand-central-shopping-centre-plein-street-eerste-river/71365", "https://www.guzzle.co.za/pep-home/eerste-river/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-home-grand-central-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-eerste-river-eerste-river', 'Cash Crusaders Eerste River',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'maxi-centre-eerste-river'),
  'Shop 6, Maxi Centre, Plein Street, Eerste River, Cape Town, 7100', '021 904 6044', NULL, NULL,
  'Cash Crusaders Eerste River is a second-hand goods and electronics buy-and-sell store in Maxi Centre, Eerste River.',
  NULL, NULL,
  '["https://cashcrusaders.co.za/locate-a-store/store/110/Cash%20Crusaders%20Eerste%20Rivier", "https://www.yellosa.co.za/company/460072/cash-crusaders-eerste-river"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-eerste-river-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'liquor-city-eerste-river-eerste-river', 'Liquor City Eerste River',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'maxi-centre-eerste-river'),
  'Shop 1, Maxi Centre, Plein Street, Eerste River, Cape Town, 7100', '021 902 0543', NULL, NULL,
  'Liquor City Eerste River is a bottle store in Maxi Centre, Eerste River.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/eerste-river/liquor-city", "https://www.globuya.com/ZA/Cape-Town/383683068448004/Liquor-City-Eersterivier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'liquor-city-eerste-river-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

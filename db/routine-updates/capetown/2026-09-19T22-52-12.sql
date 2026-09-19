INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'truworths-liberty-promenade-mitchells-plain', 'Truworths',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Shop 57C, Liberty Promenade, AZ Berman Drive, Mitchells Plain, Cape Town, 7785', '021 376 3116', NULL, NULL,
  'Truworths is a fashion clothing retailer inside Liberty Promenade, Mitchells Plain.',
  NULL, NULL,
  '["https://libertypromenade.co.za/shops/truworths/", "https://www.callupcontact.com/b/Clothing_Stores/Truworths_Promenade/5813"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truworths-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'game-liberty-promenade-mitchells-plain', 'Game',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Liberty Promenade, Cnr AZ Berman Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785', '021 376 9700', NULL, NULL,
  'Game is a general merchandise and electronics retailer inside Liberty Promenade, Mitchells Plain.',
  NULL, NULL,
  '["https://mydorpie.com/m/?page=chain_game_mplain", "https://www.callupcontact.com/b/Supermarkets/Game_Mitchells_Plain/4239"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'game-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-sport-liberty-promenade-mitchells-plain', 'Mr Price Sport',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Liberty Promenade, Cnr AZ Berman Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785', '021 376 0178', NULL, NULL,
  'Mr Price Sport is a sportswear and sports equipment retailer inside Liberty Promenade, Mitchells Plain.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/mr-price-sport-liberty-promenade-mitchells-plain", "https://www.ayoba.com/business/MrPriceSportLibertyPromenadeMall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-sport-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

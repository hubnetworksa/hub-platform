INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'lanos-spar-shopping-centre-la-montagne', 'Lanos Spar Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'la-montagne'),
  '231 Albertus Street, La Montagne, Pretoria, 0184', NULL, NULL,
  '["https://my-catalogue.co.za/stores/la-montagne/steers/shop-7-lanos-spar-shopping-centre-231-albertus-street", "https://www.tiendeo.co.za/stores/pretoria/steers-shop-lanos-spar-shopping-centre-albertus-street/35950"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-the-hill-la-montagne', 'TOPS at SPAR The Hill',
  (SELECT id FROM suburbs WHERE slug = 'la-montagne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lanos-spar-shopping-centre-la-montagne'),
  'Shop 2, Lanos Spar Shopping Centre, 235 Albertus St, La Montagne, Pretoria, 0184', '012 803 7670', NULL, NULL,
  'TOPS at SPAR The Hill is a liquor store in Lanos Spar Shopping Centre, La Montagne.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/tops-at-spar-the-hill-160497", "https://www.thinklocal.co.za/biz/tops-at-spar-tops-the-hill-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-the-hill-la-montagne'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-montagne-day-spa-la-montagne', 'La Montagne Day Spa & Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'la-montagne'),
  '63 Skool Street, La Montagne, Pretoria, 0184', '087 802 0562', 'https://www.lamontagnedayspa.co.za', NULL,
  'La Montagne Day Spa & Beauty Salon is a day spa and beauty salon in La Montagne, Pretoria, offering facials, massage and beauty treatments.',
  NULL, NULL,
  '["https://www.cvent.com/venues/pretoria/special-event-venue/la-montagne-day-spa-beauty-salon/venue-99fe8bb9-e4f6-4dcb-b1b7-678d08bd7bb5", "https://www.spadirectory.co.za/spa/pretoria/la-montagne-day-spa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-montagne-day-spa-la-montagne'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'smec-south-africa-la-montagne', 'SMEC South Africa',
  (SELECT id FROM suburbs WHERE slug = 'la-montagne'),
  'VKE Centre, 230 Albertus Street, La Montagne, Pretoria, 0184', '012 481 3800', 'https://www.smec.com', NULL,
  'SMEC South Africa is an engineering, management and development consultancy office in La Montagne, Pretoria.',
  NULL, NULL,
  '["https://www.smec.com/au/locations/pretoria/", "https://www.sayellow.com/view/south-africa/smec-sa-pretoria-in-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'smec-south-africa-la-montagne'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

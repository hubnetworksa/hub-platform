INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lnr-computers-plattekloof-village-shopping-centre-plattekloof', 'LNR Computers',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Shop 4, Plattekloof Village Shopping Centre, Corner Plattekloof Road & Baronetcy Boulevard, Plattekloof, Cape Town, 7500', '021 558 4428', NULL, NULL,
  'LNR Computers is a computer hardware, software and accessories retailer trading from Plattekloof Village Shopping Centre, Plattekloof.',
  NULL, NULL,
  '["https://www.yellowpages.net.za/phone-27-215584428-computer-store-Cape-Town-ZA10960.html", "https://za.africabz.com/western-cape/lnr-computers-237778"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lnr-computers-plattekloof-village-shopping-centre-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-plattekloof-village-shopping-centre-plattekloof', 'KFC Plattekloof Village',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Plattekloof Village Shopping Centre, Plattekloof Road, Plattekloof, Cape Town, 7500', '021 558 2193', NULL, NULL,
  'KFC Plattekloof Village is a branch of the fried chicken fast-food chain, trading from Plattekloof Village Shopping Centre, Plattekloof.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/cape-town/plattekloof-village-shopping-centre-plattekloof-road-platterkloof", "https://www.tiendeo.co.za/stores/cape-town/kfc-plattekloof-village-shopping-centre/38498"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-plattekloof-village-shopping-centre-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brights-hardware-plattekloof-village-shopping-centre-plattekloof', 'Brights Hardware',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Shop 7, Plattekloof Village, 2 Baronetcy Boulevard, Plattekloof, Cape Town, 7500', '021 558 0502', NULL, NULL,
  'Brights Hardware is a branch of the hardware and home improvement retail chain, trading from Plattekloof Village Shopping Centre, Plattekloof.',
  NULL, NULL,
  '["https://www.brights.co.za/store-locator/plattekloof", "https://za.africabz.com/western-cape/brights-plattekloof-village-126624"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brights-hardware-plattekloof-village-shopping-centre-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

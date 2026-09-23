INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'wavecrest-plaza-strandfontein', 'Wavecrest Plaza',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Corner Benguela Street & Wavecrest Avenue, Strandfontein, Cape Town, 7798', NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/alpha-pharm-wavecrest-pharmacy-in-strandfontein", "https://www.thinklocal.co.za/biz/wavecrest-pharmacy-strandfontein"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wavecrest-pharmacy-strandfontein', 'Wavecrest Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'wavecrest-plaza-strandfontein'),
  'Shop 4, Wavecrest Plaza, Corner Benguela & Wavecrest Avenue, Strandfontein, Cape Town, 7798', '021 393 3840', 'https://www.linkpharmacy.co.za', NULL,
  'Wavecrest Pharmacy is an Alpha Pharm-affiliated pharmacy in Wavecrest Plaza, Strandfontein.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/mitchells-plain/strandfontein/pharmacies/wavecrest-pharmacy", "https://www.cylex.net.za/company/wavecrest-pharmacy-17505953.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wavecrest-pharmacy-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'strandfontein-gas-and-hardware-strandfontein', 'Strandfontein Gas & Hardware',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  '156 Dennegeur Avenue, Strandfontein, Cape Town, 7798', '021 393 2917', NULL, NULL,
  'Strandfontein Gas & Hardware is a hardware store and gas supplier in Strandfontein.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/strandfontein-gas-hardware-319813", "https://mapcarta.com/W804714022"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'strandfontein-gas-and-hardware-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beantree-cafe-strandfontein', 'Beantree Cafe Strandfontein',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Inside Spar Strandfontein, Corner Wavecrest Avenue & Benguela Avenue, Strandfontein, Cape Town, 7798', '076 279 6906', NULL, 'beantreecafestrandfontein@gmail.com',
  'Beantree Cafe Strandfontein is a cafe inside Spar Strandfontein, serving burgers, ribs and home-style meals.',
  NULL, NULL,
  '["https://www.facebook.com/people/Beantree-Caf%C3%A8-Strandfontein/100095012896231/", "https://restaurantguru.com/Beantree-Cafe-at-Spar-Strandfontein-Cape-Town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beantree-cafe-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

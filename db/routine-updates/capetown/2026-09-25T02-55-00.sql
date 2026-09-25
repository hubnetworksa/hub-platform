INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '4x4-mega-world-paarden-eiland', '4x4 Mega World',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '26 Marine Drive, Paarden Eiland, Cape Town, 7405', '021 511 3311', 'https://www.4x4megaworldonline.com', NULL,
  '4x4 Mega World is a 4x4 accessories and off-road equipment retailer on Marine Drive, Paarden Eiland.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/4x4-mega-world-cape-town-103224", "https://www.4x4megaworldonline.com/stores/4x4-mega-world-paarden-eiland/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '4x4-mega-world-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ehire-paarden-eiland', 'EHIRE',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  'Unit 5A Natal Street, Paarden Eiland, Cape Town', '021 300 0936', 'https://ehire.co.za', NULL,
  'EHIRE is an event hire company on Natal Street, Paarden Eiland, supplying furniture, crockery and staffing for events.',
  NULL, NULL,
  '["https://ehire.co.za/contact/", "https://www.property24.com/property-values/25-natal-street/paardeneiland/milnerton/western-cape/ph7krgqwm4lcvollp5ed4xjzlbycfxosgix5et27biqqwvaweubaoufwyaxascwokathiub45t6d2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ehire-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'party-event-hire'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ergonomics-direct-paarden-eiland', 'Ergonomics Direct',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '75 Carlisle Street, Paarden Eiland, Cape Town, 7405', '021 426 2378', 'https://ergonomicsdirect.co.za', NULL,
  'Ergonomics Direct is a showroom and supplier of ergonomic office furniture and equipment on Carlisle Street, Paarden Eiland.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/ergonomicsdirect", "https://za.africabz.com/western-cape/ergonomicsdirect-304472"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ergonomics-direct-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'trenton-paarden-eiland', 'Trenton',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '82 Marine Drive, Paarden Eiland, Cape Town', '021 510 4428', 'https://trenton.co.za', NULL,
  'Trenton is a footwear showroom on Marine Drive, Paarden Eiland, and the South African home of brands including UGG, Fitflop, Hunter and TOMS.',
  NULL, NULL,
  '["https://trenton.co.za/pages/our-stores", "https://www.waze.com/live-map/directions/za/wc/cape-town/trenton-paarden-eiland"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'trenton-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'african-oils-and-vinegar-paarden-eiland', 'African Oils & Vinegar',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  'Shop 4, Paarden Eiland Business Centre, 7 Section Street, Paarden Eiland, Cape Town, 7405', '021 569 3710', 'https://africanoils.co.za', NULL,
  'African Oils & Vinegar is a specialty retailer of olive oils and vinegars at the Paarden Eiland Business Centre on Section Street.',
  NULL, NULL,
  '["https://africanoils.co.za/pages/contact", "https://za.africabz.com/western-cape/african-oils-539931"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'african-oils-and-vinegar-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

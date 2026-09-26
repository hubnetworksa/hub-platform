INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-ottery-centre-ottery', 'PEP Ottery Centre',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L49, Ottery Centre, New Ottery Road, Ottery, Cape Town, 7800', '021 703 1243', NULL, NULL,
  'PEP Ottery Centre is a branch of the national PEP clothing, footwear and homeware retail chain, in Ottery Hyper, Ottery.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-l-ottery-centre-new-ottery-road-ottery-cape-town-western-cape/11876", "https://www.facebook.com/PEPOttery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-ottery-centre-ottery'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoe-city-ottery-centre-ottery', 'Shoe City Ottery Centre',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L41, Ottery Centre, New Ottery Road, Ottery East, Cape Town, 7800', '021 204 0399', NULL, NULL,
  'Shoe City Ottery Centre is a branch of the national footwear retail chain, in Ottery Hyper, Ottery.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/shoe-city-shop-l-new-ottery-road/11662", "https://www.brabys.com/za/western-cape/cape-town/ottery-east/footwear-retailers/shoe-city", "https://www.cybo.com/ZA-biz/shoe-city-ottery-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoe-city-ottery-centre-ottery'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ottery-hardware-ottery', 'Ottery Hardware',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '262 Ottery Road, Ottery, Cape Town, 7800', '071 885 7974', 'https://otteryhardware.co.za', NULL,
  'Ottery Hardware is a small, community-focused DIY and hardware store in Ottery.',
  NULL, NULL,
  '["https://otteryhardware.co.za/", "https://www.cylex.net.za/company/ottery-hardware-plumbing---electrical-23834175.html", "https://www.facebook.com/p/Ottery-Hardware-262-Ottery-Road-Ottery-100063715044037/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ottery-hardware-ottery'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-os-motor-spares-portland', "Mr O's Motor Spares",
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  'Total Garage, Shop 3 Merrydale Road, Portlands, Mitchells Plain, Cape Town, 7785', '021 392 3786', 'https://mro.co.za', NULL,
  "Mr O's Motor Spares is a motor vehicle parts and accessories shop at the Total Garage on Merrydale Road, Portlands.",
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/mr-os-motor-spares-mitchells-plain", "https://www.yep.co.za/biz/store/iyp/7545320_3", "http://mro.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-os-motor-spares-portland'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

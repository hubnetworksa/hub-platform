INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'panorama-dental-panorama', 'Panorama Dental',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '32 Dorp Street, Panorama, Cape Town', '021 939 9114', NULL, NULL,
  'Panorama Dental is a dental practice on Dorp Street in Panorama.',
  NULL, NULL,
  '["https://panoramadental.co.za/contact-us/", "https://za.africabz.com/western-cape/panorama-dental-115103"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'panorama-dental-panorama'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-panorama-healthcare-centre-panorama', 'Dis-Chem Pharmacy Panorama Healthcare Centre',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Panorama Healthcare Centre, Shop 2, Corner Hennie Winterbach Street & Rothschild Boulevard, Panorama, Cape Town, 7530', '021 911 2050', NULL, NULL,
  'Dis-Chem Pharmacy Panorama Healthcare Centre is a pharmacy inside Panorama Healthcare Centre.',
  NULL, NULL,
  '["https://www.dischem.co.za/panorama-cape-town", "https://www.tiendeo.co.za/stores/cape-town/dischem-panorama-healthcare-centre-shop-cnr-hennie-winterbach-st-rothschild-blvd-panorama/75577"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-panorama-healthcare-centre-panorama'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coffee-couture-panorama', 'Coffee Couture Panorama',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Panorama Mediclinic, Rothschild Boulevard & Plattekloof Roads, Panorama, Cape Town, 7506', '021 930 4617', NULL, NULL,
  'Coffee Couture Panorama is a coffee shop inside the Mediclinic Panorama complex.',
  NULL, NULL,
  '["https://location.coffeecouture.co.za/panorama", "https://restaurantguru.com/Coffee-Couture-Cape-Town-2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coffee-couture-panorama'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

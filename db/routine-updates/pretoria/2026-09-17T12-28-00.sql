INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-gas-company-hennopspark', 'The Gas Company',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '25 Jakaranda Street, Hennopspark, Centurion, 0157', '+27 12 030 0333', 'https://www.thegascompany.co.za', NULL,
  'The Gas Company is an LPG gas supplier in Hennopspark, Centurion, offering gas cylinder refills and gas appliance sales and installation.',
  NULL, NULL,
  '["https://www.thegascompany.co.za/contact-us/", "https://www.yellosa.co.za/company/155255/the-gas-company"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-gas-company-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'corrupack-hennopspark', 'CorruPack',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '207 Edison Crescent, Hennopspark, Centurion', '(012) 004 0703', 'https://www.corrupack.co.za', 'sales@corrupack.co.za',
  'CorruPack is a packaging supplier in Hennopspark, Centurion, manufacturing and supplying corrugated boxes, bubble wrap, pallet wrap, strapping and custom printed packaging.',
  NULL, NULL,
  '["http://www.corrupack.co.za/contact.html", "https://za.africabz.com/gauteng/corrupack-47319"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'corrupack-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hennopspark-auto-repair-shop-hennopspark', 'Hennopspark Auto Repair Shop',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  'B2, 152 Edward Ave, Hennopspark, Centurion', '+27 69 775 0003', 'https://hennops-auto-repair.co.za', 'hennopsauto.repair@gmail.com',
  'Hennopspark Auto Repair Shop is an independent motor vehicle repair, maintenance and servicing workshop in Hennopspark, Centurion.',
  NULL, NULL,
  '["https://hennops-auto-repair.co.za/contact-us", "https://www.facebook.com/CayHennops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hennopspark-auto-repair-shop-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-hennopspark', 'Virgin Active Hennopspark',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  (SELECT id FROM shopping_centers WHERE slug = 'centurion-lifestyle-centre-hennopspark'),
  'Shop D7, Centurion Lifestyle Centre, cnr Old Johannesburg Road and Lenchen Avenue, Hennopspark, Centurion, 0157', '+27 12 493 2606', 'https://www.virginactive.co.za/gyms/hennopspark', NULL,
  'Virgin Active Hennopspark is a gym and fitness club inside Centurion Lifestyle Centre in Hennopspark, Centurion.',
  NULL, NULL,
  '["https://www.virginactive.co.za/gyms/hennopspark", "https://za.africabz.com/gauteng/virgin-active-hennopspark-red-6137"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-bank-hennopspark-hennopspark', 'Absa Bank Hennopspark',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  (SELECT id FROM shopping_centers WHERE slug = 'centurion-lifestyle-centre-hennopspark'),
  'Shop 36, Centurion Lifestyle Centre, cnr Lenchen and Old Johannesburg Road, Hennopspark, Centurion', '+27 12 681 0240', NULL, NULL,
  'Absa Bank Hennopspark is a bank branch inside Centurion Lifestyle Centre in Hennopspark, Centurion.',
  NULL, NULL,
  '["https://buzdy.com/viewBranch/absa-bank-absa-branch-hennopspark-shop-36-centurion-lifestyle-centre-cnr-lenchen-and-old-johannesburg-road-hennops-park-industrial-centurion-centurion-17631", "http://za.near-place.com/absa-branch-hennopspark-shop-36-centurion-lifestyle-centre-cnr-lenchen-and-old-johannesburg-road-hennops-park-industrial-centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-bank-hennopspark-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

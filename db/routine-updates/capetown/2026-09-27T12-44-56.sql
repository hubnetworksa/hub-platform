INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'carlton-hair-blue-route-tokai', 'Carlton Hair - Blue Route',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-route-mall-tokai'),
  'Shop G130, Blue Route Mall, 16 Tokai Road, Tokai, Cape Town, 7945', '021 713 4835', NULL, NULL,
  'Carlton Hair - Blue Route is a hair salon inside Blue Route Mall in Tokai, part of the Carlton Hair chain, offering cuts, colouring and other salon services.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/carlton-hair-blue-route-tokai-road-cape-town-VEo3r8", "https://za.africabz.com/western-cape/carlton-hair-168662"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carlton-hair-blue-route-tokai'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-meadowridge', 'The Crazy Store',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Shop 7-8, Meadowridge Shopping Centre, Cnr Firgrove Way & Howard Drive, Meadowridge, Cape Town, 7806', '087 135 8381', NULL, NULL,
  'The Crazy Store is a discount variety store inside Meadowridge Shopping Centre, selling homeware, stationery, toys and gifts.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/the-crazy-store---meadowridge-23697064.html", "https://www.tiendeo.co.za/stores/cape-town/crazy-store-meadowridge-shop-ctr-howard-dve-meadowridge-bergvliet-cape-town-south-africa/7481"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'print-hut-meadowridge', 'Print Hut',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Meadowridge Shopping Centre, Howard Drive, Meadowridge, Cape Town, 7806', '021 715 8067', NULL, NULL,
  'Print Hut is a printing and copying shop inside Meadowridge Shopping Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/print-hut-meadowridge-10988", "https://www.brabys.com/za/western-cape/cape-town/meadowridge/printers/print-hut"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'print-hut-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-meadowridge-meadowridge', 'Clicks Meadowridge',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Park ''N Shop, Firgrove Way, Meadowridge, Cape Town, 7806', '021 712 9287', NULL, NULL,
  'Clicks Meadowridge is a pharmacy and health-and-beauty retail store in the Meadowridge shopping precinct on Firgrove Way.',
  NULL, NULL,
  '["https://clicks.co.za/store/Meadowridge/113", "https://za.polomap.com/cape-town/85360"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-meadowridge-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sakura-harfield-village', 'Sakura',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  '48 Second Avenue, Harfield Village, Cape Town, 7708', '021 672 0250', NULL, NULL,
  'Sakura is a sushi and Asian-cuisine restaurant on Second Avenue in Harfield Village.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/dine-at-sakura/", "https://www.dining-out.co.za/md/Sakura-Restaurant-Harfield-Village/4883"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sakura-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'thai-world-harfield-village', 'Thai World',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  'Corner 2nd Avenue and Surrey Road, Harfield Village, Cape Town, 7708', '021 671 7462', NULL, NULL,
  'Thai World is a Thai restaurant at the corner of 2nd Avenue and Surrey Road in Harfield Village.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/thai-world/148796", "http://www.harfield-village.co.za/search-business-listings/restaurants/72-thai-world.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'thai-world-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ozone-clinic-harfield-village', 'Ozone Clinic Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  '31 2nd Avenue, Harfield Village, Cape Town, 7708', '084 517 0010', NULL, NULL,
  'Ozone Clinic Cape Town is a wellness clinic on 2nd Avenue in Harfield Village offering ozone therapy treatments.',
  NULL, NULL,
  '["https://ozonecliniccapetown.co.za/contact/", "https://harfield-village.co.za/business/ozone-clinic-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ozone-clinic-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

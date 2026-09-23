INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aqua-spares-steenberg', 'Aqua Spares',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  '49 Military Road, Steenberg, Cape Town', '021 713 6003', 'https://aquaspares.co.za', 'info@aquaspares.co.za',
  'Aqua Spares is a new and used car parts store in Steenberg.',
  NULL, NULL,
  '["https://www.facebook.com/SparePartsAqua/", "https://aquaspares.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aqua-spares-steenberg'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blocks-boutique-steenberg', 'Blocks Boutique',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  '144 Military Road, Steenberg, Cape Town, 7945', '078 435 1534', NULL, NULL,
  'Blocks Boutique is a barber shop in Steenberg.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/blocks-boutique-military-road-cape-town-A8PnrK", "https://za.africabz.com/western-cape/blocks-boutique-305271"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blocks-boutique-steenberg'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hungry-lion-steenberg-steenberg', 'Hungry Lion Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-centre-steenberg'),
  'Shop 1 & 2, Steenberg Centre, Military Road, Steenberg, Cape Town, 7945', '021 701 7236', NULL, NULL,
  'Hungry Lion Steenberg is a fast-food restaurant and takeaway branch located inside Steenberg Centre in Steenberg.',
  NULL, NULL,
  '["https://stores.hungrylion.co.za/details/steenberg", "https://www.facebook.com/hungrylionsteenberg/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hungry-lion-steenberg-steenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

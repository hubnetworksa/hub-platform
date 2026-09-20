INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'melkbos-kitchen-melkbosstrand', 'Melkbos Kitchen',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  '47 5th Avenue, Melkbosstrand, Cape Town, 7441', '021 001 8210', NULL, NULL,
  'Melkbos Kitchen is a bistro-style restaurant on 5th Avenue in Melkbosstrand, overlooking the beachfront.',
  NULL, NULL,
  '["https://melkboskitchen.co.za/", "https://www.tripadvisor.co.za/Restaurant_Review-g667022-d12786020-Reviews-Melkbos_Kitchen-Melkbosstrand_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'melkbos-kitchen-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'atlantic-view-pharmacy-melkbosstrand', 'Atlantic View Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  'Shop 2, Belzac Centre, 6th Ave, Melkbosstrand, Cape Town, 7441', '021 553 1917', NULL, NULL,
  'Atlantic View Pharmacy is a pharmacy in Belzac Centre on 6th Avenue in Melkbosstrand.',
  NULL, NULL,
  '["https://2pos.co.za/2/52", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=193441"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'atlantic-view-pharmacy-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'melkbos-hardware-melkbosstrand', 'Melkbos Hardware',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  '12 6th Avenue, Melkbosstrand, Cape Town, 7441', '021 553 2646', NULL, NULL,
  'Melkbos Hardware is a hardware and building-supplies store on 6th Avenue in Melkbosstrand.',
  NULL, NULL,
  '["https://melkboshardware.co.za/", "https://za.africabz.com/western-cape/melkbos-hardware-188089"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'melkbos-hardware-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

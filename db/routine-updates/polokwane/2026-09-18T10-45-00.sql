INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'legends-barbershop-mall-of-the-north-bendor', 'Legends Barbershop Mall of the North',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'),
  'R81, Mall of the North, Bendor, Polokwane, 0699', '015 265 1283', NULL, NULL,
  'Legends Barbershop Mall of the North is a barbershop inside Mall of the North, Bendor.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/legends-barbershop-mall-of-the-north-15ZAPQ", "https://mallofthenorth.co.za/shop/legends-barbershop/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'legends-barbershop-mall-of-the-north-bendor'),
  (SELECT id FROM categories WHERE slug = 'barbershops'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bendor-guest-house-bendor', 'Bendor Guest House',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '78 Bendor Drive, Bendor, Polokwane', '015 296 3923', NULL, NULL,
  'Bendor Guest House is a bed and breakfast in Bendor offering en-suite rooms, a self-catering unit and small conference facilities.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Hotel_Review-g312624-d8424593-Reviews-Bendor_GuestHouse-Polokwane_Limpopo_Province.html", "https://www.safarinow.com/go/bendorguesthousepolokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bendor-guest-house-bendor'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'becker-attorneys-bendor', 'Becker Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Unit 2, Proforum Building, Ismini Office Park, 4 Ismini Str, Bendor, Polokwane', '015 291 1819', 'https://beckerinc.co.za/', NULL,
  'Becker Attorneys is a law firm based in the Ismini Office Park in Bendor.',
  NULL, NULL,
  '["https://beckerinc.co.za/contact-us/", "https://directory.ilawyer.co.za/listing/becker-attorneys/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'becker-attorneys-bendor'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

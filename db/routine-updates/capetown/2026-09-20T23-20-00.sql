-- Cape Town routine: Fish Hoek suburb research (new Valyland Centre + 2 tenants, 1 Town Square tenant, 1 standalone)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'valyland-centre-fish-hoek', 'Valyland Centre',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  'Recreation Road, Fish Hoek, Cape Town, 7974', NULL, NULL,
  '["http://www.valyland.co.za/", "https://valleycommunity.co.za/fishhoek/valylandcentre/", "https://www.kaikoura.co.za/valyland-centre.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'central-mica-hardware-fish-hoek', 'Central Mica Hardware',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'valyland-centre-fish-hoek'),
  'Valyland Centre, Recreation Road, Fish Hoek, Cape Town, 7974', '021 782 1131', NULL, NULL,
  'Central Mica Hardware is a branch of the Mica Hardware chain in Valyland Centre, Fish Hoek, stocking paint, power tools, gardening, pool care and building materials.',
  NULL, NULL,
  '["https://mica.co.za/store-location/western-cape/central-mica-hardware/", "https://central-mica.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'central-mica-hardware-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-fish-hoek-fish-hoek', 'SPAR Fish Hoek',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'valyland-centre-fish-hoek'),
  'Valyland Centre, Recreation Road, Fish Hoek, Cape Town, 7974', '021 782 5315', NULL, NULL,
  'SPAR Fish Hoek is a branch of the SPAR supermarket chain in Valyland Centre, offering groceries, a butchery, bakery, deli and fresh produce.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/spar-fish-hoek-6940", "https://za.africabz.com/western-cape/spar-fish-hoek-16175"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-fish-hoek-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'golden-river-spur-fish-hoek', 'Golden River Spur',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'fish-hoek-town-square-fish-hoek'),
  '1st Floor, Town Square Centre, Main Road, Fish Hoek, Cape Town, 7974', '021 782 2631', NULL, NULL,
  'Golden River Spur is a branch of the Spur Steak Ranches family restaurant chain on the first floor of Fish Hoek Town Square.',
  NULL, NULL,
  '["https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/fish+hoek/golden-river-spur", "https://crave.co.za/establishment.asp?est=16434"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'golden-river-spur-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  's-and-h-optometrists-fish-hoek', 'S & H Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  'The Arcade, Main Road, Fish Hoek, Cape Town, 7975', '021 782 6092', NULL, 'info@optomfishhoek.co.za',
  'S & H Optometrists is an optometry practice in The Arcade on Main Road, Fish Hoek, also known as Stephenson & Hodgkinson Optometrists.',
  NULL, NULL,
  '["https://optomfishhoek.co.za/contact-us/", "https://www.sayellow.com/stephenson-and-hodgkinson-optometrist-fish-hoek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 's-and-h-optometrists-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

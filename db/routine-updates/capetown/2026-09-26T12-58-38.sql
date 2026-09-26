INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'makemba-boutique-kommetjie', 'Makemba Boutique',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Shop 29, Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '074 472 4973', NULL, NULL,
  'Makemba Boutique is a boutique in Imhoff Farm selling handmade clothing and jewellery, in Kommetjie.',
  NULL, NULL,
  '["https://imhofffarm.co.za/makemba-boutique/", "https://www.instagram.com/makembaboutique/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'makemba-boutique-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-board-shop-kommetjie', 'The Board Shop',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  '11C & D Fish Eagle Park, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 5820', 'https://theboardshop.co.za', NULL,
  'The Board Shop is a supplier of kitchen and built-in cupboard board materials, timber and hardware, in Kommetjie.',
  NULL, NULL,
  '["https://theboardshop.co.za/", "https://za.africabz.com/western-cape/the-board-shop-131344"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-board-shop-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

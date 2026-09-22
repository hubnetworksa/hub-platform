-- Jobs 1-2: Plumstead suburb sweep
-- New shopping centre: Pick n Pay Centre, corner Wicklow & Gabriel Road
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'pick-n-pay-centre-plumstead', 'Pick n Pay Centre',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  'Corner Wicklow & Gabriel Road, Plumstead, Cape Town', NULL, NULL,
  '["https://www.guzzle.co.za/malls/787/", "https://www.yep.co.za/biz/store/iyp/5967382_2"]',
  'centre'
);

-- 3Arts Village tenants (existing centre)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nandos-3arts-village-plumstead', 'Nando''s 3Arts Village',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  'Shop GF-S23, 260 Main Road, 3 Arts Village Shopping Centre, Plumstead, Cape Town, 7800', '021 761 2632', 'https://store.nandos.co.za/details/plumstead', NULL,
  'Nando''s 3Arts Village is a branch of the peri-peri chicken chain in Plumstead, with drive-thru and small sit-down seating.',
  NULL, NULL,
  '["https://store.nandos.co.za/details/plumstead", "https://za.africabz.com/western-cape/nandos-plumstead-27261"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nandos-3arts-village-plumstead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-barbers-range-3arts-village-plumstead', 'The Barber''s Range 3Arts Village',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  'Shop GF-S31, 260 Main Road, 3 Arts Village, Plumstead, Cape Town, 7800', '074 082 8571', 'https://thebarbersrange.co.za', NULL,
  'The Barber''s Range is an old-fashioned barbershop at 3Arts Village offering haircuts, beard trims, shaves and traditional hot towel treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/the-barbers-range-3art-village-cape-town-Wq812v", "https://za.africabz.com/western-cape/the-barbers-range-3art-village-373706"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-barbers-range-3arts-village-plumstead'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-book-shoppe-plumstead', 'The Book Shoppe',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  '3 Arts Village, 260 Main Road, Plumstead, Cape Town, 7945', '021 713 1528', NULL, 'requests@thebookshoppe.co.za',
  'The Book Shoppe is a secondhand and antiquarian bookstore at 3Arts Village, stocking restored fiction, non-fiction, kids'' books, art and vinyl, with coffee and snacks on offer.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-book-shoppe-370489", "https://hombaze.co.za/the-book-shoppe-62500522065320304/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-book-shoppe-plumstead'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

-- New tenant of Pick n Pay Centre
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-pantry-plumstead-plumstead', 'The Pantry Plumstead',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = 'pick-n-pay-centre-plumstead'),
  'Shop 20C, Pick n Pay Centre, Corner Wicklow & Gabriel Road, Plumstead, Cape Town', '081 665 9653', 'https://thepantrysa.co.za/plumstead', NULL,
  'The Pantry Plumstead is a quick-counter cafe at the Pick n Pay Centre serving artisan baked goods and coffee, with free wifi.',
  NULL, NULL,
  '["https://thepantrysa.co.za/plumstead", "https://www.facebook.com/thepantryplumstead/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-pantry-plumstead-plumstead'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

-- General suburb research: Moksh Indian Restaurant (not in a shopping centre)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'moksh-indian-restaurant-plumstead', 'Moksh Indian Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  'FNB Building, 137 Main Road, Plumstead, Cape Town, 7800', '021 761 1363', 'https://mokshrestaurants.com/plumstead/', NULL,
  'Moksh Indian Restaurant is a North Indian restaurant in Plumstead known for tandoor-cooked dishes and curries.',
  NULL, NULL,
  '["https://mokshrestaurants.com/plumstead/", "https://www.tripadvisor.com/Restaurant_Review-g6776488-d33219893-Reviews-Moksh_Indian_Restaurant_Plumstead-Plumstead_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'moksh-indian-restaurant-plumstead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

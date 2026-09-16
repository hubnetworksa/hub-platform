-- Cape Town CBD: job 1/2 research checkpoint

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'golden-acre-cape-town-cbd', 'Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '9 Adderley Street, Cape Town', NULL, NULL,
  '["https://en.wikipedia.org/wiki/Golden_Acre_(Cape_Town)", "https://golden-acre.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mama-africa-cape-town-cbd', 'Mama Africa',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '178 Long Street, Cape Town', '021 426 1017', NULL, NULL,
  'Mama Africa is a Pan-African restaurant and bar on Long Street offering traditional African cuisine and nightly live entertainment, in Cape Town CBD.',
  NULL, NULL,
  '["https://mamaafricacpt.com/contact", "https://www.eatout.co.za/venue/mama-africa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mama-africa-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'royale-eatery-cape-town-cbd', 'Royale Eatery',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '273 Long Street, City Centre, Cape Town', '021 422 4536', NULL, NULL,
  'Royale Eatery is a gourmet burger restaurant on Long Street known for its milkshakes and vegetarian options, in Cape Town CBD.',
  NULL, NULL,
  '["https://www.royaleeatery.com/", "https://www.flickr.com/photos/mallix/798960023"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'royale-eatery-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clarkes-bar-dining-room-cape-town-cbd', 'Clarke''s Bar and Dining Room',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '133 Bree Street, Cape Town', '021 424 7648', NULL, NULL,
  'Clarke''s Bar and Dining Room is a restaurant and bar on Bree Street known for its Reuben sandwiches and burgers, in Cape Town CBD.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/clarkes-bar-and-dining-room?to=place.ChIJnTuF52VnzB0RTGAL7oSEWTU", "https://www.capetownccid.org/explore/eat/clarkes-bar-and-dining-room"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clarkes-bar-dining-room-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barrs-pharmacy-cape-town-cbd', 'Barr''s Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '14 Long Street, Cape Town', '021 421 6756', NULL, NULL,
  'Barr''s Pharmacy is a community pharmacy on Long Street offering free medicine delivery within the CBD, in Cape Town CBD.',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/wc/cape-town/pharmacies/barr-s-pharmacy_142575+4.html", "https://opening-hours.co.za/04113056/Barr''s_Pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barrs-pharmacy-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clarkes-bookshop-cape-town-cbd', 'Clarke''s Bookshop',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '199 Long Street, Cape Town', '021 423 5739', NULL, NULL,
  'Clarke''s Bookshop is an independent bookshop on Long Street specialising in Africana and second-hand books, trading since 1957, in Cape Town CBD.',
  NULL, NULL,
  '["https://maps.apple.com/place?address=199+Long+StreetCape+TownWC8001South+Africa&coordinate=-33.9251074%2C18.4165192&name=Clarke%27s+Bookshop&place-id=IA77C89A93D39CCB3&_provider=9902", "https://clarkesbooks.co.za/pages/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clarkes-bookshop-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

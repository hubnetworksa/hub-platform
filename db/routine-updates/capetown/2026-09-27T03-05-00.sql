-- Job 1/2: va-waterfront suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'baia-seafood-restaurant-va-waterfront', 'Baia Seafood Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  '19 Breakwater Boulevard, V&A Waterfront, Cape Town, 8001', '021 421 0935', 'http://baiarestaurant.co.za/', NULL,
  'Baia Seafood Restaurant is an upmarket seafood restaurant at the V&A Waterfront, overlooking the harbour on Breakwater Boulevard.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Baia-Seafood-Restaurant/2093", "http://baiarestaurant.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'baia-seafood-restaurant-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'willoughby-and-co-va-waterfront', 'Willoughby & Co',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 6132, 19 Dock Rd, Victoria Wharf Shopping Centre, V&A Waterfront, Cape Town, 8001', '021 418 6115', 'https://www.willoughbyandco.co.za/', NULL,
  'Willoughby & Co is a long-standing sushi and seafood restaurant inside Victoria Wharf at the V&A Waterfront, known for its fresh sushi and Japanese-fusion menu.',
  NULL, NULL,
  '["https://www.waterfront.co.za/eat-and-drink/willoughby-co", "https://www.tripadvisor.com/ShowUserReviews-g312659-r51941936-Willoughby_Co-Cape_Town_Central_Western_Cape.html", "https://willoughbyandco.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'willoughby-and-co-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'den-anker-va-waterfront', 'Den Anker Restaurant & Bar',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Pierhead, V&A Waterfront, Cape Town, 8001', '021 419 0249', 'https://denanker.co.za/', NULL,
  'Den Anker is a Belgian restaurant and bar on the Pierhead at the V&A Waterfront, specialising in mussels, Belgian beer and harbour views.',
  NULL, NULL,
  '["https://denanker.co.za/", "https://www.waterfront.co.za/food_and_drinks/den-anker-restaurant-bar/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'den-anker-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harbour-house-va-waterfront', 'Harbour House',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Quay Four, Dock Road, V&A Waterfront, Cape Town, 8001', '021 418 4744', NULL, NULL,
  'Harbour House is a seafood restaurant on Quay Four at the V&A Waterfront, serving Mediterranean-influenced seafood dishes overlooking the harbour.',
  NULL, NULL,
  '["https://www.waterfront.co.za/food_and_drinks/harbour-house/", "https://www.corner.inc/place/22361"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harbour-house-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mitchells-scottish-ale-house-va-waterfront', 'Mitchell''s Scottish Ale House',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Corner of East Pier and Dock Road, V&A Waterfront, Cape Town, 8001', '021 419 5074', 'https://mitchellsalehouse.co.za/', NULL,
  'Mitchell''s Scottish Ale House is a pub and brewery restaurant at the V&A Waterfront, serving pub fare and craft beer brewed on site.',
  NULL, NULL,
  '["https://www.waterfront.co.za/food_and_drinks/mitchells-scottish-ale-house/", "https://www.eatout.co.za/venue/mitchells-waterfront-brewery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mitchells-scottish-ale-house-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'louis-vuitton-va-waterfront', 'Louis Vuitton',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 6256 & 6259B, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town, 8001', '+27 10 157 7111', 'https://uk.louisvuitton.com/eng-gb/point-of-sale/south-africa/louis-vuitton-cape-town', NULL,
  'Louis Vuitton is a luxury fashion flagship store inside Victoria Wharf at the V&A Waterfront.',
  NULL, NULL,
  '["https://uk.louisvuitton.com/eng-gb/point-of-sale/south-africa/louis-vuitton-cape-town", "https://nowinsa.co.za/2026/louis-vuitton-opens-new-store-va-waterfront-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'louis-vuitton-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

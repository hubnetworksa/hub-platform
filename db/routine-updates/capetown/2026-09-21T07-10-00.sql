INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'magnolia-social-dining-lounge-somerset-west', 'Magnolia Social Dining Lounge',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '1 Erinvale Avenue, Somerset West, 7130', '021 847 1160', NULL, NULL,
  'Magnolia Social Dining Lounge is a restaurant at Erinvale Estate Hotel & Spa in Somerset West, serving sharing plates and regional fare.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/magnolia-social-dining-lounge/", "https://erinvale.co.za/restaurants/magnolia-social-dining-lounge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'magnolia-social-dining-lounge-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'moksh-indian-restaurant-somerset-west', 'Moksh Indian Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '41 Victoria Street, Audas Estate, Somerset West', '021 851 2213', NULL, NULL,
  'Moksh Indian Restaurant is an Indian restaurant in Audas Estate, Somerset West.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/moksh-indian-restaurant-2/", "https://mokshrestaurants.com/somerset-west/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'moksh-indian-restaurant-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oceans-8-seafood-and-sushi-somerset-west', 'Oceans 8 Seafood & Sushi',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Corner Main Road & Van der Byl Road, Van der Stel, Somerset West', '084 904 9339', NULL, NULL,
  'Oceans 8 Seafood & Sushi is a seafood and sushi restaurant in the Van der Stel area of Somerset West.',
  NULL, NULL,
  '["https://www.facebook.com/Oceans8Restaurant/", "https://www.eatout.co.za/venue/oceans-8-seafood-sushi/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oceans-8-seafood-and-sushi-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'henris-restaurant-and-wine-bar-somerset-west', 'Henri''s Restaurant & Wine Bar',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '164 Main Road, Somerset West, 7130', '021 852 6442', NULL, NULL,
  'Henri''s Restaurant & Wine Bar is a restaurant on Main Road in Somerset West, in a renovated heritage building, serving grass-fed beef, seafood and wood-fired pizza.',
  NULL, NULL,
  '["https://henrisrestaurant.co.za/", "https://www.facebook.com/henris.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'henris-restaurant-and-wine-bar-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mlv-law-somerset-west', 'MLV Law',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '1 Metrohm House, 20 Gardner Williams Avenue, Somerset West', '021 853 1535', NULL, NULL,
  'MLV Law (Malan Lourens Viljoen Inc) is a law firm in Somerset West specialising in litigation, family law, labour law, property law, commercial law, and wills, estates and trusts.',
  NULL, NULL,
  '["https://mlvlaw.co.za/", "https://www.facebook.com/mlvlaw"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mlv-law-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'morkel-de-villiers-inc-somerset-west', 'Morkel & De Villiers Inc',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '13 Drama Road, Somerset West, 7130', '021 850 9700', NULL, NULL,
  'Morkel & De Villiers Inc is a long-established law firm in the Helderberg area, based in Somerset West, providing legal services since 1918.',
  NULL, NULL,
  '["https://mdv.legal/", "https://www.brabys.com/za/western-cape/somerset-west/attorneys/morkel-de-villiers-incorporated"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'morkel-de-villiers-inc-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ridgemor-villa-guest-house-firgrove', 'Ridgemor Villa Guest House',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'R102, Firgrove, Somerset West, 7129', '021 842 2972', 'https://ridgemorvilla.com', NULL,
  'Ridgemor Villa Guest House is a guest house on the R102 in Firgrove, on the slopes of the Helderberg near Somerset West.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/accommodation/ridgemor-villa-guest-house", "https://www.booking.com/hotel/za/ridgemor-villa.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ridgemor-villa-guest-house-firgrove'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'news-cafe-firgrove', 'News Cafe',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-sanctuary-shopping-centre-somerset-west'),
  'Shop G14, The Sanctuary Shopping Centre, Niblick Way, Firgrove Rural, 7110', '087 470 1304', NULL, 'somersetwest@newscafe.co.za',
  'News Cafe is a restaurant and bar in The Sanctuary Shopping Centre, Firgrove, part of the News Cafe restaurant chain.',
  NULL, NULL,
  '["https://www.newscafe.co.za/stores/south-africa/somerset-west/", "https://www.facebook.com/alexandrajohn.dahlia/posts/news-cafe-somerset-westshop-g14-the-sanctuary-shopping-centre-niblick-way-firgro/4628730487413534/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'news-cafe-firgrove'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

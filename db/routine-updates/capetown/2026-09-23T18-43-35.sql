-- Job 1/2: kalk-bay suburb research, 2 new businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-brass-bell-kalk-bay', 'The Brass Bell',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '75 Main Road, Kalk Bay, Cape Town, 7975', '021 788 5455', NULL, NULL,
  'The Brass Bell is a seafood restaurant and pub right on Kalk Bay''s Main Road, known for its ocean-side dining and live music.',
  NULL, NULL,
  '["https://www.brassbell.co.za/", "https://www.capetownmagazine.com/brass-bell"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-brass-bell-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oh-so-boho-kalk-bay', 'Oh So Boho',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '96-98 Main Road, Kalk Bay, Cape Town, 7990', '021 788 2443', NULL, NULL,
  'Oh So Boho is a bohemian-style clothing and accessories boutique on Kalk Bay''s Main Road.',
  NULL, NULL,
  '["https://www.ohsoboho.co.za/pages/about-us", "https://www.brabys.com/za/western-cape/cape-town/kalk-bay/clothing-retailers/oh-so-boho"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oh-so-boho-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

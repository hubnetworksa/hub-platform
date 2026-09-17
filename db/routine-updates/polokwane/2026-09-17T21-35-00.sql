INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lindekroon-guest-house-hospark', 'Lindekroon Guest House',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '18 Voortrekker Street, Hospital Park, Polokwane, 0699', '015 295 3988', 'https://lindekroonguesthouse.co.za/', NULL,
  'Lindekroon Guest House is a bed and breakfast guest house in Hospital Park, Polokwane.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/accommodation/lindekroon-guest-house", "https://lindekroonguesthouse.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lindekroon-guest-house-hospark'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jorenes-guest-house-hospark', 'Jorene''s Guest House',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '15 Hoog Street, Hospital Park, Polokwane, 0700', '015 291 5302', NULL, NULL,
  'Jorene''s Guest House is a guest house in Hospital Park, Polokwane.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/accommodation/jorenes-guest-house", "https://givingmore.co.za/jorene-s-guest-house"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jorenes-guest-house-hospark'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-lofts-overnight-accommodation-hospark', 'The Lofts Overnight Accommodation',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '78B Voortrekker Street, Hospital Park, Polokwane, 0700', '015 297 5605', 'https://www.the-lofts.co.za/', NULL,
  'The Lofts Overnight Accommodation is a guest house in Hospital Park, Polokwane.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/accommodation/the-lofts-overnight-accommodation", "https://www.the-lofts.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-lofts-overnight-accommodation-hospark'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

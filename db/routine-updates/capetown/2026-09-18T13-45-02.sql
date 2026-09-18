INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rosedene-guest-house-higgovale', 'Rosedene Guest House',
  (SELECT id FROM suburbs WHERE slug = 'higgovale'),
  '28 Upper Kloof Street, Higgovale, Cape Town', '021 424 3290', NULL, NULL,
  'Rosedene Guest House is a bed and breakfast on Upper Kloof Street, in Higgovale, Cape Town.',
  NULL, NULL,
  '["https://www.rosedene.co.za/", "https://www.hotel.com.au/cape-town/rosedene-guest-house.htm"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rosedene-guest-house-higgovale'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kensington-place-higgovale', 'Kensington Place',
  (SELECT id FROM suburbs WHERE slug = 'higgovale'),
  '38 Kensington Crescent, Higgovale, Cape Town', '021 424 4744', NULL, NULL,
  'Kensington Place is a boutique hotel on Kensington Crescent, in Higgovale, Cape Town.',
  NULL, NULL,
  '["https://www.kensingtonplace.co.za/", "https://www.i-escape.com/kensington-place"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kensington-place-higgovale'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

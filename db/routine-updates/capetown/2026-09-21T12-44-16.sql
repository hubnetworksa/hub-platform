INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tribe-coffee-woodstock', 'Tribe Coffee',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '170 Albert Road, Woodstock, Cape Town', '021 448 3362', NULL, NULL,
  'Tribe Coffee is a coffee shop and roastery at the Woodstock Foundry on Albert Road, in Woodstock.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6623117-Reviews-Tribe_Coffee_Cafe-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/tribe-coffee-shop/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tribe-coffee-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'field-office-woodstock', 'Field Office',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '66 Albert Road, Woodstock, Cape Town', '021 447 2771', NULL, NULL,
  'Field Office is a coffee shop and eatery in the Woodstock Exchange on Albert Road, in Woodstock.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'field-office-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tasca-mozambique-woodstock', 'Tasca Mozambique',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '163 Victoria Road, Woodstock, Cape Town', '021 448 6523', NULL, NULL,
  'Tasca Mozambique is a Portuguese and Mozambican restaurant on Victoria Road, in Woodstock.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Tasca-Mozambique/10454", "https://hungryforhalaal.co.za/listing/tasca-mozambique/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tasca-mozambique-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

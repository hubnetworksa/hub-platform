INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'culture-wine-bar-newlands', 'Culture Wine Bar Newlands',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  '1 Kildare Road, Newlands, Cape Town, 7700', '076 256 8654', NULL, NULL,
  'Culture Wine Bar Newlands is a wine and tapas bar in Newlands, a sister location of the Culture Wine Bar in the Cape Town CBD.',
  NULL, NULL,
  '["https://destinali.com/cape-town/bar-nightlife/culture-wine-bar-newlands-cape-town", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d23306176-Reviews-Culture_Wine_Bar-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'culture-wine-bar-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'newlands-brewery-newlands', 'Newlands Brewery',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  '3 Main Road, Newlands, Cape Town', '021 658 7440', NULL, NULL,
  'Newlands Brewery is the oldest operating brewery in South Africa, offering brewery tours in Newlands.',
  NULL, NULL,
  '["https://www.capetown.travel/listing/newlands-brewery/", "https://www.tripadvisor.co.za/Attraction_Review-g312582-d6433937-Reviews-Newlands_Brewery-Newlands_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'newlands-brewery-newlands'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'basilico-newlands', 'Basilico',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  '32 Kildare Road, Newlands, Cape Town', '021 683 5989', NULL, NULL,
  'Basilico is an Italian restaurant in Newlands with views of Table Mountain.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/basilico/", "https://www.basilico.co.za/contact-us/9-uncategorised"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'basilico-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'paradise-road-newlands', 'Paradise Road',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  'Shop 5, Cardiff Castle, 58 Main Street, Newlands, Cape Town', '060 645 6235', NULL, NULL,
  'Paradise Road is a bakery in Cardiff Castle, Newlands, offering freshly-baked bread and pastries alongside a small selection of fresh flowers.',
  NULL, NULL,
  '["https://www.paradiseroad.co.za/", "https://thismammaloves.com/2022/05/16/table-seven-at-paradise-road/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'paradise-road-newlands'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

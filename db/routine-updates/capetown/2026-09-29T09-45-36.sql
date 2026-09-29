INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southern-sun-cape-sun-cape-town-cbd', 'Southern Sun Cape Sun',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '23 Strand Street, Cape Town, 8001', '021 488 5100', 'https://www.southernsun.com/southern-sun-cape-sun', NULL,
  'Southern Sun Cape Sun is a large city-centre hotel on Strand Street in the Cape Town CBD, part of the Southern Sun hotel group.',
  NULL, NULL,
  '["https://www.southernsun.com/southern-sun-cape-sun/contact-us", "https://capetown.hotelguide.co.za/Cape_Town_City_Bowl-travel/cape-town-hotel-cape-sun_location.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'southern-sun-cape-sun-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maru-korean-steakhouse-cape-town-cbd', 'Maru Korean Steakhouse',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '107 Bree Street, Cape Town, 8001', '021 109 0039', 'https://maru.co.za/', 'capetown@maru.co.za',
  'Maru Korean Steakhouse is a Korean barbecue restaurant on Bree Street in the Cape Town CBD, part of the city''s culinary mile of independent restaurants.',
  NULL, NULL,
  '["https://maru.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d34000529-Reviews-Maru_Korean_Steakhouse-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'maru-korean-steakhouse-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hacienda-coastal-mexican-cape-town-cbd', 'Hacienda Coastal Mexican',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '92 Bree Street, Cape Town, 8001', '021 422 0128', NULL, 'capetown@hacienda.co.za',
  'Hacienda Coastal Mexican is a Mexican restaurant on Bree Street in the Cape Town CBD, part of the city''s culinary mile of independent restaurants.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/hacienda-coastal-mexican/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d24138375-Reviews-Hacienda_Coastal_Mexican-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hacienda-coastal-mexican-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

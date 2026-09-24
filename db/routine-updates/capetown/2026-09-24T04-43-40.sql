-- jobs 1-2: suburb research for gardens, tamboerskloof, oranjezicht

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vadivelu-gardens', 'Vadivelu',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '151 Kloof Street, Gardens, Cape Town, 8001', '021 300 5777', NULL, NULL,
  'Vadivelu is an Indian restaurant on Kloof Street, Gardens, serving South African Indian cuisine with a contemporary twist.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/vadivelu/", "https://www.capetownetc.com/cape-town/restaurants/vadivelu-on-kloof-street/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vadivelu-gardens'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'knead-bakery-cafe-gardens', 'Knead Bakery & Café',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'lifestyle-on-kloof-gardens'),
  'Shop 16, Lifestyle on Kloof, 50 Kloof Street, Gardens, Cape Town', '021 424 1666', NULL, NULL,
  'Knead Bakery & Café is an artisan bakery and café in Lifestyle on Kloof, Gardens, serving fresh-baked bread and pastries.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/knead-kloof-street/", "https://www.lifestyleonkloofct.co.za/browse-directory/1344/knead/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'knead-bakery-cafe-gardens'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tamboers-winkel-gardens', 'Tamboers Winkel',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '3 De Lorentz Street, Gardens, Cape Town, 8001', '021 424 0521', NULL, NULL,
  'Tamboers Winkel is a café and general store on De Lorentz Street, Gardens, serving coffee, breakfast and light meals.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/tamboers-winkel/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d4430137-Reviews-Tamboers_Winkel-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tamboers-winkel-gardens'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'citivet-tamboerskloof-tamboerskloof', 'Citivet Tamboerskloof',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '42 De Lorentz Street, Tamboerskloof, Cape Town, 8001', '021 423 0113', NULL, NULL,
  'Citivet Tamboerskloof is a veterinary clinic on De Lorentz Street, Tamboerskloof, offering consultations and emergency pet care.',
  NULL, NULL,
  '["https://www.yellowpages.net.za/phone_27-214230113_emergency-veterinarian-service_Cape-Town_ZA434863.html", "https://www.citivet.net/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'citivet-tamboerskloof-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mooi-hair-salon-oranjezicht', 'Mooi Hair Salon',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  '101 Upper Orange Street, Oranjezicht, Cape Town, 8001', '021 423 6553', NULL, NULL,
  'Mooi Hair Salon is a hairdressing and beauty salon on Upper Orange Street, Oranjezicht.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/mooi-hair-salon-upper-orange-street-cape-town-bx64vX", "https://mooihairsalon.co.za/2021/07/01/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mooi-hair-salon-oranjezicht'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

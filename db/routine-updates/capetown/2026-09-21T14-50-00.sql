INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mamacitas-district-six', 'Mamacita''s',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '75 Harrington Street, District Six, Cape Town', '083 660 5515', 'https://www.mamacitas.co.za/', NULL,
  'Mamacita''s is a Mexican restaurant and cocktail bar on Harrington Street in District Six.',
  NULL, NULL,
  '["https://www.mamacitas.co.za/", "https://www.dineplan.com/restaurants/mamacitas-on-harrington"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mamacitas-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-harrington-street-district-six', 'Bootlegger Harrington Street',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '50 Harrington Street, District Six, Cape Town', '021 201 6708', NULL, NULL,
  'Bootlegger Harrington Street is a coffee shop and casual eatery on Harrington Street in District Six, part of the Bootlegger Coffee Company chain.',
  NULL, NULL,
  '["https://ourcafes.bootlegger.coffee/FoodDrink-TheHarrington-BootleggerHarringtonStreet", "https://www.tripadvisor.com/Restaurant_Review-g312659-d13982011-Reviews-Bootlegger_Coffee_Company_Harrington-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-harrington-street-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'neighbourgood-84-harrington-district-six', 'Neighbourgood 84 Harrington',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '84 Harrington Street, District Six, Cape Town', '021 140 6778', 'https://www.neighbourgood.co/84-harrington', 'hello@neighbourgood.co',
  'Neighbourgood 84 Harrington is a 4-star graded aparthotel on Harrington Street in District Six, offering self-contained serviced apartments.',
  NULL, NULL,
  '["https://www.booking.com/hotel/za/neighbourgood-84-harrington.html", "https://www.property24.com/to-rent/cape-town-city-centre/cape-town/western-cape/9138/114341578"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'neighbourgood-84-harrington-district-six'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

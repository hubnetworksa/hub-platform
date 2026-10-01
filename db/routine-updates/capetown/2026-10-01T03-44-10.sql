INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stor-age-ottery-road-ottery', 'Stor-Age Ottery Road',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '5 John Tyres Close, Ottery, Cape Town, 7808', '021 201 5218', NULL, NULL,
  'Stor-Age Ottery Road is a self-storage facility on Ottery Road, Ottery, offering storage units for residential and business use.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/5ef3fac2521d7d5b5512a604eb6a9f5c/stor-age-ottery-road/cape-town/storage", "https://stor-age.co.za/stores/ottery-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stor-age-ottery-road-ottery'),
  (SELECT id FROM categories WHERE slug = 'commercial-property-office-space'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stor-age-springfield-road-ottery', 'Stor-Age Springfield Road',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '57 Springfield Street, Ottery, Cape Town, 7750', '021 879 1073', NULL, NULL,
  'Stor-Age Springfield Road is a self-storage facility in Ottery, offering storage units for residential and business use.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/stor-age-self-storage-ottery-springfield-road-23805876.html", "https://stor-age.co.za/stores/ottery-springfield-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stor-age-springfield-road-ottery'),
  (SELECT id FROM categories WHERE slug = 'commercial-property-office-space'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jumbo-cash-and-carry-ottery', 'Jumbo Cash & Carry',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  'Old Ottery Road, Ottery, Cape Town, 7808', '021 704 0371', NULL, NULL,
  'Jumbo Cash & Carry is a wholesale cash-and-carry store on Old Ottery Road, Ottery, selling general merchandise, food and household goods in bulk.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/jumbo-cash-and-carry/old-ottery-road-ottery", "https://www.eeziads.co.za/p/504175/jumbo-cash-&-carry-ottery"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jumbo-cash-and-carry-ottery'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'usave-ottery', 'Usave Ottery',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '392 Ottery Road, Ottery, Cape Town', '021 703 5042', NULL, NULL,
  'Usave Ottery is a discount grocery store on Ottery Road, Ottery.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/usave-ottery-46380", "https://www.africabizinfo.com/ZA/usave-ottery-021-703-5042"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'usave-ottery'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-ottery-centre-ottery', 'Wimpy Ottery Centre',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L14B, Ottery Centre, Woodlands Road, Ottery, Cape Town, 7808', '021 891 0406', NULL, NULL,
  'Wimpy Ottery Centre is a Wimpy restaurant inside Ottery Centre, Ottery.',
  NULL, NULL,
  '["https://locations.wimpy.co.za/restaurants-OtteryCentre-WimpyOttery", "https://crave.co.za/establishment.asp?est=21661"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-ottery-centre-ottery'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bloomberg-gym-ottery', 'Bloomberg Gym Ottery',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  '1st Floor, Ottery Centre, New Ottery Road, Ottery, Cape Town', '021 704 1543', NULL, NULL,
  'Bloomberg Gym Ottery is a fitness and health club inside Ottery Centre, Ottery, with a cardio area, weights area, group exercise studio and sauna.',
  NULL, NULL,
  '["http://www.bloomberggym.co.za/index.php/contact", "https://www.africanadvice.com/1043561/Fitness_Centre/Cape_Town/Bloomberg_Health_And_Fitness_Club"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bloomberg-gym-ottery'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

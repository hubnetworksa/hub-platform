-- Jobs 1-2: Muizenberg suburb research

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-muize-muizenberg', 'The Muize Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Corner Main Road & Atlantic Road, Muizenberg, Cape Town, 7945', NULL, NULL,
  '["https://www.bizcommunity.com/Article/196/570/116211.html", "https://eprop.co.za/commercial-property-news/item/16420-popular-muizenberg-retail-centre-undergoes-renovations-and-receives-new-management"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'happy-rooster-muizenberg', 'Happy Rooster',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'First Floor, Muizenberg Station Building, Muizenberg, Cape Town, 7945', '067 901 0900', NULL, NULL,
  'Happy Rooster is a Portuguese-style restaurant located above Muizenberg train station, serving dishes such as trinchado steak and peri-peri chicken with sea views over False Bay, in Muizenberg.',
  NULL, NULL,
  '["https://www.timeout.com/cape-town/restaurants/the-happy-rooster", "https://6000.co.za/happy-rooster/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'happy-rooster-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hang-ten-cafe-muizenberg', 'Hang Ten Cafe',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Balmoral Building, 62 Beach Road, Muizenberg, Cape Town, 7945', '021 788 2001', NULL, NULL,
  'Hang Ten Cafe is a crêperie and coffee bar at Muizenberg''s Surfers Corner, popular with locals and surfers for its sweet crêpes, juices and coffee, in Muizenberg.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d10067431-Reviews-Hang_Ten_Cafe-Muizenberg_Western_Cape.html", "https://www.eatout.co.za/venue/hang-ten-cafe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hang-ten-cafe-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gaslight-cafe-muizenberg', 'Gaslight Cafe',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '13 Kent Road, Surfers Corner, Muizenberg, Cape Town, 7945', '021 788 6994', NULL, NULL,
  'Gaslight Cafe is an owner-run cafe at Surfer''s Corner in Muizenberg, serving breakfast and light meals at any time of day, next to Muizenberg train station.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d6485568-Reviews-Gaslight_Cafe-Muizenberg_Western_Cape.html", "https://texxandthecity.com/2019/10/smet-pleks-to-suip-in-the-southern-suburbs-the-gaslight-cafe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gaslight-cafe-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-coffee-company-muizenberg', 'Bootlegger Coffee Company',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Empire Building, 80 Beach Road, Muizenberg, Cape Town, 7945', '021 709 0606', NULL, NULL,
  'Bootlegger Coffee Company is a specialty coffee shop at Surfers Corner in Muizenberg, open daily for all-day breakfast, lunch and coffee, with soft-serve ice cream also on offer.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/bootlegger-coffee-company-muizenberg/", "https://www.tripadvisor.co.za/Restaurant_Review-g1509162-d12958166-Reviews-Bootlegger_Coffee_Company_Muizenberg-Muizenberg_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-coffee-company-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caledonian-cycles-muizenberg', 'Caledonian Cycles',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '120 Main Road, Muizenberg, Cape Town, 7945', '021 788 5257', 'https://caledonioncycles.co.za/', NULL,
  'Caledonian Cycles is a family-run bicycle shop established in 1945, offering bicycle sales, servicing and repairs, in Muizenberg.',
  NULL, NULL,
  '["https://caledonioncycles.co.za/", "https://bicyclesouth.co.za/listings/caledonion-cycles/caledonian-cycles/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caledonian-cycles-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'false-bay-veterinary-clinic-muizenberg', 'False Bay Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Shop 13, The Muize Shopping Centre, Corner Main & Atlantic Road, Muizenberg, Cape Town, 7945', '021 788 1172', 'https://falsebayvet.co.za/', NULL,
  'False Bay Veterinary Clinic is a small-animal veterinary practice inside The Muize Shopping Centre offering wellness check-ups, vaccinations, dental care and emergency treatment, in Muizenberg.',
  NULL, NULL,
  '["https://falsebayvet.co.za/", "https://www.brabys.com/business/6040946/south-africa/western-cape/cape-town/muizenberg/main-rd/veterinary-clinics/false-bay-veterinary-clinic"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'false-bay-veterinary-clinic-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
UPDATE businesses SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'the-muize-muizenberg')
WHERE slug = 'false-bay-veterinary-clinic-muizenberg';

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'muizenberg-medical-practice-muizenberg', 'Muizenberg Medical Practice',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '50 Main Road, Corner Main and Ronleigh Roads, Muizenberg, Cape Town, 7945', '021 788 8685', 'https://www.muizenbergmedical.co.za/', NULL,
  'Muizenberg Medical Practice is a general medical and dental practice offering GP consultations and dental care, at Muizenberg Medical Square on Main Road, Muizenberg.',
  NULL, NULL,
  '["https://www.muizenbergmedical.co.za/contact", "https://www.facebook.com/p/Muizenberg-Medical-Practice-100063679297655/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'muizenberg-medical-practice-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-muizenberg', 'Checkers',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-muize-muizenberg'),
  'The Muize Shopping Centre, Corner Main Road & Atlantic Road, Muizenberg, Cape Town, 7945', '021 787 9160', NULL, NULL,
  'Checkers is a supermarket anchoring The Muize Shopping Centre, offering groceries and everyday essentials, in Muizenberg.',
  NULL, NULL,
  '["https://www.checkers.co.za/store-directory-and-leaflets/store-details/369", "https://za.africabz.com/western-cape/checkers-muizenberg-8187"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

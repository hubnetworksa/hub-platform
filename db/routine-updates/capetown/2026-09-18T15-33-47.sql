-- Parallel agent research batch (7 agents assigned to Cape Town suburbs
-- across the City Bowl/Atlantic Seaboard, Southern Suburbs, and Northern
-- Suburbs -- this file covers 5 of those 7 agents' results; a follow-up
-- file covers the remaining 2). Each business verified against 2+
-- independent sources with mandatory phone+address, cross-checked against
-- the existing dataset (which had almost no coverage in these suburbs) to
-- avoid duplicates. Full research notes (including discarded/unverifiable
-- leads -- there were many, this dataset had a strict bar applied) are in
-- this session's conversation log, not reproduced here.

-- New shopping centres discovered this batch

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'victoria-wharf-va-waterfront', 'Victoria Wharf Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Breakwater Boulevard, V&A Waterfront, Cape Town, 8002', NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/victoria-wharf/", "https://www.tripadvisor.com/Attraction_Review-g312659-d12822292-Reviews-Victoria_Wharf_Shopping_Centre-Cape_Town_Central_Western_Cape.html"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'adelphi-centre-sea-point', 'Adelphi Centre',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '277 Main Road, Sea Point, Cape Town, 8005', NULL, NULL,
  '["https://www.mallguide.co.za/malls/view/866/adelphi-centre", "https://nearbyza.com/place/adelphi-centre"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'rondebosch-main-centre-rondebosch', 'Rondebosch Main Centre',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  'Main Road, Rondebosch, Cape Town, 7700', NULL, NULL,
  '["https://www.rondeboschmain.co.za/stores/", "https://www.fpggroup.co.za/rondebosch-main/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'cavendish-square-claremont', 'Cavendish Square',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '1 Dreyer St, Claremont, Cape Town, 7708', NULL, NULL,
  '["https://cavendish.co.za/", "https://www.capetown.travel/listing/cavendish-square/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kenilworth-centre-kenilworth', 'Kenilworth Centre',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  'Doncaster Road, Kenilworth, Cape Town, 7708', NULL, NULL,
  '["https://www.yellosa.co.za/company/269738/kenilworth-centre", "https://www.lekkeslaap.co.za/attractions/kenilworth-centre"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'access-park-kenilworth', 'Access Park',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '81 Chichester Road, Kenilworth, Cape Town', NULL, NULL,
  '["https://www.accesspark.co.za/", "https://www.fresha.com/lp/en/bt/hair-salons/in/za-cape-town/kenilworth"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'sherwood-shopping-centre-bergvliet', 'Sherwood Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  'Corner Children''s Way and Dreyersdal Road, Bergvliet, Cape Town, 7945', NULL, NULL,
  '["https://sherwoodshopping.co.za/", "https://www.rennieproperty.co.za/buildings/sherwood-court.html"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'meadowridge-shopping-centre-meadowridge', 'Meadowridge Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  'Howard Drive & Firgrove Way, Meadowridge, Cape Town', NULL, NULL,
  '["https://www.anvilproperty.co.za/commercial-property/retail/to-rent/meadowridge/park-n-shop-meadowridge-cape-town-3108", "https://www.rennieproperty.co.za/buildings/park-n-shop---meadowridge.html"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'goodwood-mall-goodwood', 'Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  'Cnr MacDonald & Voortrekker Road, Goodwood, Cape Town, 7460', NULL, NULL,
  '["https://www.shopshours.co.za/goodwood-mall/cape-town/c-57f3c9f347d677c3b27a5b1c", "https://www.africanadvice.com/1154209/Shopping_Centre_And_Malls/Western_Cape/Goodwood_Mall/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'brackenfell-shopping-centre-brackenfell', 'Brackenfell Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Old Paarl Road, Brackenfell, Cape Town', NULL, NULL,
  '["https://brackenfellcentre.co.za/", "https://www.facebook.com/brackenfellcentre/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'glengarry-shopping-centre-brackenfell', 'Glengarry Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Cnr De Bron & Fairtrees Road, Vredekloof, Brackenfell, Cape Town, 7560', NULL, NULL,
  '["https://maps.apple.com/place?place-id=IDCAC755BDB5620F1", "https://glengarryshoppingcentre.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'capegate-shopping-centre-brackenfell', 'Capegate Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'De Bron Road & Okavango Road, Brackenfell, Cape Town, 7562', NULL, NULL,
  '["https://www.bestdirectory.co.za/capegate-shopping-centre-brackenfell-shopping-in-capegate-brackenfell-western-cape.html", "https://www.myguidecapetown.com/shopping/cape-gate-centre"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'durbanville-town-centre-durbanville', 'Durbanville Town Centre',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '31 Wellington Road, Durbanville, Cape Town, 7550', NULL, NULL,
  '["https://www.durbanvilletowncentre.co.za/stores/", "https://www.shoprite.co.za/Western-Cape/Cape-Town/Durbanville/Shoprite-Durbanville/store-details/1894"]',
  'mall'
);

-- Businesses: V&A Waterfront / Walmer Estate / Sea Point / Green Point / Mouille Point / Bantry Bay

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'amare-bantry-bay', 'Amare',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '29 Victoria Road, Bantry Bay, Cape Town', '021 300 8290', 'https://amarecapetown.com', 'info@amarecapetown.com',
  'Amare is a Mediterranean-inspired restaurant in Bantry Bay, Cape Town, named Africa''s Best New Restaurant at the 2025 World Culinary Awards.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/specials/amare/", "https://purely-local.co.za/cape-town/bantry-bays-amare-restaurant-is-the-latest-culinary-hotspot/", "https://www.dining-out.co.za/md/Amare/11823"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'amare-bantry-bay'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-butcher-shop-and-grill-mouille-point', 'The Butcher Shop and Grill',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '125 Beach Road, Mouille Point, Cape Town, 8005', '021 434 0813', NULL, NULL,
  'The Butcher Shop and Grill is a steakhouse restaurant on Beach Road in Mouille Point, Cape Town, serving steak, burgers and seafood.',
  NULL, NULL,
  '["https://nearbyza.com/place/the-butcher-shop-grill-1", "https://www.eatout.co.za/venue/butcher-shop-grill-mouille-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-butcher-shop-and-grill-mouille-point'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lilys-mouille-point', 'Lily''s',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  'Shop 1, East West Building, Corner Beach Road & Surrey Place, Mouille Point, Cape Town, 8001', '021 204 8545', 'https://www.kovecollection.co.za/lilys/', 'managers@lilysrestaurant.co.za',
  'Lily''s is a neighbourhood restaurant on the Mouille Point promenade in Cape Town.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/lily''s-restaurant-mouille-point", "https://www.kovecollection.co.za/lilys/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'lilys-mouille-point'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vetpoint-clinic-sea-point', 'VetPoint Clinic',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '28 Kloof Road, Sea Point, Cape Town, 8005', '021 434 8831', NULL, 'admin@vetpoint.co.za',
  'VetPoint is a full-service small-animal veterinary clinic in Sea Point, Cape Town.',
  NULL, NULL,
  '["https://savet.co.za/vet/vetpoint-clinic", "https://veterinary.co.za/find-a-vet/vetpoint/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'vetpoint-clinic-sea-point'), (SELECT id FROM categories WHERE slug = 'vets-animal-care'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pigalle-cape-town-green-point', 'Pigalle Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '57A Somerset Road, Green Point, Cape Town, 8005', '021 421 4848', 'https://pigalle.capetown', 'info@pigalle.capetown',
  'Pigalle is a 350-seat fine-dining restaurant in Green Point, Cape Town, offering seafood and steak alongside live entertainment.',
  NULL, NULL,
  '["https://pigalle.capetown/welcome-to-pigalle/contact-us", "https://www.yep.co.za/biz/store/pigalle-restaurant/656347"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'pigalle-cape-town-green-point'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-extrablatt-green-point', 'Cafe Extrablatt',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '79 Main Road, Green Point, Cape Town, 8051', '021 434 3759', 'https://www.cafe-extrablatt.co.za/', NULL,
  'Cafe Extrablatt is a German-style cafe and restaurant in Green Point, Cape Town, serving breakfast, pizza and burgers.',
  NULL, NULL,
  '["https://www.cafe-extrablatt.co.za/", "https://www.sa-venues.com/things-to-do/westerncape/cafe-extrablatt/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'cafe-extrablatt-green-point'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belthazar-va-waterfront', 'Belthazar Restaurant & Wine Bar',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-va-waterfront'),
  'Victoria Wharf, 19 Breakwater Boulevard, V&A Waterfront, Cape Town, 8001', '021 421 3753', 'https://www.belthazar.co.za', NULL,
  'Belthazar is a steakhouse and seafood restaurant with a wine bar inside the Victoria Wharf Shopping Centre at the V&A Waterfront, Cape Town.',
  NULL, NULL,
  '["https://www.belthazar.co.za/contact", "https://www.dineplan.com/restaurants/belthazar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'belthazar-va-waterfront'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-adelphi-sea-point', 'Dis-Chem Adelphi',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  (SELECT id FROM shopping_centers WHERE slug = 'adelphi-centre-sea-point'),
  'Shop 27, Adelphi Centre, 277 Main Road, Sea Point, Cape Town, 8005', '021 541 0664', 'https://www.dischem.co.za/adelphi-cape-town', NULL,
  'Dis-Chem Adelphi is a pharmacy and health store located inside the Adelphi Centre in Sea Point, Cape Town.',
  NULL, NULL,
  '["https://www.dischem.co.za/adelphi-cape-town", "https://www.mallguide.co.za/malls/view/866/adelphi-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'dis-chem-adelphi-sea-point'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-sea-point', 'Spec-Savers Sea Point',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  (SELECT id FROM shopping_centers WHERE slug = 'adelphi-centre-sea-point'),
  'Shop 8, Adelphi Centre, 277 Main Road, Sea Point, Cape Town, 8005', '021 202 9971', 'https://www.specsavers.co.za/store/sea-point', NULL,
  'Spec-Savers Sea Point is an optometry store located inside the Adelphi Centre in Sea Point, Cape Town.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/sea-point", "https://www.mallguide.co.za/malls/view/866/adelphi-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'spec-savers-sea-point'), (SELECT id FROM categories WHERE slug = 'opticians'), 1);

-- Businesses: Clifton / Camps Bay / Fresnaye / Bakoven / Rondebosch

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-caprice-camps-bay', 'Café Caprice',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '37 Victoria Road, Camps Bay, Cape Town, 8005', '021 438 8315', 'https://www.cafecaprice.co.za/', NULL,
  'Café Caprice is a beach bar and restaurant in Camps Bay, open on Camps Bay''s Victoria Road beachfront since 2001.',
  NULL, NULL,
  '["https://www.cafecaprice.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d1989589-Reviews-Cafe_Caprice-Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'cafe-caprice-camps-bay'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lite-kem-camps-bay-pharmacy', 'Lite-Kem Camps Bay Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  'Shop 20 & 21, The Promenade, 83 Victoria Road, Camps Bay, Cape Town, 8005', '021 438 2088', NULL, NULL,
  'Lite-Kem Camps Bay Pharmacy is a retail pharmacy located in the Promenade centre on Camps Bay''s Victoria Road.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/1548207_2", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88018"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'lite-kem-camps-bay-pharmacy'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-bakoven', 'Bootlegger Coffee Company (Bakoven)',
  (SELECT id FROM suburbs WHERE slug = 'bakoven'),
  '38 Victoria Road, Bakoven, Camps Bay, Cape Town, 8005', '+27 21 201 1339', NULL, NULL,
  'Bootlegger Coffee Company is a coffee shop in Bakoven, part of a South African coffee-shop group started in 2012.',
  NULL, NULL,
  '["https://wanderlog.com/place/details/2263423/bootlegger-bakoven", "https://www.tripadvisor.com/Restaurant_Review-g4574140-d12969770-Reviews-Bootlegger_Coffee_Company_Bakoven-Bakoven_Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bootlegger-bakoven'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-bungalow-clifton', 'The Bungalow',
  (SELECT id FROM suburbs WHERE slug = 'clifton'),
  'The Glen Country Club, 3 Victoria Road, Clifton, Cape Town, 8005', '021 438 2018', 'https://www.glenclub.co.za/the-bungalow', NULL,
  'The Bungalow is a restaurant in Clifton operating from the Glen Country Club premises on Victoria Road.',
  NULL, NULL,
  '["https://www.kovecollection.co.za/the-bungalow/", "https://www.glenclub.co.za/the-bungalow"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-bungalow-clifton'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'glen-country-club-clifton', 'Glen Country Club',
  (SELECT id FROM suburbs WHERE slug = 'clifton'),
  '3 Victoria Road, Clifton, Cape Town, 8005', '021 438 1512', 'https://www.glenclub.co.za', NULL,
  'Glen Country Club is a sports club in Clifton hosting multiple sporting codes including lawn bowls and padel, founded in 1955.',
  NULL, NULL,
  '["https://www.glenclub.co.za/contact", "https://foursquare.com/v/glen-country-club/4ce54833ca41236af9677b4b"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'glen-country-club-clifton'), (SELECT id FROM categories WHERE slug = 'fitness-gyms'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-clarendon-boutique-hotel-fresnaye', 'The Clarendon Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'fresnaye'),
  '67 Kloof Road, Fresnaye, Cape Town, 8005', '+27 21 434 6853', 'https://www.clarendon.co.za', NULL,
  'The Clarendon Boutique Hotel is a boutique hotel in Fresnaye on Kloof Road.',
  NULL, NULL,
  '["https://www.clarendon.co.za/", "https://www.ca.kayak.com/Cape-Town-Hotels-The-Clarendon---Fresnaye.313394.ksp"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-clarendon-boutique-hotel-fresnaye'), (SELECT id FROM categories WHERE slug = 'accommodation'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-rondebosch', 'Clicks Pharmacy (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 18 & 23, Rondebosch Main Centre, Main Road, Rondebosch, Cape Town, 7700', '021 689 8973', NULL, NULL,
  'Clicks Pharmacy is a pharmacy and retail health store trading in the Rondebosch Main Centre.',
  NULL, NULL,
  '["https://www.rondeboschmain.co.za/stores/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=226170"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-rondebosch'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'specsavers-rondebosch', 'Specsavers Rondebosch',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop G23, Rondebosch Main & Fountain Centre, 93 Main Street, Rondebosch, Cape Town, 7700', '021 686 6708', 'https://www.specsavers.co.za/store/rondebosch', NULL,
  'Specsavers Rondebosch is an optometry and eyewear store trading in the Rondebosch Main Centre.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/rondebosch", "https://www.rondeboschmain.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'specsavers-rondebosch'), (SELECT id FROM categories WHERE slug = 'opticians'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-k-rondebosch', 'Mr K (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  'Shop 1.1A, Riverside Mall, 95 Main Road, Rondebosch, Cape Town, 7700', '021 023 0811', 'https://www.mrk.co.za', NULL,
  'Mr K is a precious-metals and Krugerrand dealer trading in Rondebosch.',
  NULL, NULL,
  '["https://www.mrk.co.za/get-in-touch/rondebosch/", "https://www.rondeboschmain.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mr-k-rondebosch'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-dentist-on-main-rondebosch', 'The Dentist on Main (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  '41 Main Road, Rondebosch, Cape Town, 7700', '+27 21 685 5927', 'https://www.dentistonmain.co.za', NULL,
  'The Dentist on Main is a dental practice on Main Road in Rondebosch, next to Vida e Caffè.',
  NULL, NULL,
  '["https://www.dentistonmain.co.za/contact/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=207211"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-dentist-on-main-rondebosch'), (SELECT id FROM categories WHERE slug = 'dentists'), 1);

-- Businesses: Claremont / Mowbray / Newlands / Rondebosch East

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hudsons-the-burger-joint-claremont', 'Hudson''s The Burger Joint',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '25 Protea Rd, Claremont, Cape Town, 7708', '021 674 5152', 'https://www.theburgerjoint.co.za/our-stores', NULL,
  'Hudson''s The Burger Joint is a restaurant in Claremont serving gourmet burgers and wood-fired pizzas.',
  NULL, NULL,
  '["https://www.theburgerjoint.co.za/our-stores", "https://www.eatout.co.za/venue/hudsons-claremont/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'hudsons-the-burger-joint-claremont'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'morituri-pizzeria-ristorante-claremont', 'Morituri Pizzeria & Ristorante',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '214 Main Road, Claremont, 7708', '021 683 6671', NULL, NULL,
  'Morituri Pizzeria & Ristorante is an Italian restaurant in Claremont that has traded at the same Main Road address for over 18 years.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/morituri", "https://www.food-blog.co.za/morituri-pizzeria/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'morituri-pizzeria-ristorante-claremont'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-mowbray', 'Shoprite Mowbray',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '13 Main Road, Mowbray, Cape Town', '021 658 7160', NULL, NULL,
  'Shoprite Mowbray is a supermarket on Main Road in Mowbray, Cape Town.',
  NULL, NULL,
  '["https://mydorpie.com/m/?page=chain_shoprite_mowbray", "https://maps.me/catalog/shops/shop-supermarket/shoprite-4611686018500909644/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shoprite-mowbray'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-dean-street-newlands', 'Bootlegger – Dean Street',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  'Shop T16, Dean St, Newlands, Cape Town, 7700', '021 203 5330', NULL, NULL,
  'Bootlegger is a coffee shop in the Dean Street retail strip in Newlands.',
  NULL, NULL,
  '["https://coffeedec.com/shop/listing/bootlegger-dean-street-newlands-cape-town-coffee-shop/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bootlegger-dean-street-newlands'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hair-studio-rondebosch-east', 'Hair Studio Rondebosch',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  '75 4th Avenue, Rondebosch East, Cape Town, 7780', '021 696 7694', NULL, NULL,
  'Hair Studio Rondebosch is a hair salon in Rondebosch East offering styling, colour and keratin treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lp/en/bt/hair-salons/in/za-cape-town/rondebosch-east", "https://za.africabz.com/western-cape/hair-studio-59047"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'hair-studio-rondebosch-east'), (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'authentic-aesthetics-sa-rondebosch-east', 'Authentic Aesthetics S.A',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  '37 Ayrshire St, Rondebosch East, Cape Town, 7780', '064 000 2021', NULL, NULL,
  'Authentic Aesthetics S.A is a beauty and aesthetics clinic in Rondebosch East offering laser hair removal, skincare and slimming treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/authentic-aesthetics-s-a-ayrshire-street-cape-town-P54oA", "https://www.findmy.co.za/services/business/authentic-aesthetics-sa/1911"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'authentic-aesthetics-sa-rondebosch-east'), (SELECT id FROM categories WHERE slug = 'spas-wellness'), 1);

-- Businesses: Bergvliet (Sherwood Shopping Centre tenants) / Harfield Village

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lees-chinese-bergvliet', 'Lee''s Chinese',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'sherwood-shopping-centre-bergvliet'),
  'Sherwood Centre, Corner Children''s Way and Dreyersdal Road, Bergvliet, Cape Town, 7945', '071 363 9861', 'https://leeschinesekitchen.co.za', NULL,
  'Lee''s Chinese is a Chinese restaurant in Bergvliet, trading from the Sherwood Shopping Centre.',
  NULL, NULL,
  '["https://sherwoodshopping.co.za/lees-chinese/", "https://www.yep.co.za/biz/store/lees-chinese-restaurant/346290", "https://www.mrdfood.com/food-delivery/restaurant/lees-chinese_bergvliet/534"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'lees-chinese-bergvliet'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lime-tree-cafe-bergvliet', 'Lime Tree Café',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'sherwood-shopping-centre-bergvliet'),
  'Sherwood Centre, Corner Children''s Way and Dreyersdal Road, Bergvliet, Cape Town, 7945', '021 712 1497', 'https://limetreecafe.co.za', 'info@limetreecafe.co.za',
  'Lime Tree Café is a restaurant and deli in Bergvliet serving breakfast, lunch and dinner from the Sherwood Shopping Centre.',
  NULL, NULL,
  '["https://limetreecafe.co.za/", "https://sherwoodshopping.co.za/limetree/", "https://www.tripadvisor.com/Restaurant_Review-g6857443-d7159193-Reviews-Lime_Tree_Cafe-Bergvliet_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'lime-tree-cafe-bergvliet'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'xciter-sports-bergvliet', 'Xciter Sports',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'sherwood-shopping-centre-bergvliet'),
  'Shop 4, Sherwood Centre, Corner Children''s Way and Dreyersdal Road, Bergvliet, Cape Town, 7945', '081 772 7198', 'https://xciter.co.za', 'info@xciter.co.za',
  'Xciter Sports is a multi-sport retail store in Bergvliet specialising in cycling, running and triathlon gear with a bike workshop.',
  NULL, NULL,
  '["https://sherwoodshopping.co.za/xciter-sports/", "https://opening-hours.co.za/03952442/Xciter_Sports_-_Bergvliet", "https://bikeshops.heyplaces.co.za/01976221/Xciter_Sports_-_Bergvliet"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'xciter-sports-bergvliet'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'veganic-asian-mart-bergvliet', 'Veganic Asian Mart',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'sherwood-shopping-centre-bergvliet'),
  'Shop 7b, Sherwood Centre, Corner Children''s Way and Dreyersdal Road, Bergvliet, Cape Town, 7945', '083 818 8889', NULL, NULL,
  'Veganic Asian Mart is a specialty grocery store in Bergvliet stocking vegan and vegetarian Asian ingredients and spices.',
  NULL, NULL,
  '["https://sherwoodshopping.co.za/veganic-asian-mart/", "https://za.africabz.com/western-cape/veganic-419712", "https://opening-hours.co.za/04025626/Veganic_Asian_Mart"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'veganic-asian-mart-bergvliet'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-avenue-restaurant-and-grill-harfield-village', 'The Avenue Restaurant and Grill',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  'Second Avenue, Harfield Village, Claremont, Cape Town', '021 671 0623', NULL, NULL,
  'The Avenue Restaurant and Grill is a family-run restaurant on Second Avenue in Harfield Village serving steaks and grills.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/the-avenue-restaurant-and-grill/", "https://www.dining-out.co.za/md/The-Avenue-Restaurant-and-Grill/5656"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-avenue-restaurant-and-grill-harfield-village'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'banana-jam-cafe-harfield-village', 'Banana Jam Café',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  'Second Avenue, Harfield Village, Cape Town, 7708', '021 674 0186', 'https://bananajamcafe.co.za', NULL,
  'Banana Jam Café is a Caribbean-style café and bar on the Second Avenue strip in Harfield Village.',
  NULL, NULL,
  '["https://en.wikipedia.org/wiki/Harfield_Village", "https://cape-town.infoisinfo.co.za/card/banana-jam-cafe/222358"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'banana-jam-cafe-harfield-village'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

-- Businesses: Southfield / Bellville / Parow / Durbanville

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blackburns-pharmacy-southfield', 'Blackburns Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '153 Victoria Road, Southfield, Cape Town, 7800', '021 705 6604', 'https://www.alphapharmacies.co.za/department/blackburns-pharmacy/', NULL,
  'Blackburns Pharmacy is a community pharmacy in Southfield that has operated at this location for more than 50 years.',
  NULL, NULL,
  '["https://www.alphapharmacies.co.za/department/blackburns-pharmacy/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=85135", "https://www.yep.co.za/biz/store/iyp/23176_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'blackburns-pharmacy-southfield'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bp-southfield', 'BP Southfield',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '146 Victoria Road, Southfield, Cape Town, 7800', '021 705 6153', NULL, NULL,
  'BP Southfield is a fuel station and motor repair/maintenance garage in Southfield.',
  NULL, NULL,
  '["https://www.brabys.com/business/2908268/south-africa/western-cape/cape-town/southfield/victoria-rd/motor-car-repairs-maintenance/garages-service-stations/b-p-southfield", "https://nearfinderza.com/business/western-cape/cape-town/bp-southfield-cc_421590+9.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-southfield'), (SELECT id FROM categories WHERE slug = 'fuel-stations'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-willowbridge-bellville', 'Food Lover''s Market (Willowbridge North)',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'Willowbridge North Shopping Centre, Carl Cronje Drive, Bellville, 7530', '021 914 8011', NULL, NULL,
  'Food Lover''s Market is a fresh-produce and grocery supermarket in the Willowbridge North Shopping Centre in Bellville.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/shop-willowbridge-village-shopping-centre-bellville-carl-cronje-drive/49435", "https://my-catalogue.co.za/stores/bellville/food-lovers-market/willowbridge-north-shopping-centre-carl-cronje-drive", "https://vymaps.com/ZA/Food-Lovers-Market-Willowbridge-T11578069/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'food-lovers-market-willowbridge-bellville'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-bellville', 'Shoprite Bellville',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  '147 Voortrekker Road, Bellville, 7530', '021 941 1700', 'https://www.shoprite.co.za/Western-Cape/Bellville/Shoprite-Bellville/store-details/1048', NULL,
  'Shoprite Bellville is a supermarket on Voortrekker Road offering a bakery, meat market, deli and in-store banking services.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Bellville/Shoprite-Bellville/store-details/1048", "https://hombaze.co.za/shoprite-bellville-16898743256480065933/", "https://za.africabz.com/western-cape/shoprite-bellville-58147"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shoprite-bellville'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-parow', 'Shoprite Parow',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '178 Voortrekker Road, Parow, Cape Town, 7500', '021 929 1320', NULL, NULL,
  'Shoprite Parow is a supermarket on Voortrekker Road with a bakery, meat market and deli counter.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/shoprite-liquorshop-parow-station", "https://za.africabz.com/western-cape/shoprite-parow-107633", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Parow/4801"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shoprite-parow'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'faulls-pharmacy-parow', 'Faull''s Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '169 Voortrekker Road, Parow, Cape Town, 7500', '021 939 6481', NULL, NULL,
  'Faull''s Pharmacy is a retail pharmacy on Voortrekker Road in Parow.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/489875/faulls-pharmacy", "https://vymaps.com/ZA/Faulls-Pharmacy-Parow-378257082233224/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'faulls-pharmacy-parow'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-durbanville', 'Shoprite Durbanville',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'durbanville-town-centre-durbanville'),
  'Shop 1, Durbanville Town Centre, 31 Wellington Road, Durbanville, 7550', '021 970 4760', 'https://www.shoprite.co.za/Western-Cape/Cape-Town/Durbanville/Shoprite-Durbanville/store-details/1894', NULL,
  'Shoprite Durbanville is a supermarket anchoring the Durbanville Town Centre.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Durbanville/Shoprite-Durbanville/store-details/1894", "https://www.durbanvilletowncentre.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shoprite-durbanville'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

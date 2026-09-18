-- Second parallel-agent research round (10 agents: 4 Polokwane, 6 Cape
-- Town). This file covers Cape Town's new shopping centres and businesses.
-- Every entry verified against 2+ independent sources with mandatory
-- phone+address (shopping centres verified as entities via 2 sources on
-- name+address, same bar as any other new shopping centre; not every
-- individual tenant of a newly-discovered centre was independently
-- verified this round -- only tenants meeting the full bar are included
-- as businesses below). No description rewrites (job 4) were performed --
-- out of scope for this round by explicit owner instruction.

-- New shopping centres discovered this round

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'fish-hoek-town-square-fish-hoek', 'Fish Hoek Town Square',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '61 Main Road, Fish Hoek, Cape Town', NULL, NULL,
  '["https://www.fishhoektownsquare.co.za/a-z-stores/", "https://za.africabz.com/western-cape/fish-hoek-town-square-24568"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'longbeach-mall-noordhoek', 'Longbeach Mall',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  'Cnr Buller Louw Blvd & Sunnydale Road, Noordhoek, Cape Town, 7975', NULL, NULL,
  '["https://www.noordhoektourism.co.za/longbeach-mall/", "https://www.mallguide.co.za/malls/view/846/longbeach-mall"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'sun-valley-mall-sunnydale', 'Sun Valley Mall',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  'Cnr Noordhoek Main Road & Buller Louw Blvd, Sunnydale, Cape Town, 7975', NULL, NULL,
  '["https://sunvalley-mall.co.za/", "https://www.findglocal.com/ZA/Cape-Town/983168411774198/Sun-Valley-Mall"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bay-harbour-market-hout-bay', 'Bay Harbour Market',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  '31 Harbour Road, Hout Bay, Cape Town', NULL, NULL,
  '["https://www.bayharbour.co.za/traders/food-drink/", "https://www.capetownetc.com/things-to-do-cape-town/hout-bay-restaurants/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'imhoff-farm-kommetjie', 'Imhoff Farm',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  'Kommetjie Road, Kommetjie, Cape Town, 7975', NULL, NULL,
  '["https://imhofffarm.co.za/", "https://www.capetown.travel/your-neighbourhood-guide-to-kommetjie/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'noordhoek-farm-village-noordhoek', 'Noordhoek Farm Village',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  'Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', NULL, NULL,
  '["https://thefoodbarn.co.za", "https://www.caferoux.co.za", "https://www.capetourism.com/noordhoek-farm-village/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'canal-walk-century-city', 'Canal Walk Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  'Century Boulevard, Century City, Cape Town, 7441', NULL, NULL,
  '["https://en.wikipedia.org/wiki/Canal_Walk", "https://www.callupcontact.com/b/businessprofile/Canal_Walk_Shopping_Centre/7236830"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'somerset-mall-somerset-west', 'Somerset Mall',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Centenary Drive, Somerset West, Cape Town, 7130', NULL, NULL,
  '["https://en.wikipedia.org/wiki/Somerset_Mall_(South_Africa)", "https://www.wheretostay.co.za/topic/5924-somerset-mall-in-somerset-cape-town"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'helderberg-centre-somerset-west', 'Helderberg Centre',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Cnr De Beers Avenue & Forsyth Road, Somerset West, 7130', NULL, NULL,
  '["https://helderbergcentre.com/stores/", "https://my-catalogue.co.za/stores/somerset-west/checkers/helderberg-centre-cnr-de-beers-avenue-forsyth-road"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'waterstone-village-somerset-west', 'Waterstone Village Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Cnr of R44 & Main Road, Somerset West, Cape Town, 7130', NULL, NULL,
  '["https://www.waterstonevillage.co.za", "https://en.wikipedia.org/wiki/Somerset_West"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bayside-mall-table-view', 'Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  'Corner of West Coast Road and Blaauwberg Road, Table View, 7443', NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/bayside-mall/", "https://www.guzzle.co.za/malls/table-bay-mall/"]',
  'mall'
);

-- Golden Acre (cape-town-cbd) -- new tenants

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sheet-street-golden-acre-cape-town-cbd', 'Sheet Street Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop C59, Golden Acre, Cnr Strand/Adderley Streets, Cape Town', '087 754 5309', 'https://www.sheetstreet.com', NULL,
  'Sheet Street is a retail store selling linen, towels, and home textiles, trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.sheetstreet.com/sheet-street-cpt-goldenacre-30578"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sheet-street-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-golden-acre-cape-town-cbd', 'Clicks Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Golden Acre, Castle Street entrance, Cape Town, 8001', '021 418 1900', 'https://clicks.co.za', NULL,
  'Clicks Golden Acre is a pharmacy and health, beauty, and personal-care retail store trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://clicks.co.za/store/Golden-Acre/116"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'clicks-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-golden-acre-cape-town-cbd', 'Capitec Bank Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop S41, Golden Acre, 9 Adderley St, Cape Town', '0860 10 20 43', 'https://www.capitecbank.co.za', NULL,
  'Capitec Bank is a retail bank branch trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.capitecbank.co.za/branch-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'capitec-bank-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'financial-investment-services'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-golden-acre-cape-town-cbd', 'Standard Bank Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Golden Acre, 9 Adderley St, Cape Town', '0860 123 000', 'https://www.standardbank.co.za', NULL,
  'Standard Bank is a retail bank branch trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.standardbank.co.za/branch-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'standard-bank-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'financial-investment-services'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-golden-acre-cape-town-cbd', 'Ackermans Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '021 421 6627', 'https://www.ackermans.co.za', NULL,
  'Ackermans is a value clothing and homeware retail store trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.ackermans.co.za/store-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'ackermans-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'specsavers-golden-acre-cape-town-cbd', 'Specsavers Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop S50, Golden Acre, Cnr Strand & Adderley St, Cape Town', '021 421 7123', 'https://www.specsavers.co.za', NULL,
  'Specsavers is an optometry and eyewear store trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.specsavers.co.za/stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'specsavers-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'opticians'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-golden-acre-cape-town-cbd', 'Mr Price Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop 44, Golden Acre, 1 Adderley St & Strand St, Cape Town', '021 419 8448', 'https://www.mrp.com', NULL,
  'Mr Price is a value fashion retail store trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.mrp.com/store-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mr-price-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'markham-golden-acre-cape-town-cbd', 'Markham Golden Acre',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop P2, Concourse Level, Golden Acre, Adderley St, Cape Town', '021 417 4622', 'https://www.markham.co.za', NULL,
  'Markham is a menswear and streetwear retail store trading from the Golden Acre shopping centre in central Cape Town.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.markham.co.za/store-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'markham-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

-- Cape Quarter (de-waterkant) -- new tenants

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'uwe-koetter-jewellers-cape-quarter-de-waterkant', 'Uwe Koetter Jewellers',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  'Shop 103A, Level 1, Cape Quarter, 27 Somerset Rd, De Waterkant', '021 425 7770', 'https://uwekoetter.com', NULL,
  'Uwe Koetter Jewellers is a fine jewellery store trading from the Cape Quarter Lifestyle Village in De Waterkant.',
  NULL, NULL,
  '["https://capequarter.co.za/shops/", "https://uwekoetter.com/pages/store-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'uwe-koetter-jewellers-cape-quarter-de-waterkant'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-cape-quarter-de-waterkant', 'Bootlegger Coffee Company (Cape Quarter)',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  'Shop 45, Cape Quarter, 27 Somerset Rd, De Waterkant', '021 421 1237', NULL, NULL,
  'Bootlegger Coffee Company is a coffee shop trading from the Cape Quarter Lifestyle Village in De Waterkant.',
  NULL, NULL,
  '["https://capequarter.co.za/shops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bootlegger-cape-quarter-de-waterkant'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-cape-quarter-de-waterkant', 'SPAR Cape Quarter',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  '27 Somerset Rd, De Waterkant, Cape Town', '021 418 0360', NULL, NULL,
  'SPAR is a supermarket trading from the Cape Quarter Lifestyle Village in De Waterkant.',
  NULL, NULL,
  '["https://capequarter.co.za/shops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'spar-cape-quarter-de-waterkant'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-cape-quarter-de-waterkant', 'TOPS at SPAR Cape Quarter',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  '27 Somerset Rd, De Waterkant, Cape Town', '021 418 0396', NULL, NULL,
  'TOPS at SPAR is a liquor store trading from the Cape Quarter Lifestyle Village in De Waterkant.',
  NULL, NULL,
  '["https://capequarter.co.za/shops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'tops-at-spar-cape-quarter-de-waterkant'), (SELECT id FROM categories WHERE slug = 'liquor-stores'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-cape-quarter-de-waterkant', 'Clicks Cape Quarter',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  '27 Somerset Rd, De Waterkant, Cape Town', '021 488 8007', 'https://clicks.co.za', NULL,
  'Clicks Cape Quarter is a pharmacy and health, beauty, and personal-care retail store trading from the Cape Quarter Lifestyle Village in De Waterkant.',
  NULL, NULL,
  '["https://capequarter.co.za/shops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'clicks-cape-quarter-de-waterkant'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wellness-warehouse-cape-quarter-de-waterkant', 'Wellness Warehouse (Cape Quarter)',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  'Shop D06, Cape Quarter, 27 Somerset Rd, De Waterkant', '021 425 7007', 'https://www.wellnesswarehouse.com', NULL,
  'Wellness Warehouse is a health and wellness retail store trading from the Cape Quarter Lifestyle Village in De Waterkant.',
  NULL, NULL,
  '["https://capequarter.co.za/shops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'wellness-warehouse-cape-quarter-de-waterkant'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-cape-quarter-de-waterkant', 'Zone Fitness (Cape Quarter)',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  'Cape Quarter, The Square, Cnr Somerset & Napier St, De Waterkant', '021 425 9472', 'https://www.zonefitness.co.za', NULL,
  'Zone Fitness is a gym trading from the Cape Quarter Lifestyle Village in De Waterkant.',
  NULL, NULL,
  '["https://capequarter.co.za/shops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'zone-fitness-cape-quarter-de-waterkant'), (SELECT id FROM categories WHERE slug = 'fitness-gyms'), 1);

-- Victoria Wharf (va-waterfront) -- new tenants

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shimansky-victoria-wharf-va-waterfront', 'Shimansky (Victoria Wharf)',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 7228, Upper Level, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 425 9888', 'https://shimansky.com', NULL,
  'Shimansky is a diamond and jewellery boutique trading from the Victoria Wharf Shopping Centre at the V&A Waterfront.',
  NULL, NULL,
  '["https://www.waterfront.co.za/stores/shimansky-boutique-victoria-wharf", "https://www.capetown.travel/listing/shimansky", "https://www.capetownmagazine.com/diamond-store"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shimansky-victoria-wharf-va-waterfront'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'carrol-boyes-victoria-wharf-va-waterfront', 'Carrol Boyes (Victoria Wharf)',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 6180, Ground Level, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 418 0595', 'https://carrolboyes.com', NULL,
  'Carrol Boyes is a functional art and homeware store trading from the Victoria Wharf Shopping Centre at the V&A Waterfront.',
  NULL, NULL,
  '["https://www.waterfront.co.za/stores/carrol-boyes", "https://www.fyple.co.za/company/carrol-boyes"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'carrol-boyes-victoria-wharf-va-waterfront'), (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

-- City Bowl standalone businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'millers-thumb-restaurant-gardens', 'Miller''s Thumb Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '10B Kloof Nek Rd, Gardens, Cape Town', '021 424 3838', 'https://millersthumb.co.za', NULL,
  'Miller''s Thumb is a seafood-focused restaurant in Gardens, Cape Town.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/millers-thumb/", "https://millersthumb.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'millers-thumb-restaurant-gardens'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-labia-gardens', 'The Labia',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '68 Orange Street, Gardens, Cape Town', '021 424 5927', 'https://thelabia.co.za', NULL,
  'The Labia is an independent arthouse cinema in Gardens, Cape Town.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/the-labia/", "https://thelabia.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-labia-gardens'), (SELECT id FROM categories WHERE slug = 'events-function-venues'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'four-rosmead-oranjezicht', 'Four Rosmead',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  '4 Rosmead Avenue, Oranjezicht, Cape Town', '021 480 3810', 'https://fourrosmead.com', NULL,
  'Four Rosmead is a boutique guest house in Oranjezicht, Cape Town.',
  NULL, NULL,
  '["https://fourrosmead.com", "https://www.sa-venues.com/things-to-do/westerncape/four-rosmead/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'four-rosmead-oranjezicht'), (SELECT id FROM categories WHERE slug = 'accommodation'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'addis-in-cape-cape-town-cbd', 'Addis in Cape',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '168 Loop Street, Cape Town, 8001', '076 846 0929', 'https://addisincape.co.za', NULL,
  'Addis in Cape is an Ethiopian restaurant on Loop Street in the Cape Town CBD.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/addis-in-cape/", "https://addisincape.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'addis-in-cape-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'district-six-museum-district-six', 'District Six Museum',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '25A Buitenkant Street, Cape Town', '021 466 7200', 'https://districtsix.co.za', NULL,
  'District Six Museum is a heritage museum commemorating the forced removals from the District Six area of Cape Town.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/district-six-museum/", "https://districtsix.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'district-six-museum-district-six'), (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'), 1);

-- Epping

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jumbo-wholesale-sa-epping', 'JUMBO Wholesale SA (Epping)',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '5 Bofors Circle, Epping, Cape Town', '021 534 0702', NULL, NULL,
  'JUMBO Wholesale SA is a wholesale food, liquor, and personal-care cash-and-carry store in Epping.',
  NULL, NULL,
  '["https://www.waze.com/live-map", "https://www.infobel.com/en/south_africa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'jumbo-wholesale-sa-epping'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'epping-industrial-suppliers-epping', 'Epping Industrial Suppliers',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '7 Hawkins Ave, Epping, Cape Town, 7460', '021 531 6666', NULL, NULL,
  'Epping Industrial Suppliers is a family-run wholesaler of industrial, washroom, and PPE supplies, trading in Epping since 1973.',
  NULL, NULL,
  '["https://www.cybo.com/za-biz/epping-industrial-suppliers", "https://za.africabz.com/western-cape/epping-industrial-suppliers"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'epping-industrial-suppliers-epping'), (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jmr-body-works-epping', 'JMR Body Works',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Unit C, Barkley Park, 82 Bofors Circle, Epping Industria, Cape Town', '021 534 2642', NULL, NULL,
  'JMR Body Works is a panel-beating and spray-painting workshop in Epping Industria, established in 1995.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/jmr-body-works", "https://www.brabys.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'jmr-body-works-epping'), (SELECT id FROM categories WHERE slug = 'automotive-repairs'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'epping-motor-spares-epping', 'Epping Motor Spares',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '3A Goodenough Avenue, Epping, Cape Town', '021 534 6980', NULL, NULL,
  'Epping Motor Spares sells new and used motor spares in Epping.',
  NULL, NULL,
  '["https://www.netpages.co.za", "https://www.sayellow.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'epping-motor-spares-epping'), (SELECT id FROM categories WHERE slug = 'motor-spares'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'leopards-panel-beaters-epping', 'Leopards Panel Beaters',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '18 Fisher Avenue, Epping 1, Cape Town', '078 343 7396', 'https://leopardspanelbeaters.co.za', NULL,
  'Leopards Panel Beaters offers panel beating, spray painting, and dent repair services in Epping.',
  NULL, NULL,
  '["https://leopardspanelbeaters.co.za", "https://panelbeatersdirectory.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'leopards-panel-beaters-epping'), (SELECT id FROM categories WHERE slug = 'automotive-repairs'), 1);

-- Paarden Eiland

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southern-ropes-factory-shop-paarden-eiland', 'Southern Ropes Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '48 Section Street, Paarden Eiland, Cape Town, 7405', '021 510 7335', NULL, NULL,
  'Southern Ropes Factory Shop sells rope, marine, and industrial supplies in Paarden Eiland.',
  NULL, NULL,
  '["https://www.cybo.com", "https://www.netpages.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'southern-ropes-factory-shop-paarden-eiland'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cityrock-paarden-eiland', 'CityROCK',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '9 Milner St, Paarden Eiland, Cape Town, 7405', '021 447 1326', NULL, NULL,
  'CityROCK is an indoor rock climbing gym in Paarden Eiland.',
  NULL, NULL,
  '["https://za.africabz.com", "https://absolutelylife.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'cityrock-paarden-eiland'), (SELECT id FROM categories WHERE slug = 'fitness-gyms'), 1);

-- Ysterplaat

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'matrix-warehouse-ysterplaat', 'Matrix Warehouse (Ysterplaat)',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  '48 Gold St, Highway Park, Ysterplaat, Cape Town, 7404', '021 510 3857', NULL, NULL,
  'Matrix Warehouse is a computer and networking equipment retailer in Ysterplaat.',
  NULL, NULL,
  '["https://www.cylex.co.za", "https://www.thinklocal.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'matrix-warehouse-ysterplaat'), (SELECT id FROM categories WHERE slug = 'computer-it-services'), 1);

-- Maitland

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'broadway-confectionery-bakery-maitland', 'Broadway Confectionery & Bakery',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '109 Voortrekker Road, Maitland, 7405', '021 511 8729', NULL, NULL,
  'Broadway Confectionery & Bakery is a Portuguese bakery and deli on Voortrekker Road in Maitland.',
  NULL, NULL,
  '["https://www.cybo.com", "https://za.africabz.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'broadway-confectionery-bakery-maitland'), (SELECT id FROM categories WHERE slug = 'bakeries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'formentos-bakery-take-aways-maitland', 'Formentos Bakery & Take-Aways',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '133 Voortrekker Road, Maitland, 7405', '021 511 3871', NULL, NULL,
  'Formentos Bakery & Take-Aways is a bakery and takeaway on Voortrekker Road in Maitland.',
  NULL, NULL,
  '["https://www.yep.co.za", "https://www.thinklocal.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'formentos-bakery-take-aways-maitland'), (SELECT id FROM categories WHERE slug = 'bakeries'), 1);

-- Salt River

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sparesboyz-korean-boyz-salt-river', 'Sparesboyz / Korean Boyz',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '118a Voortrekker Road, Salt River, 7925', '021 511 9005', NULL, NULL,
  'Sparesboyz / Korean Boyz sells new and used Korean motor spares on Voortrekker Road in Salt River.',
  NULL, NULL,
  '["https://www.cybo.com", "https://za.africabz.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sparesboyz-korean-boyz-salt-river'), (SELECT id FROM categories WHERE slug = 'motor-spares'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'affordable-office-factory-shop-salt-river', 'Affordable Office Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '120 Voortrekker Road, Salt River, 7925', '021 510 0600', NULL, NULL,
  'Affordable Office Factory Shop sells used office furniture on Voortrekker Road in Salt River.',
  NULL, NULL,
  '["https://www.yellopages.co.za", "https://www.thinklocal.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'affordable-office-factory-shop-salt-river'), (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

-- Ndabeni

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-good-food-cafe-ndabeni', 'The Good Food Cafe (at Merrypak)',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '45 Morningside Road, Merrypak, Ndabeni, 7405', '021 531 2244', 'https://merrypak.co.za', NULL,
  'The Good Food Cafe is a café operating inside the Merrypak furniture showroom in Ndabeni.',
  NULL, NULL,
  '["https://www.tripadvisor.com", "https://merrypak.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-good-food-cafe-ndabeni'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

-- Brooklyn

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'do-it-yourself-hardware-brooklyn', 'Do It Yourself Hardware',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '39 Koeberg Road, Brooklyn, Cape Town, 7405', '021 511 1839', 'https://doityourselfshop.co.za', NULL,
  'Do It Yourself Hardware is an independent, family-run hardware store in Brooklyn, trading since 1974.',
  NULL, NULL,
  '["https://za.africabz.com", "https://doityourselfshop.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'do-it-yourself-hardware-brooklyn'), (SELECT id FROM categories WHERE slug = 'hardware-stores'), 1);

-- Muizenberg

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'garys-surf-school-muizenberg', 'Gary''s Surf School',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '34 Balmoral Building, Beach Road, Muizenberg, 7945', '021 788 9839', 'https://www.garysurf.com', NULL,
  'Gary''s Surf School offers surf lessons and board rental on Beach Road in Muizenberg.',
  NULL, NULL,
  '["https://www.garysurf.com", "https://en.wikivoyage.org/wiki/Muizenberg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'garys-surf-school-muizenberg'), (SELECT id FROM categories WHERE slug = 'schools-education'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'two-gingers-gember-distillery-muizenberg', 'Two Gingers Gember Distillery',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Unit 6, Platinum Park, 101 Capricorn Drive, Muizenberg, 7945', '021 180 2852', 'https://www.twogingers.com', NULL,
  'Two Gingers Gember Distillery is a craft ginger-liqueur distillery in Muizenberg.',
  NULL, NULL,
  '["https://www.twogingers.com", "https://www.sa-venues.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'two-gingers-gember-distillery-muizenberg'), (SELECT id FROM categories WHERE slug = 'liquor-stores'), 1);

-- Hout Bay

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mariners-wharf-hout-bay', 'Mariner''s Wharf',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'Harbour Road, Hout Bay Harbour, Hout Bay', '021 790 1100', 'https://www.marinerswharf.co.za', NULL,
  'Mariner''s Wharf is a seafood restaurant and fish market at Hout Bay Harbour.',
  NULL, NULL,
  '["https://www.marinerswharf.co.za", "https://insideguide.co.za/cape-town/hout-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mariners-wharf-hout-bay'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-lookout-hout-bay', 'The Lookout Hout Bay',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'Lot 65, Quayside, Hout Bay Harbour, Hout Bay', '021 790 0900', 'https://www.lookouthoutbay.co.za', NULL,
  'The Lookout is a restaurant overlooking Hout Bay Harbour.',
  NULL, NULL,
  '["https://www.lookouthoutbay.co.za", "https://www.capetownetc.com/things-to-do-cape-town/hout-bay-restaurants/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-lookout-hout-bay'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

-- Kalk Bay

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'olympia-cafe-and-deli-kalk-bay', 'Olympia Cafe and Deli',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '134 Main Road, Kalk Bay, Cape Town', '021 788 6396', 'https://olympiacafe.co.za', NULL,
  'Olympia Cafe and Deli is a bakery-café on Main Road in Kalk Bay.',
  NULL, NULL,
  '["https://olympiacafe.co.za", "https://thehappytraveller.co.za/kalk-bay-guide/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'olympia-cafe-and-deli-kalk-bay'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'artvark-gallery-kalk-bay', 'Artvark Gallery',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '48 Main Road, Kalk Bay, Cape Town, 7975', '021 788 5584', 'https://www.artvark.org', NULL,
  'Artvark Gallery is an arts and crafts gallery on Main Road in Kalk Bay.',
  NULL, NULL,
  '["https://www.artvark.org", "https://insideguide.co.za/cape-town/kalk-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'artvark-gallery-kalk-bay'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

-- Simon's Town

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'berthas-restaurant-simons-town', 'Bertha''s Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '1 Wharf Road, Simon''s Town, 7995', '021 786 2138', 'https://berthas.co.za', NULL,
  'Bertha''s Restaurant is a waterfront restaurant on Wharf Road in Simon''s Town.',
  NULL, NULL,
  '["https://berthas.co.za", "https://www.simonstown.com/listing-category/restaurants/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'berthas-restaurant-simons-town'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

-- Noordhoek Farm Village tenants (noordhoek)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-foodbarn-cafe-and-tapas-noordhoek', 'The Foodbarn Café & Tapas',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Cnr Village Lane & Noordhoek Main Road, Noordhoek Farm Village, Noordhoek, 7979', '021 789 1390', 'https://thefoodbarn.co.za', NULL,
  'The Foodbarn Café & Tapas is a café and tapas restaurant trading from the Noordhoek Farm Village.',
  NULL, NULL,
  '["https://thefoodbarn.co.za", "https://www.capetourism.com/noordhoek-farm-village/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-foodbarn-cafe-and-tapas-noordhoek'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-roux-noordhoek', 'Café Roux',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Main Road & Village Lane, Noordhoek Farm Village, Noordhoek', '021 789 2538', 'https://www.caferoux.co.za', NULL,
  'Café Roux is a restaurant with regular live music, trading from the Noordhoek Farm Village.',
  NULL, NULL,
  '["https://www.caferoux.co.za", "https://www.capetourism.com/noordhoek-farm-village/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'cafe-roux-noordhoek'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

-- Century City

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'urban-umami-century-city', 'Urban Umami',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  '3 Energy Lane, Bridgeways Precinct, Century City, Cape Town, 7441', '021 202 9133', 'https://www.umamirestaurant.co.za', NULL,
  'Urban Umami is a restaurant in the Bridgeways Precinct of Century City.',
  NULL, NULL,
  '["https://www.umamirestaurant.co.za", "https://ccconferencecentre.co.za/restaurants/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'urban-umami-century-city'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tigers-milk-century-city', 'Tiger''s Milk Century City',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  '8 Kinetic Way, Century City, Cape Town, 7441', '021 137 1798', 'https://www.tigersmilk.co.za', NULL,
  'Tiger''s Milk Century City is a restaurant and bar in Century City, part of the Tiger''s Milk chain.',
  NULL, NULL,
  '["https://www.tigersmilk.co.za/location/century-city/", "https://ccconferencecentre.co.za/restaurants/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'tigers-milk-century-city'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

-- Somerset West (Helderberg Centre tenant)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-hyper-helderberg-centre-somerset-west', 'Checkers Hyper (Helderberg Centre)',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  (SELECT id FROM shopping_centers WHERE slug = 'helderberg-centre-somerset-west'),
  'Helderberg Centre, Cnr De Beers Avenue & Forsyth Road, Somerset West, 7130', '021 840 5000', NULL, NULL,
  'Checkers Hyper is a hypermarket anchoring the Helderberg Centre in Somerset West.',
  NULL, NULL,
  '["https://helderbergcentre.com/stores/", "https://my-catalogue.co.za/stores/somerset-west/checkers/helderberg-centre-cnr-de-beers-avenue-forsyth-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'checkers-hyper-helderberg-centre-somerset-west'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

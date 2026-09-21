INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'walmer-butchery-walmer-estate', 'Walmer Butchery',
  (SELECT id FROM suburbs WHERE slug = 'walmer-estate'),
  '41 Coronation Road, Walmer Estate, Cape Town', '021 447 5654', NULL, NULL,
  'Walmer Butchery is a butchery on Coronation Road in Walmer Estate, offering a full range of fresh meat, sosaties and kebabs, and known locally for its biltong, droëwors and warm sausages.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/walmer-butchery-266357", "https://www.ivote.co.za/view/south-africa/walmer-butchery-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'walmer-butchery-walmer-estate'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ghazala-food-cafe-walmer-estate', 'Ghazala Food & Cafe',
  (SELECT id FROM suburbs WHERE slug = 'walmer-estate'),
  '23 Coronation Road, Walmer Estate, Cape Town', '073 136 2499', NULL, NULL,
  'Ghazala Food & Cafe is a takeaway on Coronation Road in Walmer Estate specialising in chicken tikka, boerewors and chicken roti, with Friday and Sunday specials of mutton and chicken biryani.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/ghazala-food-cafe-273722", "https://www.hungryfoody.com/za/ghazala-food-amp-cafe-walmer-estate/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ghazala-food-cafe-walmer-estate'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'two-oceans-aquarium-va-waterfront', 'Two Oceans Aquarium',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Dock Road, V&A Waterfront, Cape Town', '021 418 3823', 'https://www.aquarium.co.za', NULL,
  'Two Oceans Aquarium is a public aquarium on Dock Road at the V&A Waterfront, showcasing marine life from the cold Atlantic and warm Indian Ocean ecosystems found around the Cape coastline.',
  NULL, NULL,
  '["https://www.aquarium.co.za/visit-us", "https://www.aquarium.co.za/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'two-oceans-aquarium-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zeitz-mocaa-va-waterfront', 'Zeitz MOCAA',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Silo District, V&A Waterfront, Cape Town, 8002', '087 350 4777', 'https://zeitzmocaa.museum', NULL,
  'Zeitz MOCAA is a contemporary art museum housed in a converted grain silo in the Silo District of the V&A Waterfront, holding the largest collection of contemporary art from Africa and its diaspora.',
  NULL, NULL,
  '["https://zeitzmocaa.museum/contact-us/", "https://www.capetown.travel/listing/zeitz-mocaa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zeitz-mocaa-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'arlecchino-by-tashas-sea-point', 'Arlecchino by tashas',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '16 Regent Road, Sea Point, Cape Town, 8005', '021 879 1133', NULL, NULL,
  'Arlecchino by tashas is a Mediterranean-inspired restaurant on Regent Road in Sea Point from the tashas Group, serving all-day dining in a Venetian-influenced interior.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d34105676-Reviews-Arlecchino_by_tashas-Cape_Town_Central_Western_Cape.html", "https://www.timeout.com/cape-town/news/arlecchino-sea-points-newest-dining-destination-012926"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'arlecchino-by-tashas-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-perla-sea-point', 'La Perla',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  'Corner of Church & Beach Roads, Sea Point, Cape Town', '021 439 9538', 'https://laperla.co.za', NULL,
  'La Perla is a long-standing upmarket Italian seafood restaurant on the Sea Point beachfront, serving Italian classics, seafood and meat dishes since 1957 with views over Table Bay.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d799026-Reviews-La_Perla_Restaurant-Cape_Town_Central_Western_Cape.html", "https://laperla.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-perla-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harveys-at-winchester-mansions-sea-point', 'Harveys at Winchester Mansions',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '221 Beach Road, Sea Point, Cape Town, 8060', '021 434 2351', NULL, NULL,
  'Harveys at Winchester Mansions is a restaurant and bar within the Winchester Mansions hotel on Sea Point''s Beach Road, offering a sea-facing courtyard and terraces alongside a weekly Sunday jazz brunch.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Harveys-at-Winchester-Mansions/1324", "https://news.wine.co.za/news.aspx?NEWSID=15281"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harveys-at-winchester-mansions-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sundoo-sea-point', 'Sundoo',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  'Shop 6, La Rhone, 77 Regent Road, Sea Point, Cape Town', '021 300 5779', 'https://sundoo.co.za', NULL,
  'Sundoo is a tapas-style South Indian restaurant on Regent Road in Sea Point, serving sharing-plate biryanis and tandoori dishes with a contemporary Durban-influenced twist.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g15134971-d9750909-Reviews-Sundoo-Sea_Point_Western_Cape.html", "https://www.dining-out.co.za/md/Sundoo-Sea-Point/8146"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sundoo-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kiki-sea-point', 'Kiki',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  'Section 52, Piccadilly Court, 85 Regent Road, Sea Point, Cape Town', '021 023 2667', NULL, NULL,
  'Kiki is a contemporary Greek restaurant on Regent Road in Sea Point, serving meze-style sharing plates such as fava, tzatziki, dolmades and spanakopita in a taverna-style setting.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/kiki/", "https://www.tripadvisor.com/Restaurant_Review-g1722390-d32905202-Reviews-Kiki-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kiki-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

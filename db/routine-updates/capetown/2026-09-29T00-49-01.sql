INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lakeside-brewing-co-taproom-kommetjie', 'Lakeside Brewing Co Taproom',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 4545', NULL, NULL,
  'Lakeside Brewing Co Taproom is a craft-beer taproom at Imhoff Farm in Kommetjie, run in collaboration with Blue Water Cafe.',
  NULL, NULL,
  '["https://www.eatplaydrink.capetown/play/imhoff-farm-in-kommetjie-revived-as-unique-retail-destination/", "https://www.facebook.com/imhofffarm.co.za/posts/great-news-the-lakeside-beer-garden-is-finished-and-its-looking-very-coollakesid/3221476517964953/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lakeside-brewing-co-taproom-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harvest-moon-watercolours-kommetjie', 'Harvest Moon Watercolours',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 4545', NULL, NULL,
  'Harvest Moon Watercolours is a shop at Imhoff Farm in Kommetjie selling handcrafted, ethically sourced vegan watercolour paints.',
  NULL, NULL,
  '["https://harvestmoonwatercolours.co.za/", "https://www.instagram.com/harvestmoonwatercolours/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harvest-moon-watercolours-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-green-room-kommetjie', 'The Green Room',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  '12 Huskisson Way, The Old Post House, Kommetjie, Cape Town, 7975', '021 783 4148', NULL, NULL,
  'The Green Room is a small restaurant and bar in Kommetjie with laidback local art and outside seating.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-green-room-107374", "https://www.facebook.com/greenroomkommetjie/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-green-room-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kommetjie-village-vet-kommetjie', 'Kommetjie Village Vet',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  'Unit 1, Kommetjie On Main, Main Road, Kommetjie, Cape Town, 7975', '021 783 4493', NULL, NULL,
  'Kommetjie Village Vet is a veterinary consulting room in Kommetjie, part of the Two Oceans Veterinary Group.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=237592", "https://www.vetdirectory.co.za/categories/public/western-cape/veterinary-practices/kommetjie-village-veterinary-consulting-room"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kommetjie-village-vet-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kommetjie-estate-agency-kommetjie', 'Kommetjie Estate Agency',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  'Swan Lodge Building, Main Street, Kommetjie, Cape Town, 7975', '021 783 1721', NULL, NULL,
  'Kommetjie Estate Agency is a long-established estate agency in Kommetjie, handling residential property sales in the village.',
  NULL, NULL,
  '["https://www.facebook.com/p/Kommetjie-Estate-Agency-100068135389247/", "https://south-africa.searchinafrica.com/business/5799007/south-africa/western-cape/cape-town/kommetjie/main-st/property-agents/kommetjie-estate-agency"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kommetjie-estate-agency-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

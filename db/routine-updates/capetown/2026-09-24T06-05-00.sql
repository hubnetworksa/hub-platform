INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sidewalk-cafe-vredehoek', 'Sidewalk Cafe',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '33 Derry Street, Vredehoek, Cape Town', '021 461 2839', NULL, NULL,
  'Sidewalk Cafe is a neighbourhood cafe on Derry Street serving breakfast, lunch and fresh juices, in Vredehoek.',
  NULL, NULL,
  '["https://www.capetownetc.com/food-and-drink/sidewalk-cafe/", "https://oncebitten.co.za/?page_id=640"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sidewalk-cafe-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'carlyles-on-derry-vredehoek', 'Carlyle''s on Derry',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '17 Derry Street, Vredehoek, Cape Town', '021 461 8787', NULL, NULL,
  'Carlyle''s on Derry is a family-run Italian restaurant and pizzeria on Derry Street, in Vredehoek.',
  NULL, NULL,
  '["https://carlyles.co.za/contact/", "https://za.africabz.com/western-cape/carlyles-on-derry-26273"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carlyles-on-derry-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pet-kin-vredehoek', 'Pet Kin',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '23 Derry Street, Vredehoek, Cape Town', '064 957 0735', NULL, NULL,
  'Pet Kin is a pet supply store on Derry Street stocking dog and cat food and other pet supplies, in Vredehoek.',
  NULL, NULL,
  '["https://www.petkin.co.za/password", "https://bormandumazitha.co.za/pet-kin-pet-supply-store-17255723028012014100/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pet-kin-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harringtons-zonnebloem', 'Harringtons',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '61B Harrington Street, Zonnebloem, Cape Town', '021 461 2276', NULL, NULL,
  'Harringtons is a cocktail lounge and bar on Harrington Street with a wrap-around bar and panoramic windows, in Zonnebloem.',
  NULL, NULL,
  '["https://www.harringtonstreet.co.za/harringtons", "https://www.dining-out.co.za/md/Harringtons/10253"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harringtons-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wild-eatery-zonnebloem', 'Wild Eatery',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '59 Harrington Street, Zonnebloem, Cape Town', '083 534 6518', NULL, NULL,
  'Wild Eatery is a vegan restaurant on Harrington Street, in Zonnebloem.',
  NULL, NULL,
  '["https://www.wildeatery.co.za/locations", "https://www.corner.inc/place/563497"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wild-eatery-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'new-york-bagels-zonnebloem', 'New York Bagels',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '44 Harrington Street, Zonnebloem, Cape Town', '021 820 4359', NULL, NULL,
  'New York Bagels is a bagel bakery and cafe on Harrington Street, in Zonnebloem.',
  NULL, NULL,
  '["https://www.capetownccid.com/explore/eat/new-york-bagels", "https://www.facebook.com/NYBCT/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'new-york-bagels-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-kind-kitchen-woodstock', 'The Kind Kitchen',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  'Shop 1, Woodstock Brewery, 252 Albert Road, Woodstock, Cape Town', '061 526 1358', NULL, NULL,
  'The Kind Kitchen is a vegan restaurant on Albert Road serving seasonal, locally sourced dishes, in Woodstock.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/the-kind-kitchen/", "https://thekindkitchencoza.wordpress.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-kind-kitchen-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'delis-pies-woodstock', 'Deli''s Pies',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '191B Victoria Road, Woodstock, Cape Town', '021 447 5529', NULL, NULL,
  'Deli''s Pies is a pie bakery and deli on Victoria Road, in Woodstock.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/delis-pies/329358", "https://www.facebook.com/DeliPiesBakery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'delis-pies-woodstock'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crema-design-woodstock', 'Crema Design',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '317 Albert Road, Woodstock, Cape Town', '021 448 7775', NULL, NULL,
  'Crema Design is a designer lighting and furniture showroom on Albert Road, in Woodstock.',
  NULL, NULL,
  '["https://cremadesign.co.za/contact/", "https://za.africabz.com/western-cape/crema-design-50747"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crema-design-woodstock'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fish4africa-woodstock', 'Fish4Africa',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '230 Victoria Road, Woodstock, Cape Town', '021 448 5258', NULL, NULL,
  'Fish4Africa is a fresh seafood retailer on Victoria Road, in Woodstock.',
  NULL, NULL,
  '["https://fish4.africa/stores/", "https://za.africabz.com/western-cape/fish4africa-47431"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fish4africa-woodstock'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

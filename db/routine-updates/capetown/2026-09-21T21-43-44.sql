INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-dean-street-arcade-newlands', 'Woolworths Dean Street',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  'Dean Street Arcade, Dean St, Newlands, Cape Town, 7700', '021 658 6900', NULL, NULL,
  'Woolworths Dean Street is a Woolworths Food store in Dean Street Arcade, Newlands.',
  NULL, NULL,
  '["https://readymap.co.za/4/38720", "https://za.africabz.com/western-cape/woolworths-dean-street-16648"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-dean-street-arcade-newlands'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-little-fisherman-newlands', 'The Little Fisherman',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  'Shop 11, Dean Street Arcade, Dean St, Newlands, Cape Town, 7700', '021 686 1454', NULL, NULL,
  'The Little Fisherman is a fishmonger in Dean Street Arcade, Newlands, selling fresh seafood.',
  NULL, NULL,
  '["https://za.ypgo.net/The+Little+Fisherman+Newlands,+Western+Cape-51852928913", "https://za.africabz.com/western-cape/the-little-fisherman-130016"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-little-fisherman-newlands'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ryan-boon-speciality-meats-newlands', 'Ryan Boon Speciality M.eat',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  'Dean Street Arcade, Dean St, Newlands, Cape Town, 7725', '021 685 2777', NULL, NULL,
  'Ryan Boon Speciality M.eat is a butchery in Dean Street Arcade, Newlands, specialising in pasture-reared, sustainably sourced meat.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Ryan-Boon-speciality-m-eat-103911387727180/", "https://rsa.worldorgs.com/catalog/cape-town/butcher-shop/ryan-boon-speciality-meats-newlands"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ryan-boon-speciality-meats-newlands'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bare-necessity-newlands', 'Bare Necessity',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  'Dean Street Arcade, 15 Dean St, Newlands, Cape Town, 7700', '021 686 2950', NULL, NULL,
  'Bare Necessity is a sleepwear, home accessories and gift shop in Dean Street Arcade, Newlands.',
  NULL, NULL,
  '["https://opening-hours.co.za/03984294/Bare_Necessity,_Dean_Street_Arcade,_Newlands", "https://business-service-directory.com/za/listing/bare-necessity-18515"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bare-necessity-newlands'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wordsworth-books-dean-street-newlands', 'Wordsworth Books Dean Street',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  'Dean Street Arcade, Dean St, Newlands, Cape Town, 7700', '021 686 1604', NULL, NULL,
  'Wordsworth Books Dean Street is a bookshop in Dean Street Arcade, Newlands.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/dean-street-bookshop-in-cape-town", "https://m.facebook.com/WordsworthSA/posts/our-store-in-dean-street-arcade-newlands-is-now-open-sundays-just-incase-you-nee/2706946056078573/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wordsworth-books-dean-street-newlands'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'knead-dean-street-newlands', 'Knead Dean Street',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  'Shop 7, Dean Street Arcade, Dean St, Newlands, Cape Town, 7700', '021 685 7769', NULL, NULL,
  'Knead Dean Street is an artisan bakery and neighbourhood cafe in Dean Street Arcade, Newlands, selling fresh bread, pastries and confectionery.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Knead-Dean-Street/7415", "https://www.wininganddining.co.za/western-cape/cape-town/newlands/knead-dean-street"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'knead-dean-street-newlands'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ohmm-face-and-beauty-newlands', 'OHMM Face and Beauty',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  'Shop 2B, Dean Street Arcade, Cnr Dean St and Main Rd, Newlands, Cape Town, 7700', '021 686 6886', NULL, NULL,
  'OHMM Face and Beauty is a beauty and skincare salon in Dean Street Arcade, Newlands.',
  NULL, NULL,
  '["https://www.hellolocal.co.za/south-africa/newlands/beauty/ohmm-face-and-body", "https://ohmmbeauty.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ohmm-face-and-beauty-newlands'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'cardiff-castle-centre-newlands', 'Cardiff Castle Centre',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  'Cnr Main Rd & Kildare Rd, Newlands, Cape Town, 7700', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/cardiff-castle-building.html", "https://blog.rawson.co.za/newlands-popular-cardiff-castle-gets-an-additional-gourmet-food-outlet"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sushi-box-newlands', 'Sushi Box Newlands',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  'Shop 8, Cardiff Castle Centre, Kildare Rd & Main St, Newlands, Cape Town, 7700', '072 147 7880', NULL, NULL,
  'Sushi Box Newlands is a sushi restaurant in Cardiff Castle Centre, Newlands.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/sushi-box-newlands-19507", "https://2pos.co.za/2/9262"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sushi-box-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

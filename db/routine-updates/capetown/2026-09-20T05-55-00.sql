INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kromboom-convenience-centre-crawford', 'Kromboom Convenience Centre',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  'Cnr Kromboom Road & Jan Smuts Drive, Crawford, Cape Town, 7770', NULL, NULL,
  '["https://www.fresha.com/lvp/whitneys-hair-beauty-boutique-jan-smuts-drive-cape-town-Kz2bB1", "https://birdandco.info/bird-and-co-kromboom/"]',
  'convenience_centre'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-kromboom-crawford', 'Steers Kromboom Rd',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-convenience-centre-crawford'),
  'Shop 3, 1st Floor, Kromboom Centre, 134 Kromboom Road, Crawford, Cape Town, 7770', '021 696 9993', NULL, NULL,
  'Steers Kromboom Rd is a fast-food outlet in Kromboom Centre, Crawford, part of the Steers flame-grilled burger and chicken chain.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1722390-d34071294-Reviews-Steers_Kromboom_Rd-Cape_Town_Western_Cape.html", "https://www.southafricabusinessdirectory.co.za/company/33de2ade960dcf16af9a4c32c6dab387/steers/cape-town/restaurants"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-kromboom-crawford'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-kromboom-crawford', 'KwikSpar Kromboom',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-convenience-centre-crawford'),
  'Kromboom Road, Kromboom Gardens, Crawford, Cape Town, 7780', '021 697 2834', NULL, NULL,
  'KwikSpar Kromboom is a supermarket in Kromboom Gardens, Crawford, offering groceries and everyday essentials.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/crawford/supermarkets/kromboom-quick-spar", "https://www.hotfrog.co.za/company/0816d1c29194aacc5bc335ce6f57cece/kwikspar-kromboom/cape-town/general-stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-kromboom-crawford'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'whitneys-hair-and-beauty-boutique-crawford', 'Whitney''s Hair & Beauty Boutique',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-convenience-centre-crawford'),
  'Shop 6, Kromboom Convenience Centre, Cnr Kromboom Rd & Jan Smuts Dr, Crawford, Cape Town, 7708', '083 418 3384', NULL, NULL,
  'Whitney''s Hair & Beauty Boutique is a hair and beauty salon in Kromboom Convenience Centre, Crawford, offering hair, nail and beauty treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/whitneys-hair-beauty-boutique-jan-smuts-drive-cape-town-Kz2bB1", "https://wikideals.co.za/my-city/a-hair-botox-treatment-at-whitney-s-hair-beauty-boutique-kromboom-convenience-centre.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'whitneys-hair-and-beauty-boutique-crawford'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bird-and-co-kromboom-crawford', 'Bird & Co Kromboom',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-convenience-centre-crawford'),
  'Kromboom Convenience Centre, Kromboom Road, Crawford, Cape Town, 7770', '021 203 5328', NULL, NULL,
  'Bird & Co Kromboom is a restaurant in Kromboom Convenience Centre, Crawford, serving deboned chicken and wood-fired pizza.',
  NULL, NULL,
  '["https://birdandco.info/bird-and-co-kromboom/", "https://www.facebook.com/birdandcoza/posts/opening-giveawayon-4-september-bird-co-opens-the-doors-to-our-first-mother-city-/1685100900286895/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bird-and-co-kromboom-crawford'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kromboom-medical-practice-crawford', 'Kromboom Medical Practice',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  'Kromboom Medi-Centre, Cnr Kromboom & Sunnyside Roads, Crawford, Cape Town, 7764', '021 697 0217', NULL, NULL,
  'Kromboom Medical Practice is a family and general medical practice and travel clinic in Crawford, established in 1992, with family physicians, psychologists, physiotherapy and dietetics on site.',
  NULL, NULL,
  '["https://www.recomed.co.za/private-practice/southern-suburbs/kromboom-medical-practice/9700/", "https://kromboommedical.co.za/about/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kromboom-medical-practice-crawford'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

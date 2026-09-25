INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'edgars-liberty-promenade-mitchells-plain', 'Edgars',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Shop 17, Liberty Promenade, Cnr AZ Berman Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785',
  '087 822 3479', NULL, NULL,
  'Edgars is a department store chain outlet inside Liberty Promenade in Mitchells Plain, selling clothing, footwear, and homeware.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Clothing_Stores/Edgars_Promenade_Mitchell039s_Plain/3271", "http://www.netpages.co.za/Mitchells+Plain/Edgars+StoresBranchesMitchells+PlainLiberty+Promenade+Mall+17+-557860.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'edgars-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'foschini-liberty-promenade-mitchells-plain', 'Foschini',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Shop 59, Liberty Promenade, Cnr AZ Berman Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785',
  '021 376 9500', NULL, NULL,
  'Foschini is a ladieswear fashion retailer inside Liberty Promenade in Mitchells Plain, selling contemporary clothing, footwear, and cosmetics.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/foschini-promenade-mitchells-plain-in-cape-town", "https://www.ayoba.com/business/FoschiniLibertyPromenadeMall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'foschini-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'romans-pizza-liberty-promenade-mitchells-plain', 'Romans Pizza',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Shop 190, Liberty Promenade, Cnr AZ Berman Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785',
  '021 376 7447', 'https://www.romanspizza.co.za', NULL,
  'Romans Pizza is a pizza takeaway and delivery outlet inside Liberty Promenade in Mitchells Plain.',
  NULL, NULL,
  '["http://textmap.co.za/3/47913", "https://vymaps.com/ZA/ROMANS-PIZZA-164648/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'romans-pizza-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'innohealth-medical-centres-mitchells-plain', 'Innohealth Medical Centres',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  'Shop 6, Woolworths Arcade Building, Seventh Avenue, Mitchells Plain Town Centre, Cape Town, 7785',
  '021 203 1897', 'https://www.innohealthclinics.com/mitchells-plain', NULL,
  'Innohealth Medical Centres is a dispensing medical clinic in Mitchells Plain Town Centre offering GP and physiotherapy services.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/innohealth-clinics-mitchells-plain-dr-clayton-mentoor-seventh-avenue-cape-town-ovL8rx", "https://www.innohealthclinics.com/mitchells-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'innohealth-medical-centres-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

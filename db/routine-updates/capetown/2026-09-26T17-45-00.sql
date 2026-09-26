-- Jobs 1-2: Sunnydale suburb research + Sun Valley Mall tenant discovery

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caroline-berry-optometrists-sunnydale', 'Caroline Berry Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  'Unit 6 Longboat Corner, Cnr Ou Kaapse Weg & Longboat Street, Sunnydale, Cape Town, 7975', '021 785 2163', NULL, NULL,
  'Caroline Berry Optometrists is an optometry practice in Sunnydale offering eye testing, spectacles, sunglasses and contact lenses.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=165107", "https://www.brabys.com/za/western-cape/fish-hoek/sunnydale/optometrists/caroline-berry-optometrist"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caroline-berry-optometrists-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'just-fencing-sunnydale', 'Just Fencing',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '15 Blackbird Road, Sunnydale, Cape Town, 7975', '021 785 4005', NULL, NULL,
  'Just Fencing is a fencing contractor in Sunnydale handling residential and commercial fencing installations.',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/just-fencing-021-785-4005", "https://south-africa.searchinafrica.com/business/6163039/south-africa/western-cape/fish-hoek/sunnydale/blackbird-rd/fencing-contractors/just-fencing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'just-fencing-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'fencing-security-installations'),
  1
);

-- Sun Valley Mall (existing shopping centre, suburb-tagged sunnydale) -- tenant discovery
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-sunnydale', 'Dis-Chem Sunnydale',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Shop 15, Sun Valley Mall, Cnr Ou Kaapse Weg and Noordhoek Main Road, Sunnydale, Cape Town, 7975', '021 784 4400', NULL, NULL,
  'Dis-Chem Sunnydale is a pharmacy and health and beauty store inside Sun Valley Mall.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/sunnydale/dis-chem/sun-valley-mall-cnr-ou-kaapse-weg-and-noordhoek-main-road", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=359091"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-sun-valley-sunnydale', 'Virgin Active Sun Valley',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Sun Valley Mall, Cnr Ou Kaapse Weg & Buller Louw Blvd, Sunnydale, Cape Town, 7975', '021 785 1934', NULL, NULL,
  'Virgin Active Sun Valley is a health club and gym inside Sun Valley Mall, offering fitness equipment, a swimming pool and personal training.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/virgin-active-sun-valley-10366", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=394733"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-sun-valley-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tiger-wheel-tyre-sunnydale', 'Tiger Wheel & Tyre',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Sun Valley Mall, Cnr Noordhoek Main Road & Buller Louw Blvd, Sunnydale, Cape Town, 7975', '021 785 1910', NULL, NULL,
  'Tiger Wheel & Tyre is a tyre and vehicle fitment centre at Sun Valley Mall.',
  NULL, NULL,
  '["https://homeappliancerepairs.co.za/8420766342042441448/", "https://www.findglocal.com/ZA/Cape-Town/106074950772806/Tiger-Wheel-&-Tyre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tiger-wheel-tyre-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'irene-link-doringkloof', 'Irene Link',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  'Corner Alexandra Road & Impala Avenue, Doringkloof, Centurion, 0157', NULL, NULL,
  '["https://my-catalogue.co.za/stores/pretoria/woolworths/irene-link-corner-alexandra-road-and-impala-street", "https://pretoria.co.za/listing/irene-link-shopping-centre-2/", "https://www.gumtree.co.za/a-office-space-for-rent/centurion/irene-link-precinct-impala-avenue-doringkloof/10012886861351013324522609"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'irene-arms-outdoor-doringkloof', 'Irene Arms & Outdoor',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-link-doringkloof'),
  '2-20 Impala Avenue, Irene Link, Doringkloof, Centurion, 0157', '010 300 1222', 'https://irenearms.com', NULL,
  'Irene Arms & Outdoor is a firearms, training and shooting-range retailer in Irene Link, Doringkloof.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/pretoria-arms-277121", "https://irenearms.com/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'irene-arms-outdoor-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-irene-link-doringkloof', 'Woolworths Irene Link',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-link-doringkloof'),
  'Corner Alexandra Road & Impala Street, Irene Link, Doringkloof, Centurion, 0157', '012 662 9440', NULL, NULL,
  'Woolworths Irene Link is a clothing and food department store in Irene Link, Doringkloof.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/pretoria/woolworths/irene-link-corner-alexandra-road-and-impala-street", "https://pretoria.co.za/listing/woolworths-irene-link-2/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-irene-link-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-irene-link-doringkloof', 'Checkers Irene Link',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-link-doringkloof'),
  '38 Alexandra Rd, Irene Link, Doringkloof, Centurion, 0157', '012 667 9200', NULL, NULL,
  'Checkers Irene Link is a supermarket in Irene Link, Doringkloof.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1900682", "https://pretoria.co.za/listing/checkers-irene-link/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-irene-link-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-pharmacy-irene-link-doringkloof', 'Dis-Chem Pharmacy Irene Link',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-link-doringkloof'),
  'Shop 27, Irene Link, Corner Alexandra Road & Impala Street, Doringkloof, Centurion, 0157', '010 541 2236', 'https://www.dischem.co.za/irene-link-centurion', NULL,
  'Dis-Chem Pharmacy Irene Link is a pharmacy in Irene Link, Doringkloof.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/dis-chem-pharmacy-irene-link-549390", "https://firmania.co.za/centurion/dis-chem-pharmacy-irene-link-centurion-71032"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-pharmacy-irene-link-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

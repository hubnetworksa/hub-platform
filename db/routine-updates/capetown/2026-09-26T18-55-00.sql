-- Job 1-2: Somerset West suburb research

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'circle-centre-somerset-west', 'Circle Centre',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '110 Main Road, Somerset West, 7130', NULL, NULL,
  '["https://circlecentreshopping.co.za/", "https://www.anvilproperty.co.za/commercial-property/retail/to-rent/somerset-west/circle-centre-somerset-west-6450"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'circle-pharmacy-somerset-west', 'Circle Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  (SELECT id FROM shopping_centers WHERE slug = 'circle-centre-somerset-west'),
  'Shop 22-25, Circle Centre, 110 Main Road, Somerset West, 7130', '021 851 2600', NULL, 'circlescripts@gmail.com',
  'Circle Pharmacy is a retail pharmacy in Circle Centre, Somerset West, dispensing prescription medicine and over-the-counter health products.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=87197", "https://wecarepharmacy.co.za/circle-pharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'circle-pharmacy-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'somerset-west-private-school-somerset-west', 'Somerset West Private School',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '95 Andries Pretorius Street, Audas Estate, Somerset West, 7130', '021 852 8451', NULL, 'admin@swps.co.za',
  'Somerset West Private School is an independent school in the Audas Estate area of Somerset West.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/education/facility/somerset-west-private-school", "https://southafricaprivateschool.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'somerset-west-private-school-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'timbuild-somerset-west-somerset-west', 'TimBuild Somerset West',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Cnr Reitz Street & Victoria Street, Somerset West, 7130', '021 851 7160', NULL, NULL,
  'TimBuild Somerset West is a hardware and DIY store selling timber, boards and building materials, with a precision cutting service.',
  NULL, NULL,
  '["https://timbuildsomersetwest.co.za/", "https://www.hardware1000.com/ZA/Somerset-West/111768537832294/TimBuild-Somerset-West"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'timbuild-somerset-west-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kelfords-ford-and-mazda-somerset-west', 'Kelfords Ford & Mazda',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '11 Victoria Street, Somerset West, 7130', '021 851 3333', 'https://www.kelfords.co.za', 'info@kelfords.co.za',
  'Kelfords Ford & Mazda is a new and pre-owned car dealership in Somerset West offering Ford and Mazda sales, service and parts.',
  NULL, NULL,
  '["https://www.kelfords.co.za/contact/", "https://dir.alltrack.org/view/167050-0-kelfords-ford--mazda"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kelfords-ford-and-mazda-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

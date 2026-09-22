INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'howard-centre-pinelands', 'Howard Centre',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  'Corner Howard Drive & Forest Drive, Pinelands, Cape Town, 7405', NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/bysuburb/pinelands/category/malls-and-shopping/", "https://en.wikipedia.org/wiki/Howard_Centre"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'central-square-pinelands', 'Central Square',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  'Central Buildings, Central Square, Forest Drive, Pinelands, Cape Town, 7405', NULL, NULL,
  '["https://www.property24.com/estate-agents/jawitz-pinelands/36335", "https://www.jawitz.co.za/contact/pinelands/1514/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-howard-centre-pinelands', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Howard Centre, Howard Drive, Pinelands, Cape Town, 7405', '021 531 3107', NULL, NULL,
  'Clicks is a pharmacy, health and beauty retailer, this branch in Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://clicks.co.za/store/Pinelands/128", "https://za.africabz.com/western-cape/clicks-pharmacy-30890"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-howard-centre-pinelands', 'PostNet',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop 2, Howard Centre, Forest Drive, Pinelands, Cape Town, 7405', '021 531 3111', NULL, NULL,
  'PostNet is a courier, printing and mailbox services retailer, this branch in Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/pinelands", "https://za.kompass.com/c/postnet-pinelands/zan131709/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-clothing-howard-centre-pinelands', 'Pick n Pay Clothing',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G36, Howard Centre, Cnr Forest & Howard Drives, Pinelands, Cape Town, 7405', '021 531 6437', NULL, NULL,
  'Pick n Pay Clothing is a clothing and apparel retailer, this branch in Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://sabusinesslistings.co.za/listings/pick-n-pay-clothing-howard-centre/", "https://za.africabz.com/western-cape/pick-n-pay-pinelands-6295"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-clothing-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pinelands-dental-inc-howard-centre-pinelands', 'Pinelands Dental Inc',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Suite 04, 2nd Floor, Howard Centre, Pinelands, Cape Town, 7405', '021 531 8742', NULL, NULL,
  'Pinelands Dental Inc is a dental practice offering general dentistry, based on the 2nd floor of Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://pinelandsdentalinc.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1781388"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pinelands-dental-inc-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jawitz-properties-central-square-pinelands', 'Jawitz Properties Pinelands',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'central-square-pinelands'),
  'Shop 6, Central Buildings, Central Square, Pinelands, Cape Town, 7405', '021 780 1401', NULL, NULL,
  'Jawitz Properties Pinelands is a residential estate agency branch based in Central Square, Pinelands, serving the Pinelands, Thornton and Maitland areas.',
  NULL, NULL,
  '["https://www.jawitz.co.za/contact/pinelands/1514/", "http://www.yellowpages.co.za/business/SA_6352680_BUS"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jawitz-properties-central-square-pinelands'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

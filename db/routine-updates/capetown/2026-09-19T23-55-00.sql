INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-khayelitsha-cbd-khayelitsha', 'Shoprite Khayelitsha CBD',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  'Corner Walter Sisulu and Nomzamo Mongo Street, Khayelitsha, Cape Town, 7780', '021 391 1000', NULL, NULL,
  'Shoprite Khayelitsha CBD is a supermarket on the corner of Walter Sisulu and Nomzamo Mongo Street in Khayelitsha, Cape Town.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Khayelitsha/Shoprite-Khayelitsha-CBD/store-details/45094", "https://www.yellosa.co.za/company/907749/shopritekhayelitsha-cbdsite-c"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-khayelitsha-cbd-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nceduluntu-driving-school-khayelitsha', 'Nceduluntu Driving School',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  '65 Raymond Mhlaba Crescent, Khayelitsha, Cape Town', '021 367 2522', NULL, NULL,
  'Nceduluntu Driving School is a driving school on Raymond Mhlaba Crescent in Khayelitsha, Cape Town.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/nceduluntu-driving-school-khayelitsha", "https://brabys.com/za/western-cape/cape-town/khayelitsha/driving-schools/nceduluntu-driving-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nceduluntu-driving-school-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'driving-schools'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'avbob-khayelitsha', 'AVBOB Khayelitsha',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  '29156 Khwezi Crescent, Ilitha Park, Khayelitsha, Cape Town, 7784', '021 361 4538', 'https://www.avbob.co.za', NULL,
  'AVBOB Khayelitsha is a funeral parlour in Ilitha Park, Khayelitsha, part of the national AVBOB funeral services group.',
  NULL, NULL,
  '["https://www.avbob.co.za/our-branches/branch-details?loc=AVBOB+Funeral+Service+Khayelitsha&locationid=ed34c35f-6ebf-4f0c-aa16-4acdab34ac17", "https://nfda.org.za/business-directory/775/avbob-khayelitsha/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'avbob-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'funeral-services'),
  1
);

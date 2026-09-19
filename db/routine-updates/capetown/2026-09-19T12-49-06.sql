INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'factory-toy-shop-parow', 'Factory Toy Shop',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '250 Voortrekker Road, Parow, Cape Town, 7500', '021 939 8958', NULL, NULL,
  'Factory Toy Shop is a toy store in Parow, offering a wide range of toys for all ages at discounted prices.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/factory-toy-shop-in-parow", "https://www.yep.co.za/biz/store/iyp/1479429_3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'factory-toy-shop-parow'),
  (SELECT id FROM categories WHERE slug = 'toy-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'u-turn-charity-shop-parow', 'U-turn Charity Shop',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '382 Voortrekker Road, Parow, Cape Town, 7506', '081 726 6819', NULL, NULL,
  'U-turn Charity Shop is a thrift and charity shop in Parow, run by U-turn Homeless Ministries, selling donated clothing and household goods to fund homelessness outreach work.',
  NULL, NULL,
  '["https://homeless.org.za/charity-shops/", "https://grapevinesa.co.za/index.php/u-turn-charity-shop-durbanville-9"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'u-turn-charity-shop-parow'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

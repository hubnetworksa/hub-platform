INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bellville-mall-bellville', 'Bellville Mall',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'Cnr Voortrekker Road & Bill Bezuidenhout Avenue, Bellville, 7530', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/bellville-mall.html", "https://galetti.co.za/property/commercial-property/western-cape/bellville-central/lease/66d31fa2cb5c9f7413809c74"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'middestad-mall-bellville', 'Middestad Mall',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'Cnr Charl Malan Road & Church Street, Bellville, 7530', NULL, NULL,
  '["https://middestadmallbellville.co.za/", "https://www.shoprite.co.za/Western-Cape/Bellville/Shoprite-Middestad/store-details/6438"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-bellville-mall-bellville', 'SPAR Bellville Mall',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  (SELECT id FROM shopping_centers WHERE slug = 'bellville-mall-bellville'),
  'Bellville Mall, Cnr Voortrekker Road & Bill Bezuidenhout Avenue, Bellville, 7530', '021 946 2675', NULL, NULL,
  'SPAR Bellville Mall is a supermarket inside Bellville Mall, in Bellville.',
  NULL, NULL,
  '["https://www.spar.co.za/home/store-view/spar-bellville-western-cape", "https://magicpin.com/south-africa/Cape-Town/Bellville/Grocery/Spar-Bellville/store/235b0ab"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-bellville-mall-bellville'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-middestad-bellville', 'Shoprite Middestad',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  (SELECT id FROM shopping_centers WHERE slug = 'middestad-mall-bellville'),
  'Middestad Mall, 30 Charl Malan Road, Bellville, 7530', '021 957 7340', NULL, NULL,
  'Shoprite Middestad is a supermarket inside Middestad Mall, in Bellville.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Bellville/Shoprite-Middestad/store-details/6438", "https://my-catalogue.co.za/stores/bellville/shoprite/middestad-mall-30-charl-malan-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-middestad-bellville'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

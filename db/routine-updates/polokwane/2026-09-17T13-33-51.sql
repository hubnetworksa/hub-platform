INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mankweng-shopping-centre-mankweng', 'Mankweng Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  'Mankweng Street, Mankweng-A, Mankweng, 0727', NULL, NULL,
  '["https://za.africabz.com/limpopo/ackermans-mankweng-471258", "https://www.russells.co.za/storelocator/store/index/id/491"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-mankweng-shopping-centre-mankweng', 'Ackermans Mankweng Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'mankweng-shopping-centre-mankweng'),
  'Shop 4, Mankweng Shopping Centre, Mankweng Street, Mankweng-A, Mankweng, 0727', '015 267 9385', NULL, NULL,
  'Ackermans Mankweng Shopping Centre is a branch of the Ackermans clothing retail chain, in Mankweng Shopping Centre, Mankweng.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/ackermans-mankweng_11", "https://za.africabz.com/limpopo/ackermans-mankweng-471258"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-mankweng-shopping-centre-mankweng'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'russells-mankweng-shopping-centre-mankweng', 'Russells Mankweng Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'mankweng-shopping-centre-mankweng'),
  'Shop 1, Mankweng Shopping Centre, Mankweng, 0727', '015 267 0953', NULL, NULL,
  'Russells Mankweng Shopping Centre is a branch of the Russells furniture and appliance retail chain, in Mankweng Shopping Centre, Mankweng.',
  NULL, NULL,
  '["https://www.russells.co.za/storelocator/store/index/id/491", "https://my-catalogue.co.za/stores/mankweng/russells/mankweng-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'russells-mankweng-shopping-centre-mankweng'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

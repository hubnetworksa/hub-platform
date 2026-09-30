-- Job 1/2: Meadowridge suburb research (2 new businesses, both tenants of the existing Meadowridge Shopping Centre)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-meadowridge', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Park ''n Shop Shopping Centre, Firgrove Road, Meadowridge, Cape Town, 7806', '021 710 3611', NULL, NULL,
  'Woolworths is a supermarket branch at the Meadowridge Shopping Centre, in Meadowridge.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/meadowridge/woolworths/park-n-shop-shopping-centre-firgrove-rd", "https://www.gps-data-team.com/where/south_africa/store_locator/Woolworths-ZA/Woolworths-Meadowridge.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-meadowridge', 'Checkers',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Park ''n Shop Centre, Cnr Firgrove and Howard Drive, Meadowridge, Cape Town, 7806', '021 710 5160', NULL, NULL,
  'Checkers is a supermarket branch at the Meadowridge Shopping Centre, in Meadowridge.',
  NULL, NULL,
  '["https://textmap.co.za/3/34710", "https://www.cybo.com/ZA-biz/checkers-meadowridge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

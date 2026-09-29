-- Jobs 1-2: Wynberg suburb research -- new shopping centre (Chelsea Courtyard) with one verified tenant
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'chelsea-courtyard-wynberg', 'Chelsea Courtyard', (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  'Corner Wolfe Street & Durban Road, Wynberg Village, Cape Town', NULL, NULL,
  '["https://chelseacourtyard.com/", "https://desray.co.za/pages/store-locations"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'desray-wynberg', 'Desray', (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'chelsea-courtyard-wynberg'),
  '7 Wolfe Street, Chelsea Courtyard, Wynberg, Cape Town', '021 448 2887', NULL, NULL,
  'Desray is a South African homeware and decor store, located in Chelsea Courtyard, Wynberg.',
  NULL, NULL,
  '["https://desray.co.za/pages/store-locations", "https://chelseacourtyard.com/directory/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'desray-wynberg'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

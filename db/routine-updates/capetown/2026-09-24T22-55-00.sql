INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'n1-city-mall-goodwood', 'N1 City Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  'Louwtjie Rothman Street, Goodwood, Cape Town, 7463', NULL, NULL,
  '["https://n1citymall.co.za/", "https://www.sayellow.com/n1-city-mall-goodwood"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-n1-city-mall-goodwood', 'Woolworths', (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'n1-city-mall-goodwood'),
  'N1 City Mall, Louwtjie Rothman Street, Goodwood, Cape Town, 7463', '021 596 3311', NULL, NULL,
  'Woolworths is a clothing, food and homeware retailer inside N1 City Mall in Goodwood.',
  NULL, NULL,
  '["https://n1citymall.co.za/stores/woolworths/", "https://www.cylex.net.za/company/woolworths---n1-city-19629091.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-n1-city-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'edgars-n1-city-mall-goodwood', 'Edgars', (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'n1-city-mall-goodwood'),
  'Shop 23/24, N1 City Mall, Frans Conradie Drive, Goodwood, Cape Town, 7460', '021 595 1600', NULL, NULL,
  'Edgars is a fashion and department store inside N1 City Mall in Goodwood.',
  NULL, NULL,
  '["https://n1citymall.co.za/stores/edgars/", "https://www.cybo.com/ZA-biz/edgars_2289"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'edgars-n1-city-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

-- Hazeldean: 3 new tenants of the existing Hazeldean Square shopping centre

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-hazeldean', 'RocoMamas',
  (SELECT id FROM suburbs WHERE slug = 'hazeldean'),
  (SELECT id FROM shopping_centers WHERE slug = 'hazeldean-square-hazeldean'),
  'Shop 40, Hazeldean Square, Silverlakes Rd, Hazeldean, Pretoria, 0040', '012 996 3039', NULL, NULL,
  'RocoMamas is a build-your-own burger and ribs restaurant chain branch in Hazeldean Square, Hazeldean.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/rocomamas-hazeldean-1048", "https://za.africabz.com/gauteng/rocomamas-hazeldean-square-2663"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocomamas-hazeldean'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'senhor-peri-peri-hazeldean', 'Senhor Peri-Peri',
  (SELECT id FROM suburbs WHERE slug = 'hazeldean'),
  (SELECT id FROM shopping_centers WHERE slug = 'hazeldean-square-hazeldean'),
  'Shop 21B, Hazeldean Square, 3 Silverlakes Road, Hazeldean, Pretoria, 0084', '012 817 2092', NULL, NULL,
  'Senhor Peri-Peri is a Portuguese peri-peri chicken restaurant chain branch in Hazeldean Square, Hazeldean.',
  NULL, NULL,
  '["https://www.sluurpy.co.za/pretoria/restaurant/8449955/senhor-peri-peri-hazeldean", "https://rsa.worldorgs.com/catalog/tyger-valley/chicken-restaurant/senhor-peri-peri-hazeldean-square"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'senhor-peri-peri-hazeldean'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pizza-hut-hazeldean', 'Pizza Hut Hazeldean',
  (SELECT id FROM suburbs WHERE slug = 'hazeldean'),
  (SELECT id FROM shopping_centers WHERE slug = 'hazeldean-square-hazeldean'),
  'Hazeldean Retail Square, 1 Silverlakes Rd, Hazeldean, Pretoria, 0081', '010 060 0602', NULL, NULL,
  'Pizza Hut Hazeldean is a pizza restaurant chain branch offering dine-in, takeaway and delivery in Hazeldean Square, Hazeldean.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/a7847b79b93a22c0fea0fdd105899b10/pizza-hut-hazeldean/pretoria/restaurants", "https://www.tellows.co.za/num/0100600602"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pizza-hut-hazeldean'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

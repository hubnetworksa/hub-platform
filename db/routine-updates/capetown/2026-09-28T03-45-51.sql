INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-stores-gugulethu-square-gugulethu', 'PEP Stores',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 31, Gugulethu Square, Cnr NY25 & Steve Biko Street, Gugulethu, Cape Town, 7750', '021 633 4149', NULL, NULL,
  'PEP Stores is a general clothing and merchandise retailer inside Gugulethu Square, Gugulethu.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-gugulethu-square-cnr-ny-steve-biko-street-guguletu-cape-town-western-cape/70519", "https://www.cybo.com/ZA-biz/pep-gugulethu-square"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-stores-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cell-gugulethu-square-gugulethu', 'PEP Cell',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 36, Gugulethu Square, Cnr NY25 & Steve Biko Street, Gugulethu, Cape Town, 7750', '021 638 0039', NULL, NULL,
  'PEP Cell is a cellphone and accessories retailer inside Gugulethu Square, Gugulethu.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/pep-cell-guguletu", "https://nearbyza.com/place/pep-cell-168"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-cell-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

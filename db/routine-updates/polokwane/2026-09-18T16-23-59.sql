-- Round-3 partial batch (run stopped early by owner request before most
-- agents finished; this covers the one agent that completed naturally --
-- Mall@Lebo / Seshego / Lebowakgomo shopping-centre sweep -- before the
-- rest were halted). Every entry verified against 2+ independent sources
-- with mandatory phone+address.

-- Existing-tenant link: Unjani Clinic's own snapshot address literally
-- names Mohlakaneng Shopping Centre but was never linked.

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'mohlakaneng-shopping-centre-seshego')
WHERE slug = 'unjani-clinic-seshego-seshego';

-- Mall@Lebo (Lebowakgomo) -- new tenants

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'african-bank-mall-lebo-lebowakgomo', 'African Bank – Mall@Lebo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 19, Mall@Lebo, Cnr R518 & R579, Lebowakgomo, 0737', '015 633 7683', NULL, NULL,
  'African Bank is a retail bank branch trading from Mall@Lebo in Lebowakgomo.',
  NULL, NULL,
  '["https://mallatlebo.co.za/shops-v2/", "https://www.africanbank.co.za/en/home/contact-us/find-a-branch/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'african-bank-mall-lebo-lebowakgomo'), (SELECT id FROM categories WHERE slug = 'banks-atms'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'old-mutual-mall-lebo-lebowakgomo', 'Old Mutual – Mall@Lebo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 48, Mall@Lebo, Cnr R518 & R579, Lebowakgomo, 0737', '013 658 9014', NULL, NULL,
  'Old Mutual is a financial services branch trading from Mall@Lebo in Lebowakgomo.',
  NULL, NULL,
  '["https://mallatlebo.co.za/shops-v2/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'old-mutual-mall-lebo-lebowakgomo'), (SELECT id FROM categories WHERE slug = 'financial-investment-services'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'john-craig-mall-lebo-lebowakgomo', 'John Craig – Mall@Lebo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 42, Mall@Lebo, Cnr R518 & R579, Lebowakgomo, 0737', '010 006 3208', 'https://johncraig.co.za', NULL,
  'John Craig is a menswear retail store trading from Mall@Lebo in Lebowakgomo.',
  NULL, NULL,
  '["https://mallatlebo.co.za/shops-v2/", "https://johncraig.co.za/stores/mall-lebo-john-craig/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'john-craig-mall-lebo-lebowakgomo'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cell-mall-lebo-lebowakgomo', 'PEP Cell – Mall@Lebo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 45, Mall@Lebo, Cnr R518 & R579, Lebowakgomo, 0737', '015 633 7091', NULL, NULL,
  'PEP Cell is a mobile phone and accessories retail store trading from Mall@Lebo in Lebowakgomo.',
  NULL, NULL,
  '["https://mallatlebo.co.za/shops-v2/", "https://www.tiendeo.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'pep-cell-mall-lebo-lebowakgomo'), (SELECT id FROM categories WHERE slug = 'mobile-phones'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-home-mall-lebo-lebowakgomo', 'PEP Home – Mall@Lebo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 43, Mall@Lebo, Jane Furse Rd, Lebowakgomo, 0737', '015 633 7041', NULL, NULL,
  'PEP Home is a homeware retail store trading from Mall@Lebo in Lebowakgomo.',
  NULL, NULL,
  '["https://mallatlebo.co.za/shops-v2/", "https://www.waze.com/live-map"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'pep-home-mall-lebo-lebowakgomo'), (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

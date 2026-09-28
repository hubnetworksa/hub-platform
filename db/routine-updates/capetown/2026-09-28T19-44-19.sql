-- Bloubergstrand: 2 new shopping centres (Eden on the Bay Mall, Seaside Village) + 4 tenants

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'eden-on-the-bay-mall-bloubergstrand', 'Eden on the Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  'Cnr Sir David Baird Drive & Otto du Plessis Drive, Big Bay, Bloubergstrand, Cape Town, 7441', NULL, NULL,
  '["https://www.edenonthebaymall.co.za/", "https://tableviewinfo.co.za/eden-on-the-bay-mall/", "https://www.wheretostay.co.za/topic/6524-eden-on-the-bay-shopping-mall-big-bay-cape-town"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'seaside-village-bloubergstrand', 'Seaside Village',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  'Cnr Otto du Plessis Drive & Cormorant Avenue, Big Bay, Bloubergstrand, Cape Town, 7441', NULL, NULL,
  '["https://www.sa-venues.com/visit/seasidevillageb24/map.php", "https://getoccupi.com/malls/seaside-village", "https://www.lekkeslaap.co.za/attractions/seaside-village-shopping-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-big-bay-bloubergstrand', 'Pick n Pay Big Bay',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'eden-on-the-bay-mall-bloubergstrand'),
  'Shop 1, Eden on the Bay Mall, Cnr Sir David Baird & Otto du Plessis Drives, Big Bay, Bloubergstrand, Cape Town, 7441', '021 712 0802', NULL, NULL,
  'Pick n Pay Big Bay is a family-store supermarket in Eden on the Bay Mall, Bloubergstrand, offering groceries, deli and fresh foods.',
  NULL, NULL,
  '["https://www.shopshours.co.za/pick-n-pay/cape-town/c-57f3cac247d677c3b27e5ca0", "https://www.yep.co.za/biz/store/big-bay-family-store-pty-ltd-t-or-a-pick-n-pay/493445", "https://www.pukkapure.co.za/outlets/pick-n-pay-local-big-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-big-bay-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-eden-on-the-bay-bloubergstrand', 'Clicks Pharmacy Eden on the Bay',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'eden-on-the-bay-mall-bloubergstrand'),
  'Shop 65, Eden on the Bay Mall, Big Bay, Bloubergstrand, Cape Town, 7441', '086 010 3030', NULL, NULL,
  'Clicks Pharmacy Eden on the Bay is a pharmacy and health, home and beauty store in Eden on the Bay Mall, Bloubergstrand.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1910463", "https://www.guzzle.co.za/clicks/table-view/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-eden-on-the-bay-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-seaside-village-bloubergstrand', 'Clicks Pharmacy Seaside Village',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'seaside-village-bloubergstrand'),
  'Seaside Village Centre, Cnr Otto du Plessis Drive & Cormorant Avenue, Bloubergstrand, Cape Town, 7441', '021 554 5037', NULL, NULL,
  'Clicks Pharmacy Seaside Village is a pharmacy and health, home and beauty store in the Seaside Village centre, Bloubergstrand.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/clicks-seaside-village-pharmacy", "https://www.africabizinfo.com/ZA/clicks-seaside-village-pharmacy-021-554-5037"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-seaside-village-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-big-bay-bloubergstrand', 'Checkers Big Bay',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'seaside-village-bloubergstrand'),
  'Seaside Village, Cnr Cormorant Road & Otto du Plessis Drive, Big Bay, Bloubergstrand, Cape Town, 7441', '021 554 8160', NULL, NULL,
  'Checkers Big Bay is a supermarket anchoring the Seaside Village centre in Bloubergstrand.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/checkers-big-bay-7672", "https://my-catalogue.co.za/stores/big-bay/checkers/seaside-village-cnr-cormorant-rd-and-otto-du-plessis-dr"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-big-bay-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

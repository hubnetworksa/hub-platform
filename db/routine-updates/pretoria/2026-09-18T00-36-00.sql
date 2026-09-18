INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-irene-village-mall-irene-farm-villages', 'Woolworths Irene Village Mall',
  (SELECT id FROM suburbs WHERE slug = 'irene-farm-villages'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-village-mall-irene-farm-villages'),
  'Irene Village Mall, Cnr Nellmapius Dr & Pierre Van Ryneveld Ave, Irene, Centurion, 0157', '012 662 9025', NULL, NULL,
  'Woolworths Irene Village Mall is a clothing and food department store in Irene Village Mall.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/irene/woolworths/irene-village-shopping-centre-cnr-nellmapius-dr-pierre-van-ryneveld-ave", "https://www.gps-data-team.com/where/south_africa/store_locator/Woolworths-ZA/Woolworths-Irene-Mall.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-irene-village-mall-irene-farm-villages'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-irene-village-irene-farm-villages', 'KFC Irene Village',
  (SELECT id FROM suburbs WHERE slug = 'irene-farm-villages'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-village-mall-irene-farm-villages'),
  'Irene Village Mall, Cnr Nellmapius Dr & Van Ryneveld Ave, Irene, Centurion, 0157', '012 662 0254', NULL, NULL,
  'KFC Irene Village is a fried-chicken fast-food outlet with a drive-thru in Irene Village Mall.',
  NULL, NULL,
  '["https://za.polomap.com/irene/5400", "https://www.waze.com/live-map/directions/kfc-irene-village-mall-(drive-thru)-cnr-nellmapius-rd-(m31)-and-van-ryneveld-ave-(m28)-irene,-centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-irene-village-irene-farm-villages'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-basket-irene-village-irene-farm-villages', 'Ocean Basket Irene Village',
  (SELECT id FROM suburbs WHERE slug = 'irene-farm-villages'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-village-mall-irene-farm-villages'),
  'Shop 144, Irene Village Mall, Mezereon Cres, Irene Farm Villages, Centurion, 0133', '012 662 3848', 'https://oceanbasket.co.za/our-restaurants/ocean-basket-irene/', NULL,
  'Ocean Basket Irene Village is a seafood restaurant at Shop 144, Irene Village Mall.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/ocean-basket-irene-village-mall-in-centurion", "https://oceanbasket.co.za/our-restaurants/ocean-basket-irene/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-basket-irene-village-irene-farm-villages'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-irene-village-mall-irene-farm-villages', 'McDonald''s Irene Village Mall',
  (SELECT id FROM suburbs WHERE slug = 'irene-farm-villages'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-village-mall-irene-farm-villages'),
  'Irene Village Mall, Mezereon Crescent, Irene Farm Villages, Centurion, 0133', '012 662 3727', 'https://www.mcdonalds.co.za/location/mcdonalds-irene-village-mall', NULL,
  'McDonald''s Irene Village Mall is a fast-food restaurant with a drive-thru in Irene Village Mall.',
  NULL, NULL,
  '["https://www.mcdonalds.co.za/location/mcdonalds-irene-village-mall", "https://www.findmy.co.za/food/category-detail/mcdonalds-irene-village-mall/24304"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-irene-village-mall-irene-farm-villages'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'step-ahead-irene-village-irene-farm-villages', 'Step Ahead Irene Village',
  (SELECT id FROM suburbs WHERE slug = 'irene-farm-villages'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-village-mall-irene-farm-villages'),
  'Shop E58, Irene Village Mall, Nellmapius Dr, Irene, Centurion, 0157', '077 608 7333', 'https://www.stepaheadshoes.co.za/', NULL,
  'Step Ahead Irene Village is a shoe and handbag store at Shop E58, Irene Village Mall.',
  NULL, NULL,
  '["https://www.stepaheadshoes.co.za/pages/stores", "https://www.brabys.com/business/6130529/south-africa/gauteng/centurion/irene/nellmapius-dve/shoe-stores/step-ahead"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'step-ahead-irene-village-irene-farm-villages'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

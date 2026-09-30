-- Job 1/2: Dreyersdal suburb research (1 new standalone business, plus 2 new tenants of the
-- existing Blue Route Mall discovered opportunistically -- the mall itself sits just over the
-- Dreyersdal/Tokai boundary and is already recorded under Tokai, so its tenants are filed there too)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nandos-tokai-drive-thru-dreyersdal', 'Nando''s Tokai Drive Thru',
  (SELECT id FROM suburbs WHERE slug = 'dreyersdal'),
  '238 Main Road, Tokai Junction, Dreyersdal, Cape Town, 7945', '021 715 0445', NULL, NULL,
  'Nando''s Tokai Drive Thru is a flame-grilled chicken fast-food drive-thru on Main Road, in Dreyersdal.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g25046846-d7988913-Reviews-Nando_s_Tokai_Drive_Thru-Dreyersdal_Western_Cape.html", "https://showmesa.co.za/directory-listing/nandos-tokai-drive-thru/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nandos-tokai-drive-thru-dreyersdal'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-union-mart-tokai', 'Cape Union Mart',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-route-mall-tokai'),
  'Shop F220, Blue Route Mall, 16 Tokai Road, Tokai, Cape Town, 7945', '021 712 5979', NULL, NULL,
  'Cape Union Mart is an outdoor and adventure gear retailer at the Blue Route Mall, in Tokai.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/cape-union-mart/shop-f220-blue-route-mall-tokai-road-tokai", "https://www.tiendeo.co.za/stores/cape-town/cape-union-mart-shop-f-blue-route-mall-tokai-road-tokai--cape-town/14659"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-union-mart-tokai'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mugg-bean-blue-route-mall-tokai', 'Mugg & Bean Blue Route Mall',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-route-mall-tokai'),
  'Shop F214, 16 Tokai Road, Blue Route Mall, Tokai, Cape Town, 7945', '021 012 5761', NULL, NULL,
  'Mugg & Bean Blue Route Mall is a coffee shop and restaurant at the Blue Route Mall, in Tokai.',
  NULL, NULL,
  '["https://locations.muggandbean.co.za/restaurants-BlueRouteMall-MuggBeanBlueRouteMall/", "https://www.eatout.co.za/venue/mugg-bean-blue-route-mall-tokai/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mugg-bean-blue-route-mall-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

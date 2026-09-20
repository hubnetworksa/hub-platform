INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sheet-street-vangate-mall-athlone', 'Sheet Street Vangate Mall',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  (SELECT id FROM shopping_centers WHERE slug = 'vangate-mall-athlone'),
  'Shop 58, Vangate Mall, Cnr Vanguard Drive & Klipfontein Road, Athlone, Cape Town, 7764',
  '087 754 5271', NULL, NULL,
  'Sheet Street Vangate Mall is a homeware and soft furnishings store in Vangate Mall, Athlone.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/sheet-street-shop-vanguard-shopping-mall-vangate-city-vanguard-drive/40233", "https://www.sheetstreet.com/sheet-street-vangate-mall-30511"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sheet-street-vangate-mall-athlone'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-basket-vangate-mall-athlone', 'Ocean Basket Vangate Mall',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  (SELECT id FROM shopping_centers WHERE slug = 'vangate-mall-athlone'),
  'Shop 76, Vangate Mall, Cnr Vanguard Drive & Klipfontein Road, Athlone, Cape Town, 7764',
  '021 633 6716', NULL, NULL,
  'Ocean Basket Vangate Mall is a seafood restaurant in Vangate Mall, Athlone.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/ocean-basket-shop-no-vangate-mall-cnr-vanguard-drive-klipfontein-road-athlone/38808", "https://www.eatout.co.za/venue/ocean-basket-van-gate-plaza/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-basket-vangate-mall-athlone'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-vangate-mall-athlone', 'Clicks Vangate Mall',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  (SELECT id FROM shopping_centers WHERE slug = 'vangate-mall-athlone'),
  'Shop 65, Vangate Mall, Cnr Vanguard Drive & Klipfontein Road, Athlone, Cape Town, 7764',
  '021 638 1289', NULL, NULL,
  'Clicks Vangate Mall is a pharmacy and health, beauty and homeware retailer in Vangate Mall, Athlone.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/clicks/vangate-mall-vanguard-drive-athlone", "https://www.callupcontact.com/b/Pharmacies/Clicks_Vangate_Mall/2997"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-vangate-mall-athlone'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'athlone-pharmacy-athlone', 'Athlone Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '29 Old Klipfontein Road, Athlone, Cape Town', '021 697 1613', NULL, NULL,
  'Athlone Pharmacy is a pharmacy on Old Klipfontein Road in Athlone.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=89169", "https://www.brabys.com/business/1591622/south-africa/western-cape/athlone/old-klipfontein-rd/pharmacies/athlone-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'athlone-pharmacy-athlone'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

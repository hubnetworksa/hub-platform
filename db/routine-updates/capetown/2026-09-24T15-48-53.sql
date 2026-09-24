INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'constantia-emporium-constantia', 'Constantia Emporium',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Spaanschemat River Road & Ladies Mile Road, Constantia, Cape Town, 7806', NULL, NULL,
  '["http://www.constantiaemporium.co.za/", "https://en.wikipedia.org/wiki/Constantia_Emporium", "https://www.safcom.co.za/area-constantia-emporium-centre-constantia"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-constantia-emporium-constantia', 'Checkers',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-emporium-constantia'),
  'Constantia Emporium, Ladies Mile Road, Constantia, Cape Town, 7806', '021 710 5515', NULL, NULL,
  'Checkers is a supermarket in Constantia Emporium on Ladies Mile Road, Constantia.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/checkers-ladies-mile-road-constantia/54168", "https://www.cybo.com/ZA-biz/checkers-fx-constantia"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-constantia-emporium-constantia'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-constantia-emporium-constantia', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-emporium-constantia'),
  'Shop 12 & 13, Constantia Emporium, Ladies Mile Road, Constantia, Cape Town', '021 799 7190', NULL, NULL,
  'Clicks is a pharmacy and health-and-beauty retailer inside Constantia Emporium on Ladies Mile Road.',
  NULL, NULL,
  '["https://clicks.co.za/store/Constantia-Emporium/1976", "https://za.africabz.com/western-cape/clicks-pharmacy-323872"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-constantia-emporium-constantia'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

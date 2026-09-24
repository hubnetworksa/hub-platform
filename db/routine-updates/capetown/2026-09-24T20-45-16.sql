INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tjopshop-parow-centre-parow', 'Tjopshop',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  (SELECT id FROM shopping_centers WHERE slug = 'parow-centre-parow'),
  'Shop F1-79, Parow Centre, Cnr Voortrekker Road & De La Rey Street, Parow, Cape Town, 7500', '021 330 5403', NULL, NULL,
  'Tjopshop is a free-range Karoo lamb butchery in Parow Centre, Parow.',
  NULL, NULL,
  '["https://mindtrip.ai/attraction/parow-western-cape/tjopshop-free-range-karoo-lamb-butchery/at-KGf9MRF2", "https://za.africabz.com/western-cape/tjopshop-416746"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tjopshop-parow-centre-parow'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-atm-cycad-centre-bendor-park', 'Absa ATM Cycad Centre',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'cycad-centre-bendor-park'),
  '113 General Maritz Street, Cycad Centre, Bendor Park, Polokwane, 0699', '0860 008 600', NULL, NULL,
  'Absa ATM Cycad Centre is a standalone Absa automated teller machine at Cycad Centre in Bendor Park.',
  NULL, NULL,
  '["https://za.near-place.com/absa-atm-cycad-113-generaal-maritz-street-bendor-park-polokwane", "https://getoccupi.com/malls/cycad-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-atm-cycad-centre-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

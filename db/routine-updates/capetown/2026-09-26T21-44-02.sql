INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belkem-pharmacy-macassar', 'Belkem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  (SELECT id FROM shopping_centers WHERE slug = 'macassar-shopping-centre-macassar'),
  'Shop 19, Macassar Shopping Centre, Corner Hospital and Burg Street, Macassar, 7130', '021 224 0844', NULL, NULL,
  'Belkem Pharmacy is a pharmacy at Macassar Shopping Centre in Macassar.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/business/BelKem_Pharmacy/61180", "https://www.facebook.com/p/Belkem-Macassar-Pharmacy-100083144868060/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belkem-pharmacy-macassar'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

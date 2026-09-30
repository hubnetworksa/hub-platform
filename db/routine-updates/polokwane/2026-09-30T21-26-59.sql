INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-thornhill-thornhill-estate', 'Food Lover''s Market Thornhill',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Cnr Munnik Ave & Veldspaat St, Thornhill, Polokwane, 0699', '015 296 4855', NULL, NULL,
  'Food Lover''s Market Thornhill is a fresh-food supermarket on the corner of Munnik Avenue and Veldspaat Street in Thornhill, Polokwane, stocking fresh produce, meat, bakery and grocery lines.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/bendor/fruit-vegetable-merchants/food-lovers-market", "https://www.top-rated.online/cities/Polokwane/place/p/9761584/Food+Lover''s+Market+Thornhill"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'food-lovers-market-thornhill-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

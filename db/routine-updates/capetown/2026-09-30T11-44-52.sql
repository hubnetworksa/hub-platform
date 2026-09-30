INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tonys-liquors-la-piazza-richwood', 'Tony''s Liquors',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'la-piazza-richwood'),
  'La Piazza Complex, 39 Nederberg Drive, Richwood, Milnerton, Cape Town, 7441', '021 558 5361', NULL, NULL,
  'Tony''s Liquors is a bottle store and liquor merchant in La Piazza, Richwood.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/milnerton/richwood/bottle-stores-off-sales-retail/tonys-liquors", "https://za.africabz.com/western-cape/tonys-liquor-store-267346", "https://www.yellosa.co.za/company/757296/tonys-liquors-richwood"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tonys-liquors-la-piazza-richwood'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

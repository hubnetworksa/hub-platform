INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'abundance-city-church-dalmada', 'Abundance City Church',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  '2Myn Dalmada, Polokwane', '015 265 7298', 'https://abundancechurch.org.za/index.html', NULL,
  'Abundance City Church is a Christian congregation in Dalmada, Polokwane, holding services on Sunday mornings and Wednesday evenings.',
  NULL, NULL,
  '["https://abundancechurch.org.za/index.html", "https://www.instagram.com/abundance_citychurch/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'abundance-city-church-dalmada'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);

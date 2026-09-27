INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  's-h-s-security-fauna-park', 'S H S Security',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '50 Gazelle Street, Fauna Park, Polokwane, 0787', '015 296 3602', NULL, NULL,
  'S H S Security is a security services provider based in Fauna Park, Polokwane.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/fauna-park/security-services/s-h-s-security", "https://www.searchinafrica.com/business/5994877/south-africa/limpopo/polokwane/fauna-park/gazelle-st/security-services/s-h-s-security"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 's-h-s-security-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

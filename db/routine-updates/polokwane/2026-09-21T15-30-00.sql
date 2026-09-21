INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-polygraph-professionals-cc-capricorn', 'The Polygraph Professionals CC',
  (SELECT id FROM suburbs WHERE slug = 'capricorn'),
  '94 Jones St, Capricorn, Polokwane, 0699', '073 402 7085', 'http://www.polygraphy.co.za', NULL,
  'The Polygraph Professionals CC is a polygraph testing and lie-detection service based in Capricorn, Polokwane, serving Limpopo alongside North Gauteng, North West and Mpumalanga.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/capricorn/polygraph-testing-lie-detection/the-polygraph-professionals-cc", "https://www.hotfrog.co.za/company/1099854432468992/the-polygraph-professionals-cc/polokwane/investigation-services"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-polygraph-professionals-cc-capricorn'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

-- Rosebank: 1 new business discovered via general suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medindi-manor-rosebank', 'Medindi Manor',
  (SELECT id FROM suburbs WHERE slug = 'rosebank'),
  '4 Thicket Road, Rosebank, Cape Town, 7700', '021 686 3563', 'https://www.medindimanor.com', NULL,
  'Medindi Manor is a guest house in a secluded Edwardian-era house in Rosebank, offering accommodation for leisure and business travellers.',
  NULL, NULL,
  '["https://www.medindimanor.com/contact-us", "https://www.sa-venues.com/visit/medindimanor/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medindi-manor-rosebank'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

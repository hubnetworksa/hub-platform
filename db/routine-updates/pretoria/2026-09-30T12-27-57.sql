INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sable-hills-lodge-sable-hills-waterfront-estate', 'Sable Hills Lodge',
  (SELECT id FROM suburbs WHERE slug = 'sable-hills-waterfront-estate'),
  '7 Eland St, Sable Hills Waterfront Estate, Pretoria, 0182', '082 390 6861', 'https://www.sablehillslodge.com', NULL,
  'Sable Hills Lodge is a 4-star graded self-catering guest lodge on the banks of the Roodeplaat Dam inside the Sable Hills Waterfront Estate, with three individually decorated units, a sports bar, gym, squash and tennis courts, and an Olympic-size pool.',
  NULL, NULL,
  '["https://sa-venues.com/visit/sablehouse", "https://www.lekkeslaap.co.za/accommodation/sable-hills-lodge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sable-hills-lodge-sable-hills-waterfront-estate'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

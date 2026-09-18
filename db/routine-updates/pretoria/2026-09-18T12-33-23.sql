-- Kilner Park checkpoint (job 1/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-kilner-park-kilner-park', 'TOPS at SPAR Kilner Park',
  (SELECT id FROM suburbs WHERE slug = 'kilner-park'),
  '25 Lynette Street, Kilner Park, Pretoria', '012 333 3709', NULL, NULL,
  'TOPS at SPAR Kilner Park is a liquor store attached to SUPERSPAR Kilner Park, 25 Lynette Street, Kilner Park.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/kilner-park/tops-at-spar/25-lynette-street", "https://southafricafirm.com/gauteng/superspar-kilner-park-and-tops-5642"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-kilner-park-kilner-park'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

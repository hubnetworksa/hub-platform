INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-health-team-mouille-point', 'The Health Team',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '129 Beach Road, Mouille Point, Cape Town, 8001', '021 434 2244', NULL, NULL,
  'The Health Team is a medical centre with general practitioners, a psychiatrist and a physiotherapist under one roof, in Mouille Point.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=411225", "https://www.recomed.co.za/private-practice/mouille-point/the-health-team/10265/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-health-team-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

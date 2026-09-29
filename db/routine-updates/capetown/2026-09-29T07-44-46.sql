INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-strand', 'Pep',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Strand Square, 21 Fagan Street, Strand, 7140', '021 853 4929', NULL, NULL,
  'Pep is a branch of the Pep discount clothing and household goods chain, trading from Strand Square in Strand.',
  NULL, NULL,
  '["https://2pos.co.za/64178/11934", "https://za.polomap.com/strand/29835"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-strand'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

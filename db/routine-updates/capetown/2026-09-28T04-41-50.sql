INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ndwamba-market-nyanga', 'Ndwamba Market',
  (SELECT id FROM suburbs WHERE slug = 'nyanga'),
  '14 Emms Drive, Nyanga East, Cape Town, 7750', '021 023 0553', NULL, NULL,
  'Ndwamba Market is a Pick n Pay-affiliated supermarket in Nyanga East, launched under Pick n Pay''s spaza shop modernisation programme.',
  NULL, NULL,
  '["https://www.news24.com/SouthAfrica/News/meet-the-woman-behind-ndwamba-market-nyanga-easts-first-supermarket-20180405", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=406517"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ndwamba-market-nyanga'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lifestyle-emporium-mouille-point', 'Lifestyle Emporium',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  'Corner of Surrey Place and Bay Road, Mouille Point, Cape Town', '021 434 7760', NULL, NULL,
  'Lifestyle Emporium is a beauty and hair salon on the corner of Surrey Place and Bay Road, in Mouille Point.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1904949", "https://za.africabz.com/western-cape/lifestyle-emporium-177790"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lifestyle-emporium-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

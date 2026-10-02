INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'edgemead-optical-centre-edgemead', 'Edgemead Optical Centre',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-village-centre-edgemead'),
  'Edgemead Village Centre, Louis Thibault Drive, Edgemead, Cape Town, 7441', '021 558 7128', NULL, NULL,
  'Edgemead Optical Centre is an optometry practice in the Edgemead Village Centre, in Edgemead.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=31779", "https://sabusinesslistings.co.za/listings/edgemead-optical-centre-incorp/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'edgemead-optical-centre-edgemead'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

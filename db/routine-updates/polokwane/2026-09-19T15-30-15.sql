INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rampora-attorneys-lebowakgomo', 'J.M Rampora Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Stand No. 04, Unit P, Lebowakgomo, 0737', '015 635 0000', NULL, NULL,
  'J.M Rampora Attorneys is a law firm in Lebowakgomo handling criminal law, civil litigation, contracts, debt collections, third-party claims, conveyancing, and administration of estates.',
  NULL, NULL,
  '["https://www.directory101.co.za/legaldir/index.php?page=item&id=181", "https://b2bhint.com/en/company/za/jm-rampora-attorneys--K2020621772"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rampora-attorneys-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jb-accountants-welgelegen', 'JB Accountants',
  (SELECT id FROM suburbs WHERE slug = 'welgelegen'),
  'Ismini Office Park, Unit 6, 5 Adj Mauritz Dommisie Street, Welgelegen, Polokwane', '015 297 5052', NULL, NULL,
  'JB Accountants is an accounting and financial services firm based in Ismini Office Park, Welgelegen.',
  NULL, NULL,
  '["https://www.facebook.com/p/JB-Accountants-Financial-Services-100083221627553/", "https://vymaps.com/ZA/Jb-Accountants-1604611626430568/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jb-accountants-welgelegen'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

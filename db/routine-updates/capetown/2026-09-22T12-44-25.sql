INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stellenberg-pharmacy-stellenberg', 'Stellenberg Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  'Corner Reiger & Haarlem Road, Stellenberg, Bellville', '021 919 3520', NULL, NULL,
  'Stellenberg Pharmacy is a pharmacy on the corner of Reiger and Haarlem Road in Stellenberg, Bellville.',
  NULL, NULL,
  '["https://www.africanadvice.com/1349712/Pharmacies/Bellville/Stellenberg_Pharmacy/", "https://www.brabys.com/za/western-cape/bellville/stellenberg/pharmacies/stellenberg-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stellenberg-pharmacy-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

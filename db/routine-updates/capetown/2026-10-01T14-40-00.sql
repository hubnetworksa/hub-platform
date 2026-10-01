INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-glengariff-three-anchor-bay', 'Clicks Pharmacy Glengariff',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '2 Main Rd', '021 439 3942', NULL, NULL,
  'Clicks Pharmacy Glengariff is a retail pharmacy offering prescription dispensing, repeat prescriptions and health consultations, in Three Anchor Bay.',
  NULL, NULL,
  '["https://clicks.co.za/store/Glengariff/155", "https://www.southafricabusinessdirectory.co.za/company/0b7abeb82d5a7fde14112caa1664923e/clicks-pharmacy-glengariff/cape-town/pharmacies-prescriptions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-glengariff-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

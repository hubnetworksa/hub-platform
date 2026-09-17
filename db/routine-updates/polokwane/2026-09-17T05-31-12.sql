-- Jobs 1-2: bendor-park
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fnb-platinum-park-bendor-park', 'FNB Platinum Park',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'platinum-park-bendor-park'),
  'Shop 3, Platinum Park Shopping Centre, Outspan Drive, Bendor Park, Polokwane, 0699', '087 575 9404', NULL, NULL,
  'FNB Platinum Park is a First National Bank branch inside Platinum Park Shopping Centre in Bendor Park.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/2d27cd3513cf61fcb2e9c0a8ad7a236c/fnb-platinum-park-polokwane/polokwane/banking-services", "https://www.vezaconnect.co.za/directory/fnb-platinum-park-polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fnb-platinum-park-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

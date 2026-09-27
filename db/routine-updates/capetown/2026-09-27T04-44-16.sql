-- Jobs 1-2: bantry-bay suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'compass-house-bantry-bay', 'Compass House',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '154 Kloof Road, Bantry Bay, Cape Town, 8005', '+27 21 430 3330', NULL, NULL,
  'Compass House is a boutique hotel on Kloof Road in Bantry Bay offering sea-facing guest rooms with views of the Atlantic Ocean.',
  NULL, NULL,
  '["https://www.compasshouse.co.za/", "https://www.sa-venues.com/visit/compasshouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'compass-house-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bantry-bay-international-vacation-resort-bantry-bay', 'Bantry Bay International Vacation Resort',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '44A Victoria Road, Bantry Bay, Cape Town, 8005', '021 439 0333', NULL, NULL,
  'Bantry Bay International Vacation Resort is a self-catering vacation resort on Victoria Road in Bantry Bay offering timeshare and holiday apartment accommodation.',
  NULL, NULL,
  '["https://bantrybayinternational.co.za/", "https://www.africanadvice.com/1029253/Pleasure_Resorts/Cape_Town/Bantry_Bay_International_Vacation_Resort/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bantry-bay-international-vacation-resort-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

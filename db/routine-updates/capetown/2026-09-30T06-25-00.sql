-- Jobs 1-2: Kraaifontein suburb research -- 1 new business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blou-winkel-kraaifontein', 'Blou Winkel',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '254 Voortrekker Road, Kraaifontein, Cape Town, 7570',
  '021 988 2174', NULL, NULL,
  'Blou Winkel is a general dealer on Voortrekker Road in Kraaifontein, stocking motor spares, hardware, plumbing and electrical supplies, LPG gas refills and groceries.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/594132/blou-winkel-die", "https://www.brabys.com/za/western-cape/kraaifontein/general-dealers/blou-winkel"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blou-winkel-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

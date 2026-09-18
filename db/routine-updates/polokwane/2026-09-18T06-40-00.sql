INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'century-21-polokwane-eduan-park', 'Century 21 Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'eduan-park'),
  '215 Harley Street, Kleen Place, Office 1, Eduan Park, Polokwane, 0699', '015 880 2111', NULL, NULL,
  'Century 21 Polokwane is an estate agency office in Eduan Park handling residential and commercial property sales and rentals across the greater Polokwane area.',
  NULL, NULL,
  '["https://www.century21.co.za/contact/", "https://www.property24.com/estate-agents/century-21-polokwane/36187", "https://www.myproperty.co.za/offices/century-21-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'century-21-polokwane-eduan-park'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

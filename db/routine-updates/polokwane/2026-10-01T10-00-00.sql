INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'malahlela-attorneys-ivy-park', 'Malahlela Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'ivy-park'),
  '6 Turmeric St, Ivy Park, Polokwane, 0699', '015 295 2938', NULL, NULL,
  'Malahlela Attorneys is a law firm offering legal services, in Ivy Park.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/ivy-park/attorneys/malahlela-attorneys", "https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=2206"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'malahlela-attorneys-ivy-park'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

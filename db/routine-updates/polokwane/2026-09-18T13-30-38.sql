-- Westenburg suburb checkpoint

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'westenburg-police-station-westenburg', 'Westenburg Police Station',
  (SELECT id FROM suburbs WHERE slug = 'westenburg'),
  '34 Ben Harris St, Westenburg, Polokwane, 0699', '015 292 9415', NULL, NULL,
  'Westenburg Police Station is a South African Police Service (SAPS) station serving the Westenburg community in Polokwane.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/saps-westernburg-police-station", "https://www.africabizinfo.com/ZA/saps-westernburg-police-station-015-292-9415"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'westenburg-police-station-westenburg'),
  (SELECT id FROM categories WHERE slug = 'government-municipal-services'),
  1
);

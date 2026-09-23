INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gabaza-security-services-hospark', 'Gabaza Security Services',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '9 Devenish Street, Hospital Park, Polokwane, 0700', '015 297 3239', 'https://gabazasecurity.co.za', NULL,
  'Gabaza Security Services is a private security company in Hospital Park offering alarm installation and monitoring for homes and businesses.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/lp/polokwane/gabaza-security-services", "https://www.shopshours.co.za/gabaza-security-services/polokwane/c-57f3c9f447d677c3b27a616e", "https://alarminstallations.co.za/installers/gabaza-security-services/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gabaza-security-services-hospark'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

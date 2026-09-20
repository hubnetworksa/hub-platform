INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-j-h-weyer-hospark', 'Dr J H Weyer',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  'Corner Plein & Devenish Street, Hospital Park, Polokwane, 0700', '015 297 7873', NULL, NULL,
  'Dr J H Weyer is an ophthalmology practice in Hospital Park, Polokwane, offering eye care and treatment.',
  NULL, NULL,
  '["https://za.polomap.com/polokwane/10100", "https://www.brabys.com/za/limpopo/polokwane/ophthalmologist/dr-jh-weyer"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-j-h-weyer-hospark'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'limpopo-department-of-health-hospark', 'Limpopo Department of Health',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '18 College Street, Hospital Park, Polokwane, 0700', '015 293 6000', NULL, NULL,
  'The Limpopo Department of Health provincial head office, based in Hospital Park, Polokwane.',
  NULL, NULL,
  '["https://www.govpage.co.za/limpopo-department-of-health.html", "https://www.waze.com/live-map/directions/limpopo-department-of-health-college-ave-18-hospital-park,-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'limpopo-department-of-health-hospark'),
  (SELECT id FROM categories WHERE slug = 'government-municipal-services'),
  1
);

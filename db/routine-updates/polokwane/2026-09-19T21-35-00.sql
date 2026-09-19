INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-ml-tjelele-hospark', 'Dr ML Tjelele',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '70 Burger Street, Hospital Park, Polokwane, 0699', '015 280 0247', NULL, NULL,
  'Dr ML Tjelele is a general dental practice in Hospital Park, Polokwane.',
  NULL, NULL,
  '["https://www.recomed.co.za/dentist/polokwane/ml-tjelele/16277/22306/", "https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/Network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/Dental-pdf/august/Dentists/T1B-Dental-List_LP.ashx?la=en"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-ml-tjelele-hospark'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

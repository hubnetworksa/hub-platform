-- Seshego suburb research: 2 new businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'leda-seshego-training-centre-seshego', 'LEDA Seshego Training Centre',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  'Factory Unit No. 58, Moletjie Drive, Zone 6, Seshego, Polokwane, 0742', '015 223 5656', NULL, NULL,
  'LEDA Seshego Training Centre is a small business development services provider in Seshego, offering entrepreneur support, technical and occupational training, learnerships and artisan development.',
  NULL, NULL,
  '["https://www.lieda.co.za/index.php/leda-seshego-training-centre/", "https://www.findmy.co.za/services/business/leda-seshego-training-centre/40363", "https://www.brabys.com/za/limpopo/seshego/training-institutes/leda-seshego-training-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'leda-seshego-training-centre-seshego'),
  (SELECT id FROM categories WHERE slug = 'business-consulting'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'seshego-clinic-2-seshego', 'Seshego Clinic 2',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  'Stand 3850, Seshego-G, Polokwane, 0741', '015 223 4243', NULL, NULL,
  'Seshego Clinic 2 is a public primary healthcare clinic in Seshego Zone 2, providing general clinic services to the local community.',
  NULL, NULL,
  '["https://za.polomap.com/polokwane/10920", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=214670", "https://health.infogov.co.za/locations/seshego-ii-clinic/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'seshego-clinic-2-seshego'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

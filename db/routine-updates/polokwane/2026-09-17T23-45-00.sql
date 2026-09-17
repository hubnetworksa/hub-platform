INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-dm-moetlo-mankweng', 'Dr DM Moetlo',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  '561 Zone A, Mankweng, Polokwane, 0727', '072 739 0323', NULL, NULL,
  'A dental therapy practice in Mankweng, Sovenga, providing oral health and dental treatment services to the local community.',
  NULL, NULL,
  '["https://www.recomed.co.za/dentist/mankweng/dm-moetlo/16233/22262/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=186929", "https://www.meditrader.co.za/mr-d-m-moetlo-dental-therapist-mankweng-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-dm-moetlo-mankweng'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

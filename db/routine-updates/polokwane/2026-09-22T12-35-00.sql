INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-t-g-mulaudzi-seshego-zone-1', 'Dr T.G. Mulaudzi',
  (SELECT id FROM suburbs WHERE slug = 'seshego-zone-1'),
  '1880 Nelson Mandela Drive, Seshego Zone 1, Polokwane, 0699', '015 223 2886', NULL, NULL,
  'A general practice offering primary healthcare consultations to the Seshego Zone 1 community.',
  NULL, NULL,
  '["https://www.recomed.co.za/general-practitioner/polokwane/tg-mulaudzi/4203/3972/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=149585"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-t-g-mulaudzi-seshego-zone-1'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

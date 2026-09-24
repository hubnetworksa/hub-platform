INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mowbray-veterinary-clinic-mowbray', 'Mowbray Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '84 Durban Road, Mowbray, Cape Town', '021 686 6161', NULL, NULL,
  'Mowbray Veterinary Clinic is a veterinary practice on Durban Road in Mowbray, Cape Town, offering consultations and animal care services.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/mowbray-veterinary-hospital-232366", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=238021"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mowbray-veterinary-clinic-mowbray'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

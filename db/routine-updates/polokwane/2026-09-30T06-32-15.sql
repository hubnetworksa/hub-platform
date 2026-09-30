-- Jobs 1-2: fauna-park suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'savannah-pharmacy-fauna-park', 'Savannah Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Savannah Mall, Cnr Thabo Mbeki St (R71) & Grimm St, Fauna Park, Polokwane, 0699', '015 296 1125', NULL, NULL,
  'Savannah Pharmacy is an independent pharmacy trading inside Savannah Mall in Fauna Park, alongside the mall''s other health and beauty retailers.',
  NULL, NULL,
  '["https://www.dischem.co.za/savannah-mall-pharmacy", "https://www.wheretostay.co.za/topic/5329-savannah-mall-in-polokwane-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'savannah-pharmacy-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hopewell-medical-centre-fauna-park', 'Hopewell Medical Centre',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '144 Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '015 296 3929', NULL, NULL,
  'Hopewell Medical Centre is a multi-practice medical centre on Thabo Mbeki Street offering general practitioner, dental, gynaecological and psychology services under one roof.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=241126", "https://www.cylex.net.za/company/hopewell-medical-centre-23687849.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hopewell-medical-centre-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

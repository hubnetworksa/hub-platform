INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-savannah-mall-fauna-park', 'Nedbank Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop 54, Savannah Mall, Cnr Grimm & Thabo Mbeki St, Fauna Park, Polokwane, 0699', '015 296 5000', NULL, NULL,
  'Nedbank is a South African commercial bank offering personal and business banking, loans, credit cards and investment products, with this branch inside Savannah Mall, Fauna Park.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/nedbank-savannah-17507239.html", "https://mycityinfo.co.za/places/south-africa/limpopo/polokwane/finance/nedbank-savannah-mall/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fauna-veterinary-clinic-fauna-park', 'Fauna Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '49A Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '015 295 3622', NULL, NULL,
  'Fauna Veterinary Clinic is a veterinary hospital and clinic in Fauna Park, Polokwane, and a member of the South African Veterinary Association.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/fauna-veterinary-clinic-in-polokwane", "https://www.ivote.co.za/view/south-africa/fauna-veterinary-clinic-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fauna-veterinary-clinic-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cream-car-wash-polokwane-fauna-park', 'CREAM Car Wash Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  'Thabo Mbeki Street, Fauna Park, Polokwane', '083 390 2258', NULL, NULL,
  'CREAM Car Wash Polokwane is a car wash offering vehicle washing and valet services in Fauna Park, Polokwane.',
  NULL, NULL,
  '["https://rsa.worldorgs.com/catalog/polokwane/car-wash/cream-car-wash-polokwane", "https://www.waze.com/live-map/directions/za/lp/polokwane/cream-car-wash-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cream-car-wash-polokwane-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'car-wash-detailing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nandos-savannah-mall-fauna-park', 'Nando''s Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop 71, Grobler St Entrance 4, Savannah Mall, Fauna Park, Polokwane, 0699', '015 296 2450', NULL, NULL,
  'Nando''s Savannah Mall is a branch of the flame-grilled peri-peri chicken chain, inside Savannah Mall, Fauna Park.',
  NULL, NULL,
  '["https://store.nandos.co.za/details/savannah-mall", "https://www.eatout.co.za/venue/nandos-savannah-mall/", "https://za.near-place.com/nandos-savannah-mall-grobler-st-entrance-4-shop-71-savannah-mall-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nandos-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-savannah-mall-fauna-park', 'Ackermans Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop 84 & 85, Savannah Mall, Cnr Thabo Mbeki & Grimm Street, Fauna Park, Polokwane, 0699', '015 296 0070', NULL, NULL,
  'Ackermans Savannah Mall is a branch of the value clothing and footwear retailer, inside Savannah Mall, Fauna Park.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/polokwane/ackermans/savannah-mall-cnr-thabo-mbeki-grimm-str", "https://www.tiendeo.co.za/stores/polokwane/ackermans-savannah-mall-shop/15580", "https://www.ivote.co.za/view/south-africa/ackermans-polokwane-savannah-mall-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'totalsports-savannah-mall-fauna-park', 'Totalsports Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop 45, Savannah Mall, Cnr Grimm & Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '015 296 0201', NULL, NULL,
  'Totalsports Savannah Mall is a branch of the sportswear and sports equipment retailer, inside Savannah Mall, Fauna Park.',
  NULL, NULL,
  '["https://bash.com/store/totalsports-savannah-centre-polokwane-limpopo-0699/060734", "https://www.ivote.co.za/view/south-africa/totalsports-savannah-mall-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'totalsports-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-nc-ngobeni-fauna-park', 'Dr N.C. Ngobeni',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '144 Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '072 224 4774', NULL, NULL,
  'Dr N.C. Ngobeni is a dental practice in Fauna Park, Polokwane.',
  NULL, NULL,
  '["https://www.recomed.co.za/dentist/polokwane/nc-ngobeni/947/848/", "https://docnearby.co.za/practice/ngobeni-n-c-4182/practitioner/28652", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=281408"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-nc-ngobeni-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

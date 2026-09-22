-- Bonteheuwel: general suburb research (job 1), plus a shopping-centre discovery correctly
-- belonging to neighbouring Matroosfontein (job 2), surfaced while researching Bonteheuwel
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'settlers-muslim-butchery-bonteheuwel', 'Settlers Muslim Butchery',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  '3 Neighbourhood Centre, Bonteheuwel Avenue, Bonteheuwel, Cape Town, 7764', '021 694 7161', NULL, NULL,
  'Settlers Muslim Butchery is a halal butchery in Bonteheuwel.',
  NULL, NULL,
  '["https://www.worldofmeats.co.za/view/settlers-muslim-butchery", "https://www.africanadvice.com/1140319/Butcher_Shops/Western_Cape/Settlers_Moslem_Butchery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'settlers-muslim-butchery-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'settlers-gas-and-hardware-bonteheuwel', 'Settlers Gas & Hardware',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  '468 Bonteheuwel Avenue, Bonteheuwel, Cape Town, 7764', '072 618 6000', NULL, NULL,
  'Settlers Gas & Hardware is a gas and hardware store in Bonteheuwel.',
  NULL, NULL,
  '["https://www.facebook.com/SettlersGasHardware/", "https://b2bhint.com/en/company/za/settlers-gas-and-hardware--K2020620138"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'settlers-gas-and-hardware-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'charlesville-mall-matroosfontein', 'Charlesville Mall',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  'Cnr Valhalla Drive & Charles Calvert Road, Charlesville, Matroosfontein, Cape Town, 7490', NULL, NULL,
  '["https://foursquare.com/v/charlesville-mall/4f28037fe4b071524274ea2b", "https://www.facebook.com/p/Charlesville-Mall-100087454503480/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-charlesville-mall-matroosfontein', 'PEP Charlesville Mall',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'charlesville-mall-matroosfontein'),
  'Shop 17, Charlesville Mall, Cnr Valhalla Drive & Charles Calvert Road, Charlesville, Matroosfontein, Cape Town, 7490', '021 927 1134', NULL, NULL,
  'PEP Charlesville Mall is a branch of the national value clothing and homeware retailer, in Charlesville Mall, Matroosfontein.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/guguletu/pep-stores-shop-charville-shopping-centre-cnr-valhalla-drive-charles-calvert-road-matroosfontein-western-cape/11907", "https://south-africa.searchinafrica.com/business/6145071/south-africa/western-cape/bonteheuwel/charlesville/valhalla-dve/departmental-stores/clothing-retailers/pep-stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-charlesville-mall-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-kgadi-mailula-dental-surgery-seshego', 'Dr Kgadi Mailula Dental Surgery',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Shop 17C, Seshego Circle Centre, Ditlou Street, Seshego, Polokwane, 0742', '015 223 6022', NULL, NULL,
  'A dental surgery inside Seshego Circle Centre offering general and cosmetic dentistry, operating since 2016.',
  NULL, NULL,
  '["https://za.near-place.com/dr-kgadi-mailula-dental-surgery-17c-seshego-circle-centre-seshego-b", "https://b2bhint.com/en/company/za/dr-kgadi-mailula-dental-surgery--K2016112177", "https://www.africanadvice.com/1448239/Dental_Practitioners/Limpopo/Dentist_in_Polokwane_(Dr_Kgadi_Mailula_Dental)/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-kgadi-mailula-dental-surgery-seshego'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-seshego-circle-seshego', 'Capitec Bank Seshego Circle',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Shop 15, Erf 8179 Portion 1, Seshego Circle, Ditlou Street, Seshego, Polokwane, 0742', '0860 102 043', NULL, NULL,
  'Capitec Bank is a retail bank branch inside Seshego Circle Centre, offering everyday personal banking and ATM services.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/polokwane/capitec-bank-shop-erf-portion-seshego-circle-berea/63217", "https://vymaps.com/ZA/Capitec-Bank-Polokwane-Seshego-T38543749/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-seshego-circle-seshego'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'khayelitsha-pharmacy-khayelitsha', 'Khayelitsha Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  'Shoprite Khayelitsha, Corner Walter Sisulu and Nomanzo Monge Streets, Khayelitsha, Cape Town',
  '021 361 0159', NULL, 'kpharm@mweb.co.za',
  'Khayelitsha Pharmacy is a retail pharmacy in Khayelitsha, dispensing medicines and health products.',
  NULL, NULL,
  '["https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/pharmacies/Western-Cape.pdf", "https://www.brabys.com/za/western-cape/cape-town/khayelitsha/pharmacies/khayelitsha-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'khayelitsha-pharmacy-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'department-of-coffee-khayelitsha', 'Department of Coffee',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  '158 Ntlazane Street, Khayelitsha, Cape Town',
  '078 086 0093', NULL, NULL,
  'Department of Coffee is a coffee shop in Khayelitsha, known as one of Cape Town''s few township-based coffee houses, located opposite the Khayelitsha train station.',
  NULL, NULL,
  '["https://www.capetownetc.com/food-and-drink/department-of-coffee-cape-towns-only-township-coffee-shop/", "https://www.foodandthefabulous.com/travel/department-of-coffee-doc-khayelitsha/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'department-of-coffee-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

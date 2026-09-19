-- Jobs 1-2: Mowbray suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'webb-and-savoy-pharmacy-mowbray', 'Webb and Savoy Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '34 Main Rd, Mowbray, Cape Town, 7700', '021 689 8923', NULL, NULL,
  'Webb and Savoy Pharmacy is a Local Choice-affiliated independent pharmacy on Main Road in Mowbray, offering dispensing and everyday health services.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Webb-Savoy-Pharmacy-Mowbray-179532265472022/", "https://www.brabys.com/business/4239542/south-africa/western-cape/cape-town/mowbray/main-rd/pharmacies/webb-and-savoy-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'webb-and-savoy-pharmacy-mowbray'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-mowbray-mowbray', 'Capitec Bank Mowbray',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '52 Main Road, Mowbray, Cape Town, 7700', '021 686 0491', NULL, NULL,
  'This Capitec Bank branch on Main Road in Mowbray offers everyday banking services to the local community.',
  NULL, NULL,
  '["https://za.polomap.com/mowbray/3215", "https://www.callupcontact.com/b/Banks/Capitec_Bank_Mowbray/4917"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-mowbray-mowbray'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-mowbray-mowbray', 'Standard Bank Mowbray Service Centre',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '37 Main Road, Mowbray, Cape Town, 7700', '021 401 3396', NULL, NULL,
  'This Standard Bank service centre on Main Road in Mowbray offers everyday banking services to the local community.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/standard-bank-mowbray-in-cape-town", "https://www.callupcontact.com/b/Banks/Standard_Bank_Mowbray/41904"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'standard-bank-mowbray-mowbray'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

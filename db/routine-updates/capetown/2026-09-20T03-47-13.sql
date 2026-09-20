INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bel-kem-pharmacy-belhar', 'Bel-Kem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  'Cnr Barberton Link & Amandel Rd, Belhar, Cape Town, 7493', '021 952 7446', NULL, 'belkem@mweb.co.za',
  'Bel-Kem Pharmacy is an independent pharmacy on the corner of Barberton Link and Amandel Road in Belhar.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=84728", "https://www.callupcontact.com/b/business/BelKem_Pharmacy/61180", "https://www.netpages.co.za/Belhar/Bel-Kem+Pharmacy-283466.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bel-kem-pharmacy-belhar'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'shoprite-wing-bishop-lavis', 'Shoprite Wing Bishop Lavis',
  (SELECT id FROM suburbs WHERE slug = 'bishop-lavis'),
  'Cnr Lawton & Lavis Drives, Bishop Lavis, Cape Town', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/shoprite-wing---bishop-lavis.html", "https://www.facebook.com/Shoprite-Bishop-Lavis-aka-The-Stoep-245238488849298/about"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-bishop-lavis-bishop-lavis', 'Shoprite Bishop Lavis',
  (SELECT id FROM suburbs WHERE slug = 'bishop-lavis'),
  (SELECT id FROM shopping_centers WHERE slug = 'shoprite-wing-bishop-lavis'),
  'Cnr Lawton & Lavis Drives, Bishop Lavis, Cape Town', '021 935 6200', NULL, NULL,
  'Shoprite Bishop Lavis is a supermarket anchoring the small Shoprite Wing shopping centre on the corner of Lawton and Lavis Drives.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Athlone/Shoprite-Bishop-Lavis/store-details/46189", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Bishop_Lavis/4764"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-bishop-lavis-bishop-lavis'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medirite-pharmacy-bishop-lavis-bishop-lavis', 'Medirite Pharmacy Bishop Lavis',
  (SELECT id FROM suburbs WHERE slug = 'bishop-lavis'),
  (SELECT id FROM shopping_centers WHERE slug = 'shoprite-wing-bishop-lavis'),
  'Shoprite Bishop Lavis, Cnr Lawton & Lavis Drives, Bishop Lavis, Cape Town', '021 934 2363', NULL, NULL,
  'Medirite Pharmacy Bishop Lavis operates a pharmacy counter inside the Shoprite Wing shopping centre on the corner of Lawton and Lavis Drives.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=258195", "https://www.wooltruhealthcarefund.co.za/static-assets/siteFiles/whf_network_pharmacy_list_western_cape_dec2025.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medirite-pharmacy-bishop-lavis-bishop-lavis'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

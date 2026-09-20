INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'nyanga-junction-shopping-centre-manenberg', 'Nyanga Junction Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  'Duinefontein Road, Manenberg, Cape Town', NULL, NULL,
  '["https://www.waze.com/live-map/directions/nyanga-junction-duinefontein-rd-m10-manenberg,-cape-town", "https://thecapetownpropertygroup.com/property/nyanga-junction-manenberg-vibrant-retail-office-units-to-let/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-nyanga-junction-manenberg', 'Shoprite Nyanga Junction',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nyanga-junction-shopping-centre-manenberg'),
  'Shop 19, Nyanga Junction Shopping Centre, Duinefontein Road, Manenberg, Cape Town',
  '021 690 2060', NULL, NULL,
  'Shoprite Nyanga Junction is a supermarket in Nyanga Junction Shopping Centre, in Manenberg.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Nyanga/Shoprite-Nyanga-Junction/store-details/39299", "https://mydorpie.com/m/?page=chain_shoprite_nyanga_junction_centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-nyanga-junction-manenberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-nyanga-junction-manenberg', 'PEP Nyanga Junction',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nyanga-junction-shopping-centre-manenberg'),
  'Shop 51-52, Nyanga Junction Shopping Centre, Duinefontein Road, Manenberg, Cape Town',
  '021 691 8331', NULL, NULL,
  'PEP Nyanga Junction is a branch of the PEP clothing and general merchandise chain, in Nyanga Junction Shopping Centre, Manenberg.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--nyanga-junction-shopping-centre-duinefontein-road-manenberg-cape-town-western-cape/12465", "https://www.sayellow.com/view/south-africa/pep-nyanga-junction-shopping-centre-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-nyanga-junction-manenberg'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'macassar-shopping-centre-macassar', 'Macassar Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'Link Avenue, Macassar, 7130', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/macassar-shopping-centre.html", "https://locations.debonairspizza.co.za/restaurants-MacassarShoppingCentre-DebonairsPizzaMacassarCentre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-macassar-macassar', 'Shoprite Macassar',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  (SELECT id FROM shopping_centers WHERE slug = 'macassar-shopping-centre-macassar'),
  'Corner of Hospital and Burg Streets, Macassar Shopping Centre, Macassar, 7130', '021 857 7060', NULL, NULL,
  'Shoprite Macassar is a supermarket anchoring Macassar Shopping Centre at the corner of Hospital and Burg Streets.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Somerset-West/Macassar/Shoprite-Macassar/store-details/48898", "https://mydorpie.com/m/?page=chain_shoprite_macassar_somerset_west"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-macassar-macassar'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-macassar-shopping-centre-macassar', 'PEP Macassar Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  (SELECT id FROM shopping_centers WHERE slug = 'macassar-shopping-centre-macassar'),
  'Shop 14, Macassar Shopping Centre, Corner Burg and Hospital Street, Macassar, 7130', '021 857 2468', NULL, NULL,
  'PEP is a clothing and homeware retailer at Shop 14 in Macassar Shopping Centre.',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/pep-stores_779240+9.html", "https://www.mnelisi.com/Pep/pepstores.php?city=MACASSAR"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-macassar-shopping-centre-macassar'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-macassar', 'Debonairs Pizza',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  (SELECT id FROM shopping_centers WHERE slug = 'macassar-shopping-centre-macassar'),
  'Shop 22, Macassar Shopping Centre, Corner Link and Ring Avenues, Macassar, 7130', '021 857 0096', NULL, NULL,
  'Debonairs Pizza is a pizza restaurant and takeaway at Shop 22 in Macassar Shopping Centre.',
  NULL, NULL,
  '["https://locations.debonairspizza.co.za/restaurants-MacassarShoppingCentre-DebonairsPizzaMacassarCentre", "https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/debonairs-pizza-34ff0f"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-macassar'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

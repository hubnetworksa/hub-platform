INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-furniture-delft-mall-delft', 'OK Furniture',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 25, Delft Mall, Cnr Hindle & Delft Main Rd, Delft, Cape Town', '021 954 9100', NULL, NULL,
  'OK Furniture is a South African furniture, appliance and electronics retailer, with a branch in Delft Mall.',
  NULL, NULL,
  '["https://www.okfurniture.co.za/delft-okf", "https://www.tiendeo.co.za/stores/Delft/ok-furniture-shop-delft-mall-cnr-hindle-delft-main-rd-delft/45020"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-furniture-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-delft-mall-delft', 'Capitec Bank',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 34, Delft Mall, Hindle Rd, Delft, Cape Town, 7100', '0860 102 043', NULL, NULL,
  'Capitec Bank is a South African retail bank, with a branch in Delft Mall.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Capitec-Bank-Delft-Mall-T24061762/", "https://rsa.worldorgs.com/catalog/cape-town/bank/capitec-bank-delft-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sleepmasters-delft-mall-delft', 'Sleepmasters',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 9a, Delft Mall, Cnr Delft Main & Hindle Road, Delft, Cape Town, 7102', '021 330 0102', NULL, NULL,
  'Sleepmasters is a South African bedding and mattress retailer, with a branch in Delft Mall.',
  NULL, NULL,
  '["https://www.sleepmasters.co.za/storelocator/store/index/id/1304", "https://delft-mall.co.za/listing/sleepmasters/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sleepmasters-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-delft-mall-delft', 'Debonairs Pizza',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 1, Delft Mall, Cnr Hindle and Delft Main Roads, Delft, Cape Town', '021 201 1198', NULL, NULL,
  'Debonairs Pizza is a South African pizza takeaway and delivery chain, with a branch in Delft Mall.',
  NULL, NULL,
  '["https://locations.debonairspizza.co.za/restaurants-DelftMall-DebonairsPizzaDelftMall", "https://www.tripadvisor.com.sg/Restaurant_Review-g1722390-d19102143-Reviews-Debonairs_Pizza-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'marhaba-khans-take-aways-delft-mall-delft', 'Marhaba Khan''s Take Aways',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 42A, Delft Mall, Cnr Hindle & Delft Main Rd, Delft, Cape Town', '081 214 9824', NULL, NULL,
  'Marhaba Khan''s Take Aways is a Halaal takeaway, with a branch in Delft Mall.',
  NULL, NULL,
  '["https://www.instagram.com/marhabakhans/", "https://www.facebook.com/100067875111504/about/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marhaba-khans-take-aways-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cell-delft-mall-delft', 'PEP Cell',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 14, Delft Mall, Cnr Hindle & Delft Main Rd, Delft, Cape Town', '021 955 0095', NULL, NULL,
  'PEP Cell is a South African mobile phone and accessories retailer, with a branch in Delft Mall.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-cell-delft-mall-corner-hindle-delft-main-road/71126", "https://www.facebook.com/PEPCellDelftMall/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-cell-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

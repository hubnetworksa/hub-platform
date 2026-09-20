INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'table-bay-mall-bloubergstrand', 'Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  'Cnr West Coast Rd (R27) & Berkshire Blvd, Bloubergstrand, Cape Town, 7441', NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/table-bay-mall/", "https://www.tablebaymall.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-table-bay-mall-bloubergstrand', 'Nedbank Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-bloubergstrand'),
  'Shop G416, Table Bay Mall, Cnr West Coast Rd & Berkshire Blvd, Bloubergstrand, Cape Town', '021 521 1200', NULL, NULL,
  'Nedbank Table Bay Mall is a bank branch of the Nedbank chain inside Table Bay Mall in Bloubergstrand.',
  NULL, NULL,
  '["https://za.readymap.info/4/23824", "https://za.polomap.com/cape-town/29780", "https://tablebaymall.co.za/stores/nedbank"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-table-bay-mall-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-table-view-west-coast-village-bloubergstrand', 'PostNet Table View West Coast Village',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  'Shop 3, West Coast Village, Cnr R27 & Sandown Rd, Bloubergstrand, Cape Town, 7441', '021 554 1015', NULL, NULL,
  'PostNet Table View West Coast Village is a courier, printing and mailbox services branch of the PostNet chain in Bloubergstrand.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/postnet-table-view-west-coast-village-45290", "https://www.postnet.co.za/stores/tableviewwestcoastvillage"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-table-view-west-coast-village-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blouberg-manor-bloubergstrand', 'Blouberg Manor',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  '6 Verkouteren Crescent, Bloubergstrand, Cape Town, 7441', '021 554 3135', NULL, NULL,
  'Blouberg Manor is a boutique guest house in a restored Cape Dutch house near the beach in Bloubergstrand.',
  NULL, NULL,
  '["https://bloubergmanor.co.za/", "https://www.tripadvisor.com/Hotel_Review-g6736900-d651082-Reviews-Blouberg_Manor_Boutique_Hotel-Bloubergstrand_Western_Cape.html", "https://www.lekkeslaap.co.za/accommodation/blouberg-manor"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blouberg-manor-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

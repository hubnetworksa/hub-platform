INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sticky-bbq-observatory', 'Sticky BBQ',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '96 Station Road, Observatory, Cape Town, 7700', '021 447 2316', NULL, NULL,
  'Sticky BBQ is a barbecue and ribs restaurant off Lower Main Road, in Observatory.',
  NULL, NULL,
  '["https://foursquare.com/v/sticky-fingers-bbq/4c0693e48a81c9b673ed2590", "https://www.eatout.co.za/venue/sticky-fingers/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d3601120-Reviews-Sticky_BBQ_Observatory-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sticky-bbq-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kind-regards-observatory', 'Kind Regards',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '86 Station Road, Observatory, Cape Town', '087 378 1012', NULL, NULL,
  'Kind Regards is a restaurant and bar on Station Road mixing Indian and Portuguese-inspired flavours, in Observatory.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Kind-Regards-CPT-664032377393890/", "https://www.facebook.com/p/Kind-Regards-Obz-100086205529254/", "http://www.findglocal.com/ZA/Cape-Town/664023184061476/Kind-Regards-CPT"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kind-regards-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

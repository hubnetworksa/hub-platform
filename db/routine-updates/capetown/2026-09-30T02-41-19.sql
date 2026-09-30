INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'afya-pharmacy-bellville', 'Afya Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  '3 Tygerberg Centre, 16 Voortrekker Road, Bellville, 7530', '021 203 4770', NULL, NULL,
  'Afya Pharmacy is a retail pharmacy on Voortrekker Road, in Bellville.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=359927", "https://mapcarta.com/N4468809317"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'afya-pharmacy-bellville'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'reno-spur-bellville', 'Reno Spur',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  (SELECT id FROM shopping_centers WHERE slug = 'bellville-mall-bellville'),
  'Shop 18, Bellville Mall, Bill Bezuidenhout Avenue, Bellville, 7530', '021 945 3380', NULL, NULL,
  'Reno Spur is a Spur Steak Ranch family restaurant in Bellville Mall, Bellville.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312656-d6674574-Reviews-Reno_Spur_Steak_Ranch-Bellville_Western_Cape.html", "https://www.eatout.co.za/venue/spur-bellville-strand-road/", "https://www.bellvillemall.co.za/a-z-stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'reno-spur-bellville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

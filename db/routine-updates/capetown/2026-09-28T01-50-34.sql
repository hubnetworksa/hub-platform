-- Jobs 1-2: richwood suburb research (Richmond Corner tenant discovery, plus a standalone service business)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pizza-perfect-richwood', 'Pizza Perfect',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 7, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', '021 003 3490', NULL, NULL,
  'Pizza Perfect is a pizza takeaway inside Richmond Corner, Richwood.',
  NULL, NULL,
  '["https://www.facebook.com/PizzaPerfectRichmondCorner/", "https://www.tripadvisor.co.za/Restaurant_Review-g312665-d26732350-Reviews-Pizza_Perfect_Richmond-Milnerton_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pizza-perfect-richwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'calamari-fisheries-richwood', 'Calamari Fisheries',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', '081 793 4787', NULL, NULL,
  'Calamari Fisheries is a fish and chips takeaway inside Richmond Corner, Richwood.',
  NULL, NULL,
  '["https://www.calamarifisheries.co.za/lockdown-menu-stores/richmond", "https://restaurantguru.com/Calamari-Fisheries-Cape-Town-12"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'calamari-fisheries-richwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'famous-kalahari-biltong-richwood', 'Famous Kalahari Biltong',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 29, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', '068 779 7357', NULL, NULL,
  'Famous Kalahari Biltong is a biltong and dried-meat shop inside Richmond Corner, Richwood.',
  NULL, NULL,
  '["https://famouskalaharibiltong.co.za/store-locator/famous-kalahari-biltong-richmond-corner/", "https://www.mrd.com/delivery/store/famous-kalahari-biltong-richmond-corner-milnerton/15980"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'famous-kalahari-biltong-richwood'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'weclean-richwood', 'weClean',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  'Buitengracht Drive, Richwood, Milnerton, Cape Town, 7441', '021 802 6450', NULL, NULL,
  'weClean is a professional home and office cleaning service based in Richwood.',
  NULL, NULL,
  '["https://weclean.co.za/cleaning-services-richwood/", "https://www.cylex.net.za/company/weclean-professional-cleaning-solutions-19102439.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'weclean-richwood'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

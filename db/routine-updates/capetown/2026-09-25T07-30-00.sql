INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-drive-thru-richmond-corner-richwood', 'KFC Drive Thru Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 01, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', '021 524 1548', NULL, NULL,
  'KFC Drive Thru Richmond Corner is a branch of the fried chicken fast-food chain, trading from Richmond Corner, Richwood.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/kfc-richmond-corner-51480", "https://www.tripadvisor.com.sg/Restaurant_Review-g312665-d24175900-Reviews-KFC_Richmond_Corner-Milnerton_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-drive-thru-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vida-e-caffe-richmond-corner-richwood', 'Vida e Caffè Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 39, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', '021 001 2599', NULL, NULL,
  'Vida e Caffè Richmond Corner is a branch of the South African coffee shop chain, trading from Richmond Corner, Richwood.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/vida-e-caffe-richmond-corner-345184", "https://vymaps.com/ZA/vida-e-caffe-102907278187338/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vida-e-caffe-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sorbet-richmond-corner-richwood', 'Sorbet Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 17, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', '021 001 2877', NULL, NULL,
  'Sorbet Richmond Corner is a branch of the beauty salon chain, offering nail, hair and beauty treatments from Richmond Corner, Richwood.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/sorbet-richmond-corner-330977", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1838355"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sorbet-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

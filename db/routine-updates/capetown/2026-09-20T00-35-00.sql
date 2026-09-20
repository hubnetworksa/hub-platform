INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-food-richmond-corner-richwood', 'Woolworths Food Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 05, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441',
  '021 524 2160', NULL, NULL,
  'Woolworths Food Richmond Corner is a Woolworths food store in Richmond Corner shopping centre, Richwood.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/woolworths/richwood-corner-tygerberg-valley-rd-richwood", "https://www.atterbury.co.za/richmond-corner-15/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-food-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-richmond-corner-richwood', 'Spec-Savers Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 15, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441',
  '021 001 7330', NULL, NULL,
  'Spec-Savers Richmond Corner is an optometrist and eyewear store in Richmond Corner shopping centre, Richwood.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/richmond-corner", "https://www.atterbury.co.za/richmond-corner-15/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'richmond-corner-richwood', 'Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  'Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', NULL, NULL,
  '["https://richmondcorner.capetown/", "https://www.atterbury.co.za/richmond-corner-15/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-richmond-corner-richwood', 'Clicks Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 21, Richmond Corner, Plattekloof Rd, Richwood, Milnerton, Cape Town, 7441', '021 524 2190', NULL, NULL,
  'Clicks Richmond Corner is a pharmacy and health, beauty and homeware retailer in Richmond Corner, Richwood.',
  NULL, NULL,
  '["https://clicks.co.za/store/Richmond-Corner/1965", "https://za.africabz.com/western-cape/clicks-pharmacy-richmond-corner-416130"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absolute-pets-richmond-corner-richwood', 'Absolute Pets Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 13, Richmond Corner, Corner Tygerberg Valley & Plattekloof Roads, Richwood, Milnerton, Cape Town, 7441', '067 776 5691', NULL, NULL,
  'Absolute Pets Richmond Corner is a pet-supply store in Richmond Corner, Richwood, part of the national Absolute Pets chain.',
  NULL, NULL,
  '["https://www.rawlovepets.co.za/pages/absolute-pets-richmond-corner", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=417233"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absolute-pets-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-richmond-corner-richwood', 'The Crazy Store Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 27, Richmond Corner, Corner Plattekloof & Tygervalley Centre Service Rd, Richwood, Milnerton, Cape Town, 7441', '087 135 9667', NULL, NULL,
  'The Crazy Store Richmond Corner is a discount variety and homeware store in Richmond Corner, Richwood, part of the national The Crazy Store chain.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1439126240653312/the-crazy-store-richmond-corner/cape-town/retail-stores", "https://www.cylex.net.za/company/the-crazy-store---richmond-corner-23782084.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-richmond-corner-richwood', 'Pick n Pay Richmond Corner',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-corner-richwood'),
  'Shop 23, Richmond Corner, Corner Plattekloof & Tygerberg Valley Roads, Richwood, Milnerton, Cape Town, 7441', '021 285 0267', NULL, NULL,
  'Pick n Pay Richmond Corner is a supermarket in Richmond Corner, Richwood, offering groceries and everyday essentials.',
  NULL, NULL,
  '["https://foursquare.com/v/pick-n-pay-richmond-corner/5f2d53ecf1198f2ea40f3bc0", "https://www.medpages.info/sf/index.php?orgcode=416818&page=organisation"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-richmond-corner-richwood'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

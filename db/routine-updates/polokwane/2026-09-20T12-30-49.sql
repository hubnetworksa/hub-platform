INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-fauna-park-service-centre-fauna-park', 'Standard Bank Fauna Park Service Centre',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop G39, Savannah Mall, Cnr Grimm & Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '015 296 9553', NULL, NULL,
  'Standard Bank Fauna Park Service Centre is a bank branch inside Savannah Mall, Fauna Park.',
  NULL, NULL,
  '["https://za.near-place.com/standard-bank-shop-g39-savannah-mall-thabo-mbeki-st-polokwane", "https://za.polomap.com/polokwane/1300"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-savannah-mall-fauna-park', 'The Crazy Store Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop 62, Savannah Mall, Cnr Grimm & Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '087 135 8877', NULL, NULL,
  'The Crazy Store Savannah Mall is a variety retailer selling books, gifts, home decor and toys inside Savannah Mall, Fauna Park.',
  NULL, NULL,
  '["https://savannahmall.co.za/shop/62/", "https://www.bestdirectory.co.za/crazy-store-polokwane-savannah-mall-gifts-gift-store-retailers-retail-trade-in-faunapark-polokwane-limpopo.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

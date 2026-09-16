INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mugg-bean-savannah-mall-fauna-park', 'Mugg & Bean Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop G7, Savannah Mall, Cnr Thabo Mbeki & Grimm Street, Fauna Park, Polokwane, 0699', '015 296 1585', NULL, NULL,
  'Mugg & Bean Savannah Mall is a cafe-style restaurant inside Savannah Mall, Fauna Park, part of the national Mugg & Bean chain serving coffee, breakfast, brunch and lunch.',
  NULL, NULL,
  '["https://locations.muggandbean.co.za/restaurants-SavannahMall-MuggBeanPolokwane", "https://www.tripadvisor.com/Restaurant_Review-g312624-d5821592-Reviews-or60-Mugg_Bean-Polokwane_Limpopo_Province.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mugg-bean-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-savannah-mall-fauna-park', 'Wimpy Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop 47/48, Savannah Mall, Grimm Street, Fauna Park, Polokwane, 0699', '015 296 1142', NULL, NULL,
  'Wimpy Savannah Mall is a family restaurant inside Savannah Mall, Fauna Park, part of the national Wimpy chain known for all-day breakfasts, burgers and milkshakes.',
  NULL, NULL,
  '["https://location.wimpy.co.za/savannah-centre", "https://crave.co.za/establishment.asp?est=18188"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caffe-rossini-savannah-mall-fauna-park', 'Caffe Rossini Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop 19, Savannah Mall, Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '015 296 1533', NULL, NULL,
  'Caffe Rossini Savannah Mall is an Italian-inspired cafe inside Savannah Mall, Fauna Park, serving breakfasts, paninis, salads and pastas.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/limpopo/caffe-rossini-polokwane/", "https://www.tripadvisor.co.za/Restaurant_Review-g312624-d11768582-Reviews-Caffe_Rossini_s-Polokwane_Limpopo_Province.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caffe-rossini-savannah-mall-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

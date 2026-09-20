INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'khaya-corner-mandela-park', 'Khaya Corner',
  (SELECT id FROM suburbs WHERE slug = 'mandela-park'),
  'Cnr Govan Mbeki & Oscar Mpetha Roads, Mandela Park, Khayelitsha, Cape Town', NULL, NULL,
  '["https://www.atuba.co.za/project/khaya-corner-mall-khayelitsha/", "https://www.aucorproperty.co.za/properties/detail/spar-retail-centre-khayelitsha-cape-town"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mandela-park-spar-mandela-park', 'Mandela Park Spar',
  (SELECT id FROM suburbs WHERE slug = 'mandela-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'khaya-corner-mandela-park'),
  'Cnr Govan Mbeki & Oscar Mpetha Roads, Mandela Park, Khayelitsha, Cape Town', '021 207 1250', NULL, NULL,
  'Mandela Park Spar is a supermarket inside Khaya Corner on Govan Mbeki Road in Mandela Park, Khayelitsha.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/khayelitsha/spar-co-govan-mbeki-oscar-mpetha-roads/74543", "https://www.cylex.net.za/company/spar-mandela-park-23863938.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mandela-park-spar-mandela-park'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

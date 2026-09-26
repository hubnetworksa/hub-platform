INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-mandela-park-mandela-park', 'Tops Mandela Park',
  (SELECT id FROM suburbs WHERE slug = 'mandela-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'khaya-corner-mandela-park'),
  'Khaya Corner, Cnr Govan Mbeki & Oscar Mpetha Roads, Mandela Park, Khayelitsha, Cape Town, 7784', '021 207 1250', NULL, NULL,
  'Tops Mandela Park is a liquor store attached to Mandela Park Spar, in Khaya Corner, Mandela Park, Khayelitsha.',
  NULL, NULL,
  '["https://www.spar.co.za/Home/Store-View/TOPS-Mandela-Park-Western-Cape", "https://mapdoor.com/za/wc/khayelitsha/spar/mandela-park-tops"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-mandela-park-mandela-park'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mdzananda-animal-clinic-mandela-park', 'Mdzananda Animal Clinic',
  (SELECT id FROM suburbs WHERE slug = 'mandela-park'),
  '21297 Govan Mbeki Road, Mandela Park, Khayelitsha, Cape Town, 7784', '021 367 6001', NULL, NULL,
  'Mdzananda Animal Clinic is a veterinary and animal welfare clinic serving Mandela Park, Khayelitsha.',
  NULL, NULL,
  '["https://mdzananda.co.za/contact/", "https://www.africabizinfo.com/ZA/mdzananda-animal-clinic-082-251-0554"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mdzananda-animal-clinic-mandela-park'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

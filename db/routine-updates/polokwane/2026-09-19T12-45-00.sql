INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-jsk-van-heerden-hospark', 'Dr JSK Van Heerden',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  'Room 9, Medical Centre, Burger Street, Hospital Park, Polokwane, 0699', '015 295 9065', NULL, NULL,
  'A gynaecology and obstetrics practice based in Hospital Park, Polokwane.',
  NULL, NULL,
  '["https://www.medicalnetwork.co.za/Profile/36907/Dr-Jacobus-Stephanus-Van-Heerden", "https://www.yep.co.za/biz/store/kamfer-wj-van-heerden-js-drs/440516"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-jsk-van-heerden-hospark'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

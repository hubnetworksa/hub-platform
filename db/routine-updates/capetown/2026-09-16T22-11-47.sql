INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ou-meul-bakery-oranjezicht', 'Ou Meul Bakery',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  'Cnr Montrose & Upper Orange Street, Oranjezicht, Cape Town', '021 001 0671', NULL, NULL,
  'Ou Meul Bakery is a neighbourhood bakery and cafe on the corner of Montrose and Upper Orange Street, in Oranjezicht.',
  NULL, NULL,
  '["https://m.facebook.com/oumeulbakkery/photos/a.778484712162178/5377374945606442/", "https://southafricafirm.com/western-cape/ou-meul-oranjezicht-52067"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ou-meul-bakery-oranjezicht'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'molteno-road-dental-practice-oranjezicht', 'Molteno Road Dental Practice',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  '12 Molteno Road, Oranjezicht, Cape Town', '021 426 4393', NULL, NULL,
  'Molteno Road Dental Practice is a dental practice on Molteno Road, opposite De Waal Park, in Oranjezicht.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/molteno-road-dental-practice-cape-town-116847", "https://dir.alltrack.org/view/169321-8-molteno-road-dental-practice-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'molteno-road-dental-practice-oranjezicht'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

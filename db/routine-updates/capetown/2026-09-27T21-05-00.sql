INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kenridge-centre-kenridge', 'Kenridge Centre',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  'Corner Kenridge Avenue & Mildred Street, Kenridge, Durbanville, Cape Town, 7550',
  NULL, NULL,
  '["https://www.fresha.com/lvp/pure-skin-body-kenridge-mildred-street-cape-town-vv2NWo", "https://dir.alltrack.org/view/541657-1-kenridge-shopping-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pure-skin-and-body-kenridge', 'Pure Skin & Body',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenridge-centre-kenridge'),
  'Shop 2, Kenridge Centre, Cnr Kenridge Avenue & Mildred Street, Kenridge, Durbanville, Cape Town, 7550',
  '021 914 4600', 'https://pureskinandbody.co.za/', NULL,
  'Pure Skin & Body is a beauty and skincare salon in Kenridge Centre, Kenridge.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/pure-skin-body-kenridge-mildred-street-cape-town-vv2NWo", "https://pureskinandbody.co.za/contact.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pure-skin-and-body-kenridge'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-d-bekker-kenridge', 'Dr D Bekker',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenridge-centre-kenridge'),
  '1 Mildred Street, Kenridge, Durbanville, Cape Town, 7550',
  '021 914 1222', NULL, NULL,
  'Dr D Bekker is a dental practice in Kenridge Centre, Kenridge.',
  NULL, NULL,
  '["https://nearbyza.com/place/bekker-d", "https://www.thinklocal.co.za/biz/bekker-d-dr-durbanville", "http://drdebbiebekker.co.za/home/0005-2/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-d-bekker-kenridge'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kenridge-primary-school-kenridge', 'Kenridge Primary School',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  '22 Van Riebeeck Avenue, Durbanville, Cape Town',
  '021 976 3046', 'https://kenridgeprimary.co.za', NULL,
  'Kenridge Primary School is a public primary school in Kenridge, Durbanville.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/kenridge-primary-school/", "https://schoolseek.co.za/school/kenridge-primary-school-101309272/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kenridge-primary-school-kenridge'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

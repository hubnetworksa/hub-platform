-- Jobs 1-2: suburb research -- heathfield, kenwyn, southfield
-- heathfield: no businesses cleared the verification bar this run
-- kenwyn: no businesses cleared the verification bar this run

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-i-bux-southfield', 'Dr I Bux',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  'Unit 3, Glaymont Centre, 161 Victoria Road, Southfield, Cape Town, 7800', '021 705 0677', NULL, NULL,
  'Dr I Bux is a general practice, in Southfield.',
  NULL, NULL,
  '["https://www.recomed.co.za/general-practitioner/cape-town/i-bux/3237/2914/?service=47196", "https://www.medpages.info/sf/index.php?page=person&personcode=9595", "https://www.brabys.com/business/6031918/south-africa/western-cape/cape-town/southfield/victoria-rd/general-practitioners/dr-i-bux"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-i-bux-southfield'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'natural-body-therapy-southfield', 'Natural Body Therapy',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '58 Victoria Road, Southfield, Cape Town, 7880', '081 504 0099', NULL, NULL,
  'Natural Body Therapy is a spa offering massages and body treatments, in Southfield.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/natural-body-therapy-spa-victoria-road-cape-town-loPyPY", "https://www.cylex.net.za/company/natural-body-therapy-spa-23790925.html", "https://www.thespaguide.co.za/listing/cape-town/spa/natural-body-therapy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'natural-body-therapy-southfield'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

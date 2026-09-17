-- Owner-requested: individual doctors at Medpark Family Practice (added in
-- an earlier batch), extracted from https://medpark.co.za/'s own "Doctors
-- at Medpark Family Practice" team section -- the site's only listing of
-- its doctors, taken as the complete team. Each shares the practice's
-- address/phone/site; no separate consulting hours were published per
-- doctor, so hours is left blank (the practice's own listing already
-- carries the shared hours).

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-annchen-gerritsen-polokwane-central', 'Dr Annchen Gerritsen',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '24 Jorissen Street, Polokwane, 0700', '015 297 2180', 'https://medpark.co.za/', 'medpark1@mweb.co.za',
  'Dr Annchen Gerritsen is a doctor at Medpark Family Practice in Polokwane Central, specialising in aesthetic medicine and holding a Diploma in Aesthetic Medicine.',
  NULL, NULL,
  '["https://medpark.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-annchen-gerritsen-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-mark-melville-polokwane-central', 'Dr Mark Melville',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '24 Jorissen Street, Polokwane, 0700', '015 297 2180', 'https://medpark.co.za/', 'medpark1@mweb.co.za',
  'Dr Mark Melville is a doctor at Medpark Family Practice in Polokwane Central, specialising in anaesthetics and holding a postgraduate diploma in Anaesthetics from UNISA.',
  NULL, NULL,
  '["https://medpark.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-mark-melville-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-pieter-vermeulen-polokwane-central', 'Dr Pieter Vermeulen',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '24 Jorissen Street, Polokwane, 0700', '015 297 2180', 'https://medpark.co.za/', 'medpark1@mweb.co.za',
  'Dr Pieter Vermeulen is a doctor at Medpark Family Practice in Polokwane Central, specialising in Attention Deficit Disorder and Hyperactivity.',
  NULL, NULL,
  '["https://medpark.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-pieter-vermeulen-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-veronica-stopforth-polokwane-central', 'Dr Veronica Stopforth',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '24 Jorissen Street, Polokwane, 0700', '015 297 2180', 'https://medpark.co.za/', 'medpark1@mweb.co.za',
  'Dr Veronica Stopforth is a doctor at Medpark Family Practice in Polokwane Central, specialising in Obstetrics and Gynaecology and holding a postgraduate diploma in Obstetrics from Stellenbosch University.',
  NULL, NULL,
  '["https://medpark.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-veronica-stopforth-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-wilhelm-von-ludwig-polokwane-central', 'Dr Wilhelm von Ludwig',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '24 Jorissen Street, Polokwane, 0700', '015 297 2180', 'https://medpark.co.za/', 'medpark1@mweb.co.za',
  'Dr Wilhelm von Ludwig is a doctor at Medpark Family Practice in Polokwane Central, specialising in HIV/TB care and currently pursuing a postgraduate diploma in HIV and TB.',
  NULL, NULL,
  '["https://medpark.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-wilhelm-von-ludwig-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

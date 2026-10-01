INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'emb-makelaars-ta-marianne-makelaars-hospark', 'EMB Makelaars t/a Marianne Makelaars',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '62 Devenish Street, Hospital Park, Polokwane, 0699', '015 297 0442', NULL, NULL,
  'EMB Makelaars t/a Marianne Makelaars is an insurance brokerage on Devenish Street in Hospital Park, offering life, business and medical aid insurance and retirement and estate planning.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/emb-makelaars-in-polokwane", "https://www.yep.co.za/biz/store/iyp/2401167_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'emb-makelaars-ta-marianne-makelaars-hospark'),
  (SELECT id FROM categories WHERE slug = 'insurance'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bosman-attorneys-hospark', 'Bosman Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '37 Voortrekker Street, Hospital Park, Polokwane, 0699', '015 291 3863', 'https://bosmanattorneyssa.co.za/', 'Office@bosmanattorneys.co.za',
  'Bosman Attorneys is a law firm on Voortrekker Street in Hospital Park, practising from its own Polokwane offices.',
  NULL, NULL,
  '["https://bosmanattorneyssa.co.za/", "https://nearfinderza.com/en/business/limpopo/polokwane/attorneys/bosman-attorneys_64418+3.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bosman-attorneys-hospark'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aesthetico-hospark', 'Aesthetico',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '50B Compensatie Street, The Eye Centre, Hospital Park, Polokwane, 0700', '015 291 2404', 'https://aesthetico.co.za/', NULL,
  'Aesthetico is a medical aesthetics clinic at The Eye Centre on Compensatie Street in Hospital Park, offering face, body and wellness treatments.',
  NULL, NULL,
  '["https://aesthetico.co.za/contact-us-2/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=350992"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aesthetico-hospark'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-lr-monare-hospark', 'Dr L.R. Monare',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '56 Compensatie Street, Hospital Park, Polokwane, 0699', '015 291 5704', NULL, NULL,
  'Dr L.R. Monare is a urology practice on Compensatie Street in Hospital Park.',
  NULL, NULL,
  '["https://www.recomed.co.za/urologist/polokwane/lr-monare/2277/2043/", "https://www.mediclinic.co.za/en/corporate/doctors/8/dr-lekohotla-monare.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-lr-monare-hospark'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

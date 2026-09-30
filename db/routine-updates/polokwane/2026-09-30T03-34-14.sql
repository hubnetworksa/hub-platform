INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ehlers-law-inc-bendor', 'Ehlers Law Inc',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Unit 4, ProForum Building, 29 Bendor Drive, Bendor, Polokwane, 0699', '015 880 2338', 'https://www.ehlerslaw.org/', NULL,
  'Ehlers Law Inc is a boutique law firm in Bendor handling corporate, family, labour, divorce, commercial, immigration and conveyancing matters.',
  NULL, NULL,
  '["https://www.ehlerslaw.org/", "https://www.procompare.co.za/providers/ehlers-law-inc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ehlers-law-inc-bendor'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'corrie-nel-kie-attorneys-bendor', 'Corrie Nel & Kie Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '5 Adj Mauritz Dommisie Street, Ismini Office Park, Bendor, Polokwane, 0699', '015 291 4344', 'https://cnilaw.co.za/', NULL,
  'Corrie Nel & Kie Attorneys is a law firm at Ismini Office Park in Bendor, offering commercial and litigation services alongside a dedicated conveyancing practice.',
  NULL, NULL,
  '["https://cnilaw.co.za/contact-us/", "https://www.sayellow.com/view/south-africa/corrie-nel-attorneys-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'corrie-nel-kie-attorneys-bendor'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pj-mathebula-attorneys-bendor', 'PJ Mathebula Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '11 Pierre Street, Bendor Ext 30, Polokwane, 0699', '067 084 1093', NULL, NULL,
  'PJ Mathebula Attorneys is a law firm on Pierre Street in Bendor, practising corporate, family, labour, divorce, commercial and immigration law, plus conveyancing.',
  NULL, NULL,
  '["https://www.procompare.co.za/providers/pj-mathebula-attorneys", "https://www.facebook.com/pjmlaw.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pj-mathebula-attorneys-bendor'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'diamond-inc-attorneys-bendor', 'Diamond Inc Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '2a Pierre Street, Bendor, Polokwane, 0700', '015 296 3966', 'https://www.diamondinc.co.za/', NULL,
  'Diamond Inc Attorneys is a law firm on Pierre Street in Bendor, established in 1976, handling personal injury claims and High Court and Magistrate''s Court litigation alongside corporate and commercial law.',
  NULL, NULL,
  '["https://www.diamondinc.co.za/CONTACT/", "https://www.yep.co.za/biz/store?name=diamond-inc&id=309628"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'diamond-inc-attorneys-bendor'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'prime-spine-chiropractic-bendor', 'Prime Spine',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '101 Genl Maritz Street, Bendor Ext 10, Polokwane, 0699', '015 291 1219', 'https://primespine.co.za/', NULL,
  'Prime Spine is a chiropractic practice in Bendor treating common family ailments, including paediatric chiropractic care.',
  NULL, NULL,
  '["https://primespine.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=person&personcode=263469"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'prime-spine-chiropractic-bendor'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

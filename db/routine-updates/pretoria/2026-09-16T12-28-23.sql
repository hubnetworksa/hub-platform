INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bdj-auditors-incorporated-garsfontein-smallholdings', 'BDJ Auditors Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'garsfontein-smallholdings'),
  '489 Jacqueline Drive, Garsfontein, Pretoria', '012 747 6001', 'https://bdj.co.za/', NULL,
  'BDJ Auditors Incorporated is a firm of registered chartered accountants and auditors, formed in 1995, offering audit, tax, accounting, payroll and estate administration services, in Garsfontein.',
  NULL, NULL,
  '["https://bdj.co.za/", "https://www.brabys.com/za/gauteng/pretoria/garsfontein/accountants-auditors/b-d-j-auditors-incorporated"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bdj-auditors-incorporated-garsfontein-smallholdings'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jones-kie-garsfontein-smallholdings', 'Jones & Kie',
  (SELECT id FROM suburbs WHERE slug = 'garsfontein-smallholdings'),
  '670 Jacqueline Drive, Garsfontein, Pretoria, 0042', '012 998 9902', NULL, NULL,
  'Jones & Kie is a single-practitioner accounting and auditing firm offering bookkeeping, tax advisory and financial statement preparation services, in Garsfontein.',
  NULL, NULL,
  '["https://www.brabys.com/za/gauteng/pretoria/garsfontein/accountants-auditors/jones-kie", "https://www.yep.co.za/biz/store/jones-kie/357623"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jones-kie-garsfontein-smallholdings'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'botha-lovegrove-inc-garsfontein-smallholdings', 'Botha & Lovegrove Inc',
  (SELECT id FROM suburbs WHERE slug = 'garsfontein-smallholdings'),
  '32A Garsfontein Office Park, 645 Jacqueline Drive, Garsfontein, 0081', '012 993 2311', 'http://www.bothaandlovegrove.co.za/', NULL,
  'Botha & Lovegrove Incorporated is a law firm specialising in conveyancing, contracts, commercial law, and deceased estates and estate planning, in Garsfontein.',
  NULL, NULL,
  '["http://www.bothaandlovegrove.co.za/contact.html", "https://www.property24.com/attorneys/botha-and-lovegrove-inc/627"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'botha-lovegrove-inc-garsfontein-smallholdings'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

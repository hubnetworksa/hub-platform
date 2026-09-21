-- Job 1/2: new businesses discovered in Bendor suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'van-der-walt-attorneys-bendor', 'Van Der Walt Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Suite 1, Pro Park 1, 29 Bendor Drive, Bendor, Polokwane, 0699',
  '015 110 0580', NULL, NULL,
  'Van Der Walt Attorneys is a law firm in Bendor providing specialised and professional legal services.',
  NULL, NULL,
  '["https://www.facebook.com/vanderwaltlaw/", "https://www.yellosa.co.za/company/970410/van-der-walt-attorneys", "https://van-der-walt-attornyes.business.site/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'van-der-walt-attorneys-bendor'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tsebang-chartered-accountants-auditors-bendor', 'Tsebang Chartered Accountants & Auditors',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Unit A, Mirome Place, 16 Dimitri Crescent, Bendor, Polokwane, 0699',
  '015 291 1322', 'http://www.tsebang.co.za/', NULL,
  'Tsebang Chartered Accountants & Auditors is an accounting, audit and tax firm in Bendor, led and managed by a black female director who is a qualified chartered accountant and registered auditor.',
  NULL, NULL,
  '["https://www.facebook.com/TsebangInc/", "http://www.tsebang.co.za/", "https://www.sayellow.com/view/south-africa/tsebang-chartered-accountants-and-auditors-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tsebang-chartered-accountants-auditors-bendor'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

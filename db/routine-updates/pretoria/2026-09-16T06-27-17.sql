-- Garsfontein: new shopping centre + 3 new businesses (job 1-2)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'garsfontein-village-shopping-centre-garsfontein', 'Garsfontein Village Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'garsfontein'),
  '473 Serene St, Garsfontein, Pretoria, 0042', NULL, NULL,
  '["https://za.2pos.info/4/14204", "https://za.readymap.info/8/28408"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'go2-accounting-garsfontein', 'Go2 Accounting',
  (SELECT id FROM suburbs WHERE slug = 'garsfontein'),
  'Unit 25, Garsfontein Office Park, 645 Jacqueline Drive, Garsfontein, Pretoria, 0042', '012 755 3954', 'https://go2accounting.co.za/', NULL,
  'Go2 Accounting is a cloud-based accounting, bookkeeping, payroll and tax practice operating from Garsfontein Office Park, Garsfontein.',
  NULL, NULL,
  '["https://garsfonteinofficepark.co.za/business-directory/", "https://www.findmy.co.za/services/business/go2-accounting-pty-ltd/3295"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'go2-accounting-garsfontein'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'annelie-grundlingh-attorneys-garsfontein', 'Annelie Grundlingh Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'garsfontein'),
  'Unit 19, Garsfontein Office Park, 645 Jacqueline Drive, Garsfontein, Pretoria, 0042', '010 109 1112', NULL, NULL,
  'Annelie Grundlingh Attorneys is a law firm operating from Garsfontein Office Park, Garsfontein.',
  NULL, NULL,
  '["https://garsfonteinofficepark.co.za/", "https://showme.co.za/pretoria/business/business-finance/annelie-grundlingh-attorneys/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'annelie-grundlingh-attorneys-garsfontein'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'van-der-walt-attorneys-incorporated-garsfontein', 'Van der Walt Attorneys Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'garsfontein'),
  'Unit 11, Garsfontein Office Park, 645 Jacqueline Drive, Garsfontein, Pretoria, 0042', '012 004 0344', 'https://www.rvdwattorney.co.za/', NULL,
  'Van der Walt Attorneys Incorporated is a law firm operating from Garsfontein Office Park, Garsfontein.',
  NULL, NULL,
  '["https://garsfonteinofficepark.co.za/2024/07/21/van-der-walt-attorneys-incorporated/", "https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=1985"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'van-der-walt-attorneys-incorporated-garsfontein'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

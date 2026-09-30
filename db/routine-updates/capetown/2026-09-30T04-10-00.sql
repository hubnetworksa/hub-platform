INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'visagievos-inc-goodwood', 'VisagieVos Inc',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '181 Vasco Boulevard, Goodwood, Cape Town', '021 591 9221', NULL, NULL,
  'VisagieVos Inc is a firm of attorneys, notaries and conveyancers in Goodwood, Cape Town, in practice for over 40 years.',
  NULL, NULL,
  '["https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=1120", "https://www.southafricanlawyer.co.za/law-firm/visagievos-attorneys/goodwood/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'visagievos-inc-goodwood'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'm-van-der-scholtz-attorneys-goodwood', 'M van der Scholtz Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '51 Hugo Street, Richmond Estate, Goodwood, 7460', '021 592 1930', NULL, NULL,
  'M van der Scholtz Attorneys is a firm of attorneys, notaries and conveyancers in Richmond Estate, Goodwood.',
  NULL, NULL,
  '["https://www.property24.com/attorney-firms/goodwood/western-cape/435", "https://www.southafricanlawyer.co.za/law-firm/m-van-der-scholtz-attorneys/goodwood/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'm-van-der-scholtz-attorneys-goodwood'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'yusria-cornelius-incorporated-goodwood', 'Yusria Cornelius Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '43 Hugo Street, Richmond Estate, Goodwood, 7460', '021 592 4912', NULL, NULL,
  'Yusria Cornelius Incorporated is a firm of attorneys, notaries and conveyancers in Richmond Estate, Goodwood.',
  NULL, NULL,
  '["https://www.southafricanlawyer.co.za/law-firm/yusria-cornelius-incorporated/goodwood/", "https://www.brabys.com/za/western-cape/goodwood/richmond-estate/attorneys/cornelius-incorporated-yusria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'yusria-cornelius-incorporated-goodwood'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'a-h-mckenzie-and-associates-goodwood', 'A H McKenzie & Associates',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '94B Voortrekker Road, Goodwood', '021 592 3796', NULL, NULL,
  'A H McKenzie & Associates is a firm of attorneys in Goodwood, offering services including conveyancing, liquidations, evictions and family law.',
  NULL, NULL,
  '["https://amckenzie.findanattorney.co.za/", "https://www.southafricanlawyer.co.za/law-firms/province/western-cape/area/goodwood/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'a-h-mckenzie-and-associates-goodwood'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

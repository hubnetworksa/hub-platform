-- Jobs 1-2: bendor-park suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-atm-cycad-centre-bendor-park', 'Nedbank ATM Cycad Centre',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'cycad-centre-bendor-park'),
  'Shop 4, Cycad Centre, Cnr Outspan Dr & General Maritz St, Bendor Park, Polokwane, 0699', '0800 555 111', NULL, NULL,
  'Nedbank ATM Cycad Centre is a Nedbank ATM inside Cycad Centre in Bendor Park, alongside the centre''s other banking facilities.',
  NULL, NULL,
  '["https://moolmangroup.co.za/wp-content/uploads/2020/12/MM-CYCAD-CENTRE-FACT-SHEET-April-2021.pdf", "https://getoccupi.com/malls/cycad-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-atm-cycad-centre-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-atm-cycad-centre-bendor-park', 'Standard Bank ATM Cycad Centre',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'cycad-centre-bendor-park'),
  'Shop 11, Cycad Centre, Cnr Outspan Dr & General Maritz St, Bendor Park, Polokwane, 0699', '0860 101 341', NULL, NULL,
  'Standard Bank ATM Cycad Centre is a Standard Bank ATM inside Cycad Centre in Bendor Park, alongside the centre''s other banking facilities.',
  NULL, NULL,
  '["https://moolmangroup.co.za/wp-content/uploads/2020/12/MM-CYCAD-CENTRE-FACT-SHEET-April-2021.pdf", "https://getoccupi.com/malls/cycad-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'standard-bank-atm-cycad-centre-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-dental-studio-bendor-park', 'The Dental Studio',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  '39 Bendor Drive, Bendor Park, Polokwane, 0699', '015 296 4242', 'http://thedentalstudio.co.za/', NULL,
  'The Dental Studio is a dental practice on Bendor Drive offering general and cosmetic dentistry in a modern, comfort-focused setting.',
  NULL, NULL,
  '["http://thedentalstudio.co.za/", "https://www.yep.co.za/biz/store/the-dental-studio/673545"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-dental-studio-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

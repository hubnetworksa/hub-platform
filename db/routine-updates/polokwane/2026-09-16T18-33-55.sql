INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salvus-commercial-insurance-brokers-bendor-park', 'Salvus Commercial Insurance Brokers',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  '16 Dimitri Crescent, Mirome Place, Unit E, Platinum Park, Bendor Park, Polokwane, 0699', '015 590 0244', NULL, NULL,
  'Salvus Commercial Insurance Brokers is a commercial insurance brokerage based in Bendor Park.',
  NULL, NULL,
  '["http://2pos.co.za/94/5712", "https://za.polomap.com/polokwane/14280"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salvus-commercial-insurance-brokers-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'insurance'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dzb-chartered-accountants-bendor-park', 'DZB Chartered Accountants',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  '25 Watermelon Street, Bendor Ext 59, Polokwane, 0699', '015 297 2731', 'https://dzb.co.za', NULL,
  'DZB Chartered Accountants (Diemont, Zimmerman and Bolink) is an auditing and accounting firm on Watermelon Street in Bendor Park, offering audit, tax and estate planning services.',
  NULL, NULL,
  '["https://dzb.co.za/contact-us/", "https://www.polokwane.info/accountants-auditors-and-bookkeepers-in-polokwane/dzb-accountants-in-polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dzb-chartered-accountants-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

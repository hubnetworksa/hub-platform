INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lz-makwela-accountants-polokwane-central', 'LZ Makwela Accountants',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '6 Hans van Rensburg Street, Polokwane Central, Polokwane, 0700', '015 295 3489', 'https://www.lzmakwela.com', 'lzmakwela@telkomsa.net',
  'LZ Makwela Accountants is an accounting firm in Polokwane Central offering accounting, tax and business compliance services to small and medium-sized businesses.',
  NULL, NULL,
  '["https://www.lzmakwela.com/", "https://www.procompare.co.za/providers/lz-makwela-accountants", "https://www.shopshours.co.za/accountants/polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lz-makwela-accountants-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'deon-stuart-electronics-and-installations-rocklands', 'Deon Stuart Electronics and Installations',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  '4 Ventura Street, Rocklands, Mitchells Plain, Cape Town, 7798', '021 391 4067', NULL, NULL,
  'Deon Stuart Electronics and Installations is a security installation business in Rocklands, fitting alarm systems, surveillance cameras, and garage and gate automation.',
  NULL, NULL,
  '["https://cylex.net.za/p?f=deon-stuart-electronics-and-installations&id=19206981", "https://cape-town.infoisinfo.co.za/card/deon-stuart-electronics-and-installation/380198"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'deon-stuart-electronics-and-installations-rocklands'),
  (SELECT id FROM categories WHERE slug = 'fencing-security-installations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cashbuild-baobab-gardens-thornhill-estate', 'Cashbuild Baobab Gardens',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Veldspaat Street, Baobab Gardens, Polokwane, 0787', '015 414 0059', NULL, NULL,
  'Cashbuild Baobab Gardens is a hardware and building materials store in Baobab Gardens, Thornhill Estate, stocking cement, timber, plumbing supplies and tools for contractors, DIYers and homeowners, with free local delivery.',
  NULL, NULL,
  '["https://locations.cashbuild.co.za/Retail-Bendor-CashbuildBaobab", "https://x.com/GelmarOnline/status/1955907269117530477"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cashbuild-baobab-gardens-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

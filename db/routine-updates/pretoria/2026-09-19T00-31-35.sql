INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'toncrete-klerksoord', 'Toncrete',
  (SELECT id FROM suburbs WHERE slug = 'klerksoord'),
  '48 Toermalyn St, Klerksoord AH, Akasia, 0200', '012 880 3896', 'https://toncrete.co.za/', NULL,
  'Toncrete is a ready-mix concrete supplier operating from the Klerksoord Industrial Area in Akasia.',
  NULL, NULL,
  '["https://www.ccbc.co.za/business-directory-2/toncrete-klerksoord", "https://toncrete.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'toncrete-klerksoord'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

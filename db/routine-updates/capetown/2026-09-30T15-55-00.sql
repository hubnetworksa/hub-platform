INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'braudes-pharmacy-athlone', 'Braude''s Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '31 Lawrence Road, Athlone, Cape Town, 7764', '021 696 9820', 'https://www.braudespharmacy.co.za', NULL,
  'Braude''s Pharmacy is a long-standing community pharmacy in Athlone, founded in 1948, offering dispensing, compounding and in-store clinic services.',
  NULL, NULL,
  '["https://www.braudespharmacy.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=84762"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'braudes-pharmacy-athlone'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'anchor-pharmacy-athlone', 'Anchor Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '28 Lawrence Road, Athlone, Cape Town, 7764', '021 696 9722', NULL, NULL,
  'Anchor Pharmacy is a retail pharmacy on Lawrence Road in Athlone.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=88361", "https://www.sayellow.com/view/south-africa/anchor-pharmacy-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'anchor-pharmacy-athlone'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chavda-pharmacy-athlone', 'Chavda Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '4 Pluto Road, Surrey Estate, Athlone, Cape Town, 7764', '021 637 2953', 'https://chavdapharmacy.co.za', NULL,
  'Chavda Pharmacy is a retail pharmacy in the Surrey Estate part of Athlone.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/athlone/pharmacies/chavda-pharmacy", "https://2pos.co.za/2/20116"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chavda-pharmacy-athlone'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

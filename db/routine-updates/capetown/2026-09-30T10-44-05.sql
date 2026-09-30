-- Epping: new business
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'c-pack-corrugated-epping', 'C-Pack Corrugated',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '75 Bofors Circle, Epping Industria 2, Cape Town, 7460', '021 934 4333', NULL, NULL,
  'C-Pack Corrugated manufactures custom and standard-size corrugated cartons, in Epping.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/epping-industria/box-manufacturers/c-pack-corrugated", "https://c-pack.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'c-pack-corrugated-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

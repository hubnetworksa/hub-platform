-- Job 1-2: Westlake suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mantellis-direct-westlake', 'Mantelli''s Direct',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  '9A Bell Crescent, Westlake Business Park, Westlake, Cape Town, 7945', '021 702 6734', NULL, 'westlakedirect@mantellis.com',
  'Mantelli''s Direct is a bakery factory shop outlet selling Mantelli''s baked goods, in Westlake Business Park.',
  NULL, NULL,
  '["https://mantellisdirect.com/stores", "https://www.facebook.com/MantellisDirectWestlake/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mantellis-direct-westlake'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

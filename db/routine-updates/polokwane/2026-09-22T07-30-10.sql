INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'w-h-saffer-superbia', 'W H Saffer',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '40 Nikkel Street, Superbia, Polokwane, 0699', '015 292 8600', NULL, NULL,
  'W H Saffer is a supplier of plumbing and sanitary ware in Superbia, Polokwane, stocking taps, basins, toilets, showers and bathroom fittings.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/wh-saffer-polokwane", "https://www.yep.co.za/biz/store/w-h-saffer/156960"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'w-h-saffer-superbia'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

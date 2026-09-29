INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'royal-auto-body-superbia', 'Royal Auto Body',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '27 Mangaan Street, Superbia, Polokwane, 0699', '015 292 1666', NULL, 'royalab@mweb.co.za',
  'Royal Auto Body is a Mercedes-Benz and Smart factory-approved panel beating and spray painting workshop, in Superbia.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/875814_2", "https://www.brabys.com/za/limpopo/polokwane/superbia/panelbeaters-spraypainters/royal-auto-body"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'royal-auto-body-superbia'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

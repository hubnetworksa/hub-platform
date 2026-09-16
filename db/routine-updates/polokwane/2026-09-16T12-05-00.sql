INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'thomsons-body-107-superbia', 'Thomson''s Body 107',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '26 Mangaan Street, Superbia, Polokwane, 0699', '015 292 0862', 'https://thomsons107.co.za', NULL,
  'Thomson''s Body 107 is a panel beating and spray painting workshop in Superbia, an approved Chery repairer that also handles accident and bodywork repairs for other vehicle makes.',
  NULL, NULL,
  '["https://www.chery.co.za/owners-area/panel-beaters/TSB001", "https://www.brabys.com/za/limpopo/polokwane/superbia/motor-repairs/thomsons-body-107"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'thomsons-body-107-superbia'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

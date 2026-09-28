INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'royal-auto-body-superbia', 'Royal Auto Body',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '27 Mangaan Street, Superbia, Polokwane, 0699', '015 292 1666', 'http://www.royalautobody.co.za', 'royalab@mweb.co.za',
  'Royal Auto Body is a panel beating and spray painting business in Superbia, Polokwane, factory approved by Mercedes-Benz South Africa for Mercedes-Benz and Smart vehicle bodywork.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/superbia/panelbeaters-spraypainters/royal-auto-body", "https://za.africabz.com/limpopo/royal-auto-body-64347"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'royal-auto-body-superbia'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mizpah-motor-trimmers-superbia', 'Mizpah Motor Trimmers',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '3 Nikkel Street, Superbia, Polokwane, 0699', '+27 82 678 5592', 'https://mizpahpolokwane.co.za/', NULL,
  'Mizpah Motor Trimmers is a motor trimming and upholstery business in Superbia, Polokwane, offering vehicle upholstery, re-upholstery and auto valet services, operating for over 26 years.',
  NULL, NULL,
  '["https://mizpahpolokwane.co.za/", "https://www.yellowpages.co.za/business/16744857_3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mizpah-motor-trimmers-superbia'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'battery-networx-futura', 'Battery Networx',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '47 Corundum Street, Futura, Polokwane, 0699', '015 297 5870', NULL, NULL,
  'Battery Networx is a battery specialist in Futura, Polokwane, supplying automotive, leisure and deep-cycle batteries with fitting, charging and free battery/alternator testing services.',
  NULL, NULL,
  '["https://www.facebook.com/p/Battery-Networx-100029381936066/", "https://www.brabys.com/za/limpopo/polokwane/battery-dealers"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'battery-networx-futura'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'plumblink-superbia', 'Plumblink Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '40 Nikkel Street, Superbia, Polokwane, 0699', '015 292 1604', NULL, NULL,
  'Plumblink Polokwane is a branch of the national plumbing and sanitary-ware supplier, stocking plumbing, bathroom and related building materials, in Superbia.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/plumblink-polokwane-in-polokwane", "https://www.tiendeo.co.za/stores/polokwane/plumblink-nikkel-street-superbia/18693"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'plumblink-superbia'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'master-tech-auto-services-superbia', 'Master Tech Auto Services',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '40 Tungsten Street, Superbia, Polokwane, 0700', '015 292 0722', NULL, NULL,
  'Master Tech Auto Services is a vehicle diagnostics and repair workshop in Superbia, Polokwane.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/master-tech-auto-services/233328", "https://www.thinklocal.co.za/biz/master-tech-auto-services-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'master-tech-auto-services-superbia'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

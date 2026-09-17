INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'freshmark-futura', 'Freshmark (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '41 Emerald St, Futura, Polokwane, 0699', '015 293 9900', NULL, NULL,
  'Freshmark is a fresh fruit and vegetable distribution business operating out of Futura, Polokwane.',
  NULL, NULL,
  '["https://dir.alltrack.org/view/395070-4-freshmark-pty.-ltd.", "https://www.thinklocal.co.za/biz/freshmark-polokwane", "https://www.brabys.com/za/limpopo/polokwane/futura/fresh-fruit-vegetables/freshmark-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'freshmark-futura'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crd-glass-aluminium-futura', 'CRD Glass & Aluminium',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '2 Diamant St, Futura, Polokwane, 0699', '015 293 2691', NULL, NULL,
  'CRD Glass & Aluminium fabricates and installs aluminium windows, doors and glass fittings, operating out of Futura, Polokwane.',
  NULL, NULL,
  '["https://www.findmy.co.za/services/business/crd-glass-aluminuim/12767", "https://www.thinklocal.co.za/biz/crd-glass-aluminuim-polokwane", "https://www.brabys.com/za/limpopo/polokwane/futura/glass-aluminium/c-r-d-glass-aluminium"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crd-glass-aluminium-futura'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'northern-auto-panelbeaters-futura', 'Northern Auto Panelbeaters',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '45 Lood St, Futura, Polokwane, 0699', '015 293 0982', NULL, NULL,
  'Northern Auto Panelbeaters is a SAMBRA-approved panel beating and spray painting workshop for auto and commercial vehicle body repairs, in Futura, Polokwane.',
  NULL, NULL,
  '["https://www.looking4spares.co.za/directory/panelbeaters-and-spray-painting-/limpopo/polokwane/northern-auto-panelbeaters-", "https://www.africanadvice.com/1397309/Panel_Beaters_And_Spray_Painters/Limpopo/Northern_Auto_Panelbeaters/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'northern-auto-panelbeaters-futura'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

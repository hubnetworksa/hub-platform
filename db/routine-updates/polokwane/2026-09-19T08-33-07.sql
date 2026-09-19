INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'elda-panelbeaters-ladanna', 'Elda Panelbeaters',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '4 Silver Street, Ladanna, Polokwane, 0699', '015 293 2667', NULL, NULL,
  'Elda Panelbeaters is a panel beating and spray painting workshop in Ladanna, Polokwane.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/panelbeaters-spraypainters/elda-panelbeaters-pty-ltd", "https://www.africanadvice.com/1089976/Panel_Beaters_And_Spray_Painters/Limpopo/Elda_Panelbeaters_(PTY)_Ltd/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'elda-panelbeaters-ladanna'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'meetse-civils-construction-ladanna', 'Meetse Civils & Construction',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '3 Silver Street, Ladanna, Polokwane, 0699', '015 293 1080', NULL, NULL,
  'Meetse Civils & Construction is a civil works and construction contractor based in Ladanna, Polokwane.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/meetse-civils-construction/127806", "https://polokwane.infoisinfo.co.za/card/meetse-civils-construction/294415"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'meetse-civils-construction-ladanna'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

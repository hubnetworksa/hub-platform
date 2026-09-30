INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-atm-ladanna-ladanna', 'Absa ATM Ladanna',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '17 Witklip Street, Ladanna, Polokwane, 0699', '0860 008 600', NULL, NULL,
  'Absa ATM Ladanna is a standalone Absa ATM on Witklip Street, Ladanna, serving the local business district with cash withdrawal services.',
  NULL, NULL,
  '["https://absa.banklocationmaps.com/en/atms/zaf/limpopo/polokwane", "https://tracks4africa.co.za/listings/item/w186663/absa-bank-atm-polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-atm-ladanna-ladanna'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bradburys-auto-body-ladanna', 'Bradbury''s Auto Body',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '82 Silicon Street, Ladanna, Polokwane, 0699', '015 293 2029', NULL, NULL,
  'Bradbury''s Auto Body is an auto body and panel beating workshop in Ladanna, approved by multiple vehicle manufacturers for accident repairs.',
  NULL, NULL,
  '["https://www.chery.co.za/owners-area/panel-beaters/BRY001", "https://www.brabys.com/business/5940800/south-africa/limpopo/polokwane/ladine/silicon-st/panelbeaters-spraypainters/auto-body-repairs/bradburys-auto-body"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bradburys-auto-body-ladanna'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'platinum-auto-panel-beaters-ladanna', 'Platinum Auto Panel Beaters',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '22A Natrium Street, Ladanna, Polokwane, 0699', '064 522 7877', NULL, NULL,
  'Platinum Auto Panel Beaters is a SAMBRA-accredited panel beating and auto body repair shop in Ladanna, offering dent repair, spray painting and towing services.',
  NULL, NULL,
  '["https://www.panelbeatersdirectory.co.za/listing.php?listings_id=2200", "https://sambra.biz/item/platinum-auto-panelbeaters/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'platinum-auto-panel-beaters-ladanna'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'macgyver-commercial-panel-beaters-ladanna', 'Macgyver Commercial Panel Beaters',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '117 Blaauwberg Street, Ladanna, Polokwane, 0699', '015 293 1930', NULL, NULL,
  'Macgyver Commercial Panel Beaters is a panel beating workshop in Ladanna specialising in major structural repairs to accident-damaged vehicles and trucks, approved by multiple vehicle manufacturers and insurers.',
  NULL, NULL,
  '["https://www.macgyvercommercial.co.za/", "https://panelbeatersdirectory.co.za/listing.php?listings_id=272"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'macgyver-commercial-panel-beaters-ladanna'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

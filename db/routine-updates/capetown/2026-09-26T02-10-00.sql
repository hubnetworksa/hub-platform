-- Jobs 1-2: new businesses discovered in Elsie's River
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sa-autoparts-elsies-river', 'SA Autoparts',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '43 Halt Road, Elsies River, Cape Town, 7490', '021 592 1660', 'https://saautoparts.co.za', NULL,
  'SA Autoparts is a motor spares supplier on Halt Road in Elsies River.',
  NULL, NULL,
  '["https://saautoparts.co.za/", "https://www.brabys.com/za/western-cape/cape-town/elsies-river/motor-car-parts/s-a-auto-parts"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sa-autoparts-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'm-l-panelbeaters-elsies-river', 'M&L Panelbeaters',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '1 Sixth Ave, Elsies River, Cape Town, 7490', '021 591 9229', NULL, NULL,
  'M&L Panelbeaters is a panel beating and auto body repair shop on Sixth Avenue in Elsies River.',
  NULL, NULL,
  '["https://panelshop.co.za/listing/m-l-panelbeaters/", "https://www.africanadvice.com/1215212/Panel_Beaters_And_Spray_Painters/Cape_Town/M_And_L_Panelbeaters/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'm-l-panelbeaters-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'central-park-foods-elsies-river', 'Central Park Foods',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '1B Central Park, 112 Epping Ave, Elsies River Estate, Cape Town, 7490', '021 931 8554', NULL, NULL,
  'Central Park Foods is a takeaway food outlet on Epping Avenue in Elsies River.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/elsies-river-estate/takeaway-foods/central-park-foods", "https://south-africa.searchinafrica.com/business/3447948/south-africa/western-cape/cape-town/elsies-river-estate/epping-ave/takeaway-foods/central-park-foods"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'central-park-foods-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'craven-park-pharmacy-elsies-river', 'Craven Park Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '204 Connaught Road, Elsies River, Cape Town', '021 931 2962', 'https://cravenparkpharmacy.co.za', NULL,
  'Craven Park Pharmacy is a pharmacy on Connaught Road in Elsies River.',
  NULL, NULL,
  '["https://cravenparkpharmacy.co.za/", "https://www.thinklocal.co.za/biz/craven-park-pharmacy-elsies-river"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'craven-park-pharmacy-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

-- Ladanna suburb checkpoint

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hadtiit-construction-ladanna', 'Hadtiit Construction',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '66 Railway Street, Ladanna, Polokwane, 0699', '015 293 2317', 'www.hadtiit.co.za', NULL,
  'Hadtiit Construction is a construction and renovations company operating from Railway Street in Ladanna, Polokwane.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/ladanna/renovations/hadtiit-construction", "https://www.thinklocal.co.za/biz/hadtiit-construction-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hadtiit-construction-ladanna'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jumbo-foods-ladanna', 'Jumbo Foods',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '29 Silicon Street, Ladanna, Polokwane, 0700', '015 297 3964', NULL, 'info@jumbofoods.co.za',
  'Jumbo Foods is a cash-and-carry wholesaler on Silicon Street in Ladanna, supplying beverages and groceries to local retailers.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/jumbo-foods-polokwane", "https://www.brabys.com/za/limpopo/polokwane/beverages/jumbo-foods-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jumbo-foods-ladanna'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-crane-hire-ladanna', 'DR Crane Hire',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '72 Platinum Street, Ladanna, Polokwane, 0699', '082 448 7899', 'https://drcranehire.co.za/', NULL,
  'DR Crane Hire provides crane hire, transport and rigging services from Platinum Street in Ladanna, serving construction and industrial sites across Polokwane and the wider Limpopo region.',
  NULL, NULL,
  '["https://drcranehire.co.za/", "http://www.mapknows.co.za/polokwane/dr-manufacturing-3131/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-crane-hire-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, hours, status, origin)
VALUES (
  'leda-platinum-office-ladanna', 'LEDA Platinum Office',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '6 Platinum Street, Ladanna, Polokwane, 0699', '015 287 3000', 'https://www.lieda.co.za/', NULL,
  'LEDA Platinum Office is a Limpopo Economic Development Agency branch in Ladanna, offering economic development, investment and enterprise support services to Polokwane businesses and entrepreneurs.',
  NULL, NULL,
  '["https://www.lieda.co.za/index.php/leda-platinum/", "https://www.yep.co.za/biz/store/iyp/13128642_2"]',
  'Mon-Thu 08:00-16:30, Fri 08:00-16:00',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'leda-platinum-office-ladanna'),
  (SELECT id FROM categories WHERE slug = 'government-municipal-services'),
  1
);

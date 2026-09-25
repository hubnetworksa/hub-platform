INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'busy-corner-butchery-grassy-park', 'Busy Corner Butchery',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  '1 Victoria Road, Grassy Park, Cape Town, 7945', '021 706 2352', NULL, NULL,
  'Busy Corner Butchery is a butchery on Victoria Road in Grassy Park, offering fresh meat and meat products to the local community.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/2584a27893738fc839ddfb16d003e61c/busy-corner-butchery-grassy-park/grassy-park/business-organizations", "https://www.cylex.net.za/company/busy-corner-butchery-grassy-park-23806571.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'busy-corner-butchery-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dilshaad-oosthuizen-physiotherapy-grassy-park', 'Dilshaad Oosthuizen Physiotherapy',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  'Shop 4, Key Shopping Centre, Victoria Road, Grassy Park, Cape Town, 7941', '076 454 2717', NULL, NULL,
  'Dilshaad Oosthuizen Physiotherapy is a physiotherapy practice in Grassy Park offering physiotherapy, acupuncture and dry needling treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/dilshaad-oosthuizen-physiotherapy-victoria-road-cape-town-7r6YwX", "https://www.medpages.info/sf/index.php?page=person&personcode=433483"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dilshaad-oosthuizen-physiotherapy-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'physiotherapists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grassy-park-pharmacy-grassy-park', 'Grassy Park Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  'Shop 2, Nazraf Centre, 71 Victoria Road, Grassy Park, Cape Town, 7941', '021 705 4898', NULL, NULL,
  'Grassy Park Pharmacy is a pharmacy in the Nazraf Centre on Victoria Road, Grassy Park, dispensing medicines and health products to the local community.',
  NULL, NULL,
  '["https://homeappliancerepairs.co.za/17839304734797624282/", "https://www.africanadvice.com/1178212/Pharmacies/Western_Cape/Grassy_Park_Pharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grassy-park-pharmacy-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maggaards-multichem-pharmacy-grassy-park', "Maggaard's Multichem Pharmacy",
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  'Shop 10, Prince Park Centre, Prince George Drive cnr 5th Avenue, Grassy Park, Cape Town', '021 200 6467', NULL, NULL,
  "Maggaard's Multichem Pharmacy is a pharmacy on Prince George Drive in Grassy Park, next to Woolworths, dispensing medicines and health products.",
  NULL, NULL,
  '["https://www.primecure.co.za/provider/maggaards-multichem-pharmacy/", "https://za.africabz.com/western-cape/maggaards-multichem-pharmacy-271630"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'maggaards-multichem-pharmacy-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'avenue-hardware-and-motor-spares-grassy-park', 'Avenue Hardware & Motor Spares',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  '161 5th Avenue, Grassy Park, Cape Town, 7941', '021 706 2992', NULL, NULL,
  'Avenue Hardware & Motor Spares is a hardware and motor spares shop on 5th Avenue in Grassy Park.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/avenue-hardware-motor-spares", "https://www.netpages.co.za/Grassy+Park/Avenue+Hardware+Motor+Spares-85558.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'avenue-hardware-and-motor-spares-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

-- thornhill-estate suburb sweep: Baobab Gardens commercial hub, batch 1 of 6 new businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jaguar-land-rover-polokwane-thornhill-estate', 'Jaguar Land Rover Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  '1 Buffalo Thorn Street, Baobab Gardens, Polokwane, 0699', '015 590 2900', NULL, NULL,
  'Jaguar Land Rover Polokwane is a franchised dealership selling new and pre-owned Jaguar and Land Rover vehicles, with servicing and parts, in the Baobab Gardens motor precinct, Thornhill.',
  NULL, NULL,
  '["https://retailers.landrover.co.za/polokwane-land-rover/service", "https://www.cylex.net.za/company/land-rover-polokwane-23662334.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jaguar-land-rover-polokwane-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gelmar-baobab-thornhill-estate', 'Gelmar Baobab',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Shop LO3, Baobab Gardens, Aloe Vera Street, Polokwane, 0699', '015 590 0050', NULL, NULL,
  'Gelmar Baobab is a home improvement and DIY hardware store in the Baobab Gardens development, Thornhill, part of the national Gelmar chain.',
  NULL, NULL,
  '["https://stores.gelmar.co.za/limpopo/polokwane/baobab-gardens-shop-lo3", "https://x.com/GelmarOnline/status/1955907269117530477"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gelmar-baobab-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'limpopo-toyota-thornhill-estate', 'Limpopo Toyota',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Cnr Munnik & Veldspaat St, Thornhill, Polokwane, 0700', '015 292 9500', NULL, NULL,
  'Limpopo Toyota is a Toyota dealership offering new and used vehicle sales, servicing, parts and finance, on the corner of Munnik and Veldspaat Street, Thornhill.',
  NULL, NULL,
  '["https://www.cars.co.za/groups/CFAO-Mobility/Limpopo-Toyota/2902/", "https://za.africabz.com/limpopo/limpopo-toyota-35420"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'limpopo-toyota-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'italtile-polokwane-thornhill-estate', 'Italtile Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  '7 Marlothii Street, Baobab Gardens, Polokwane, 0699', '015 690 0996', NULL, NULL,
  'Italtile Polokwane is a tile, bathroomware and home-finishes showroom in the Baobab Gardens development, Thornhill.',
  NULL, NULL,
  '["https://opening-hours.co.za/03943988/Italtile_Polokwane", "https://www.tiendeo.co.za/stores/polokwane/italtile-baobab-gardens-development-munnik-avenue-thornhill/74005"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'italtile-polokwane-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ctm-capricorn-thornhill-estate', 'CTM Capricorn',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  '7 Marlothii Street, Baobab Gardens, Polokwane, 0699', '015 590 1641', NULL, NULL,
  'CTM Capricorn is a tile and bathroomware showroom in the Baobab Gardens development, Thornhill, one of several CTM branches serving Polokwane.',
  NULL, NULL,
  '["https://za.polomap.com/polokwane/15115", "https://www.waze.com/live-map/directions/ctm-capricorn-marlothii-st-7-baobab-gardens,-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ctm-capricorn-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hino-limpopo-thornhill-estate', 'Hino Limpopo',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Cnr Munnik & Veldspaat St, Thornhill, Polokwane', '015 297 2003', NULL, NULL,
  'Hino Limpopo is a Hino truck dealership offering new and used truck sales, servicing, parts and finance, on the corner of Munnik and Veldspaat Street, Thornhill.',
  NULL, NULL,
  '["https://www.cfaomobility.co.za/hino/find-a-dealer/limpopo/", "https://rsa.worldorgs.com/catalog/polokwane/truck-dealer/hino-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hino-limpopo-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

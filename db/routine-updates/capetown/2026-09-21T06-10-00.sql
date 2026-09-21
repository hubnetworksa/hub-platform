INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'black-oak-computers-sunnydale', 'Black Oak Computers',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '23 Sunnydale Road, Sunnydale, Cape Town, 7975', '021 785 3965', 'https://blackoakcomputers.co.za', NULL,
  'Black Oak Computers is a family-run computer repair and upgrade business on Sunnydale Road in Sunnydale, Cape Town.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/black-oak-computers", "https://blackoakcomputers.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'black-oak-computers-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sbg-cape-town-sunnydale', 'SBG Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '42 Sunnydale Road, Sunnydale, Cape Town, 7975', '021 785 4216', 'https://sbgcapetown.co.za', 'sbgcapetown@gmail.com',
  'SBG Cape Town is a martial arts gym on Sunnydale Road in Sunnydale, offering Brazilian jiu-jitsu, kickboxing and MMA classes.',
  NULL, NULL,
  '["https://www.southafricabusinessdirectory.co.za/company/1356949990940672/sbg-cape-town/sunnydale/fitness-exercise", "https://sbgcapetown.co.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sbg-cape-town-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chapmans-hardware-sunnydale', 'Chapman''s Hardware',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '1 Irene Way, Sunnydale, Cape Town, 7975', '021 785 1930', 'https://www.chapmanshardware.co.za', NULL,
  'Chapman''s Hardware is an independent, family-run hardware store on Irene Way in Sunnydale, Cape Town.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/chapmans-hardware-45222", "https://2pos.co.za/2/17964", "https://valleycommunity.co.za/businessdirectory/chapmans-hardware/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chapmans-hardware-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harry-goemans-garden-centre-sunnydale', 'Harry Goemans Garden Centre',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '4 Kommetjie Road, Sunnydale, Cape Town, 7975', '021 785 3201', 'https://www.harrygoemans.co.za', 'orders@harrygoemans.co.za',
  'Harry Goemans Garden Centre is a family-run plant nursery on Kommetjie Road in Sunnydale, Cape Town.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/harry-goemans-garden-centre-20163", "https://www.yep.co.za/biz/store/harry-goemans-garden-centre/655517", "https://www.harrygoemans.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harry-goemans-garden-centre-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tears-animal-rescue-sunnydale', 'TEARS Animal Rescue',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '4 Lekkerwater Road, Sunnydale, Cape Town', '021 785 4482', 'https://tears.org.za', 'adoptions@tears.org.za',
  'TEARS Animal Rescue is an animal welfare organisation on Lekkerwater Road in Sunnydale, offering adoptions and animal rescue services.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/tears-16141", "https://tears.org.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tears-animal-rescue-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'westpoint-properties-sunnydale', 'Westpoint Properties',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '1 Carlton Close, Sunnydale, Cape Town, 7975', '021 201 1887', 'https://westpointproperties.co.za', NULL,
  'Westpoint Properties is an estate agency on Carlton Close in Sunnydale, specialising in property sales in the area.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/westpoint-properties", "https://southafricafirm.com/western-cape/westpoint-properties-38335"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'westpoint-properties-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

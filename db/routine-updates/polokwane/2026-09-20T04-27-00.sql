INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'freds-towing-ladanna', "Fred's Towing",
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '63 Platinum Street, Ladanna, Polokwane, 0700', '015 291 1506', 'http://www.fredstowing.co.za', NULL,
  "Fred's Towing is a towing and roadside recovery operator in Ladanna, established in 1998, also offering plant rental.",
  NULL, NULL,
  '["https://za.ypgo.net/FREDS+TOWING+Polokwane,+Limpopo-48778277329", "https://fredstow.com/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'freds-towing-ladanna'),
  (SELECT id FROM categories WHERE slug = 'tow-trucks-roadside'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'piglets-daycare-ladanna', 'Piglets Daycare',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '28a Spoorweg Street, Ladanna, Polokwane', '072 536 3429', NULL, NULL,
  'Piglets Daycare is a creche and pre-primary daycare centre in Ladanna.',
  NULL, NULL,
  '["https://za.ypgo.net/Piglets+Daycare-23136205376", "https://www.yellowpages.co.za/business/16971764_3", "https://www.netpages.co.za/Polokwane/Piglets+Daycare-265799.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'piglets-daycare-ladanna'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brave-group-security-services-ladanna', 'Brave Group Security Services',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '2 Diamant Street, Ladanna, Polokwane', '015 293 1256', 'http://www.bravegroupsecurity.co.za', 'bravegroupsecurity2@telkomsa.net',
  'Brave Group Security Services is an investigation and security services provider based in Ladanna.',
  NULL, NULL,
  '["https://za.ypgo.net/Brave+Group+Security+Services-19431148536", "https://www.netpages.co.za/Polokwane/Brave+Group+Security+Services-227197.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brave-group-security-services-ladanna'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ace-auto-salvage-ladanna', 'Ace Auto Salvage',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '107 Silicone Street, Ladanna, Polokwane', '015 293 0060', 'https://www.aceautosalvage.co.za', NULL,
  'Ace Auto Salvage is a motor salvage dealer in Ladanna, buying and selling accident-damaged, stolen-recovered and repossessed vehicles.',
  NULL, NULL,
  '["https://www.aceautosalvage.co.za/", "https://www.yellowpages.co.za/business/17055638_3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ace-auto-salvage-ladanna'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'firefly-foods-ladanna', 'Firefly Foods',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '83 Pietersburg Street, Ladanna, Polokwane, 0704', '015 293 0364', 'http://www.fireflyfoods.co.za', 'fireflyfoods@gmail.com',
  'Firefly Foods is a meat processor and factory shop in Ladanna selling cold meats, russians, viennas, cheese and other frozen deli products, founded in 2008.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/16534960_2", "http://www.fireflyfoods.co.za/about%20us.htm"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'firefly-foods-ladanna'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

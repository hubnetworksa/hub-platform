INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'algina-wholesale-nursery-firgrove', 'Algina Wholesale Nursery',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'Rustenhof Farm, Firgrove, Cape Town, 7130', '074 618 3901', NULL, NULL,
  'Algina Wholesale Nursery is a wholesale plant nursery on Rustenhof Farm in Firgrove.',
  NULL, NULL,
  '["https://www.facebook.com/AlginaWholesaleNursery/", "https://www.yellowpages.net.za/phone,27-746183901,Wholesale-Plant-Nursery,Cape-Town,ZA33547.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'algina-wholesale-nursery-firgrove'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'firgrove-primary-school-firgrove', 'Firgrove Primary School',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'Seventh Street, Firgrove, 7110', '021 842 3635', NULL, NULL,
  'Firgrove Primary School is a public primary school serving the Firgrove community.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/firgrove-primary-school/", "https://www.school-register.co.za/school/firgrove-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'firgrove-primary-school-firgrove'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rheinmetall-denel-munition-firgrove', 'Rheinmetall Denel Munition',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  '1 Reeb Road, Firgrove, Somerset West, Cape Town, 7130', '021 850 2911', NULL, NULL,
  'Rheinmetall Denel Munition is an explosives and munitions manufacturing plant in Firgrove.',
  NULL, NULL,
  '["https://www.rheinmetall.com/en/company/subsidiaries/rheinmetall-denel-munition", "http://www.denelproperties.co.za/property/Rheinmetall-Denel-Munition/Somerset-West/7"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rheinmetall-denel-munition-firgrove'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

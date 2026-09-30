-- Jobs 1-2: Panorama suburb research -- 2 new businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cuthills-hair-design-panorama', 'Cuthill''s Hair Design',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '80 Panorama Road, Panorama, Cape Town, 7500',
  '021 911 1035', NULL, NULL,
  'Cuthill''s Hair Design is a hair salon on Panorama Road in Panorama, offering cuts, colouring and hair treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/cuthills-hair-design-panorama-road-cape-town-loP9JM", "https://www.facebook.com/Cuthills"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cuthills-hair-design-panorama'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bryan-capes-physiotherapy-panorama', 'Bryan Capes Physiotherapy',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Shop 13, Panorama Healthcare Centre, 60 Hennie Winterbach Street, Panorama, Cape Town, 7500',
  '076 186 9604', 'https://bcphysiotherapy.co.za', NULL,
  'Bryan Capes Physiotherapy is a physiotherapy practice in the Panorama Healthcare Centre, specialising in sports injury, orthopaedic, and back and neck rehabilitation.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/bryan-capes-physiotherapy-marine-drive-cape-town-znJNxn", "https://bcphysiotherapy.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bryan-capes-physiotherapy-panorama'),
  (SELECT id FROM categories WHERE slug = 'physiotherapists'),
  1
);

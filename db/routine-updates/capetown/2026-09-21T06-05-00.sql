INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fourways-veterinary-clinic-sun-valley', 'Fourways Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'sun-valley'),
  '1A Jangada Street, Sun Valley, Cape Town, 7975', '021 785 2251', NULL, NULL,
  'Fourways Veterinary Clinic is a veterinary clinic on Jangada Street in Sun Valley, Cape Town.',
  NULL, NULL,
  '["https://www.infurmation.co.za/vet/fourways-veterinary-clinic/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=196942"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fourways-veterinary-clinic-sun-valley'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dentalwize-sun-valley-sun-valley', 'Dentalwize Sun Valley',
  (SELECT id FROM suburbs WHERE slug = 'sun-valley'),
  '31 Longboat Street, Sun Valley, Cape Town', '021 785 7698', NULL, NULL,
  'Dentalwize Sun Valley is a dental practice on Longboat Street in Sun Valley, Cape Town, part of the Dentalwize group.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/15702443_2", "https://www.cybo.com/ZA-biz/dentalwize-sun-valley"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dentalwize-sun-valley-sun-valley'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

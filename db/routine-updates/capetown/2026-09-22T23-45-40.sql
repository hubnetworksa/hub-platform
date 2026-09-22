INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dc-meat-beacon-valley', 'DC Meat',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  '29452 Bravo Street, Beacon Valley, Mitchells Plain, Cape Town', '021 376 0337', NULL, NULL,
  'DC Meat is a butchery in Beacon Valley, part of a Western Cape butchery chain founded in Paarl in 1996.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/764940/dc-meat-mitchels-plain", "https://www.worldofmeats.co.za/view/dc-meat-mitchels-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dc-meat-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-local-choice-pharmacy-chemcare-beacon-valley', 'The Local Choice Pharmacy - Chemcare Mitchells Plain',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  '39 Korfbal Street, Beacon Valley, Cape Town, 7785', '021 376 5805', NULL, NULL,
  'The Local Choice Pharmacy - Chemcare Mitchells Plain is a retail pharmacy in Beacon Valley.',
  NULL, NULL,
  '["https://za.readymap.info/4/376", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=281240"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-local-choice-pharmacy-chemcare-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

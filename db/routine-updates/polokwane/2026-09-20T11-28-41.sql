INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-mm-pula-inc-bendor', 'Dr MM Pula Inc',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '230 Outspan Drive, Bendor, Polokwane', '015 297 4112', NULL, NULL,
  'Dr MM Pula Inc is a general dental practice in Bendor offering treatments including scaling and polishing, teeth whitening, crowns and bridges.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=person&personcode=101502", "https://www.meditrader.co.za/dr-m-m-pula-dentist-dental-surgeon-polokwane-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-mm-pula-inc-bendor'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alpha-nursery-bendor', 'Alpha Nursery',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Plot 35, De Wet Drive, Bendor, Polokwane, 0699', '015 298 8384', NULL, NULL,
  'Alpha Nursery is a plant nursery and landscaping business in Bendor growing seedlings and offering irrigation, paving, instant lawn and garden services.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/bendor/nursery/alpha-nursery", "https://www.yep.co.za/biz/store/iyp/5035034_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alpha-nursery-bendor'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

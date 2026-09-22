INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'westenburg-library-westenburg', 'Westenburg Library',
  (SELECT id FROM suburbs WHERE slug = 'westenburg'),
  'Community Centre, Buys Avenue, Westenburg, Polokwane', '015 292 2169', NULL, NULL,
  'Westenburg Library is a community public library based at the Westenburg Community Centre on Buys Avenue, open to the public on weekdays.',
  NULL, NULL,
  '["https://www.findmy.co.za/services/business/westenburg-library/11060", "https://www.thinklocal.co.za/biz/westenburg-library-polokwane", "https://www.yep.co.za/biz/store/iyp/17053553_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'westenburg-library-westenburg'),
  (SELECT id FROM categories WHERE slug = 'government-municipal-services'),
  1
);

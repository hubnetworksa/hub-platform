INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alpha-kwekery-bendor', 'Alpha Kwekery',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Plot 35, De Wet Drive, Bendor, Polokwane, 0699', '015 298 8384', NULL, NULL,
  'Alpha Kwekery is a plant nursery on De Wet Drive in Bendor, growing vegetable seedlings including tomatoes, peppers, cabbage, spinach and beetroot.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/alpha-kwekery-polokwane", "https://www.callupcontact.com/b/business/Alpha_Kwekery/62183"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alpha-kwekery-bendor'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'callsave-bendor', 'Callsave',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '29 Bendor Drive, Propark 1, Bendor, Polokwane, 0699', '015 296 3226', NULL, NULL,
  'Callsave is a telecommunications and CCTV company on Bendor Drive, offering VOIP, CCTV, solar and network infrastructure services.',
  NULL, NULL,
  '["https://callsave.co.za/contact-us/", "http://www.mapknows.co.za/polokwane/callsave-15892/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'callsave-bendor'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

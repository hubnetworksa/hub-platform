INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-lotus-gardens-lotus-gardens', 'Shoprite Lotus Gardens',
  (SELECT id FROM suburbs WHERE slug = 'lotus-gardens'),
  '15 Ruth First St, Lotus Gardens, Pretoria, 0008', '012 378 9000', NULL, NULL,
  'Shoprite Lotus Gardens is a supermarket on the corner of Ruth First Street and Joe Modise Road, offering groceries, a bakery and a deli, open Monday to Saturday 07:00 to 19:00 and Sunday 07:00 to 17:00, in Lotus Gardens, Pretoria.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/shoprite-lotus-gardens-21039", "https://www.cybo.com/ZA-biz/shoprite-liquorshop-lotus-gardens", "https://za.africabz.com/gauteng/shoprite-lotus-gardens-62577"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-lotus-gardens-lotus-gardens'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lotus-gardens-clinic-lotus-gardens', 'Lotus Gardens Clinic',
  (SELECT id FROM suburbs WHERE slug = 'lotus-gardens'),
  '131 Bergamot St, Lotus Gardens, Pretoria, 0025', '012 358 2211', NULL, NULL,
  'Lotus Gardens Clinic is a public primary healthcare clinic on Bergamot Street, open Monday to Friday 07:30 to 17:00 and Sunday 08:00 to 17:00, in Lotus Gardens, Pretoria.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/lotus-garden-clinic-pretoria", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=223805", "https://www.waze.com/live-map/directions/lotus-gardens-clinic-bergamot-st-131-lotus-gardens,-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lotus-gardens-clinic-lotus-gardens'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southern-suburbs-pharmacy-claremont', 'Southern Suburbs Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '56 Belvedere Road, Claremont, Cape Town, 7708', '021 671 7100', NULL, NULL,
  'Southern Suburbs Pharmacy is a retail pharmacy on Belvedere Road in Claremont, Cape Town.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/southern-suburbs-pharmacy/97030", "https://za.readymap.info/4/680"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'southern-suburbs-pharmacy-claremont'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'essential-health-pharmacy-claremont', 'Essential Health Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  'Life Kingsbury Hospital, c/o Harfield and Main Road, Claremont, Cape Town, 7708', '021 671 7076', NULL, NULL,
  'Essential Health Pharmacy is a retail pharmacy based at Life Kingsbury Hospital on Main Road in Claremont, Cape Town.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/56225", "https://essentialhealth.co.za/pages/claremont-contact-page"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'essential-health-pharmacy-claremont'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

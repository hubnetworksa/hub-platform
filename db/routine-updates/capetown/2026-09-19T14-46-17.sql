-- Jobs 1-2: kuils-river suburb research
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'zevenwacht-mall-kuils-river', 'Zevenwacht Mall',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Corner Polkadraai & Van Riebeeck Roads, Kuils River, Cape Town, 7579',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/zevenwacht-mall/", "https://zevenwachtmall.co.za/aboutthemall/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fishaways-zevenwacht-mall-kuils-river', 'Fishaways Zevenwacht Mall',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'zevenwacht-mall-kuils-river'),
  'Shop 171, Zevenwacht Mall, Corner Van Riebeeck & Polkadraai Roads, Kuils River, Cape Town, 7579', '021 903 3232', NULL, NULL,
  'Fishaways Zevenwacht Mall is a branch of the Fishaways fish and chips takeaway chain, in the Zevenwacht Mall.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2213035-d17787435-Reviews-Fishaways-Kuils_River_Western_Cape.html", "https://location.fishaways.co.za/zevenwacht-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fishaways-zevenwacht-mall-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-zevenwacht-mall-pharmacy-kuils-river', 'Dis-Chem Zevenwacht Mall Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'zevenwacht-mall-kuils-river'),
  'Shop 44, Zevenwacht Village Centre, Corner Van Riebeeck & Polkadraai Roads, Kuils River, Cape Town, 7580', '021 900 9160', NULL, NULL,
  'Dis-Chem Zevenwacht Mall Pharmacy is a branch of the Dis-Chem pharmacy chain, in the Zevenwacht Mall.',
  NULL, NULL,
  '["https://www.dischem.co.za/zevenwacht-mall-pharmacy", "https://www.tiendeo.co.za/stores/kuils-river/dischem-zevenwacht-village-centre-cnr-van-riebeeck-and-polkadraai-road/45079"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-zevenwacht-mall-pharmacy-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'essential-health-pharmacy-kuils-river', 'Essential Health Pharmacy Kuils River',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '80 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 903 5114', 'https://essentialhealth.co.za/pages/kuils-river-contact-page', NULL,
  'Essential Health Pharmacy Kuils River is an independent pharmacy on Van Riebeeck Road, part of the Essential Health Pharmacy Group.',
  NULL, NULL,
  '["https://essentialhealth.co.za/pages/kuils-river-contact-page", "https://www.cylex.net.za/company/essential-health-pharmacy---kuilsrivier-23811046.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'essential-health-pharmacy-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

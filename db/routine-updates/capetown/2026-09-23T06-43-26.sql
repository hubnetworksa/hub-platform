-- Job 1/2: lotus-river suburb research, 4 new businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'noormed-pharmacy-lotus-river', 'Noormed Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'lotus-river'),
  'Cnr Klip & Zeekoevlei Roads, Lotus River, Cape Town, 7805', '021 705 5278', NULL, NULL,
  'Noormed Pharmacy is a retail pharmacy at the corner of Klip and Zeekoevlei Roads, in Lotus River.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/grassy-park/lotus-river/pharmacies/noormed-pharmacy", "https://www.searchinafrica.com/business/3441998/south-africa/western-cape/grassy-park/lotus-river/zeekoevlei-rd/pharmacies/noormed-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'noormed-pharmacy-lotus-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lotus-river-community-health-centre-lotus-river', 'Lotus River Community Health Centre',
  (SELECT id FROM suburbs WHERE slug = 'lotus-river'),
  'Cnr Delia & Anita Roads, Lotus River, Cape Town, 7805', '021 703 3131', NULL, NULL,
  'Lotus River Community Health Centre is a City of Cape Town public healthcare clinic offering women''s health, chronic care, HIV/TB treatment, and baby and children''s clinic services, in Lotus River.',
  NULL, NULL,
  '["https://2pos.co.za/2/11088", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=94766"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lotus-river-community-health-centre-lotus-river'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lotus-river-primary-school-lotus-river', 'Lotus River Primary School',
  (SELECT id FROM suburbs WHERE slug = 'lotus-river'),
  'Cnr Lake Road & 5th Avenue, Lotus River, Cape Town, 7945', '021 706 3746', NULL, NULL,
  'Lotus River Primary School is a public primary school at the corner of Lake Road and 5th Avenue, in Lotus River.',
  NULL, NULL,
  '["https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/lotus-river-primary-school", "https://www.findmy.co.za/services/business/lotus-river-primary-school/8343"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lotus-river-primary-school-lotus-river'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zeekoevlei-high-school-lotus-river', 'Zeekoevlei High School',
  (SELECT id FROM suburbs WHERE slug = 'lotus-river'),
  '370 7th Avenue, Lotus River, Cape Town, 7945', '021 703 3797', NULL, NULL,
  'Zeekoevlei High School is a public secondary school on 7th Avenue, in Lotus River.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Public_High_Secondary_Schools/ZEEKOEVLEI_SEC/8093", "https://schoolsdigest.co.za/listings/zeekoevlei-secondary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zeekoevlei-high-school-lotus-river'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

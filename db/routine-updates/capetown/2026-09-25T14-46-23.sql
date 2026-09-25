INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mzamomhle-clinic-browns-farm', 'Mzamomhle Clinic',
  (SELECT id FROM suburbs WHERE slug = 'browns-farm'),
  'Sagwityi Road, Browns Farm, Philippi, Cape Town', '021 444 6096', NULL, NULL,
  'Mzamomhle Clinic is a City of Cape Town public primary healthcare clinic serving the Browns Farm community in Philippi.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/Mzamomhle%20Clinic", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=113301"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mzamomhle-clinic-browns-farm'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'inzame-zabantu-community-health-clinic-browns-farm', 'Inzame-Zabantu Community Health Clinic',
  (SELECT id FROM suburbs WHERE slug = 'browns-farm'),
  'Erf 2495 Msingizane Street, Browns Farm, Philippi, Cape Town, 7750', '021 374 6063', NULL, NULL,
  'Inzame-Zabantu Community Health Clinic is a public primary healthcare clinic in Browns Farm, Philippi, offering free curative, preventative and promotive care to the local community.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/facility/inzame-zabantu-community-health-clinic", "https://www.thinklocal.co.za/biz/inzame-zabantu-community-health-clinic-philippi"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'inzame-zabantu-community-health-clinic-browns-farm'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

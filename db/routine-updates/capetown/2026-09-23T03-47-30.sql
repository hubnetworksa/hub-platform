-- Jobs 1-2: suburb research for crossroads, de-oude-weg, eastridge
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mitchells-plain-community-health-centre-eastridge', 'Mitchells Plain Community Health Centre',
  (SELECT id FROM suburbs WHERE slug = 'eastridge'),
  '1st Avenue, Eastridge, Mitchells Plain, Cape Town, 7785', '021 392 5161', NULL, NULL,
  'Mitchells Plain Community Health Centre is a public primary healthcare facility in Eastridge, offering general clinic, maternity and pharmacy services to the surrounding community.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/health-wellness/facility/mitchells-plain-chc", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=94792"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mitchells-plain-community-health-centre-eastridge'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

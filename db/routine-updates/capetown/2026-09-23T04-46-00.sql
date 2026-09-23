INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'heideveld-community-day-centre-heideveld', 'Heideveld Community Day Centre', (SELECT id FROM suburbs WHERE slug = 'heideveld'),
  'Heideveld Road, Heideveld, Cape Town, 7764', '021 637 8036', NULL, NULL,
  'Heideveld Community Day Centre is a public primary healthcare facility in Heideveld, providing free clinical services to the surrounding community.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/health-wellness/facility/heideveld-cdc", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=111054"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'heideveld-community-day-centre-heideveld'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

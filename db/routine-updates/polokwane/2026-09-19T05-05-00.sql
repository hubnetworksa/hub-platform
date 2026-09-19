-- Lebowakgomo: 3 new schools verified with 2+ independent sources each
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-dixon-mphahlele-primary-school-lebowakgomo', 'Dr. Dixon Mphahlele Primary School',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Ngwato St, Lebowakgomo, 0737', '015 633 5144', NULL, NULL,
  'Dr. Dixon Mphahlele Primary School is a public primary school in Lebowakgomo.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/15780e69e63d86b3cb17680ef25cb913/dr-dixon-mphahlele-primary-school/lebowakgomo/general-education", "https://www.school-register.co.za/school/dr-dixon-mphahlele/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-dixon-mphahlele-primary-school-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sj-van-der-merwe-technical-high-school-lebowakgomo', 'SJ van der Merwe Technical High School',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  '11 Stand, Zone P, Lebowakgomo, 0737', '015 633 5411', NULL, NULL,
  'SJ van der Merwe Technical High School is a public technical high school in Zone P, Lebowakgomo.',
  NULL, NULL,
  '["https://sjvandermerwehigh.co.za/contact", "https://www.callupcontact.com/b/Public_High_Secondary_Schools/SJ_Van_Der_Merwe_Technical_High_School/21102"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sj-van-der-merwe-technical-high-school-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pepps-ga-ledwaba-primary-school-lebowakgomo', 'PEPPS Ga-Ledwaba Primary School',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'KS Voorspoed Farm 458, Lebowakgomo, 0727', '015 495 0770', NULL, NULL,
  'PEPPS Ga-Ledwaba Primary School is a private primary school on Voorspoed Farm, Lebowakgomo.',
  NULL, NULL,
  '["https://pepps.co.za/contact-us/", "https://homeappliancerepairs.co.za/5424222591238691960/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pepps-ga-ledwaba-primary-school-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'webtank-solutions-heatherdale', 'Webtank Solutions',
  (SELECT id FROM suburbs WHERE slug = 'heatherdale'),
  '14 Sylvia St, Heatherdale AH, Pretoria, 0182', '065 965 7790', 'https://webtank.co.za', NULL,
  'Webtank Solutions is an IT services provider in Heatherdale offering website design and hosting, branding, domain registration and email/device setup.',
  NULL, NULL,
  '["https://webtank.co.za/", "https://rsa.worldorgs.com/catalog/pretoria/software-company/webtank-soltuions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'webtank-solutions-heatherdale'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'one-stop-animal-rescue-heatherdale', 'One Stop Animal Rescue',
  (SELECT id FROM suburbs WHERE slug = 'heatherdale'),
  'Plot 42b 1st Ave, Heatherdale AH, Pretoria, 0182', '076 207 3640', NULL, NULL,
  'One Stop Animal Rescue is an animal rescue and rehoming organisation based in Heatherdale.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/one-stop-animal-rescue-r-84272", "https://rsa.worldorgs.com/catalog/pretoria/animal-rescue-service/one-stop-animal-rescue-r"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'one-stop-animal-rescue-heatherdale'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'heatherdale-veterinary-clinic-heatherdale', 'Heatherdale Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'heatherdale'),
  'Plot 32, Rose Street, Heatherdale, Akasia, 0182', '012 527 0653', NULL, NULL,
  'Heatherdale Veterinary Clinic is a veterinary practice in Heatherdale, Akasia, offering general consultations.',
  NULL, NULL,
  '["https://savet.co.za/vet/heatherdale-veterinary-clinic", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=237206"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'heatherdale-veterinary-clinic-heatherdale'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

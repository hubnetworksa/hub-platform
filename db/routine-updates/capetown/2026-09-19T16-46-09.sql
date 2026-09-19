INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kenridge-pre-primary-school-kenridge', 'Kenridge Pre-Primary School',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  'Van Riebeeck Avenue, Kenridge, Durbanville, Cape Town', '021 975 1163', 'https://kenridgepreprimary.co.za', NULL,
  'Kenridge Pre-Primary School is a dual-medium pre-primary school for Pre-Grade R and Grade R learners, in Kenridge.',
  NULL, NULL,
  '["https://kenridgepreprimary.co.za/contact-us/", "https://schoolsdigest.co.za/listings/kenridge-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kenridge-pre-primary-school-kenridge'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kleuterbos-speelskool-kenridge', 'Kleuterbos Speelskool',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  '26 Soshanna Road, Kenridge, Cape Town, 7550', '076 374 3922', 'https://kleuterbos.business.site/', NULL,
  'Kleuterbos Speelskool is a nursery school and playschool in Kenridge.',
  NULL, NULL,
  '["https://www.activeactivities.co.za/directory/kleuterbos-speelskool-170596.html", "https://rsa.worldorgs.com/catalog/cape-town/nursery-school/kleuterbos-speelskool"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kleuterbos-speelskool-kenridge'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-tommie-truter-dentistry-kenridge', 'Dr Tommie Truter Dentistry',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  '3 Kenridge Business Centre, Door de Kraal Avenue, Kenridge, Durbanville', '021 914 1244', 'https://kenridgedentist.co.za', NULL,
  'Dr Tommie Truter Dentistry is a general dental practice in Kenridge Business Centre, Kenridge.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=171402", "https://www.facebook.com/p/Dr-Tommie-Truter-Dentistry-100066506444766/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-tommie-truter-dentistry-kenridge'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

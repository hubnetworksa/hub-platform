INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'durbanville-animal-hospital-durbanville', 'Durbanville Animal Hospital',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '4 De Villiers Drive, Valmary Park, Durbanville, 7550', '021 976 3031', NULL, 'info@durbanvillevet.co.za',
  'Durbanville Animal Hospital is a veterinary hospital registered with SAVA, in Valmary Park, Durbanville.',
  NULL, NULL,
  '["https://www.sava.co.za/faq/durbanville-animal-hospital-sa/", "https://topvet.net/practices/south-africa/western-cape/cape-town/durbanville-animal-hospital-26538"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'durbanville-animal-hospital-durbanville'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'goedemoed-animal-hospital-durbanville', 'Goedemoed Animal Hospital',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '7/11 Centre Lubbe Road, Durbanville, 7550', '021 975 6385', 'https://goedemoedvet.co.za', 'info@goedemoedvet.co.za',
  'Goedemoed Animal Hospital is a veterinary hospital offering laboratory diagnostics, ultrasound, medicine and surgery, in Durbanville. It opened in 1998.',
  NULL, NULL,
  '["https://goedemoedvet.co.za/", "https://savet.co.za/vet/goedemoed-animal-hospital"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'goedemoed-animal-hospital-durbanville'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

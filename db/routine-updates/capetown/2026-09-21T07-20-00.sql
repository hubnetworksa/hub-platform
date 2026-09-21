INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'essential-health-pharmacy-strand-strand', 'Essential Health Pharmacy - Strand',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  '90 Beach Road, Strand, 7140', '021 854 3603', NULL, NULL,
  'Essential Health Pharmacy - Strand is a pharmacy on Beach Road in Strand.',
  NULL, NULL,
  '["https://essentialhealth.co.za/pages/strand-contact-page", "https://www.thinklocal.co.za/biz/essential-health-pharmacy-strand-strand"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'essential-health-pharmacy-strand-strand'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'goldfish-cafe-and-eatery-strand', 'Goldfish Cafe & Eatery',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  '90 Beach Road, Strand, 7140', '021 300 5368', NULL, NULL,
  'Goldfish Cafe & Eatery is a restaurant and takeaway on Beach Road in Strand.',
  NULL, NULL,
  '["https://www.facebook.com/TheGoldfishEatery/", "https://www.tripadvisor.com/Restaurant_Review-g1236998-d17599385-Reviews-Goldfish_Eatery-Strand_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'goldfish-cafe-and-eatery-strand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'south-end-hardware-and-gas-strand', 'South End Hardware & Gas',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  'Shop 50, Lower Gordon''s Bay Road, Strand, 7140', '021 853 0479', NULL, NULL,
  'South End Hardware & Gas is a hardware store on Lower Gordon''s Bay Road in Strand, also supplying gas.',
  NULL, NULL,
  '["https://southendhardware.co.za/elements/pages/contact/", "https://za.africabz.com/western-cape/south-end-store-hardware-181610"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'south-end-hardware-and-gas-strand'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

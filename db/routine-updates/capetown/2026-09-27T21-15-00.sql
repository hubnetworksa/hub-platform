INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stellenberg-high-school-stellenberg', 'Stellenberg High School',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  '118 Panorama Drive, Bellville, Cape Town, 7550',
  '021 919 1029', 'https://stellenberg.org.za', NULL,
  'Stellenberg High School is a public high school in Stellenberg, Bellville.',
  NULL, NULL,
  '["https://stellenberg.org.za/contact-us/", "https://en.wikipedia.org/wiki/Stellenberg_High_School"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stellenberg-high-school-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bornman-and-hayward-attorneys-stellenberg', 'Bornman & Hayward Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  'Suite 1, 2 Reiger Road, Stellenberg, Bellville, Cape Town',
  '021 943 1600', 'https://borhay.co.za', NULL,
  'Bornman & Hayward Attorneys is a law firm in Stellenberg, Bellville, offering conveyancing and litigation services.',
  NULL, NULL,
  '["https://borhay.co.za/contact-us/", "https://www.brabys.com/za/western-cape/bellville/stellenberg/attorneys/bornman-hayward-attorneys"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bornman-and-hayward-attorneys-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

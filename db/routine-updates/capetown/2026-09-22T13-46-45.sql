INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'college-of-cape-town-thornton-campus-thornton', 'College of Cape Town - Thornton Campus',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  'Cnr Poplar & Cedar Avenue, Thornton, Cape Town, 7460', '021 531 9124', NULL, NULL,
  'College of Cape Town''s Thornton Campus is a technical and vocational college on the corner of Poplar and Cedar Avenue in Thornton, specialising in civil and mechanical engineering.',
  NULL, NULL,
  '["https://www.cct.edu.za/index.php/en/campuses/thornton-main", "https://mabumbe.com/sw/college-of-cape-town-thornton-campus/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'college-of-cape-town-thornton-campus-thornton'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'senior-flexonics-cape-town-thornton', 'Senior Flexonics Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  '11 Thor Circle, Viking Place, Thornton, Cape Town, 7460', '021 532 5300', NULL, NULL,
  'Senior Flexonics Cape Town is a manufacturer of flexible metal hoses and bellows on Thor Circle in Thornton.',
  NULL, NULL,
  '["https://flexonics.co.za/contact-2/", "https://panjiva.com/Senior-Flexonics/5226202"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'senior-flexonics-cape-town-thornton'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-clothing-bank-thornton', 'The Clothing Bank',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  '33 Thor Circle, Viking Place, Thornton, Cape Town, 7460', '021 531 2134', NULL, NULL,
  'The Clothing Bank is a skills-training and clothing manufacturing organisation on Thor Circle in Thornton.',
  NULL, NULL,
  '["https://www.tcb.org.za/contact-us/", "https://www.devex.com/organizations/the-clothing-bank-168282"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-clothing-bank-thornton'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

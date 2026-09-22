INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-building-centre-ysterplaat', 'The Building Centre',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  '7 Platinum Drive, Northgate Estate, Ysterplaat, Cape Town, 7405', '021 510 4000', NULL, NULL,
  'The Building Centre is a building materials and home-improvement exhibition centre in Northgate Estate, Ysterplaat.',
  NULL, NULL,
  '["https://northgateestate.co.za/the-building-centre/", "https://www.thebuildingcentre.co.za/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-building-centre-ysterplaat'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'arora-lights-ysterplaat', 'Arora Lights',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  'Unit 1, 56 Gold Street, Northgate Estate, Ysterplaat, Cape Town, 7405', '021 511 0170', NULL, NULL,
  'Arora Lights is a lighting and home goods store in Northgate Estate, Ysterplaat.',
  NULL, NULL,
  '["https://northgateestate.co.za/arora-lights/", "https://aroralights.co.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'arora-lights-ysterplaat'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-space-interiors-ysterplaat', 'Cape Space Interiors',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  '7 Platinum Street, Northgate Estate, Ysterplaat, Cape Town, 7405', '021 511 0165', NULL, NULL,
  'Cape Space Interiors is a furniture and curtaining business in Northgate Estate, Ysterplaat.',
  NULL, NULL,
  '["https://northgateestate.co.za/cape-space-interiors/", "https://www.thebuildingcentre.co.za/exhibitor-profile/cape-space-interiors"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-space-interiors-ysterplaat'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

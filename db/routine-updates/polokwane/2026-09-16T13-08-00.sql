-- Fencing & Security Installations: 2 verified businesses. Iskhondo
-- Electric Fencing was researched but discarded: two sources gave two
-- completely different addresses (Plot 51 Kerk Drive, Polokwane Central
-- vs 76 Oliver Tambo Drive, Seshego B) with no tiebreaker -- same
-- unreliable-directory-data pattern as OT Rubble Removal earlier.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stafix-electric-fence-security-nirvana', 'STAFIX Electric Fence & Security',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '9A Suez Street, Nirvana, 0699', '015 292 6273', NULL, NULL,
  'An electric fence and security installation company on Suez Street in Nirvana, the Southern African distributor of the STAFIX and JVA fence energizer ranges.',
  NULL, NULL,
  '["https://za.polomap.com/polokwane/2965", "https://www.stafix.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stafix-electric-fence-security-nirvana'),
  (SELECT id FROM categories WHERE slug = 'fencing-security-installations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bhlj-steel-services-ladine', 'BHL&J Steel Services',
  (SELECT id FROM suburbs WHERE slug = 'ladine'),
  '14 Natrium Street, Ladine, 0699', '082 418 1246', NULL, NULL,
  'A palisade fencing manufacturer and installer on Natrium Street in Ladine, family owned since 1990.',
  NULL, NULL,
  '["https://www.bhl-j.co.za/contact/", "https://www.snupit.co.za/polokwane/ladine/bhl-_and_-j-steel-services-pty-ltd/372295"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bhlj-steel-services-ladine'),
  (SELECT id FROM categories WHERE slug = 'fencing-security-installations'),
  1
);

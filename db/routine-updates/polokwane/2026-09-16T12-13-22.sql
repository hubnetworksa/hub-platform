-- Rubbish & Rubble Removal: The Red Bin (Ladine). Found during initial
-- research (their own site, theredbin.co.za) but held back at the time
-- since Ladine wasn't a seeded suburb -- phone/address independently
-- reconfirmed by the site owner, and the new Ladine suburb is added in
-- 0034_seed_ladine_suburb.sql alongside this file.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-red-bin-ladine', 'The Red Bin',
  (SELECT id FROM suburbs WHERE slug = 'ladine'),
  '124 Blaauwberg Street, Ladine, Polokwane, 0699', '073 189 1014', NULL, NULL,
  'The Red Bin offers residential, commercial, industrial and construction rubble and waste removal services, including skip bin rental, from Ladine.',
  NULL, NULL,
  '["https://theredbin.co.za/", "owner-provided-contact-details"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-red-bin-ladine'),
  (SELECT id FROM categories WHERE slug = 'rubbish-rubble-removal'),
  1
);

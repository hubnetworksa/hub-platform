INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'quest-staffing-solutions-bendor', 'Quest Staffing Solutions',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Ismini Office Park, 1 Nicosia Street, Bendor, Polokwane, 0699', '015 291 1794', 'https://www.queststaffing.net', 'info@quest.co.za',
  'Quest Staffing Solutions is a recruitment and staffing agency based in Ismini Office Park, Bendor, placing temporary and permanent workers with local employers.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/recruitment-agencies/quest-staffing-solutions", "https://www.queststaffing.net/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'quest-staffing-solutions-bendor'),
  (SELECT id FROM categories WHERE slug = 'recruitment-hr-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rakoma-travel-bendor', 'Rakoma Travel',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Rhodesdrift Office Park, Building One, 23 Rhodesdrift Street, Bendor, Polokwane, 0699', '015 296 0122', 'https://rakomatravel.co.za', NULL,
  'Rakoma Travel is a travel agency in Rhodesdrift Office Park, Bendor, arranging flights, accommodation and travel bookings.',
  NULL, NULL,
  '["https://rakomatravel.co.za/contact/", "http://za.near-place.com/rakoma-travel-polokwane-rhodesdrift-office-park-building-one-23-rhodesdrift-street-bendor-drive-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rakoma-travel-bendor'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

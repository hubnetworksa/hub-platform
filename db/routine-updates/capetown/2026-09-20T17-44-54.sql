INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blouberg-manor-bloubergstrand', 'Blouberg Manor',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  '6 Verkouteren Crescent, Bloubergstrand, Cape Town, 7441', '021 554 3135', NULL, NULL,
  'Blouberg Manor is a restored Cape Dutch guesthouse on the Bloubergstrand beachfront, offering individually styled suites.',
  NULL, NULL,
  '["https://bloubergmanor.co.za/", "https://www.lekkeslaap.co.za/accommodation/blouberg-manor"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blouberg-manor-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'secret-garden-guesthouse-bloubergstrand', 'Secret Garden Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  '33 Gull Road, Bloubergstrand, Cape Town, 7441', '083 230 7391', NULL, NULL,
  'Secret Garden Guesthouse is a small guesthouse in Bloubergstrand.',
  NULL, NULL,
  '["https://www.secretgarden-capetown.com/contact/contact-us/", "https://www.lekkeslaap.co.za/accommodation/secret-garden-guest-house"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'secret-garden-guesthouse-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

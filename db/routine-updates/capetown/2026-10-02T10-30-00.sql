INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bell-rosen-guesthouse-welgemoed', 'Bell Rosen Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  '116 Kommissaris Street, Welgemoed, Cape Town, 7530', '021 913 4703', 'https://www.bellrosen.co.za', NULL,
  'Bell Rosen Guesthouse is a guesthouse with 15 en-suite rooms and two conference venues, in Welgemoed.',
  NULL, NULL,
  '["https://www.bellrosen.co.za/guest-house-contact.php", "https://www.lekkeslaap.co.za/accommodation/bell-rosen-guest-house"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bell-rosen-guesthouse-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

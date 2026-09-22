INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'italian-club-of-cape-town-rugby', 'Italian Club of Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'rugby'),
  '16 Donegal Street, Rugby, Cape Town, 7405', '021 511 5757', NULL, NULL,
  'Italian Club of Cape Town is a cultural, social and sports club on Donegal Street in Rugby.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/italian-club-of-cape-town", "https://italianclub.capetown/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'italian-club-of-cape-town-rugby'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'portuguese-club-rugby', 'Portuguese Club',
  (SELECT id FROM suburbs WHERE slug = 'rugby'),
  '10 Donegal Street, Rugby, Cape Town, 7405', '082 936 0881', NULL, NULL,
  'Portuguese Club is a restaurant, sports bar and function venue on Donegal Street in Rugby.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/portuguese-club-49504", "https://www.yellowpages.net.za/phone,27-829360881,Club,Cape-Town,ZA273996.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'portuguese-club-rugby'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

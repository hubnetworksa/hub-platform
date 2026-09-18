INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'image-travel-and-tours-polokwane-central', 'Image Travel and Tours',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '84 Schoeman Street, Polokwane, 0700', '015 291 1449', 'https://imagetravel.co.za', 'info@imagetravel.co.za',
  'Image Travel and Tours is a Polokwane travel agency, established in 2011, offering flight bookings, tour packages and travel arrangements.',
  NULL, NULL,
  '["https://imagetravel.co.za/", "https://www.yellowpages.co.za/business/17070097_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'image-travel-and-tours-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mogau-traveling-agency-polokwane-central', 'Mogau Traveling Agency',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '135 Marshall Street, Polokwane Central, 0700', '082 293 4343', 'https://mogautravelingagency.co.za', 'mogautoursandtravels@gmail.com',
  'Mogau Traveling Agency is a travel agency in Polokwane Central offering shuttle services, tours and travel packages.',
  NULL, NULL,
  '["https://mogautravelingagency.co.za/home", "https://www.facebook.com/p/Mogaus-traveling-agency-100083246323166/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mogau-traveling-agency-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

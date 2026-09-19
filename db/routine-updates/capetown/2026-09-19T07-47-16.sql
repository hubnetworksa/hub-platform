-- Diep River suburb research (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'block-and-chisel-diep-river', 'Block & Chisel',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '99 Main Rd, corner of Main and Paddington Road, Diep River, Cape Town', '021 712 5193', 'https://www.blockandchisel.co.za', NULL,
  'Block & Chisel is a homeware and furniture retailer, in Diep River.',
  NULL, NULL,
  '["https://www.blockandchisel.co.za/stores/p/city/Cape%20Town/store/Diep%20River", "https://foursquare.com/v/block-and-chisel/4daa8c5f6e81162ae7d9de39"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'block-and-chisel-diep-river'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'martins-bakery-diep-river', 'Martins Bakery',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '43 Main Road, Diep River, Cape Town', '021 712 8555', 'https://martinsbakery.co.za', NULL,
  'Martins Bakery is an artisan bakery and deli, in Diep River.',
  NULL, NULL,
  '["https://martinsbakery.co.za/contact/", "https://www.eatout.co.za/venue/martins-bakery/", "https://www.sa-venues.com/things-to-do/westerncape/martins-bakery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'martins-bakery-diep-river'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

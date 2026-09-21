INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'tile-africa-superbia', 'Tile Africa Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  'Cnr Nikkel & Nelson Mandela Drive, Superbia, Polokwane, 0699', '015 292 2847', 'https://www.tileafrica.co.za', NULL,
  'Tile Africa Polokwane is a tile and flooring retailer in Superbia, part of the national Tile Africa chain.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/polokwane/tile-africa-cnr-nikkel-nelson-mandela-drive-superbia-polokwane/23089", "https://vymaps.com/ZA/Tile-Africa-Polokwane-518611448339148/"]',
  'published', 'agent_research', 'Mon-Tue 07:30-17:00, Wed 08:30-17:00, Thu-Fri 07:30-17:00, Sat 08:00-14:00, Sun Closed'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tile-africa-superbia'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'carpet-decor-centre-superbia', 'Carpet & Decor Centre',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '9 Iran Street, Superbia, Polokwane, 0700', '015 292 2219', 'https://www.carpetdecor.co.za/polokwane/', 'plk@carpetdecor.co.za',
  'Carpet & Decor Centre is a flooring and home-decor retailer in Superbia, supplying and installing carpets, vinyl and other flooring products.',
  NULL, NULL,
  '["https://www.carpetdecor.co.za/polokwane/", "https://www.snupit.co.za/polokwane/superbia/carpet-and-decor-centre/426452"]',
  'published', 'agent_research', 'Mon-Thu 07:30-17:00, Fri 07:30-12:00 & 14:00-17:00, Sat 08:00-13:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carpet-decor-centre-superbia'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

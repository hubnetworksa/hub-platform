INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'victoria-wharf-shopping-centre-va-waterfront', 'Victoria Wharf Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  '3 Dock Rd, V&A Waterfront, Cape Town', NULL, NULL,
  '["https://www.waterfront.co.za/area/victoria-wharf/", "https://www.sa-venues.com/things-to-do/westerncape/victoria-wharf/"]',
  'mall'
);

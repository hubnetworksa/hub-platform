INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'cape-quarter-green-point', 'Cape Quarter Lifestyle Village',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '27 Somerset Road, Green Point, Cape Town, 8005', NULL, NULL,
  '["https://capequarter.co.za/", "https://www.capetownmagazine.com/cape-quarter-shopping-experience"]',
  'mall'
);

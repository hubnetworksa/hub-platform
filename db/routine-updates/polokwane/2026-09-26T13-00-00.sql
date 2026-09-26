INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'ivydale-shopping-centre-penina-park', 'Ivydale Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'penina-park'),
  'Timbavati St, Penina Park, Polokwane, 0699', NULL, NULL,
  '["http://textmap.co.za/141/1239", "https://2pos.co.za/94/826", "https://www.africabizinfo.com/ZA/ivydale-shopping-centre-082-542-1109"]',
  'mall'
);

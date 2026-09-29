INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mall-55-monavoni', 'Mall@55',
  (SELECT id FROM suburbs WHERE slug = 'monavoni'),
  'Cnr R55 & Marais Ave, Monavoni, Centurion, 0157', NULL, NULL,
  '["https://www.dischem.co.za/mallat55-pharmacy", "https://www.fresha.com/lvp/mall-55-shopping-centre-marais-avenue-centurion-EvzyAW"]',
  'mall'
);

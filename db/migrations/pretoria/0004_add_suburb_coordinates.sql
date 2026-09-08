-- Centroid coordinates per suburb, used to scope the OSM bulk-import query
-- radius (see scripts/import-osm-businesses.mjs) and, later, for map display.
-- Approximate town-centre/node coordinates, not precise boundaries.

ALTER TABLE suburbs ADD COLUMN lat REAL;
ALTER TABLE suburbs ADD COLUMN lng REAL;

UPDATE suburbs SET lat = -25.7461, lng = 28.1881 WHERE slug = 'pretoria-central';
UPDATE suburbs SET lat = -25.8601, lng = 28.1894 WHERE slug = 'centurion';
UPDATE suburbs SET lat = -25.6222, lng = 28.0879 WHERE slug = 'akasia';
UPDATE suburbs SET lat = -25.6889, lng = 28.2044 WHERE slug = 'montana';
UPDATE suburbs SET lat = -25.7853, lng = 28.3333 WHERE slug = 'silverlakes';
UPDATE suburbs SET lat = -25.7767, lng = 28.2919 WHERE slug = 'faerie-glen';
UPDATE suburbs SET lat = -25.7827, lng = 28.2773 WHERE slug = 'menlyn';
UPDATE suburbs SET lat = -25.7735, lng = 28.2394 WHERE slug = 'waterkloof';
UPDATE suburbs SET lat = -25.7487, lng = 28.2318 WHERE slug = 'hatfield';
UPDATE suburbs SET lat = -25.7595, lng = 28.0847 WHERE slug = 'atteridgeville';
UPDATE suburbs SET lat = -25.7058, lng = 28.3719 WHERE slug = 'mamelodi';
UPDATE suburbs SET lat = -25.5241, lng = 28.1041 WHERE slug = 'soshanguve';
UPDATE suburbs SET lat = -25.4021, lng = 28.2775 WHERE slug = 'hammanskraal';
UPDATE suburbs SET lat = -25.6785, lng = 28.5225 WHERE slug = 'cullinan';
UPDATE suburbs SET lat = -25.7961, lng = 28.7469 WHERE slug = 'bronkhorstspruit';
UPDATE suburbs SET lat = -25.9992, lng = 28.1264 WHERE slug = 'midrand';

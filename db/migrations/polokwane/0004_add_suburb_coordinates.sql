-- Approximate centre coordinates per suburb, for later map display.
-- These are rough, hand-estimated town-centre/node points, NOT precise
-- boundaries or geocoded results — owner/routine can refine them later
-- (see scripts/retry-geocode-suburbs.mjs).

ALTER TABLE suburbs ADD COLUMN lat REAL;
ALTER TABLE suburbs ADD COLUMN lng REAL;

UPDATE suburbs SET lat = -23.9045, lng = 29.4689 WHERE slug = 'polokwane-central';
UPDATE suburbs SET lat = -23.8760, lng = 29.4900 WHERE slug = 'bendor';
UPDATE suburbs SET lat = -23.8800, lng = 29.4950 WHERE slug = 'bendor-park';
UPDATE suburbs SET lat = -23.9150, lng = 29.4800 WHERE slug = 'flora-park';
UPDATE suburbs SET lat = -23.9250, lng = 29.4700 WHERE slug = 'fauna-park';
UPDATE suburbs SET lat = -23.8950, lng = 29.4850 WHERE slug = 'sterpark';
UPDATE suburbs SET lat = -23.8850, lng = 29.4750 WHERE slug = 'ivy-park';
UPDATE suburbs SET lat = -23.8950, lng = 29.4600 WHERE slug = 'welgelegen';
UPDATE suburbs SET lat = -23.9100, lng = 29.4550 WHERE slug = 'nirvana';
UPDATE suburbs SET lat = -23.9150, lng = 29.4400 WHERE slug = 'westenburg';
UPDATE suburbs SET lat = -23.8850, lng = 29.4350 WHERE slug = 'ladanna';
UPDATE suburbs SET lat = -23.8950, lng = 29.4500 WHERE slug = 'superbia';
UPDATE suburbs SET lat = -23.9200, lng = 29.4650 WHERE slug = 'penina-park';
UPDATE suburbs SET lat = -23.8700, lng = 29.5000 WHERE slug = 'serala-view';
UPDATE suburbs SET lat = -23.9300, lng = 29.4550 WHERE slug = 'annadale';
UPDATE suburbs SET lat = -23.9350, lng = 29.4800 WHERE slug = 'dalmada';
UPDATE suburbs SET lat = -23.8750, lng = 29.4850 WHERE slug = 'broadlands';
UPDATE suburbs SET lat = -23.9400, lng = 29.4650 WHERE slug = 'southern-gateway';
UPDATE suburbs SET lat = -23.9280, lng = 29.4720 WHERE slug = 'eduan-park';
UPDATE suburbs SET lat = -23.8650, lng = 29.5100 WHERE slug = 'thornhill-estate';
UPDATE suburbs SET lat = -23.8900, lng = 29.4700 WHERE slug = 'moregloed';
UPDATE suburbs SET lat = -23.9000, lng = 29.4600 WHERE slug = 'hospark';
UPDATE suburbs SET lat = -23.8600, lng = 29.4500 WHERE slug = 'capricorn';
UPDATE suburbs SET lat = -23.9350, lng = 29.4450 WHERE slug = 'extension-71';
UPDATE suburbs SET lat = -23.9400, lng = 29.4500 WHERE slug = 'extension-76';
UPDATE suburbs SET lat = -23.8500, lng = 29.3800 WHERE slug = 'seshego';
UPDATE suburbs SET lat = -23.8450, lng = 29.3850 WHERE slug = 'seshego-zone-1';
UPDATE suburbs SET lat = -23.8550, lng = 29.3750 WHERE slug = 'seshego-zone-4';
UPDATE suburbs SET lat = -23.8870, lng = 29.7350 WHERE slug = 'mankweng';
UPDATE suburbs SET lat = -24.2000, lng = 29.5500 WHERE slug = 'lebowakgomo';

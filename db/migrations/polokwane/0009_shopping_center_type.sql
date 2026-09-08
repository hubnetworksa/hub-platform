-- Malls and fuel stations were imported into the same table (both are
-- real "which physical location is this business at" host venues — see
-- 0007), but showing them in one undifferentiated list reads as if a
-- petrol station were a shopping centre. Backfilled by matching common
-- South African fuel-brand names, since the import didn't record which
-- Overpass query (shop=mall vs amenity=fuel) matched each row.

ALTER TABLE shopping_centers ADD COLUMN type TEXT NOT NULL DEFAULT 'mall';

UPDATE shopping_centers SET type = 'fuel_station'
WHERE name IN (
  'Engen', 'Shell', 'Sasol', 'BP', 'Total', 'TotalEnergies', 'Caltex',
  'Astron Energy', 'Zenex', 'Puma', 'Puma Energy', 'Afric Oil'
);

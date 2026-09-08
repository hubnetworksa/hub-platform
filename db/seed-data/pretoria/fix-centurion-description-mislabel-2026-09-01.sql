-- Businesses imported by the original scraper-CSV batch (before
-- scripts/import-scraper-csv.mjs was fixed to derive the correct region)
-- all got a hardcoded "part of the Centurion area" description regardless
-- of their actual suburb. This corrects the 290 rows whose suburb is
-- actually in the 'pretoria' region (e.g. PayDay Software Systems, in
-- Brummeria) to say "Pretoria" instead.
UPDATE businesses
SET description = REPLACE(description, 'part of the Centurion area', 'part of the Pretoria area')
WHERE description LIKE '%part of the Centurion area%'
  AND suburb_id IN (SELECT id FROM suburbs WHERE region = 'pretoria');

-- Fix: batch 05's UPDATE targeted slug 'absolute-pets-hazeldean' (dropped
-- from the agent's transcription) but the real slug is
-- 'absolute-pets-hazeldean-hazeldean' (the business name already ends in
-- the suburb name, so the import doubled it up) -- the original UPDATE
-- silently matched 0 rows instead of erroring. Re-applying with the
-- correct slug.

UPDATE businesses SET
  hours = 'Mon-Sun 08:00-19:00',
  source_urls = '["https://www.absolutepets.com/", "https://pretoria.co.za/place/absolute-pets-hazeldean"]',
  description = 'Absolute Pets Hazeldean stocks a wide range of pet foods, toys and accessories for dogs, cats and other pets, with staff on hand to help customers choose products.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-hazeldean-hazeldean' AND description_enriched_at IS NULL;

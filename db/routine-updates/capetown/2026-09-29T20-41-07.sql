UPDATE businesses
SET description = 'Woolworths (Rondebosch Village) is a supermarket and food store located in Rondebosch Village on Klipfontein Road.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-rondebosch-village-rondebosch' AND description_enriched_at IS NULL;

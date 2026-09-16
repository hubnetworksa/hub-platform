UPDATE businesses
SET description = 'Turf Lodge is a guesthouse in Mankweng offering affordable accommodation right next to the University of Limpopo.',
    description_enriched_at = datetime('now')
WHERE slug = 'turf-lodge-mankweng' AND description_enriched_at IS NULL;

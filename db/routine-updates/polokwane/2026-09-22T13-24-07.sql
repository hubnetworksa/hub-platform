UPDATE businesses
SET description = 'A general practice in Seshego Zone 1, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-t-g-mulaudzi-seshego-zone-1' AND description_enriched_at IS NULL;

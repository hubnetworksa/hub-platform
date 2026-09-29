UPDATE businesses
SET description = 'Masiphumelele Clinic is a public health clinic in Masiphumelele, offering primary healthcare services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'masiphumelele-clinic-masiphumelele' AND description_enriched_at IS NULL;

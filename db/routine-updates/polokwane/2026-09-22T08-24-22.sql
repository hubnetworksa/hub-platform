UPDATE businesses
SET description = 'W H Saffer is a plumbing and sanitary ware supplier based in Superbia, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'w-h-saffer-superbia' AND description_enriched_at IS NULL;

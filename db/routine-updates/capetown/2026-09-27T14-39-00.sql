UPDATE businesses
SET description = 'Southfield Superette is a small convenience store on Victoria Road in Southfield, stocking everyday groceries and household essentials for the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'southfield-superette-southfield' AND description_enriched_at IS NULL;

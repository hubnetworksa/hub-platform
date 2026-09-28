UPDATE businesses
SET description = 'Shoprite Elsies River is a supermarket on the corner of Owen and Halt Road, stocking groceries, fresh produce and household essentials for the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-elsies-river' AND description_enriched_at IS NULL;

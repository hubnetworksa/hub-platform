UPDATE businesses
SET description = 'Woolworths Table Bay Mall is a supermarket inside Table Bay Mall, Bloubergstrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

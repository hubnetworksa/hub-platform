UPDATE businesses
SET description = 'Woolworths Table Bay Mall is a full-line store in Bloubergstrand with fashion for men, women and kids, beauty, homeware and a foodmarket featuring bakery, meat and fish counters, plus a Woolworths Cafe within the mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

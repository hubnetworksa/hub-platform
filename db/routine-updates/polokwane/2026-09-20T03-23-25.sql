UPDATE businesses
SET description = 'Online SA Park & Sell is a car dealership on Munnik Ave in Sterpark, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'online-sa-park-sell-sterpark' AND description_enriched_at IS NULL;

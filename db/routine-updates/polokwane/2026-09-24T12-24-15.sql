UPDATE businesses
SET description = 'Clear Target Optometrist is an optometry practice in Hospital Park, Polokwane, providing eye care and vision services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'clear-target-optometrist-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spectacle Hut is an optometrist and eyewear retailer on Burger Street in Hospital Park, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'spectacle-hut-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dorothy Langa Primary School is a public, no-fee primary school in Zone 2, Seshego, classified as a Quintile 3 institution within the Capricorn District.',
    description_enriched_at = datetime('now')
WHERE slug = 'dorothy-langa-primary-school-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Millennium Combined School is a public, no-fee combined school in Madiba Park, Seshego, offering schooling from the primary through to the secondary phase as a Section 21 institution.',
    description_enriched_at = datetime('now')
WHERE slug = 'millennium-combined-school-seshego' AND description_enriched_at IS NULL;

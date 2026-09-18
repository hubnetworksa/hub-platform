UPDATE businesses
SET description = 'Nederduitsch Hervormde Kerk Welgelegen is a Dutch Reformed church congregation serving the Welgelegen community in Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'nederduitsch-hervormde-kerk-welgelegen-welgelegen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shell Bendor Service Station is a Shell-branded fuel station in Bendor, Polokwane, providing fuel and forecourt services to motorists in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'shell-bendor-service-station-bendor' AND description_enriched_at IS NULL;

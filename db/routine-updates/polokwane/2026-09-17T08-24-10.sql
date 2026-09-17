UPDATE businesses
SET description = 'Bosveld Scrap Metal is a scrap metal merchant based in Ladanna, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'bosveld-scrap-metal-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polokwane Scrap Metals is a scrap metal dealer based on River Street in Ladanna, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'polokwane-scrap-metals-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RGR Services is an industrial and engineering services provider in Ladanna, operating in association with the Babcock group and offering construction equipment, welding and plant services support.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00'
WHERE slug = 'rgr-services-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reclam Polokwane recycles ferrous and non-ferrous metals along with paper, cardboard and plastic, and also runs a free garden waste and food waste drop-off that it turns into compost and lawn dressing for sale.',
    description_enriched_at = datetime('now')
WHERE slug = 'reclam-polokwane-ladanna' AND description_enriched_at IS NULL;

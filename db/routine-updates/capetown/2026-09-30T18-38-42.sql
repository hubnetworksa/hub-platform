UPDATE businesses
SET description = 'Engen Bonteheuwel Tyre & Service Centre is a fuel station with an on-site tyre and vehicle service centre, in Bonteheuwel.',
    description_enriched_at = datetime('now')
WHERE slug = 'engen-bonteheuwel-tyre-service-centre-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Z & N Hardware is a hardware store in Nyanga Junction Shopping Centre, Manenberg.',
    description_enriched_at = datetime('now')
WHERE slug = 'z-n-hardware-manenberg' AND description_enriched_at IS NULL;

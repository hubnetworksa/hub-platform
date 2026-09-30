UPDATE businesses
SET description = 'Telecom Installations CC is a telecommunications installer in Stellenberg, Durbanville, providing PABX systems, intercoms, CCTV, VoIP and data cabling for homes and businesses with in-house installation and maintenance teams.',
    description_enriched_at = datetime('now')
WHERE slug = 'telecom-installations-stellenberg' AND description_enriched_at IS NULL;

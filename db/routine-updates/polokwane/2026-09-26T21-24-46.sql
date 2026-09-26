UPDATE businesses
SET description = 'Lafixa IT Solutions is a black-owned IT close corporation established in 2006, offering PC and laptop repairs, upgrades and replacement of faulty components in Nirvana, Polokwane, carried out by qualified technicians.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-20:00, Sun Closed'
WHERE slug = 'lafixa-it-solutions-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rabie Panel Beaters is a panelbeating and spray-painting workshop in Nirvana, Polokwane, handling everything from minor dents and scratches to major structural vehicle repairs.',
    description_enriched_at = datetime('now')
WHERE slug = 'rabie-panel-beaters-nirvana' AND description_enriched_at IS NULL;

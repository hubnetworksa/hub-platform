-- Job 4: description enrichment sweep, checkpoint 2 of 2 (2 records)
UPDATE businesses
SET description = 'Wimpy is a family restaurant inside Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-15:00, Sun 08:30-14:00'
WHERE slug = 'wimpy-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket and grocery store inside Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-howard-centre-pinelands' AND description_enriched_at IS NULL;

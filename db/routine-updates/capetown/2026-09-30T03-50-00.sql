UPDATE businesses
SET description = 'Vizi Hair is a hair salon on Oxford Street in Durbanville offering services including balayage, colour, extensions, weaves, highlights, keratin treatments and permanent straightening.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Fri 08:00-17:00, Sat 08:00-13:30, Sun Closed'
WHERE slug = 'vizi-hair-durbanville' AND description_enriched_at IS NULL;

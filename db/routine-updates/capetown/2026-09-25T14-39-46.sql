UPDATE businesses
SET description = 'Bassier Medical''s Erica Square rooms is a family medicine practice, established in 1982, offering general practitioner consultations in Belhar.',
    description_enriched_at = datetime('now')
WHERE slug = 'bassier-medical-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lavis Hardware is a hardware store trading from Shop 6 in the Shoprite Wing shopping centre in Bishop Lavis.',
    description_enriched_at = datetime('now')
WHERE slug = 'lavis-hardware-bishop-lavis' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is the Bishop Lavis branch of the national clothing retailer, offering affordable, everyday fashion and homeware for the whole family.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-13:30, Sun 09:00-13:00'
WHERE slug = 'pep-bishop-lavis' AND description_enriched_at IS NULL;

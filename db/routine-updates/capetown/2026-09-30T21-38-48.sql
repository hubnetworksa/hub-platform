UPDATE businesses
SET description = 'Look Its Me Hair Design is a hair salon on Korfbal Street in Beacon Valley offering services including hair braiding, colouring, extensions, highlights, keratin treatment and women''s haircuts.',
    description_enriched_at = datetime('now')
WHERE slug = 'look-its-me-hair-design-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salon Jean Paul is a hair salon at Shop 9 in Cavalier Shopping Centre on Robert Sobukwe Road, Belhar, offering services including hair braiding, colouring, extensions, keratin treatment, perms, permanent straightening and women''s haircuts.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 08:00-14:00'
WHERE slug = 'salon-jean-paul-belhar' AND description_enriched_at IS NULL;

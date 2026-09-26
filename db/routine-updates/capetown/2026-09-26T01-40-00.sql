-- Job 4: description enrichment sweep, batch of 5 (clears the entire current backlog)
UPDATE businesses
SET description = 'Avenue Hardware & Motor Spares is a hardware store and motor spares supplier on 5th Avenue in Grassy Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:45-16:45, Fri 07:45-11:30 & 14:30-16:45, Sat 07:45-12:45, Sun Closed'
WHERE slug = 'avenue-hardware-and-motor-spares-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Busy Corner Butchery is a butchery on Victoria Road in Grassy Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-18:30, Sat 09:00-16:00, Sun 09:00-12:30'
WHERE slug = 'busy-corner-butchery-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dilshaad Oosthuizen Physiotherapy is a physiotherapy practice in Key Shopping Centre on Victoria Road, Grassy Park, offering physiotherapy, dry needling and acupuncture.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-18:30, Sat-Sun Closed'
WHERE slug = 'dilshaad-oosthuizen-physiotherapy-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Grassy Park Pharmacy is a pharmacy in the Nazraf Centre on Victoria Road, Grassy Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-13:00 & 14:00-18:30, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'grassy-park-pharmacy-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maggaard''s Multichem Pharmacy is a pharmacy in Prince Park Centre on Prince George Drive, Grassy Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'maggaards-multichem-pharmacy-grassy-park' AND description_enriched_at IS NULL;

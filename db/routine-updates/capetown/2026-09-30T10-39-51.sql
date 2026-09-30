-- Job 4: description enrichment sweep (batch 2 of 2, 1 record)
UPDATE businesses
SET description = 'Site B Youth Clinic is a City of Cape Town public health clinic in Khayelitsha, providing general primary healthcare including family planning, HIV testing and care, and STI assessment and treatment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30'
WHERE slug = 'site-b-youth-clinic-khayelitsha' AND description_enriched_at IS NULL;

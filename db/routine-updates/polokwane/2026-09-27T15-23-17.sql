UPDATE businesses
SET description = 'Dental 360 is a general dental practice in Shop 33A at Paledi Mall, offering affordable, quality dental care to patients in Mankweng and the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'dental-360-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Max Hydraulics is a hydraulics engineering business on Koper Street in Futura, supplying and fitting hydraulic components configured to customer specifications.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30'
WHERE slug = 'max-hydraulics-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pietersburg Motor & Diesel Services is a commercial truck, bus, trailer and generator repair workshop on Lood Street in Futura, with some 25 years of experience servicing commercial vehicles across Limpopo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:15-17:00'
WHERE slug = 'pietersburg-motor-diesel-services-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Car Service City Polokwane is a car servicing and repair workshop in Superbia that has operated since 2015, specialising in vehicles out of motor plan (3 years and older) across all makes, bakkies and 4x4s, and offering a free 62-point check with every major service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:30, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'car-service-city-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VTS Vehicle Testing Station in Superbia carries out vehicle roadworthiness testing and fitness certification, and also offers aluminium number plate sales and vehicle registration services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat-Sun Closed'
WHERE slug = 'vts-vehicle-testing-station-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr O''s Motor Spares is a vehicle parts and accessories retailer at Total Garage in Portlands, Mitchells Plain, with an in-house workshop offering fitment services for the parts it sells.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-18:00, Fri 08:30-12:30 & 14:30-18:00, Sat 08:30-17:00, Sun 09:00-13:00'
WHERE slug = 'mr-os-motor-spares-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ottery Hardware is a small, community-focused DIY and hardware store on Ottery Road, stocking building, plumbing and electrical supplies, tools, paint and fasteners for home repair and craft projects.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-14:00'
WHERE slug = 'ottery-hardware-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Ottery Centre is a general clothing, footwear and homeware retailer, part of the national PEP chain, located at Shop L49 in Ottery Centre on New Ottery Road, Ottery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-16:00'
WHERE slug = 'pep-ottery-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoe City Ottery Centre is a footwear retailer at Shop L41 in Ottery Centre on Ottery Road, part of the national Shoe City chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoe-city-ottery-centre-ottery' AND description_enriched_at IS NULL;

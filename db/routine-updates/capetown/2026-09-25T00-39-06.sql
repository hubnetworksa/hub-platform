UPDATE businesses
SET description = 'Cash Converters Kuils River buys and sells second-hand goods such as electronics, cellphones, tools and household items, and offers short-term cash loans against valuables, in Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-15:00, Sun 09:00-13:00'
WHERE slug = 'cash-converters-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dry Cleaning 4U is a dry cleaning and laundry service in Welgemoed Plaza, Welgemoed.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:30, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'dry-cleaning-4u-welgemoed-plaza-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Intercare Panorama is a medical centre in Panorama Healthcare Centre offering general practitioner services, pathology, minor surgery, vaccinations, aviation medicals and a diabetic clinic, in Panorama.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-19:00, Sat 08:00-15:00, Sun 08:00-13:00'
WHERE slug = 'intercare-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Knead Bakery is a bakery and cafe in Panorama Healthcare Centre, Panorama.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 07:00-18:00, Sat-Mon 07:00-16:00'
WHERE slug = 'knead-bakery-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a value clothing and general merchandise retailer in Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 08:30-15:00, Sun 09:00-13:00'
WHERE slug = 'pep-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sakura Beauty Bar is a beauty salon in Welgemoed offering facials, manicures, hair removal and waxing, threading and makeup services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-14:00'
WHERE slug = 'sakura-beauty-bar-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperSpar Kuilsrivier is a supermarket in the Aroma Centre, Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-21:00'
WHERE slug = 'superspar-kuilsrivier-kuils-river' AND description_enriched_at IS NULL;

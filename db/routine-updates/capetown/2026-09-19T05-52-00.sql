-- Job 4: description enrichment sweep, checkpoint 2/2 (10 businesses)

UPDATE businesses
SET description = 'Dawn Asian Restaurant is an upmarket Chinese restaurant in the Cape Quarter Lifestyle Centre in De Waterkant, known for dim sum, Peking duck and Asian fusion dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:00, Fri-Sat 11:00-22:30',
    source_urls = '["https://capequarter.co.za/shops/", "https://getoccupi.com/malls/cape-quarter", "https://www.eatout.co.za/article/review-dawn-offers-delicious-dive-upmarket-chinese-fare/"]'
WHERE slug = 'dawn-asian-restaurant-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza Golden Acre Express is a branch of the Debonairs Pizza chain inside the Golden Acre shopping centre in central Cape Town, offering pizza for takeaway and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'debonairs-pizza-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debt Scan is a National Credit Regulator-registered debt counselling company operating from The Palms Decor and Lifestyle Centre in Woodstock, helping consumers consolidate debt and rehabilitate their credit profile.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.palms.co.za/tenants", "https://www.debtscan.co.za/", "https://www.dcasa.co.za/locations/debt-scan-cape-town/"]'
WHERE slug = 'debt-scan-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Design Academy of Fashion is a private fashion education institution based in the Old Biscuit Mill, offering a Bachelor of Fashion degree, a Diploma in Fashion and short courses.',
    description_enriched_at = datetime('now')
WHERE slug = 'design-academy-of-fashion-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Adelphi is a pharmacy and health and beauty store inside the Adelphi Centre on Main Road, Sea Point, part of the Dis-Chem chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 08:00-15:00'
WHERE slug = 'dis-chem-adelphi-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Pharmacy is a branch of the Dis-Chem chain inside The Point shopping centre on Regent Road, Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 09:00-16:00'
WHERE slug = 'dischem-pharmacy-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Discovery Store is a walk-in branch of the Discovery financial services group inside The Point shopping centre in Sea Point, helping members and clients with medical aid, insurance and Vitality queries in person.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:00, Sun & Public Holidays 08:00-13:00',
    source_urls = '["https://hombaze.co.za/discovery-store---sea-point-3909589226047898293/", "https://za.africabz.com/western-cape/discovery-store-54466", "https://thepointmall.co.za/merchant/discovery-store-sea-point/"]'
WHERE slug = 'discovery-store-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'District Six Museum is a heritage museum on Buitenkant Street documenting the history and forced removals of the District Six community, offering self-guided visits and tours led by former residents.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-14:00, Tue-Sat 09:00-16:00',
    source_urls = '["https://www.sa-venues.com/things-to-do/westerncape/district-six-museum/", "https://districtsix.co.za", "https://citysightseeing.co.za/en/cape-town/district-six-museum"]'
WHERE slug = 'district-six-museum-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Do It Yourself Hardware is a hardware store on Koeberg Road in Brooklyn, stocking building, DIY and home-improvement supplies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:45-17:00, Sat 08:00-13:00'
WHERE slug = 'do-it-yourself-hardware-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr JB Fine is a general practice inside the Cape Quarter in De Waterkant, offering general medical consultations.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 14:00-18:30, Wed Closed, Thu-Fri 14:00-18:30, Sat-Sun Closed'
WHERE slug = 'dr-jb-fine-de-waterkant' AND description_enriched_at IS NULL;

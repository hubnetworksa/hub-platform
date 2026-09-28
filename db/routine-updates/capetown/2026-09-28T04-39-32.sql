UPDATE businesses
SET description = 'PEP Cell is a mobile phone and accessories store in Gugulethu Square, Gugulethu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-14:00'
WHERE slug = 'pep-cell-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Stores is a clothing and general merchandise retailer in Gugulethu Square, Gugulethu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'pep-stores-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Usave Rugby is a discount supermarket on Koeberg Road in Rugby, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 08:00-13:00'
WHERE slug = 'usave-rugby-rugby' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food Welgemoed is a supermarket branch inside Welgemoed Forum, Welgemoed.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-food-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Plattekloof is a supermarket branch inside Plattekloof Village Shopping Centre, Plattekloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness Cobble Walk is a gym and fitness centre branch of the Zone Fitness chain, inside Cobble Walk Shopping Centre, Durbanville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat-Sun 07:00-15:00'
WHERE slug = 'zone-fitness-cobble-walk-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'weClean is a family-owned, owner-managed cleaning company serving Richwood and the wider Cape Town area, offering office and commercial cleaning alongside carpet, upholstery and mattress cleaning.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://weclean.co.za/cleaning-services-richwood/", "https://www.cylex.net.za/company/weclean-professional-cleaning-solutions-19102439.html", "https://www.homify.co.za/professionals/8545691/weclean-cleaning-services-cape-town"]'
WHERE slug = 'weclean-richwood' AND description_enriched_at IS NULL;

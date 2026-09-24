-- Job 4: description enrichment sweep, batch 2 of 2 (final 2 of 12 backlog records)
UPDATE businesses
SET description = 'Virgin Active Steenberg is a health club in Westlake Business Park offering two heated swimming pools with aqua fitness classes, a supervised kids'' club, sauna and steam room facilities, personal training, and free underground parking.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-22:00, Fri 05:00-21:00, Sat-Sun 06:00-20:00',
    source_urls = '["https://za.africabz.com/western-cape/virgin-active-steenberg-26206", "https://za.gymcity.info/virgin-active-steenberg-1544438", "https://www.virginactive.co.za/gyms/steenberg"]'
WHERE slug = 'virgin-active-steenberg-steenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket branch inside Longbeach Mall, Noordhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-noordhoek' AND description_enriched_at IS NULL;

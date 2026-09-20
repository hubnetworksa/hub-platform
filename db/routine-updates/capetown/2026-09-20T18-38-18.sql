UPDATE businesses
SET description = 'Builders Warehouse Constantiaberg is a hardware and building materials store on the corner of Main Road and Bark Street in Retreat.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-16:00'
WHERE slug = 'builders-warehouse-constantiaberg-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caravelle Post Office is a postal and courier services branch inside Rocklands Shopping Centre in Rocklands, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'caravelle-post-office-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Rocklands is a supermarket inside Rocklands Shopping Centre in Rocklands, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-rocklands-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Steenberg is a supermarket inside Steenberg Centre on Military Road in Steenberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-18:30, Fri 08:30-19:00, Sat 08:00-17:00, Sun 08:00-14:00'
WHERE slug = 'shoprite-steenberg-steenberg' AND description_enriched_at IS NULL;

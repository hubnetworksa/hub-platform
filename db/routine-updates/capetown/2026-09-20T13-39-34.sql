UPDATE businesses
SET description = 'Builders Warehouse Constantiaberg is a large-format hardware and building-materials store on the corner of Main Road and Bark Street in Retreat, stocking building supplies, tools, hardware, paint, and home-improvement products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-16:00'
WHERE slug = 'builders-warehouse-constantiaberg-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caravelle Post Office is a South African Post Office branch inside Rocklands Shopping Centre in Rocklands, Mitchells Plain, offering postal, mail, and parcel services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'caravelle-post-office-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Rocklands is a supermarket branch of the Shoprite chain at Rocklands Shopping Centre, on the corner of Park Avenue and Caravelle Street in Rocklands, Mitchells Plain, selling groceries, fresh produce, and household essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:30, Sat 08:00-18:00, Sun 09:00-14:00'
WHERE slug = 'shoprite-rocklands-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Steenberg is a supermarket branch of the Shoprite chain at Steenberg Centre on Military Road in Steenberg, selling groceries, fresh produce, and household essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-steenberg-steenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Builders Warehouse Constantiaberg is a large hardware, building materials and home improvement store on the corner of Main Road and Bark Street in Retreat, part of the nationwide Builders Warehouse chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-16:00'
WHERE slug = 'builders-warehouse-constantiaberg-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caravelle Post Office is a South African Post Office branch inside Rocklands Shopping Centre in Mitchells Plain, offering postal, parcel and courier services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'caravelle-post-office-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Rocklands is a supermarket branch of the Shoprite chain inside Rocklands Shopping Centre in Mitchells Plain, stocking groceries, fresh produce and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-rocklands-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Steenberg is a supermarket branch of the Shoprite chain at Shop 7 in Steenberg Centre on Military Road, Steenberg, stocking groceries, fresh produce and household goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 08:00-14:00'
WHERE slug = 'shoprite-steenberg-steenberg' AND description_enriched_at IS NULL;

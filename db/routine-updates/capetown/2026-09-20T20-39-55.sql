-- Job 4: description enrichment sweep (4 businesses, clears backlog to 0)
UPDATE businesses
SET description = 'Builders Warehouse Constantiaberg is a large-format hardware and home-improvement warehouse store in Retreat, part of the national Builders chain, stocking hand tools, building materials, plumbing and electrical supplies, and featuring a large garden centre display and supply yard.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-16:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/builders-warehouse-co-main-road-and-bark-street-retreat/4888", "https://www.brabys.com/za/western-cape/retreat/retreat-industrial/building-materials/builders-warehouse-constantiaberg", "https://www.lifeisagarden.co.za/builders-warehouse-constantiaberg/"]'
WHERE slug = 'builders-warehouse-constantiaberg-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caravelle Post Office is a South African Post Office branch inside Rocklands Shopping Centre, Mitchells Plain, offering standard postal counter and parcel services.',
    description_enriched_at = datetime('now')
WHERE slug = 'caravelle-post-office-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Rocklands is a supermarket branch of the Shoprite chain inside Rocklands Shopping Centre, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-rocklands-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Steenberg is a supermarket branch of the Shoprite chain in Steenberg Centre on Military Road, Steenberg.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-steenberg-steenberg' AND description_enriched_at IS NULL;

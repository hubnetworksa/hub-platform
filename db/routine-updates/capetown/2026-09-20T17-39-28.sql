UPDATE businesses
SET description = 'Builders Warehouse Constantiaberg is a branch of the Builders Warehouse home-improvement chain (part of Massmart''s Massbuild division), stocking construction materials, tools, hardware, paint and garden supplies from its store on the corner of Main Road and Bark Street in Retreat.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/builders-warehouse-co-main-road-and-bark-street-retreat/4888", "https://www.brabys.com/za/western-cape/retreat/retreat-industrial/building-materials/builders-warehouse-constantiaberg", "https://en.wikipedia.org/wiki/Builders_Warehouse"]'
WHERE slug = 'builders-warehouse-constantiaberg-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caravelle Post Office is a South African Post Office branch located inside Rocklands Shopping Centre in Rocklands, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://pathfinda.com/en/mitchells-plain/rocklands/shops-services/caravelle-post-office", "https://za.africabz.com/western-cape/caravelle-post-office-226635", "https://www.cybo.com/ZA-biz/post-office-caravelle-post-office"]'
WHERE slug = 'caravelle-post-office-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Rocklands is a supermarket branch of the Shoprite chain, located inside Rocklands Shopping Centre in Rocklands, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-rocklands-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Steenberg is a supermarket branch of the Shoprite chain, located inside Steenberg Centre on Military Road in Steenberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-18:30, Fri 08:30-19:00, Sat 08:00-17:00, Sun 08:00-14:00',
    source_urls = '["https://sabusinesslistings.co.za/listings/shoprite-steenberg/", "https://www.cybo.com/ZA-biz/shoprite-steenberg", "https://my-catalogue.co.za/stores/retreat/shoprite/shop-7-foodworld-centre-military-road"]'
WHERE slug = 'shoprite-steenberg-steenberg' AND description_enriched_at IS NULL;

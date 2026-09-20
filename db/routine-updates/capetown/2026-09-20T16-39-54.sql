UPDATE businesses
SET description = 'Builders Warehouse Constantiaberg is a large hardware and home-improvement store in Retreat, part of the national Builders Warehouse chain, stocking building materials, tools and garden supplies, and listed as an authorised JoJo Tanks distributor.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/builders-warehouse-co-main-road-and-bark-street-retreat/4888", "https://www.brabys.com/za/western-cape/retreat/retreat-industrial/building-materials/builders-warehouse-constantiaberg", "https://www.jojo.co.za/distributor/builders-warehouse-constantiaberg/", "https://www.lifeisagarden.co.za/builders-warehouse-constantiaberg/"]'
WHERE slug = 'builders-warehouse-constantiaberg-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caravelle Post Office is a South African Post Office branch inside Rocklands Shopping Centre in Mitchells Plain, offering postal and courier services to the surrounding Rocklands community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://pathfinda.com/en/mitchells-plain/rocklands/shops-services/caravelle-post-office", "https://za.africabz.com/western-cape/caravelle-post-office-226635", "https://www.cybo.com/ZA-biz/post-office-caravelle-post-office", "https://postaldb.net/en/south-africa/post-office/view/188"]'
WHERE slug = 'caravelle-post-office-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Rocklands is the anchor supermarket of the Rocklands Shopping Centre in Mitchells Plain, offering groceries and household goods to the surrounding community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.callupcontact.com/b/Supermarkets/Shoprite_Rocklands/4807", "https://www.sayellow.com/shoprite-rocklands-mitchells-plain", "https://www.rennieproperty.co.za/buildings/rocklands-shopping-centre.html"]'
WHERE slug = 'shoprite-rocklands-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Steenberg is a supermarket branch inside the Steenberg Centre on Military Road, offering groceries and household essentials to the Steenberg and Retreat area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 08:00-14:00',
    source_urls = '["https://sabusinesslistings.co.za/listings/shoprite-steenberg/", "https://www.cybo.com/ZA-biz/shoprite-steenberg", "https://www.shopshours.co.za/shoprite/cape-town/c-57f3cabc47d677c3b27e3ecc"]'
WHERE slug = 'shoprite-steenberg-steenberg' AND description_enriched_at IS NULL;

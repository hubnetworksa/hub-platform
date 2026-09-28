-- Job 4: description enrichment sweep, batch 2 of 2 (9 records)
-- Note: 'dr-d-bekker-kenridge' was skipped this run -- research found the phone
-- (021 914 1222) and address (1 Mildred Street, Kenridge) match a family
-- physician/GP practice, not a dentist as the existing category_slug states.
-- Out of scope for this job to touch category, and writing a description
-- consistent with either the GP finding or the dentist category risks stating
-- something unverified either way, so it's left for a future run/human review.

UPDATE businesses
SET description = 'Cape Blinds & Shutters supplies and installs window coverings -- including Venetian, vertical, roller and Roman blinds, plus plaswood and wooden shutters -- for homes and businesses across the greater Cape Town area, operating from Epping Industria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capeblindsandshutters.co.za/contact-us/", "https://www.thebusinessdirectory.co.za/listings/cape-blinds-and-shutters/", "https://capeblindsandshutters.co.za/services/"]'
WHERE slug = 'cape-blinds-shutters-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Union Mart is a fashion and clothing retail store, part of a national South African retail chain, located within Access Park in Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-15:00, Sun 09:00-14:00',
    source_urls = '["https://accessparkbellville.co.za/directory/cape-union-mart/", "https://www.facebook.com/AccessParkBellville/posts/a19-cape-union-mart-021-003-2781k-way-outlet-drake-down-jacket-normally-r1599-no/3355552647882271/", "https://www.capeunionmart.co.za/stores"]'
WHERE slug = 'cape-union-mart-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caterware Connection, established in 2002, designs and supplies commercial catering equipment and kitchen fit-outs -- including urns, preparation tables, coffee machines, display units and refrigeration -- to restaurants, hotels and other hospitality businesses from its Maitland premises.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.hotfrog.co.za/company/1300768599973888/caterware-connection/cape-town/kitchen-accessories", "https://www.brabys.com/za/western-cape/cape-town/maitland/catering-equipment-suppliers/caterware-connection", "https://www.caterware.co.za/contact-us/"]'
WHERE slug = 'caterware-connection-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers is a supermarket located within Cobble Walk Shopping Centre in Durbanville, part of the national Checkers grocery chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-20:00, Sat 08:00-19:00, Sun 09:00-19:00',
    source_urls = '["https://www.brabys.com/za/western-cape/durbanville/sonstraal-heights/supermarkets/checkers-cobble-walk", "https://www.tiendeo.co.za/stores/Durbanville/checkers-cobble-walk-shopping-centre-cnr-verdi-boulevard-and-de-villiers-street-durbanville/44048", "https://www.checkers.co.za/Western-Cape/Cape-Town/Durbanville/Checkers-Cobble-Walk/store-details/45109"]'
WHERE slug = 'checkers-cobble-walk-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy and health and beauty retailer located within Cobble Walk Shopping Centre in Durbanville, part of the national Clicks chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'clicks-cobble-walk-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza Bothasig is a pizza delivery and takeaway outlet located within Bothasig Square in Bothasig, part of the national Debonairs Pizza chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'debonairs-pizza-bothasig-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Edgemead Motors is a fuel station and vehicle service garage in Edgemead, trading with an on-site Engen-branded convenience store.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/engen-edgemead-motors-convenience-centre-83982", "https://capetown.yalwa.co.za/ID_106874452/EDGEMEAD-MOTORS-Service-Station-7-EDGEMEAD-DRIVE.html", "https://www.shopshours.co.za/edgemead-motors-pty-ltd/cape-town/c-57f3c9ec47d677c3b27a39d9"]'
WHERE slug = 'edgemead-motors-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ellies Electronics in Ndabeni is the Cape Town branch of Ellies, a South African manufacturer, importer, wholesaler and distributor of lighting, electrical and electronic products, founded in 1979.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cylex.net.za/company/ellies-electronics-17503526.html", "https://ellies.co.za/contact-us/", "https://en.wikipedia.org/wiki/Ellies_Holdings"]'
WHERE slug = 'ellies-electronics-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Footgear is a footwear retail store, part of a national South African shoe chain, located within Access Park in Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 10:00-15:00',
    source_urls = '["https://accessparkbellville.co.za/directory/footgear/", "https://www.tiendeo.co.za/stores/bellville/footgear-co-la-belle-st-and-van-riebeeck-road/21435", "https://www.footgear.co.za/stores/footgear-access-park/"]'
WHERE slug = 'footgear-kuils-river' AND description_enriched_at IS NULL;

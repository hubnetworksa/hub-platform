-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)

UPDATE businesses
SET description = 'Ackermans Bothasig is a fashion and clothing retail store located within Bothasig Square in Bothasig.',
    description_enriched_at = datetime('now')
WHERE slug = 'ackermans-bothasig-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Adidas Factory Outlet is an outlet store for adidas footwear and sportswear apparel, located inside Access Park in Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://www.facebook.com/AccessParkBellville/posts/adidas-021-906-0659see-our-specials-in-store/3150822045022000/", "https://www.yep.co.za/biz/store/adidas-sa-pty-ltd/679032", "https://www.cataloguespecials.co.za/stores/adidas/locations/kuils-river"]'
WHERE slug = 'adidas-factory-outlet-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bathroom Bizarre Northgate is a showroom for bathroom fittings, tiles and plumbing supplies, part of a family-run South African sanitary ware retail chain founded in 1995, stocking vanities, taps, baths, basins, toilets and bathroom decor accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.geberit.co.za/find-dealer/showrooms/Bathroom-Bizarre-Northgate-Ysterplaat/", "https://northgateestate.co.za/bathroom-bizarre/", "https://bathroom.co.za/bathroom-bizarre-northgate/"]'
WHERE slug = 'bathroom-bizarre-northgate-ysterplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company in Century City is a specialty coffee cafe serving all-day breakfast and lunch seven days a week.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g4464136-d13235450-Reviews-Bootlegger_Coffee_Company_Century_City-Century_City_Western_Cape.html", "https://www.sluurpy.co.za/century-city/restaurant/5032310/bootlegger-coffee-company-century-city", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerCenturyCity"]'
WHERE slug = 'bootlegger-coffee-company-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bornman & Hayward Attorneys is a law firm established in 1971, offering conveyancing, litigation, labour relations, commercial law, debt collection and deceased estate services from its Stellenberg office in Bellville.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://borhay.co.za/contact-us/", "https://www.brabys.com/za/western-cape/bellville/stellenberg/attorneys/bornman-hayward-attorneys", "https://lawzana.com/lawyer/bornman-hayward-attorneys"]'
WHERE slug = 'bornman-and-hayward-attorneys-stellenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bothasig Pharmacy is a retail pharmacy located within Bothasig Square in Bothasig.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:30, Sat-Sun Closed',
    source_urls = '["https://www.thinklocal.co.za/biz/bothasig-pharmacy-bothasig", "https://za.africabz.com/western-cape/bothasig-pharmacy-158210", "https://www.openhours-southafrica.com/en/cape-town/bothasig-pharmacy"]'
WHERE slug = 'bothasig-pharmacy-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Brick Lane Eatery is a restaurant in Century City known for its canal-side setting and dog-friendly outdoor seating, serving burgers and pub-style food with vegan options, plus upstairs space for private functions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/brick-lane-eatery/", "http://blect.co.za/contact.html", "https://www.tripadvisor.com/Restaurant_Review-g4464136-d10028731-Reviews-Brick_Lane_Eatery-Century_City_Western_Cape.html"]'
WHERE slug = 'brick-lane-eatery-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Build It Bothasig is a hardware and building materials store, part of the Build It retail chain, located within Bothasig Square in Bothasig.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 08:00-14:30, Sun 09:00-13:00',
    source_urls = '["https://www.buildit.co.za/Stores/View/Build-it-Bothasig-Western-Cape", "https://za.africabz.com/western-cape/build-it-bothasig-110717", "https://www.tiendeo.co.za/stores/cape-town/build-it-shoprite-centre-vryburger-avenue-bothasig/16501"]'
WHERE slug = 'build-it-bothasig-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CCI Technology Solutions is an IT infrastructure and networking company founded in 1986, specialising in structured data cabling, fibre optics, wireless networks and electrical/power solutions, operating from its Ndabeni office.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/ndabeni/data-communication-systems-equipment/c-c-i-technology-solutions", "https://cci.co.za/contact-us/", "https://cci.co.za/about-us/"]'
WHERE slug = 'cci-technology-solutions-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caltex Cobble Walk is a 24-hour fuel station located within Cobble Walk Shopping Centre in Durbanville.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.localstore.co.za/map/49740/caltex-service-station/durbanville/", "https://www.cylex.net.za/company/freshstop-at-caltex-cobblewalk-23684406.html", "https://durbanvillehub.com/directory/local-services/caltex-cobblewalk"]'
WHERE slug = 'caltex-cobble-walk-durbanville' AND description_enriched_at IS NULL;

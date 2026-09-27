-- Job 4: description enrichment sweep, batch 2 of 3 (10 businesses)
UPDATE businesses
SET description = 'TimBuild Somerset West is an independent hardware and building-materials store at the corner of Reitz and Victoria Streets in Somerset West, stocking general hardware, tools, timber and home-improvement supplies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://timbuildsomersetwest.co.za/", "https://www.hardware1000.com/ZA/Somerset-West/111768537832294/TimBuild-Somerset-West", "https://www.helderberg.biz/timbuild--somerset-west-7151.html"]'
WHERE slug = 'timbuild-somerset-west-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unframed Ice Cream is an artisanal ice-cream maker in the Woodstock Quarter on Sir Lowry Road, known for adventurous small-batch flavours, including vegan and dairy options such as blue coconut and dirty milk chocolate.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 11:00-16:00',
    source_urls = '["https://www.woodstockquarter.co.za/tenant-directory/eateries/unframed-ice-cream", "https://za.africabz.com/western-cape/unframed-ice-cream-286095", "https://www.eatout.co.za/venue/unframed-ice-cream-woodstock/", "https://crushmag-online.com/unframed-ice-cream-why-this-is-ice-cream-done-right/"]'
WHERE slug = 'unframed-ice-cream-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Utopia Dining Elevated is a rooftop fine-dining restaurant 15 floors up in the Mirage Building on Chiappini Street, De Waterkant, serving breakfast, lunch and dinner with panoramic 360-degree views over the Cape Town city bowl and harbour.',
    description_enriched_at = datetime('now'),
    hours = 'Daily breakfast 06:30-10:30, Mon-Sat lunch/dinner 12:00-23:00',
    source_urls = '["https://www.therooftopguide.com/rooftop-bars-in-cape-town/utopia-dining-elevated.html", "https://dbd.directory/business-directory/utopia-cape-town/", "https://www.utopiacapetown.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g1722390-d15582070-Reviews-Utopia_Dining_Elevated-Cape_Town_Western_Cape.html"]'
WHERE slug = 'utopia-dining-elevated-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vergenoegd Löw Wine Estate is a historic wine farm on Faure Road dating back to 1820, known for its daily parade of Indian Runner ducks and geese through the vineyards and for wine tastings, dining and boutique accommodation on the estate.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 10:00-17:00 (tasting room)',
    source_urls = '["https://vergenoegd.co.za/contact-us/", "https://www.africanadvice.com/1107275/Wine_Estates/Western_Cape/Faure_Wine_Farm/", "https://wineroute.co.za/wineries/vergenoegd-low-wine-estate/", "https://insideguide.co.za/cape-town/vergenoegd-low/"]'
WHERE slug = 'vergenoegd-low-wine-estate-faure' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Virgin Active Sun Valley is a health club inside Sun Valley Mall offering a gym, swimming pool and group fitness classes for the Sun Valley and Noordhoek area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat-Sun 06:00-20:00',
    source_urls = '["https://southafricafirm.com/western-cape/virgin-active-sun-valley-10366", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=394733", "https://www.virginactive.co.za/gyms/sun-valley"]'
WHERE slug = 'virgin-active-sun-valley-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy at Strand Square is a branch of the national family-restaurant chain, serving breakfasts, burgers and light meals from its Shop 1 unit on Mills Street.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30, Sat 07:30-15:00, Sun & Public Holidays 08:00-14:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1236998-d17518496-Reviews-Wimpy-Strand_Western_Cape.html", "https://crave.co.za/establishment.asp?est=17923", "https://locations.wimpy.co.za/restaurants-StrandSquare-WimpyStrand"]'
WHERE slug = 'wimpy-strand-square-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths at Mountain View Shopping Centre is a supermarket branch of the national chain, on the corner of Avondrus Street and Sir Lowry''s Pass Road in Gordon''s Bay.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Wed & Fri 08:00-19:00, Thu 09:00-18:00, Sat 08:30-13:30',
    source_urls = '["https://za.africabz.com/western-cape/woolworths-gordons-bay-33493", "https://www.gordonsbayonline.co.za/item/woolworths-gordons-bay/", "https://my-catalogue.co.za/stores/gordon-s-bay/woolworths/corner-of-sir-lowry-pass-avonrus-street"]'
WHERE slug = 'woolworths-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths at Lifestyle on Kloof is a supermarket branch of the national chain, inside the LifeStyle Centre on Kloof Street in Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon,Tue,Thu,Fri 08:00-19:00, Wed & Sun 08:00-17:00, Sat 08:00-18:00',
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/woolworths/lifestyle-centre-50-kloof-st", "https://www.gps-data-team.com/where/south_africa/store_locator/Woolworths-ZA/Woolworths-Kloof-Street.html", "https://www.lifestyleonkloofct.co.za/directory/woolworths/"]'
WHERE slug = 'woolworths-lifestyle-on-kloof-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food at Strand Square is a supermarket branch of the national chain, in the Strand Square shopping centre on Fagan Street, Strand.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food at Sitari Village is a supermarket branch of the national chain, inside the Sitari Village Centre in Croydon.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-sitari-croydon' AND description_enriched_at IS NULL;

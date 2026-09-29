UPDATE businesses
SET description = 'CP&B Cape Plumbing & Bathroom Supplies Somerset West is a branch of the Cape Plumbing & Bathroom Supplies retail chain, stocking plumbing fittings and bathroom fixtures from its Gants Plaza showroom in Somerset West.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:45, Sat 08:00-12:30, Sun Closed',
    source_urls = '["https://www.cpandb.co.za/store/somerset.west", "https://za.africabz.com/western-cape/cpb-cape-plumbing-bathroom-supplies-somerset-west-134191", "https://www.openhours-southafrica.com/en/cape-town/cp-b-cape-plumbing-bathroom-supplies-somerset-west"]'
WHERE slug = 'cpb-cape-plumbing-bathroom-supplies-somerset-west-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eagle Lighting Somerset West is a branch of the Eagle Lighting chain, selling lighting fixtures and accessories from its showroom at the Somerset Decor Centre on Jigger Avenue.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/eagle-lighting-somerset-west-114702", "https://www.eaglelighting.co.za/contact-us/", "https://hoursfinder.com/e-hours/eagle-lighting-somerset-west-trading-hours.html"]'
WHERE slug = 'eagle-lighting-somerset-west-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Engel & Völkers Somerset West is the local office of the international real estate franchise, with agents serving property buyers, sellers and renters across Somerset West, Strand and Gordons Bay in the Helderberg region.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.engelvoelkers.com/za/en/shops/somerset-west", "https://property.mg.co.za/estate-agency/engel-volkers-somerset-west/35113", "https://www.engelvoelkers.com/za/en/real-estate-agent/western-cape/cape-town/somerset-west"]'
WHERE slug = 'engel-volkers-somerset-west-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Tekkie Somerset West is a branch of the Mr Tekkie footwear chain, stocking branded sneakers, shoes and apparel from its store in the Somerset West Value Centre.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/mr-tekkie-somerset-west-285651", "https://www.mrtekkie.co.za/find-a-store/", "https://www.facebook.com/Mr.Tekkie/videos/mr-tekkie-somerset-west-value-centre/2360665900883979/"]'
WHERE slug = 'mr-tekkie-somerset-west-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Party Time Somerset West, based in Fountain Square, hires out jumping castles, waterslides, popcorn and candyfloss machines, and bubble and smoke machines and party lighting, and also stocks sweets, balloons, party packs and personalised birthday cakes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/party-time-somerset-west-224518", "https://bormandumazitha.co.za/party-time-14471519603638278806/", "https://partytimesomersetw.wixsite.com/partytimessw/about_us"]'
WHERE slug = 'party-time-somerset-west-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Virgin Active Steenberg is a full-service health club in Westlake Business Park with two heated swimming pools, a Mind Body Studio for yoga and Pilates, a cycle studio, a dance/boxing/HIIT studio, a cardio and functional training zone, saunas and steam rooms, and free underground parking for members.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/virgin-active-steenberg-26206", "https://za.gymcity.info/virgin-active-steenberg-1544438", "https://www.virginactive.co.za/gyms/steenberg"]'
WHERE slug = 'virgin-active-steenberg-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'iStore Somerset West is an Apple premium reseller in Somerset Mall, selling iPhones, Macs, iPads and Apple Watches alongside Apple-certified repairs, technical support and in-store training on new devices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-19:00',
    source_urls = '["https://www.istore.co.za/storelocator/somerset", "https://za.africabz.com/western-cape/istore-somerset-west-38422", "https://www.somersetmall.co.za/shop/istore"]'
WHERE slug = 'istore-somerset-west-somerset-west' AND description_enriched_at IS NULL;

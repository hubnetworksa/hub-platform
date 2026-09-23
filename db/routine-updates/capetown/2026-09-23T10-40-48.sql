-- Job 4: description enrichment sweep, full backlog (7 businesses)
UPDATE businesses
SET description = 'Aqua Spares is a motor spares business in Steenberg supplying new and used car parts for a range of makes including Audi, BMW, Ford and Toyota, trading since 2011.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/SparePartsAqua/", "https://aquaspares.co.za/contact-us/", "https://aquaspares.co.za/about-us/"]'
WHERE slug = 'aqua-spares-steenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BP Rocklands Service Station is a 24-hour fuel station on the corner of Caravelle Street and Handley-Page in Rocklands, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'bp-rocklands-service-station-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beantree Cafe is a family-friendly cafe inside Spar Strandfontein serving hand-crafted burgers, slow-cooked ribs and coffee brewed from Lavazza beans.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/people/Beantree-Caf%C3%A8-Strandfontein/100095012896231/", "https://restaurantguru.com/Beantree-Cafe-at-Spar-Strandfontein-Cape-Town", "https://beantreehttpscafedigital.lovable.app/"]'
WHERE slug = 'beantree-cafe-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Blocks Boutique is a barbershop in Steenberg offering men''s haircuts, hot towel shaves, head shaves and beard trims.',
    description_enriched_at = datetime('now')
WHERE slug = 'blocks-boutique-steenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hungry Lion Steenberg is a fried chicken and fast-food outlet in Steenberg Centre, part of the Hungry Lion chain serving fried chicken, burgers and family meals since 1997.',
    description_enriched_at = datetime('now')
WHERE slug = 'hungry-lion-steenberg-steenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A neighbourhood hardware and gas supplier on Dennegeur Avenue in Strandfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'strandfontein-gas-and-hardware-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wavecrest Pharmacy is an Alpha Pharm franchise pharmacy in Wavecrest Plaza, Strandfontein.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-21:00, Sun 10:00-13:00',
    source_urls = '["https://www.brabys.com/za/western-cape/mitchells-plain/strandfontein/pharmacies/wavecrest-pharmacy", "https://www.cylex.net.za/company/wavecrest-pharmacy-17505953.html", "https://www.sayellow.com/view/south-africa/alpha-pharm-wavecrest-pharmacy-in-strandfontein"]'
WHERE slug = 'wavecrest-pharmacy-strandfontein' AND description_enriched_at IS NULL;

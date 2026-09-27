-- Job 4: description enrichment sweep, batch 2 of 2 (7 records)

UPDATE businesses
SET description = 'Mouille Point Village is a self-catering apartment complex on Beach Road in Mouille Point offering studio, one-, two-, and three-bedroom units with sea, Signal Hill, or Lion''s Head views and an on-site swimming pool.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mouillepoint.com/contact/", "https://www.booking.com/hotel/za/mouille-point-village.en-gb.html", "https://www.rhinoafrica.com/en/accommodation/mouille-point-village-apartment/24954"]'
WHERE slug = 'mouille-point-village-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sapphire Spa is a wellness spa at Romney Park in Green Point offering five treatment rooms, a hydrotherapy tub, a flotation tank, and treatments including IPL and microdermabrasion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.romneypark.co.za/contact", "https://www.myguidecapetown.com/wellness/romney-park-spa", "https://www.tripadvisor.in/ShowUserReviews-g312659-d624383-r121594771-Romney_Park-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'sapphire-spa-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shift Espresso Bar is a specialty coffee shop on Main Road in Green Point, established in 2014 and known for signature espresso drinks in an industrial-style interior.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 06:00-18:00, Sun 07:00-15:00',
    source_urls = '["https://www.capetownmagazine.com/shift-espresso-bar", "https://www.dining-out.co.za/md-menu/Shift-Espresso-Bar-Green-Point/9225", "https://www.shiftespresso.com/"]'
WHERE slug = 'shift-espresso-bar-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Son of a Butcher & Deli is a butchery and deli on Regent Road in Sea Point specialising in Wagyu beef, dry-aged free-range beef, Karoo lamb, and pasture-raised poultry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-18:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/son-of-a-butcher-279674", "https://www.ubereats.com/za/store/son-of-a-butcher-%26-deli-sea-point/bQlKx49bQkOF0XTyRVaq6Q", "https://opening-hours.co.za/0796106/Son_of_a_Butcher"]'
WHERE slug = 'son-of-a-butcher-and-deli-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tawa Massage Therapy is a massage therapy practice on Regent Road in Sea Point offering sports massage and full-body massage treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://tawamassage.com/", "https://www.thespaguide.co.za/listing/cape-town/sports-massage/tawa-massage-therapy-sports-massage/", "https://www.tripadvisor.com/Attraction_Review-g312659-d21365065-Reviews-Tawa_Massage_Therapy-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'tawa-massage-therapy-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Mussel Monger & Oyster Bar is a seafood stall inside Mojo Market in Sea Point specialising in fresh oysters and mussels sourced from the West Coast and Saldanha Bay, served with champagne pairings.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 11:00-22:00, Fri-Sat 11:00-23:00',
    source_urls = '["https://themusselmonger.co.za/contact-us/", "https://mojomarket.co.za/vendors/the-mussel-monger", "https://www.capetourism.com/mojo-market/"]'
WHERE slug = 'mussel-monger-oyster-bar-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vagabond Kitchens is an all-day cafe in Sea Point serving burgers, tapas, and vegan and vegetarian dishes, with a weekday happy hour on tapas and coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:00-19:45',
    source_urls = '["https://www.vagabondkitchens.co.za/vagabond-kitchens-sea-point/", "https://www.eatout.co.za/venue/vagabond-kitchens-sea-point/", "https://restaurantguru.com/amp/Vagabond-Kitchens-Cape-Town-4"]'
WHERE slug = 'vagabond-kitchens-sea-point' AND description_enriched_at IS NULL;

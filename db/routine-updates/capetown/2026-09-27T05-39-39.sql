-- Job 4: description enrichment sweep (batch of 9 -- full backlog this run)

UPDATE businesses
SET description = '61 On Camps Bay is a three-star luxury guest house with seven en-suite bedrooms -- several with sea-facing patios, others pool-facing with a kitchenette -- built around an outdoor plunge pool and terrace with panoramic Atlantic views, a short walk from Camps Bay beach.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.61oncampsbay.co.za/contact/contact-us/", "https://www.sa-venues.com/visit/61oncampsbaydrive/", "https://www.tripadvisor.com/Hotel_Review-g312658-d2176298-Reviews-61_On_Camps_Bay-Camps_Bay_Western_Cape.html"]'
WHERE slug = '61-on-camps-bay-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bantry Bay International Vacation Resort offers fully self-contained, serviced apartments -- from studio units to three-bedroom duplexes -- set on the rocks above the Atlantic, with a sun deck and swimming pool just above the surf.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://bantrybayinternational.co.za/", "https://www.africanadvice.com/1029253/Pleasure_Resorts/Cape_Town/Bantry_Bay_International_Vacation_Resort/", "https://www.tripadvisor.com/Hotel_Review-g312654-d1799954-Reviews-Bantry_Bay_International_Vacation_Resort-Bantry_Bay_Western_Cape.html"]'
WHERE slug = 'bantry-bay-international-vacation-resort-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bo-Vine Wine & Grill House is a premium steak restaurant and wine bar in The Promenade, Camps Bay, serving grilled steaks, fresh seafood and local wines alongside an intimate cocktail lounge, The Attic by Bo-Vine.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-23:00, Sun 12:00-22:00',
    source_urls = '["https://www.capetownetc.com/things-to-do-cape-town/cooking-the-perfect-steak-with-bo-vine-in-camps-bay/", "https://www.bovinegrillhouse.com/campsbay", "https://www.eatout.co.za/venue/bo-vine-wine-grill-house-2/"]'
WHERE slug = 'bo-vine-wine-grill-house-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Camps Bay Haute Coiffure is a ladies'' hair salon in The Promenade, Camps Bay, offering colouring, balayage, highlights, extensions and braiding for both Caucasian and ethnic hair, along with Brazilian and hair-Botox smoothing treatments.',
    description_enriched_at = datetime('now')
WHERE slug = 'camps-bay-haute-coiffure-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Compass House is an adults-only boutique hotel on Kloof Road in Bantry Bay with 15 individually decorated suites, a 20-metre infinity pool overlooking the Atlantic, and on-site breakfast, dining and concierge services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.compasshouse.co.za/", "https://www.sa-venues.com/visit/compasshouse/", "https://www.tripadvisor.com/Hotel_Review-g312654-d1384351-Reviews-Compass_House_Boutique_Hotel-Bantry_Bay_Western_Cape.html"]'
WHERE slug = 'compass-house-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Finchley Guest House is a six-room guesthouse in Camps Bay with views of the Twelve Apostles and the Atlantic, offering air-conditioned en-suite rooms, a terrace and garden with an outdoor pool, and a cooked breakfast.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.finchleyguesthouse.com/", "http://www.finchleyguesthouse.com/contact/", "https://www.sa-venues.com/visit/finchleyhouse/"]'
WHERE slug = 'finchley-guest-house-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morea House, Autograph Collection is a 90-room hotel on the Camps Bay beachfront and part of Marriott Bonvoy''s Autograph Collection, featuring the Lebanese-inspired Omri restaurant, poolside dining, a rooftop pool and the Morea House Spa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.marriott.com/en-us/hotels/cptck-morea-house-autograph-collection/overview/", "https://www.luxurylifestylemag.co.uk/travel/hotel-review-morea-house-autograph-collection-cape-town-in-south-africa/", "https://www.hospitalitynet.org/announcement/41013767.html"]'
WHERE slug = 'morea-house-autograph-collection-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Bay Hotel is a 78-suite hotel directly on the Camps Bay beachfront at 69 Victoria Road, with multiple swimming pools, a spa, a gym and paddle courts, set against the backdrop of Table Mountain.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thebayhotel.com/", "https://www.tripadvisor.com/Hotel_Review-g312658-d302905-Reviews-The_Bay_Hotel-Camps_Bay_Western_Cape.html", "https://www.booking.com/hotel/za/the-bay.html"]'
WHERE slug = 'the-bay-hotel-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Marly Boutique Hotel & Spa is a 38-room five-star hotel on the Camps Bay promenade between the Twelve Apostles and the beach, with mountain- and sea-facing suites, a boutique spa, gym and the rooftop pool bar and lounge, Baptiste.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.themarly.co.za/", "https://www.sa-venues.com/visit/themarly/", "https://www.themarly.co.za/facilities/"]'
WHERE slug = 'the-marly-camps-bay' AND description_enriched_at IS NULL;

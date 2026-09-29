UPDATE businesses
SET description = 'A guesthouse in a 1920s-remodelled house on Belvedere Avenue in Oranjezicht, overlooking Cape Town''s oldest reservoir with views across the city to Table Bay. Rooms are en-suite with air conditioning and complimentary Wi-Fi, and guests have use of a lounge, balcony seating and an honesty bar.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thefolly.co.za/about/", "https://www.hotelplanner.com/Hotels/311405/Reservations-Belvedere-Folly-Cape-Town-43-Belvedere-Ave-8001", "https://www.roomsforafrica.com/establishment.do?id=31364"]'
WHERE slug = 'belvedere-folly-oranjezicht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A physiotherapy and Pilates practice in Vredehoek operating since 2006, offering physiotherapy, Pilates and massage treatment with a team of physiotherapists taking an integrated approach to treatment, rehabilitation and long-term wellbeing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/catherinechambersphysio/", "https://za.africabz.com/western-cape/catherine-chambers-physio-pilates-27390", "https://samedicalspecialists.co.za/physiotherapist/western-cape/cape-town/vredehoek/catherine-chambers/"]'
WHERE slug = 'catherine-chambers-physiotherapy-pilates-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A veterinary clinic in Vredehoek offering full health checkups plus surgical and medical care with in-house hospital admission, and stocking prescription veterinary food ranges and other pet-care products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/vredehoek/veterinary-clinics-hospitals/city-vet-gardens", "https://za.africabz.com/western-cape/citi-vet-gardens-265479", "https://citivetgardens.co.za/"]'
WHERE slug = 'citivet-gardens-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A dental practice in Tamboerskloof offering family, aesthetic and holistic dentistry, including teeth whitening, teeth cleaning, dental bridges, extractions and root canals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon, Wed, Fri 08:00-16:30',
    source_urls = '["https://www.capedentist.co.za/contact-us/", "https://www.yep.co.za/biz/store/iyp/6342527_3", "https://www.recomed.co.za/dentist/cape-town/uwe-esdar/"]'
WHERE slug = 'dr-uwe-esdar-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A flower shop, pantry and cafe in Vredehoek selling fresh flowers and bouquets alongside coffee, pastries and a range of nuts and dried goods, with online bouquet ordering and delivery across greater Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-flower-supply-co-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A small, intimate yoga studio in Oranjezicht that has operated since 1999, offering classes rooted in the classical, traditional practice of yoga for students of varying levels.',
    description_enriched_at = datetime('now')
WHERE slug = 'oranjezicht-yoga-centre-oranjezicht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Victorian-era guesthouse built in 1894 in Tamboerskloof at the foot of Table Mountain, with individually decorated rooms, a piano lounge, a garden with a pool, and a sun deck with views of Table Mountain, a short walk from Kloof Street.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.trevoyan.co.za/contact/", "https://www.odunion.com/business-directory/profile/21/the-trevoyan-guesthouse", "https://www.trevoyan.co.za/our-place/"]'
WHERE slug = 'trevoyan-guesthouse-tamboerskloof' AND description_enriched_at IS NULL;

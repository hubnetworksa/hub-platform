UPDATE businesses
SET description = 'Danneberg Optometrist has operated in Cape Town since 1987, providing comprehensive eye exams, contact lens fittings, retinal photography and glaucoma screening from its store in Riverside Mall.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallguide.co.za/shops/view/44695/riverside-mall-rondebosch/danneberg-optometrist", "https://za.africabz.com/western-cape/danneberg-optometrist-160416", "https://danneberg.vision/"]'
WHERE slug = 'danneberg-optometrist-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eden Beauty Collection is a boutique hair and beauty salon in Rondebosch East offering hair styling, manicures, pedicures, lash treatments and laser hair removal in an upmarket, relaxed setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-17:30, Sun Closed'
WHERE slug = 'eden-beauty-collection-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MTN Store is a mobile network retailer inside Riverside Mall, Rondebosch, offering MTN devices, contracts and digital services.',
    description_enriched_at = datetime('now')
WHERE slug = 'mtn-store-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medindi Manor is a boutique guesthouse in a Victorian home built in the late 1890s in Rosebank, offering luxury, superior and standard rooms around a tropical garden with an outdoor pool, and breakfast served daily on the veranda.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medindimanor.com/contact-us", "https://www.sa-venues.com/visit/medindimanor/", "https://www.tripadvisor.com/Hotel_Review-g2427350-d624424-Reviews-Medindi_Manor-Rosebank_Western_Cape.html"]'
WHERE slug = 'medindi-manor-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sure 2 Travel is the Rondebosch branch of Sure Travel, a long-established Southern African travel agency network and a member of ASATA that is licensed by IATA, offering flight, accommodation, car hire and travel insurance bookings from Riverside Mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'sure-2-travel-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Italian Art Shop, also known as The Canvas Company, supplies artist-quality painting and art materials from Riverside Mall, Rondebosch, and is the sole South African importer of several leading international art-material brands; it also runs painting and drawing classes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'the-italian-art-shop-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vitacare Pharmacy is a pharmacy inside Riverside Mall, Rondebosch, part of the Vitacare Group network, offering dispensing and general pharmacy services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-18:00, Fri 08:00-12:45 & 14:00-18:00, Sat 08:00-14:00, Sun 09:00-13:00',
    source_urls = '["https://www.yep.co.za/biz/store/vitacare-pharmacies/149917", "https://za.readymap.info/4/208", "https://www.vitacaregroup.co.za/"]'
WHERE slug = 'vitacare-pharmacy-rondebosch' AND description_enriched_at IS NULL;

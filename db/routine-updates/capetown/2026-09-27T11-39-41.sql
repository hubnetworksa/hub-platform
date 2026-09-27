-- Job 4: description enrichment sweep -- full backlog of 8 businesses
-- (arambrook-boutique-hotel-bishopscourt through tai-chi-restaurant-tokai)

UPDATE businesses
SET description = 'Arambrook Boutique Hotel is a boutique hotel converted from a large Cape Town family home, offering en-suite rooms with soaking tubs and Smart TVs alongside a pool, garden and on-site restaurant, in Bishopscourt. Its well-manicured grounds sit within easy reach of Kirstenbosch Gardens and Constantia.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.expedia.com/Cape-Town-Hotels-Arambrook-Boutique-Hotel.h32442732.Hotel-Information", "https://arambrook.co.za/", "https://www.tripadvisor.com/Hotel_Review-g1722390-d15618272-Reviews-Arambrook_Boutique_Hotel-Cape_Town_Western_Cape.html"]'
WHERE slug = 'arambrook-boutique-hotel-bishopscourt' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Canterbury House is a guesthouse in Bishopscourt offering B&B rooms and a self-catering cottage option, with guest use of a swimming pool, floodlit tennis court, snooker room and pub. It is a short drive from Kirstenbosch Gardens and the Cavendish Square shopping centre.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.afristay.com/p/2231", "https://www.canterburyhouse.co.za/contact.php", "https://www.canterburyhouse.co.za/accommodation.php"]'
WHERE slug = 'canterbury-house-bishopscourt' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Prospur Pharmacy is a pharmacy branch inside Prospur Shopping Centre in Plumstead, offering dispensing and everyday health and beauty retail.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-18:00, Wed 09:00-18:00, Thu-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'clicks-prospur-pharmacy-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Intrinsic Hair & Beauty is a women-owned hair salon in Prospur Centre, Plumstead, offering Joico-based colour services including LumiShine highlights and grey coverage alongside beauty treatments such as pedicures, brow shaping and waxing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-15:00, Sun Closed'
WHERE slug = 'intrinsic-hair-and-beauty-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JEM Hair and Beauty Studio is a hair and beauty salon in 3 Arts Village, Plumstead, offering hair treatments such as Hair Botox and Mycro Keratin alongside waxing, lash extensions, facials and nail services.',
    description_enriched_at = datetime('now')
WHERE slug = 'jem-hair-and-beauty-studio-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kwikspar Prospur is a supermarket inside Prospur Shopping Centre in Plumstead, stocking groceries and everyday essentials for the surrounding neighbourhood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-21:00, Sun 08:00-21:00'
WHERE slug = 'kwikspar-prospur-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumstead Fisheries is a fish and chips takeaway on Main Road in Plumstead, next to the Checkers Centre, known for dishes such as hake, snoek and calamari served with chips.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/plumstead-fisheries-41339", "https://www.callupcontact.com/b/business/Plumstead_Fisheries/53508", "https://www.tripadvisor.co.za/Restaurant_Review-g6776488-d12381066-Reviews-Plumstead_Fisheries-Plumstead_Western_Cape.html"]'
WHERE slug = 'plumstead-fisheries-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tai Chi Restaurant is a sushi, Chinese and Japanese restaurant in Forest Glade House on Tokai Road, known for its extensive half-price sushi menu available for sit-down dining alongside its regular light meals menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-21:30, Sun 11:00-21:00'
WHERE slug = 'tai-chi-restaurant-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ackermans is a fashion, footwear and homeware retail chain, with a branch inside Mandalay Mall in Mandalay, Khayelitsha.',
    description_enriched_at = datetime('now')
WHERE slug = 'ackermans-mandalay-mandalay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lotus River Community Health Centre is a public health facility on the corner of Delia and Anita Roads, offering general clinic and dental clinic services to the Lotus River community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30',
    source_urls = '["https://2pos.co.za/2/11088", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=94766", "https://www.westerncape.gov.za/health-wellness/facility/lotus-river-cdc"]'
WHERE slug = 'lotus-river-community-health-centre-lotus-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lotus River Primary School is a public primary school on the corner of Lake Road and 5th Avenue, serving around 600 learners with about 20 teaching staff on the CAPS curriculum.',
    description_enriched_at = datetime('now')
WHERE slug = 'lotus-river-primary-school-lotus-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Noormed Pharmacy is a retail pharmacy on the corner of Klip and Zeekoevlei Roads in Lotus River, open seven days a week including Sunday mornings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-18:00, Sun 09:00-14:00',
    source_urls = '["https://www.brabys.com/za/western-cape/grassy-park/lotus-river/pharmacies/noormed-pharmacy", "https://www.searchinafrica.com/business/3441998/south-africa/western-cape/grassy-park/lotus-river/zeekoevlei-rd/pharmacies/noormed-pharmacy", "https://www.africabizinfo.com/ZA/noormed-pharmacy-021-705-5278"]'
WHERE slug = 'noormed-pharmacy-lotus-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Mandalay is a supermarket branch of the Shoprite chain, trading inside Mandalay Mall in Mandalay, Khayelitsha.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-mandalay-mandalay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy is a national courier and parcel-delivery company, operating a service kiosk inside Khaya Corner in Mandela Park, Khayelitsha.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'the-courier-guy-mandela-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Spade Boutique Hotel is a 13-suite four-star boutique hotel and spa in Mandela Park, Khayelitsha, reported as South Africa''s first four-star boutique hotel located in a township, with a heated outdoor pool, gym, spa, restaurant and bar, and shuttle service.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thespadeboutiquehotel.co.za/contact-us/", "https://www.tripadvisor.com/Hotel_Review-g2427234-d23829371-Reviews-The_Spade_Boutique_Hotel_And_Spa-Khayelitsha_Western_Cape.html", "https://www.news24.com/citypress/trending/the-spade-boutique-hotel-an-oasis-in-khayelitsha-township-20220501"]'
WHERE slug = 'the-spade-boutique-hotel-mandela-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zeekoevlei High School is a public secondary school on 7th Avenue in Lotus River, offering secondary education to the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'zeekoevlei-high-school-lotus-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nibbly Bits is a gourmet food and gift shop in Cape Quarter, De Waterkant, selling handmade biscuits, cakes, dried fruit, nuts and preserves.',
    description_enriched_at = datetime('now')
WHERE slug = 'nibbly-bits-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nicol Coachworks is a panelbeating and spray-painting workshop in Diep River, approved by SAMBRA and several major insurers, with a five-year workmanship guarantee.',
    description_enriched_at = datetime('now')
WHERE slug = 'nicol-coachworks-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Norval Foundation is an art museum and sculpture garden in Tokai, showcasing modern and contemporary art from Africa and its diaspora through curated exhibitions.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Sat 10:00-17:00, Sun 10:00-16:00, Mon-Tue Closed'
WHERE slug = 'norval-foundation-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Minimark Eversdal is a neighbourhood convenience store in Eversdal, Cape Town, serving everyday grocery needs.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-minimark-eversdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean Basket is a seafood restaurant in Victoria Wharf Shopping Centre, V&A Waterfront, part of the Ocean Basket chain known for fresh fish and seafood platters.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.findmy.co.za/food/category-detail/ocean-basket-vanda-waterfront/22769", "https://restaurants-in-cape-town.co.za/restaurants/ocean-basket-va-waterfront/", "https://www.waterfront.co.za/eat-and-drink/ocean-basket"]'
WHERE slug = 'ocean-basket-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean Basket Durbanville is a seafood restaurant in The Village Square, Durbanville, part of the Ocean Basket chain known for fresh fish and seafood platters.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-basket-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean Fresh Fisheries is a fish and chips takeaway and dine-in restaurant in Kraaifontein, also serving gatsbys and steaks.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-fresh-fisheries-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palette Art Gallery is an art gallery in Cape Quarter, De Waterkant, showing paintings and bronze sculptures by South African artists.',
    description_enriched_at = datetime('now')
WHERE slug = 'palette-art-gallery-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Panorama Dental is a dental practice at 32 Dorp Street, Panorama, offering general dentistry services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'panorama-dental-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Paranga is a beachfront restaurant in The Promenade, Camps Bay, part of the Kove Collection, serving Mediterranean-inspired seafood, sushi and grilled dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-21:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312658-d1051395-Reviews-Paranga-Camps_Bay_Western_Cape.html", "https://www.dining-out.co.za/md/Paranga/2742", "https://www.kovecollection.co.za/paranga/"]'
WHERE slug = 'paranga-camps-bay' AND description_enriched_at IS NULL;

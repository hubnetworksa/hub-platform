UPDATE businesses
SET description = 'Anatoli has served Turkish and Mediterranean cuisine on Napier Street since 1984, housed in a Victorian warehouse building dating to 1904. It is a dinner-only restaurant, in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 18:00-22:30, Sun Closed',
    source_urls = '["https://www.eatout.co.za/venue/anatoli-turkish-restaurant/", "https://www.sluurpy.co.za/cape-town-central/restaurant/4731424/anatoli-turkish-restaurant", "https://www.food-blog.co.za/anatoli/"]'
WHERE slug = 'anatoli-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Belly of the Beast is a 30-seat set-menu restaurant on Harrington Street offering a single nightly tasting menu that changes every six to eight weeks based on seasonal, sustainably farmed ingredients, with fish and vegetable options alongside its meat-forward menu. Bookings are online only, with a deposit required.',
    description_enriched_at = datetime('now'),
    hours = 'Lunch seating 12:30, Dinner seating 18:45 (booking required)',
    source_urls = '["https://www.theinfatuation.com/cape-town/reviews/belly-of-the-beast", "https://www.dineplan.com/restaurants/belly-of-the-beast", "https://insideguide.co.za/cape-town/restaurants/belly-of-the-beast/"]'
WHERE slug = 'belly-of-the-beast-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Menara is a Moroccan restaurant on Harrington Street serving traditional North African dishes across breakfast, lunch and dinner.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-23:00, Sun 09:00-22:00',
    source_urls = '["https://southafricafirm.com/western-cape/la-menara-35050", "https://www.tripadvisor.co.za/Restaurant_Review-g1722390-d23412802-Reviews-La_Menara-Cape_Town_Western_Cape.html", "https://hungryforhalaal.co.za/listing/la-menara-cape-town-cbd/"]'
WHERE slug = 'la-menara-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Petite Tarte is a French-style sidewalk cafe inside Cape Quarter, known for homemade sweet and savoury tarts and a menu of Mariage Freres teas.',
    description_enriched_at = datetime('now')
WHERE slug = 'la-petite-tarte-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rapt is a chocolate cafe on Buitenkant Street offering nitrogen ice cream, choc-o-lattes and a build-your-own chocolate bar alongside pastries and hot and cold drinks.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-18:00, Tue-Sat 09:00-21:00, Sun 09:00-16:00'
WHERE slug = 'rapt-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'San Julian Taco & Tequila is a Mexican restaurant on Rose Street serving tacos, ceviche and other Mexican dishes alongside a tequila-focused cocktail menu.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://foursquare.com/v/san-julian-taco--tequila/4c1a77d7624b9c74ab6e1204", "https://vymaps.com/ZA/San-Julian-Taco-Tequila-220176658338732/", "https://mediagourmand.wordpress.com/2013/09/28/san-julian-taco-and-tequila-authentic-mexican-in-cape-town/"]'
WHERE slug = 'san-julian-taco-tequila-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Piano Bar is a New York-inspired live-music venue on Napier Street featuring nightly performances spanning jazz, blues, folk and indie-pop, alongside cocktails, tapas and a rooftop terrace.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/the-piano-bar-1715", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d3808039-Reviews-The_Piano_Bar_Cape_Town-Cape_Town_Central_Western_Cape.html", "https://www.capetownmagazine.com/piano-bar"]'
WHERE slug = 'the-piano-bar-de-waterkant' AND description_enriched_at IS NULL;

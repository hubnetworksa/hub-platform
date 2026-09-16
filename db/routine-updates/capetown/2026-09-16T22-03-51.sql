UPDATE businesses
SET description = 'Barr''s Pharmacy is an A-graded pharmacy on Long Street offering free medicine delivery within the Cape Town CBD on weekdays, plus an after-hours emergency line.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 08:30-13:00',
    source_urls = '["https://nearfinderza.com/en/business/wc/cape-town/pharmacies/barr-s-pharmacy_142575+4.html", "https://opening-hours.co.za/04113056/Barr''s_Pharmacy", "https://www.capetownmagazine.com/pharmacy-cbd"]'
WHERE slug = 'barrs-pharmacy-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Puka is a neighbourhood coffee shop and restaurant on the corner of Brunswick and Tamboerskloof Roads, serving breakfast, lunch and coffee with both indoor and outdoor seating.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-18:00',
    source_urls = '["https://nearbyza.com/place/cafe-puka-1", "http://www.cafepuka.co.za/", "https://www.capetownmagazine.com/caf%C3%A9-puka-cape-town"]'
WHERE slug = 'cafe-puka-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Hollow Boutique Hotel is a 4-star hotel that has operated on Queen Victoria Street since 2003, offering mountain-facing and standard rooms plus its own restaurant, Eighty-Ate, a short walk from the Company''s Garden.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotelplanner.com/Hotels/218934/Reservations-Cape-Town-Hollow-Boutique-Hotel-Cape-Town-88-Queen-Victoria-St-Gardens-8001", "https://www.capetownhollow.com/contact/", "https://www.capetownhollow.com/about/"]'
WHERE slug = 'cape-town-hollow-boutique-hotel-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clarke''s Bar and Dining Room is a Bree Street restaurant and bar known for its all-day breakfasts, signature cheeseburger and classic cocktails, popular for weekend brunch.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 07:00-18:00, Wed-Fri 07:00-late, Sat 08:00-15:00',
    source_urls = '["https://www.waze.com/live-map/directions/za/wc/cape-town/clarkes-bar-and-dining-room?to=place.ChIJnTuF52VnzB0RTGAL7oSEWTU", "https://www.capetownccid.org/explore/eat/clarkes-bar-and-dining-room", "https://www.eatout.co.za/venue/clarkes-bar-and-dining-room/"]'
WHERE slug = 'clarkes-bar-dining-room-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clarke''s Bookshop is a secondhand and antiquarian bookshop on Long Street, founded in 1957 and specialising in Africana since the 1970s, supplying rare material to institutions including the British Library and Yale University.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:30-13:00',
    source_urls = '["https://maps.apple.com/place?address=199+Long+StreetCape+TownWC8001South+Africa&coordinate=-33.9251074%2C18.4165192&name=Clarke%27s+Bookshop&place-id=IA77C89A93D39CCB3&_provider=9902", "https://clarkesbooks.co.za/pages/contact", "https://en.wikipedia.org/wiki/Clarke''s_Bookshop"]'
WHERE slug = 'clarkes-bookshop-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dinkel Bakery is a German-style bakery and cafe on Kloof Nek Road, popular with locals and visitors heading up to Table Mountain, known for its authentic German baked goods and breakfast menu.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/15650495_2", "https://za.africabz.com/western-cape/dinkel-bakery-27538", "https://www.capetourism.com/bakeries-in-cape-town/"]'
WHERE slug = 'dinkel-bakery-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kloof Street House is a colonial-style restaurant and bar set in a Victorian house on Kloof Street, with a garden under palm trees and a regular Sunday jazz session in the afternoon.',
    description_enriched_at = datetime('now')
WHERE slug = 'kloof-street-house-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mama Africa is a pan-African restaurant on the corner of Long and Pepper Streets that has operated since 1995, known for its African cuisine and live marimba and drumming performances every night.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 12:00-02:00',
    source_urls = '["https://mamaafricacpt.com/contact", "https://www.eatout.co.za/venue/mama-africa/", "https://www.capetownmagazine.com/mama-africa"]'
WHERE slug = 'mama-africa-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Our Local is a Mediterranean-inspired, home-style restaurant on Kloof Street, open for all-day dining from breakfast through to late evening service later in the week.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Wed 08:00-16:00, Thu-Sat 08:00-23:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d24145286-Reviews-Our_Local-Cape_Town_Central_Western_Cape.html", "https://insideguide.co.za/cape-town/restaurants/our-local/", "https://www.dineplan.com/restaurants/our-local-kloof-street"]'
WHERE slug = 'our-local-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royale Eatery is a Long Street burger restaurant offering more than 50 gourmet burger varieties alongside pizza and pasta, with an upstairs Royale Kitchen serving from 7pm.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-23:00',
    source_urls = '["https://www.royaleeatery.com/", "https://www.flickr.com/photos/mallix/798960023", "https://www.capetownmagazine.com/royale-eatery"]'
WHERE slug = 'royale-eatery-cape-town-cbd' AND description_enriched_at IS NULL;

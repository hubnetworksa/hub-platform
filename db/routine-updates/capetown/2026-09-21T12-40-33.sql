UPDATE businesses
SET description = 'Charly''s Bakery is a family-run bakery in District Six known for its colourful designer cakes, cupcakes, petit fours, macaroons and cookies, and has been trading since 1989. It caters for weddings and special occasions and was the subject of a South African reality TV series.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://charlysbakery.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d2535353-Reviews-Charly_s_Bakery-Cape_Town_Central_Western_Cape.html", "https://www.yep.co.za/biz/store/charlys-bakery-cc/634538"]'
WHERE slug = 'charlys-bakery-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Coffee Time is a kosher dairy cafe operating under the supervision of the Cape Town Beth Din, set in the tranquil garden grounds of the Astra Centre in Oranjezicht. It serves light meals, teas, cakes and vegetarian and fish dishes, and also hosts functions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-15:30, Fri 09:00-15:30, Sat-Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d5789038-Reviews-Coffee_Time-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/coffee-time-79683", "https://www.eatout.co.za/venue/coffee-time/"]'
WHERE slug = 'coffee-time-oranjezicht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lazari is a neighbourhood cafe on the corner of Upper Maynard and Vredehoek Avenue serving a Cape Mediterranean menu of all-day breakfasts, lunches and baked goods. It is a pet-friendly local favourite with a cosy atmosphere and a good beer and wine list.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun 08:30-16:00',
    source_urls = '["https://www.sa-venues.com/things-to-do/westerncape/coffee-and-lunch-at-lazari/", "https://www.eatout.co.za/venue/lazari-food-gallery/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d940411-Reviews-Lazari-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'lazari-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nude Foods is a zero-waste grocery store selling food, home and body products by weight to avoid packaging, and includes an on-site cafe serving coffee, teas and plant-based drinks. It was Cape Town''s first plastic-free grocery store.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-15:00, Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/zonnebloem/supermarkets/nude-foods", "https://www.findglocal.com/ZA/Cape-Town/845006869007345/NUDE-FOODS", "https://nudefoods.co/"]'
WHERE slug = 'nude-foods-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tommy''s Chop Shop is an industrial-themed bar in a converted garage space in District Six, decorated with car parts and featuring pool tables, a resident food truck and regular live music events.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetownetc.com/olivers-travels/inside-tommys-chop-shop-and-just-like-papa/", "https://tr.foursquare.com/v/tommys-chop-shop/6605d54a0f3e2271a8596ddd", "https://restaurantguru.com/Tommys-Chop-Shop-Cape-Town"]'
WHERE slug = 'tommys-chop-shop-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Villa Portuguese Restaurant serves traditional Portuguese dishes such as peri-peri chicken, espetada, trinchado and seafood on Buitenkant Street, doubling as a lunch spot, sports bar and dinner venue. It also offers delivery through Mr D and Uber Eats.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/villa-portuguese/", "https://www.tripadvisor.com/Restaurant_Review-g1778144-d5821591-Reviews-Villa_Portuguese_Restaurant-Vredehoek_Western_Cape.html", "https://www.villaportugueserestaurant.com/"]'
WHERE slug = 'villa-portuguese-restaurant-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Will''s Cafe & Deli is a delicatessen-style cafe in Oranjezicht serving freshly made sandwiches, salads and breakfasts throughout the day, with licensed service, WiFi and parking. It occupies the site previously home to Carlucci''s.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-20:00',
    source_urls = '["https://www.eatout.co.za/venue/carluccis-oranjezicht/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d10470572-Reviews-Will_s_Cafe_Deli-Cape_Town_Central_Western_Cape.html", "https://www.facebook.com/WillsCafeDeli/"]'
WHERE slug = 'wills-cafe-deli-oranjezicht' AND description_enriched_at IS NULL;

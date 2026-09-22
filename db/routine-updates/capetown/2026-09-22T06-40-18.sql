-- Job 4: description enrichment sweep (8 businesses, clears entire current backlog)

UPDATE businesses
SET description = 'Southfield IT and Internet Cafe is a computer and IT services shop in Southfield offering IT support, computer, laptop and PlayStation repairs and sales, plus a full office setup service alongside its internet cafe facilities.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-17:00, Sat-Sun Closed',
    source_urls = '["https://2pos.co.za/2/3678", "https://za.polomap.com/cape-town/9195", "https://www.cylex.net.za/company/southfield-it-and-internet-cafe-23781704.html"]'
WHERE slug = 'southfield-it-and-internet-cafe-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stylistics Hair Studio is a hairdressing salon and training centre in Heathfield that also offers nail services, with laser hair removal planned as a future addition.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 09:00-17:00',
    source_urls = '["https://www.fresha.com/a/stylistics-hair-studio-cape-town-48-dover-road-x21rrdrz", "https://stylisticshairstudio.co.za/", "https://www.facebook.com/p/Stylistics-Hair-Studio-Heathfield-100063771051016/", "https://beautycafe.co.za/stylistics-hair-studio/"]'
WHERE slug = 'stylistics-hair-studio-heathfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket and food store located in Cobble Walk Shopping Centre in Durbanville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:30-18:00, Sun 09:00-18:00'
WHERE slug = 'woolworths-cobble-walk-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket and food store located in Dean Street Arcade in Newlands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-19:00, Fri 08:30-19:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'woolworths-dean-street-arcade-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wordsworth Books Dean Street is an independent bookshop in Dean Street Arcade, Newlands, known among Cape Town book buyers for trading on Sundays in addition to its regular weekday and Saturday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun 09:00-14:00',
    source_urls = '["https://www.sayellow.com/view/south-africa/dean-street-bookshop-in-cape-town", "https://m.facebook.com/WordsworthSA/posts/our-store-in-dean-street-arcade-newlands-is-now-open-sundays-just-incase-you-nee/2706946056078573/", "https://wordsworthbookstore.com/contact-us"]'
WHERE slug = 'wordsworth-books-dean-street-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zeetan Turkish Restaurant is a halaal Turkish restaurant and shisha lounge in Sea Point, known for late-night dining with a menu of pizza, grilled meats, mixed grills and chicken shawarma.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 09:00-01:00, Fri-Sat 09:00-03:00',
    source_urls = '["https://hungryforhalaal.co.za/listing/zeetan-turkish-sea-point/", "https://www.facebook.com/people/Zeetan_turkish_restaurant/100094511144986/", "https://restaurantguru.com/ZEETAN-TURKISH-RESTAURANT-Cape-Town"]'
WHERE slug = 'zeetan-turkish-restaurant-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zeitz MOCAA is a public, not-for-profit museum dedicated to 21st-century art from Africa and its diaspora, housed in a converted historic grain silo in the Silo District of the V&A Waterfront, and offers free entry to South African and other African citizens on Wednesday mornings.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 10:00-18:00, Mon Closed',
    source_urls = '["https://zeitzmocaa.museum/contact-us/", "https://www.capetown.travel/listing/zeitz-mocaa/", "https://www.waterfront.co.za/attractions/zeitz-mocaa/"]'
WHERE slug = 'zeitz-mocaa-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'vida e caffe 3Arts Village is a halaal-certified branch of the vida e caffe coffee shop chain, trading inside the 3 Arts Village retail centre on Main Road, Plumstead.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-21:00, Sun 07:00-20:00',
    source_urls = '["https://www.cybo.com/ZA-biz/vida-e-caff%C3%A8-arts-village-halaal", "https://za.africabz.com/western-cape/vida-e-caffe-3arts-village-468701", "https://www.mrdfood.com/food-delivery/restaurant/vida-e-caffe-3-arts-village_plumstead/24145"]'
WHERE slug = 'vida-e-caffe-3arts-village-plumstead' AND description_enriched_at IS NULL;

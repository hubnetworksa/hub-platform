UPDATE businesses
SET description = 'Hungry Lion Langa Junction is a branch of Hungry Lion, the South African fast-food chain known for its fried chicken, founded in 1997 and now operating across the country; this outlet trades from Langa Junction shopping centre in Langa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hungrylionmenu.co.za/locations/hungry-lion-langa-mallshop-7-langa-junctionbrinton-streetlangacape-town7456/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d27088922-Reviews-Hungry_Lion_Langa_Mall-Cape_Town_Central_Western_Cape.html", "https://en.wikipedia.org/wiki/Hungry_Lion"]'
WHERE slug = 'hungry-lion-langa-junction-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lelapa Restaurant is a family-run traditional township restaurant in Langa, Cape Town''s oldest township, established in 1999 to share township culture and cuisine with visitors. The menu features slow-cooked oxtail, samp and beans, chakalaka and malva pudding, with live marimba music on weekend afternoons; the restaurant won the Western Cape''s Emerging Tourism Entrepreneur of the Year award in 2002.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://lelapa.co.za/contact-us/", "https://www.waze.com/live-map/directions/za/wc/cape-town/lelapa-restaurant?to=place.ChIJqVlzGKBczB0RpaUbgpXTMtg", "https://www.eatout.co.za/venue/lelapa-traditional-township-restaurant/", "https://lelapa.co.za/about-us/"]'
WHERE slug = 'lelapa-restaurant-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ndwamba Market is a supermarket in Nyanga East that began as a small family-run shop in the 1960s and was later upgraded through Pick n Pay''s spaza modernisation programme, expanding to three times its original size. It now stocks more than 1,000 grocery and household lines alongside services such as money transfers, airtime, bill payments and prepaid electricity.',
    description_enriched_at = datetime('now')
WHERE slug = 'ndwamba-market-nyanga' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Langa Junction is a budget fashion and clothing retailer trading from Langa Junction shopping centre in Langa.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-langa-junction-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Cake Shop is a bakery on the corner of Belgravia and Port Jackson Roads in Athlone specialising in cakes, croissants, scones, danish pastries, doughnuts, artisan bread, pies and koeksisters.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-cake-shop-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wembley Bakery is part of the long-standing Wembley Group of Companies in Athlone, baking fresh bread, doughnuts, eclairs and made-to-order wedding cakes daily, with an in-house barista serving coffee and a catering service for birthdays and other events.',
    description_enriched_at = datetime('now')
WHERE slug = 'wembley-bakery-athlone' AND description_enriched_at IS NULL;

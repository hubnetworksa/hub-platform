UPDATE businesses
SET description = 'Blue Water Café is a family-friendly restaurant at Imhoff Farm on a historic 1743 Cape Dutch farmstead, serving modern Cape-style food and wood-fired pizzas with vegan and gluten-free options, alongside views over Long Beach and the farm''s vineyards.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00'
WHERE slug = 'blue-water-cafe-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape to Cuba is a Cuban-inspired restaurant and beach bar at Kalk Bay Harbour, a local landmark since 1999 known for its seafood, mojitos, and live music on weekend afternoons.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-to-cuba-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Free Range Farm Shop and Deli at Imhoff Farm stocks a range of free-range and organic foods including farm-made cheeses, lamb and cranberry-mint pies, organic lavender honey, and old-fashioned ginger beer and lemonade.',
    description_enriched_at = datetime('now')
WHERE slug = 'free-range-farm-shop-and-deli-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harbour House is a seafood restaurant perched over Kalk Bay Harbour with views across False Bay, serving lunch and dinner daily.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-16:00 & 18:00-22:00'
WHERE slug = 'harbour-house-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KWIKSPAR Strandfontein is a Halaal supermarket at the corner of Wavecrest and Benguela Avenue in Strandfontein, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'kwikspar-strandfontein-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kalk Bay Modern is a contemporary art gallery and craft shop on Main Road showcasing emerging and established South African artists, and home to one of the largest collections of contemporary San art from South Africa, Namibia and Botswana.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-17:00'
WHERE slug = 'kalk-bay-modern-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kalk Bay Trading Post is an antiques and collectables shop on Main Road next to Kalk Bay station, stocking vintage furniture, old coins, maps, and retro memorabilia.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun 09:30-17:00',
    source_urls = '["https://www.africanadvice.com/1167472/Antique_Dealers/Cape_Town/Kalk_Bay_Trading_Post_Cc/", "https://insideguide.co.za/cape-town/kalk-bay/", "https://www.tripadvisor.com/Attraction_Review-g1788356-d14854918-Reviews-Kalk_Bay_Trading_Post-Kalk_Bay_Western_Cape.html"]'
WHERE slug = 'kalk-bay-trading-post-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kalky''s is a Cape Town institution serving fish and chips from a harbourside shack at Kalk Bay Harbour since 1986, using fresh catch landed by local fishermen; cash only.',
    description_enriched_at = datetime('now')
WHERE slug = 'kalkys-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Knead Bakery is an artisan bakery and café on Beach Road in Muizenberg, baking bread, pastries and confectionery on site daily alongside wood-fired pizzas and café-style light meals, with views over the beach and its colourful Victorian bathing boxes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 07:00-17:00, Tue-Thu 07:00-18:00, Fri-Sat 07:00-20:00, Sun 07:00-18:00',
    source_urls = '["https://za.africabz.com/western-cape/knead-bakery-15502", "https://crave.co.za/establishment.asp?est=18544", "https://www.kneadbakery.co.za/"]'
WHERE slug = 'knead-bakery-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kommetjie Pizzeria is a small, welcoming pizzeria at The Village Place on Erica Road making handcrafted wood-fired pizzas, including gluten-free options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-21:00',
    source_urls = '["https://www.yellowpages.net.za/phone,27-217830524,Pizza-Restaurant,Kommetjie,ZA282178.html", "https://za.africabz.com/western-cape/kommetjie-pizzeria-130024", "https://kommetjiepizzeria.com/"]'
WHERE slug = 'kommetjie-pizzeria-kommetjie' AND description_enriched_at IS NULL;

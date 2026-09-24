UPDATE businesses
SET description = 'A Touch of Madness is a quirky bar and restaurant set in a Victorian house in Observatory, serving global street-food-influenced lunches and dinners alongside a wide selection of local craft beers, including its own house-brewed beer, and hosting weekly niche events like chess nights and poetry evenings.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 12:00-22:00, Sun 12:00-17:00, Mon Closed',
    source_urls = '["https://www.eatout.co.za/venue/a-touch-of-madness/", "https://za.africabz.com/western-cape/a-touch-of-madness-restaurant-231447", "https://www.capetownmagazine.com/a-touch-of-madness"]'
WHERE slug = 'a-touch-of-madness-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BangBang Vintage Market is a multi-trader vintage concept store in Observatory housing around a dozen independent traders selling thrifted clothing, steampunk pieces, festival wear and alternative fashion.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-17:00, Sat 10:00-14:00',
    source_urls = '["https://bormandumazitha.co.za/bangbang-vintage-market-17862447572003950035/", "http://www.findglocal.com/ZA/Cape-Town/1508314939472283/BangBang-Vintage-Market", "https://whatsonincapetown.com/observatory-thrifting-vintage-destination/"]'
WHERE slug = 'bangbang-vintage-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dolce Bakery is a small patisserie and bakery in Observatory that has served the neighbourhood since 2009, known for daily-baked bagels, Lindt brownies, cheesecakes, pastries and halaal-certified pizzas.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 08:00-14:00',
    source_urls = '["http://dolcebakery.co.za/contact-us/", "https://za.africabz.com/western-cape/dolce-bakery-19877", "https://hungryforhalaal.co.za/listing/dolce-bakery-observatory/"]'
WHERE slug = 'dolce-bakery-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ecco Il Caffè is a coffee shop at Devil''s Peak Brewery in Salt River, serving breakfasts, bagels, burgers and lunches alongside its own house coffee blend, popular with students in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'ecco-il-caffe-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Faeeza''s Home Kitchen is a family-run Cape Malay cooking school and restaurant in Bo-Kaap, offering hands-on classes in rolling rotis, frying samoosas and cooking traditional curries, finished with tea and koeksisters.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-16:00'
WHERE slug = 'faeezas-home-kitchen-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Freddie Freeloader is a neighbourhood café in Salt River serving breakfast and lunch daily, known for wraps, toasties, bagels and croissant sandwiches alongside rotating daily specials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat-Sun Closed'
WHERE slug = 'freddie-freeloader-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ganesh is a Thai street food restaurant and bar in Observatory from the team behind Bodega Ramen, serving small plates and curries suited to sharing alongside a concise cocktail selection, with weekly live music including vinyl and jazz sessions.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Wed 17:00-21:30, Thu-Sat 17:00-22:00, Sun 16:00-21:00, Mon Closed'
WHERE slug = 'ganesh-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hello Sailor is a rock ''n'' roll-themed bistro in Observatory known for its retro sailor decor, offering homemade breakfasts, coffee and an almost-daily-changing specials menu alongside local craft beers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-23:00, Sat-Sun 09:00-23:00'
WHERE slug = 'hello-sailor-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mango Ginger is an owner-run coffee shop and bakery in Observatory serving wholesome, health-focused food since 2006, specialising in gluten-free, sugar-free and vegan cakes and a daily gluten-free, sugar-free cheesecake.',
    description_enriched_at = datetime('now')
WHERE slug = 'mango-ginger-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Never New is a thrift store in Observatory stocking a large, weekly-rotating selection of men''s and women''s vintage and second-hand clothing, along with new hippie and Indian-inspired clothing and locally made festival wear.',
    description_enriched_at = datetime('now')
WHERE slug = 'never-new-observatory' AND description_enriched_at IS NULL;

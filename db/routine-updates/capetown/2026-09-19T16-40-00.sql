UPDATE businesses
SET description = 'Boston Coffee is a coffee roastery and cafe in Boston, Bellville, known for its freshly roasted coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 07:30-13:00, Sun Closed',
    source_urls = '["https://www.bostoncoffee.co.za/location/", "https://nearbyza.com/place/boston-coffee", "https://www.bostoncoffee.co.za/trading-times/"]'
WHERE slug = 'boston-coffee-boston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eversdal Dental is a dental practice offering general dentistry services in Eversdal, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'eversdal-dental-eversdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fancy Frank''s is a pub and grill in Bothasig Square serving burgers, pizza, sushi and Tex-Mex-style dishes, with a daily happy hour.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://fancyfranks.co.za/contact/", "https://www.sluurpy.co.za/bothasig/restaurant/10507950/fancy-frank-s-bothasig", "https://fancyfranks.co.za/menu/"]'
WHERE slug = 'fancy-franks-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Food Lover''s Market Bothasig is a supermarket at 1 Link Road offering fresh produce and groceries as part of the Food Lover''s Market chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-18:00, Sun 08:00-16:00'
WHERE slug = 'food-lovers-market-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Johnny Fox''s Pub & Restaurant is a pub and restaurant in Bothasig Square, Bothasig, serving pub-style food and drinks.',
    description_enriched_at = datetime('now')
WHERE slug = 'johnny-foxs-pub-restaurant-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Bothasig is a fast-food restaurant in Bothasig Square, Bothasig, serving the KFC menu of fried chicken and fast food.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank is a bank branch inside The Point Shopping Centre in Sea Point, offering everyday banking services.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank is a bank branch inside Gardens Shopping Centre in Gardens, offering everyday banking services.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Neovision Optometrist is an optometry practice in Riverlands Mall, Observatory, offering eye tests, glaucoma screening and a range of frames.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-17:00'
WHERE slug = 'neovision-optometrist-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Newport Market & Deli is a deli and cafe on Beach Road, Mouille Point, known for its sea views, fresh food and coffee.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.newportdeli.co.za/contact-us/", "https://www.sa-venues.com/things-to-do/westerncape/coffee-and-breakfast-at-newport-deli/", "https://www.capetownmagazine.com/deli/fresh-food-and-yummy-coffees-at-newport-deli/156_22_17574"]'
WHERE slug = 'newport-market-and-deli-mouille-point' AND description_enriched_at IS NULL;

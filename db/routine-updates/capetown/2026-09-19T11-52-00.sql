UPDATE businesses
SET description = 'Hometown Cafe is a neighbourhood coffee shop and eatery on Alma Road in Rosebank.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 07:30-16:30, Sat 08:30-16:00, Sun 08:30-14:30'
WHERE slug = 'hometown-cafe-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hudson''s The Burger Joint is an American-inspired burger restaurant on Protea Road, Claremont, serving gourmet burgers, wood-fired pizzas, loaded starters and milkshakes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.theburgerjoint.co.za/our-stores", "https://www.eatout.co.za/venue/hudsons-claremont/", "https://www.tripadvisor.com/Restaurant_Review-g2144715-d3308276-Reviews-Hudson_s_The_Burger_Joint_Claremont-Claremont_Western_Cape.html"]'
WHERE slug = 'hudsons-the-burger-joint-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Identity is a South African fashion retailer, established in 1999, offering on-trend clothing and accessories for women and men, with a branch in Golden Acre Shopping Centre in the Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'identity-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Il Leone Mastrantonio is an Italian restaurant on Cobern Street in Green Point, serving traditional and modern Italian dishes including homemade pastas and grilled meats, and a recipient of the Gambero Rosso award.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/il-leone-mastrantonio/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d2084244-Reviews-Il_Leone_Mastrantonio-Cape_Town_Central_Western_Cape.html", "https://www.gamberorossointernational.com/restaurants/restaurant/il-leone-mastrantonio/"]'
WHERE slug = 'il-leone-mastrantonio-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inhouse Design Studio is an interior design and architecture studio on the 3rd floor of The Point in Sea Point, offering bespoke design and project management for commercial, retail, hospitality and residential clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'inhouse-design-studio-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Intercare Waterstone is a medical and dental centre in Waterstone Village, Somerset West, offering general medical care, dentistry, radiology, pathology, minor surgery and travel vaccinations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waterstonevillage.co.za", "https://getoccupi.com/malls/waterstone-village", "https://www.intercare.co.za/facilities/intercare-waterstone"]'
WHERE slug = 'intercare-waterstone-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'J&S Sushi Claremont is a sushi restaurant on Main Road, Claremont, serving sushi rolls, stir-fried noodles and rice dishes for eat-in and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'j-s-sushi-claremont-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JJ Cale Premiere Tobacconist is a tobacconist and gift shop in The Point, Sea Point, stocking Cuban and non-Cuban cigars, pipes, roll-your-own tobacco, vaping products and gentlemen''s grooming accessories.',
    description_enriched_at = datetime('now')
WHERE slug = 'jj-cale-premiere-tobacconist-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JMR Body Works is a panelbeating and spray-painting workshop in Epping Industria, established in 1995.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/jmr-body-works", "https://www.brabys.com", "https://showme.co.za/cape-town/lifestyle/jmr-body-works/"]'
WHERE slug = 'jmr-body-works-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JUMBO Wholesale SA is a Massmart-owned cash-and-carry wholesaler in Epping, supplying food, liquor, personal care and general merchandise in bulk to independent traders and commercial users.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waze.com/live-map", "https://www.infobel.com/en/south_africa", "https://www.facebook.com/JUMBOEpping/"]'
WHERE slug = 'jumbo-wholesale-sa-epping' AND description_enriched_at IS NULL;

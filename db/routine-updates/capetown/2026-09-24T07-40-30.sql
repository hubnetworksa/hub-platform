UPDATE businesses
SET description = 'Playtex Factory Shop is a factory outlet in Salt River selling surplus stock from ladies'' lingerie brands Playtex and Wonderbra, men''s underwear label Bear, and a range of socks at reduced prices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat 08:00-11:00, Sun Closed'
WHERE slug = 'playtex-factory-shop-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rose Lodge is a small guesthouse in Bo-Kaap with three en-suite rooms accommodating up to six guests, offering airport transfers and sightseeing tours, in a non-smoking, dog-friendly setting.',
    description_enriched_at = datetime('now')
WHERE slug = 'rose-lodge-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rouge on Rose Boutique Hotel is a 4-star boutique hotel in Bo-Kaap with nine decorated suites, some with kitchenettes, an on-site bistro serving complimentary breakfast, and walking distance to the city centre and V&A Waterfront.',
    description_enriched_at = datetime('now')
WHERE slug = 'rouge-on-rose-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solo Factory Shop is a factory outlet in Salt River''s Brickfield precinct selling discounted kids'', men''s and ladies'' clothing and footwear from reputable retailers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:20, Sat 08:30-13:20'
WHERE slug = 'solo-factory-shop-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Happy Uncles is a halaal fine-dining restaurant in Salt River''s Spice Yard on Voortrekker Road, offering four-, six- and eight-course tasting menus without pork or alcohol.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Sat 18:00-21:00'
WHERE slug = 'the-happy-uncles-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Taproom is the on-site pub and restaurant at Devil''s Peak Brewery in Salt River, serving craft beer and food with views of Devil''s Peak.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 11:00-16:00, Tue-Sat 11:00-23:00, Sun 12:00-18:00'
WHERE slug = 'the-taproom-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Two4One Kitchen & Bar is a restaurant in Observatory built around a buy-one-get-one pricing concept, where every meal on the menu -- including burgers, pizzas and desserts -- comes with a second meal free or swappable for a beer or cocktail.',
    description_enriched_at = datetime('now')
WHERE slug = 'two4one-kitchen-bar-observatory' AND description_enriched_at IS NULL;

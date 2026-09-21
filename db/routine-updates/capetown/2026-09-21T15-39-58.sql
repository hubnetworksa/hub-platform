UPDATE businesses
SET description = '1890 House Sushi & Grill is a sushi and Chinese restaurant set in a cosy, semi-detached Victorian building in Observatory, with chefs preparing fresh maki, nigiri, sashimi and salads at an in-house sushi counter for lunch and dinner.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-15:00, 17:00-22:30, Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://www.eatout.co.za/venue/1890-house-sushi-and-grill/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a café in the Woodstock Exchange with an industrial-chic, exposed-brick interior, serving wheat-free cakes, sourdough sandwiches, breakfast bowls and freshly baked pastries for breakfast and lunch.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.findmy.co.za/food/category-detail/field-office-woodstock/22827"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware retailer on Voortrekker Road in Salt River, part of a nationwide chain supplying plumbing fixtures, sanitaryware and general hardware products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30, Sat-Sun Closed'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Café is a vintage-styled, laptop-friendly coffee shop in bohemian Observatory, known for its New York-style bagels, sourdough sandwiches and cosy decor filled with books and vintage finds.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.sonderobz.com/"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole dance and aerial fitness studio in The Spice Yard on Voortrekker Road, offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes for all levels from beginner to advanced.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 18:00-21:00, Sat 08:45-12:45'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a halaal-certified restaurant on Victoria Road in Woodstock specialising in Portuguese-style chicken and seafood dishes, with dine-in, delivery and wheelchair-accessible seating available.',
    description_enriched_at = datetime('now')
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant in Observatory serving traditional dishes such as gomen, shiro wot and atkilt with misir on injera, with vegetarian and gluten-free options, in a space decorated with vintage African masks and sculptures.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-23:00, Sun 08:00-23:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://www.eatout.co.za/venue/timbuktu-cafe/"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a coffee roastery and training centre based at the Woodstock Foundry, roasting beans sourced from origins including Brazil, Peru, Costa Rica, Indonesia, India, Malawi, Rwanda, Zambia, Guatemala and El Salvador, alongside a café serving light meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-15:00, Sat 08:30-13:00, Sun Closed'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

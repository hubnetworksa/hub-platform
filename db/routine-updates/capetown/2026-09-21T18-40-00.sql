UPDATE businesses
SET description = '1890 House Sushi & Grill is a sushi restaurant in a converted house in Observatory, built around a conveyor-belt sushi bar preparing maki, nigiri, sashimi and salads, alongside Chinese and Thai dishes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://winemag.co.za/food/restaurant-review/1890-house-of-sushi/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a Woodstock Exchange coffee shop known for wheat-free cakes and sourdough toast with avocado and poached eggs, plus hearty lunchtime sandwiches and seasonal salads.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.eatout.co.za/venue/field-office-woodstock/"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware store on Voortrekker Road in Salt River, stocking plumbing and hardware supplies as part of the wider Plumbcrazy Group.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Cafe is a vintage-style coffee shop in Observatory known for New York-style bagels and sandwiches, alongside vegan salads, fresh croissants and smoothie bowls.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole dance and aerial fitness studio in Salt River offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes from beginner through advanced levels.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 18:00-21:00, Fri Closed, Sat 08:45-12:45, Sun Closed'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a halal Portuguese-Mozambican restaurant in Woodstock specialising in grilled chicken, prawns and other seafood, alongside burgers, wraps and pitas.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:45, Fri-Sat 11:00-23:00, Sun 11:00-22:00'
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant in Observatory serving vegetable and meat dishes, including lamb and chicken, on injera flatbread, with vegan and vegetarian options.',
    description_enriched_at = datetime('now')
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a coffee roastery and cafe at the Woodstock Foundry on Albert Road, roasting its own single-origin and house-blend beans on site and serving espresso-based coffee alongside light bistro fare.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = '1890 House Sushi & Grill is a Japanese restaurant in Observatory known for its sushi, sashimi and maki alongside Chinese and Thai dishes, with vegetarian, vegan and gluten-free options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-15:00, 17:00-22:30, Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://www.eatout.co.za/venue/1890-house-sushi-and-grill/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a cafe and creative co-working space in the Woodstock Exchange on Albert Road, serving bakery and cafe fare in a space that doubles as an art and design gallery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.eatout.co.za/venue/field-office-woodstock/"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware retailer on Voortrekker Road in Salt River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30, Sat-Sun Closed'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Cafe is a vintage-style coffee shop on Lower Main Road in Observatory known for New York-style bagels, sourdough sandwiches and coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole dance and aerial fitness studio on Voortrekker Road in Salt River, offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes from beginner to advanced level.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 18:00-21:00, Fri Closed, Sat 08:45-12:45, Sun Closed'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a Woodstock restaurant on Victoria Road specialising in flame-grilled, Portuguese peri-peri style chicken and seafood, including prawns, lobster and langoustine tails.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:45, Fri-Sat 11:00-23:00, Sun 11:00-22:00',
    source_urls = '["https://www.dining-out.co.za/md/Tasca-Mozambique/10454", "https://hungryforhalaal.co.za/listing/tasca-mozambique/", "https://www.facebook.com/reviewbru/videos/tasca-mozambique-chicken-and-seafood-specialists/403856317959616/"]'
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant on Lower Main Road in Observatory, serving traditional sharing platters with vegetarian options.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://www.eatout.co.za/venue/timbuktu-cafe/"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a specialty coffee roaster and cafe in the Woodstock Foundry on Albert Road, serving coffee, pastries and light meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

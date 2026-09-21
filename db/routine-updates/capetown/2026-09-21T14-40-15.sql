UPDATE businesses
SET description = '1890 House Sushi & Grill is a Japanese sushi restaurant in Observatory with its own sushi bar and conveyor belt, serving sashimi, nigiri, maki and chef special rolls alongside a selection of Chinese and Thai dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-15:00, 17:00-22:30, Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://winemag.co.za/food/restaurant-review/1890-house-of-sushi/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a café in the Woodstock Exchange offering a seasonally changing menu of breakfast bowls, freshly baked pastries and lunchtime sandwiches and salads, alongside espresso and specialty coffee, in an industrial-chic space with exposed brick walls.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat-Sun 10:00-14:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.eatout.co.za/venue/field-office-woodstock/"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware retailer in Salt River, specialising in the importation, marketing and distribution of plumbing and hardware products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30, Sat-Sun Closed'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Cafe is a coffee shop in Observatory that also offers venue hire for private events.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.sonderobz.com/"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole and aerial dance studio in Salt River, established in 2019, offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes for beginner through elite levels.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 18:00-21:00, Fri Closed, Sat 08:45-12:45, Sun Closed'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a restaurant in Woodstock, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:45, Fri-Sat 11:00-23:00, Sun 11:00-22:00'
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant in Observatory serving vegan and vegetarian Ethiopian dishes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://www.eatout.co.za/venue/timbuktu-cafe/"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a café and on-site coffee roastery at The Woodstock Foundry in Woodstock.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 09:00-14:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6623117-Reviews-Tribe_Coffee_Cafe-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/tribe-coffee-shop/", "https://tribecoffee.co.za/pages/tribe-locator"]'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = '1890 House Sushi & Grill is a sushi and Chinese restaurant in Observatory housed in a building dating from 1890, serving fresh maki, nigiri and sashimi from a sushi counter as well as sit-down platters.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-15:00 & 17:00-22:30, Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://www.eatout.co.za/venue/1890-house-sushi-and-grill/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a coffee shop in Woodstock with an industrial-chic, art-filled space, serving espresso-based coffee and café fare alongside community events such as local art exhibits.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://coffeeshopblues.co.za/field-office-woodstock-coffeeshop-deluxe-coffee-woodstock/"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware supplier in Salt River, importing and distributing a wide range of plumbing and bathroom products since moving from retail into wholesale distribution in 1990.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Cafe is a cosy, vintage-styled coffee shop in Observatory filled with books and local artwork, serving coffee alongside New York-style bagels and sourdough sandwiches.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.sonderobz.com/"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole and aerial dance studio in Salt River, established in 2019, offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes for beginners through advanced levels.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a halaal Portuguese-style restaurant in Woodstock specialising in grilled chicken and seafood, including prawns, lobster and langoustine tails, alongside burgers and wraps, with dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant on Lower Main Road in Observatory, serving traditional shared platters such as doro wot on injera in a space decorated with vintage African masks and sculptures.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 11:00-23:00'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a coffee roastery and bistro at the Woodstock Foundry on Albert Road, run as a collective and offering coffee sourced from origins including Brazil, Peru, Costa Rica, Rwanda and Guatemala, roasted on site.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-15:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6623117-Reviews-Tribe_Coffee_Cafe-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/tribe-coffee-shop/", "https://www.bizcommunity.com/Article/196/436/92936.html"]'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

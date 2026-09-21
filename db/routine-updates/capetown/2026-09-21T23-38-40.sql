UPDATE businesses
SET description = '1890 House Sushi & Grill is a sushi restaurant that has operated in Observatory for over 18 years, housed in a converted semi-detached building on Trill Road, in Observatory, Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://www.eatout.co.za/venue/1890-house-sushi-and-grill/", "https://www.1890.co.za/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a café in the Woodstock Exchange offering specialty coffee and bakery/café fare in an industrial-chic space with exposed brick and wood finishes, doubling as a creative meeting spot with art and design on display.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.dining-out.co.za/md/Field-Office-Woodstock-Exchange/5841"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware retailer on Voortrekker Road in Salt River, part of the PlumbCrazy Group, which supplies imported and local plumbing and bathroom products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30',
    source_urls = '["https://www.hotfrog.co.za/company/1099860609650688/plumb-crazy-plumbing-sanitaryware-and-hardware/cape-town/home-improvement", "https://www.africabizinfo.com/ZA/plumb-crazy_35-021-511-7818", "https://plumbcrazy.co.za/store-locator/", "https://plumbcrazy.co.za/"]'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Café is a New York-style café in Observatory serving boiled bagels, artisanal sourdough sandwiches, smoothie bowls, cold-pressed juices and salads in a vintage-styled space.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.sonderobz.com/"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole and aerial dance studio in Salt River offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes for beginner through advanced levels.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 18:00-21:00, Fri Closed, Sat 08:45-12:45, Sun Closed',
    source_urls = '["https://www.fresha.com/lvp/south-pole-studios-voortrekker-road-cape-town-jbKeP4", "https://southpolestudios.co.za/", "https://southpolestudios.co.za/contact/"]'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a Portuguese-style restaurant on Victoria Road in Woodstock serving grilled chicken, seafood and other Portuguese dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:45, Fri-Sat 11:00-23:00, Sun 11:00-22:00',
    source_urls = '["https://www.dining-out.co.za/md/Tasca-Mozambique/10454", "https://hungryforhalaal.co.za/listing/tasca-mozambique/", "https://restaurantguru.com/TASCA-MOZAMBIQUE-Cape-Town"]'
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Café is an Ethiopian restaurant in Observatory serving traditional dishes such as gomen, shiro wot, atkilt with misir, tibs and gored gored, in a space decorated with vintage African masks and sculptures.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-23:00, Sun 08:00-23:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://www.eatout.co.za/venue/timbuktu-cafe/"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a specialty coffee roastery and café at the Woodstock Foundry on Albert Road, serving espresso-based drinks alongside a simple food menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 09:00-14:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6623117-Reviews-Tribe_Coffee_Cafe-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/tribe-coffee-shop/", "https://www.bizcommunity.com/Article/196/436/92936.html"]'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

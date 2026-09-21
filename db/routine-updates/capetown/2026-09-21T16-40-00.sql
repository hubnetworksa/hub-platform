UPDATE businesses
SET description = '1890 House Sushi & Grill is a Japanese and Chinese restaurant set across several rooms of a converted 1890s Observatory house, with a sushi counter for quick service and a grill menu for platters, in Observatory.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-15:00 & 17:00-22:30, Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://winemag.co.za/food/restaurant-review/1890-house-of-sushi/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a Woodstock coffee shop and eatery known for seasonal breakfast bowls, fresh pastries and sandwiches, served in an industrial-chic space with exposed brick and alfresco seating, in Woodstock.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.eatout.co.za/venue/field-office-woodstock/"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware supplier on Voortrekker Road, part of a group specialising in importing and distributing plumbing and bathroom fittings, in Salt River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30, Sat-Sun Closed',
    source_urls = '["https://www.hotfrog.co.za/company/1099860609650688/plumb-crazy-plumbing-sanitaryware-and-hardware/cape-town/home-improvement", "https://www.africabizinfo.com/ZA/plumb-crazy_35-021-511-7818", "https://www.netpages.co.za/Cape+Town/Plumb+Crazy-Plumbing+Sanitaryware+And+Hardware-788106.html"]'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Cafe is a vintage-styled coffee shop on Lower Main Road serving healthy breakfasts, brunch and cold-pressed juices alongside New York-style bagels and sourdough sandwiches, and doubling as a small events venue, in Observatory.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.sonderobz.com/"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole dance and aerial arts studio on Voortrekker Road, offering pole, aerial hoop, aerial hammock, lyra and flexibility classes for all levels since 2019, in Salt River.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresha.com/lvp/south-pole-studios-voortrekker-road-cape-town-jbKeP4", "https://southpolestudios.co.za/", "https://www.facebook.com/southpolestudios.capetown/"]'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a halaal Mozambican-Portuguese restaurant on Victoria Road specialising in flame-grilled chicken, prawns and other seafood, in Woodstock.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dining-out.co.za/md/Tasca-Mozambique/10454", "https://hungryforhalaal.co.za/listing/tasca-mozambique/", "https://www.facebook.com/p/TASCA-Mozambique-100057574054226/"]'
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant on Lower Main Road serving traditional platters of meat and vegetables on injera in a room decorated with vintage African masks and sculptures, in Observatory.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:00-23:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://www.facebook.com/476142062543042"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a specialty coffee roastery and cafe at the Woodstock Foundry, roasting its own blends on site from beans sourced directly from origins such as Malawi and Zimbabwe, in Woodstock.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6623117-Reviews-Tribe_Coffee_Cafe-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/tribe-coffee-shop/", "https://thecoffeevine.com/reviews/cafes/southafrica/cape-town/tribe-coffee-roasting-cape-town-za/"]'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

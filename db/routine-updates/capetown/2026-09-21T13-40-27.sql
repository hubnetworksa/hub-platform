-- Job 4: description enrichment sweep (8 businesses, full backlog this run)

UPDATE businesses
SET description = '1890 House Sushi & Grill is a sushi and grill restaurant operating from a converted semi-detached house in Observatory, serving the area''s student, academic and NGO community for more than 18 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://www.eatout.co.za/venue/1890-house-sushi-and-grill/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a bakery and café in the Woodstock Exchange on Albert Road, serving bakery fare and coffee shop dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.findmy.co.za/food/category-detail/field-office-woodstock/22827"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware store on Voortrekker Road in Salt River, part of the PlumbCrazy Group which imports, markets and distributes plumbing and hardware products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30',
    source_urls = '["https://www.hotfrog.co.za/company/1099860609650688/plumb-crazy-plumbing-sanitaryware-and-hardware/cape-town/home-improvement", "https://www.africabizinfo.com/ZA/plumb-crazy_35-021-511-7818", "https://plumbcrazy.co.za/"]'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Café is a vintage-style coffee shop on Lower Main Road in Observatory serving New York-style boiled bagels, artisanal sourdough toasted sandwiches, smoothie bowls and cold-pressed juices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.novacircle.com/en-ZA/spots/africa/south-africa/western-cape/city-of-cape-town-metropolitan-municipality/cape-town/sonder-cafe-c63cf4/opening-hours"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole dance and aerial fitness studio in Salt River offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes with qualified instructors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 18:00-21:00, Fri Closed, Sat 08:45-12:45, Sun Closed'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a Mozambican-Portuguese cuisine restaurant on Victoria Road in Woodstock offering halaal-friendly dining.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:45, Fri-Sat 11:00-23:00, Sun 11:00-22:00'
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant on Lower Main Road in Observatory serving both vegetarian and meat dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:00-23:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://whatsonincapetown.com/eateries-in-observatory/", "https://opening-hours.co.za/02202890/Timbuktu_Cafe,_Observatory,_Cape_Town"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a specialty coffee roastery and café at the Woodstock Foundry on Albert Road, roasting and serving its own coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6623117-Reviews-Tribe_Coffee_Cafe-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/tribe-coffee-shop/", "https://foursquare.com/v/tribe-coffee/51695769e4b04fc89096589a"]'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

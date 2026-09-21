UPDATE businesses
SET description = '1890 House Sushi & Grill is a sushi and Chinese restaurant in Observatory, making fresh maki, nigiri, sashimi and grilled dishes for lunch and dinner, with over 15 years of experience in Asian cuisine.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-15:00, 17:00-22:30, Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://www.eatout.co.za/venue/1890-house-sushi-and-grill/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a cafe in the Woodstock Exchange serving wheat-free cakes, brownies and sandwiches alongside a seasonal breakfast and lunch menu built around locally sourced ingredients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.eatout.co.za/venue/field-office-woodstock/"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware retailer in Salt River, part of a long-established South African group that supplies plumbing and sanitaryware products nationally.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30',
    source_urls = '["https://www.hotfrog.co.za/company/1099860609650688/plumb-crazy-plumbing-sanitaryware-and-hardware/cape-town/home-improvement", "https://www.africabizinfo.com/ZA/plumb-crazy_35-021-511-7818", "https://www.yep.co.za/biz/store/iyp/50497_2"]'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Cafe is a vintage-style cafe on Lower Main Road in Observatory serving specialty coffee, New York-style bagels and sourdough sandwiches, with laptop-friendly seating popular with remote workers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.sonderobz.com/about"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole and aerial dance studio in Salt River, established in 2019, offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes from beginner through elite level.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresha.com/lvp/south-pole-studios-voortrekker-road-cape-town-jbKeP4", "https://southpolestudios.co.za/", "https://www.facebook.com/southpolestudios.capetown/"]'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a Mozambican-Portuguese restaurant in Woodstock specialising in prawns, lobster, langoustine tails and grilled chicken alongside burgers and wraps, with a halaal menu and dine-in, takeaway and delivery options.',
    description_enriched_at = datetime('now')
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant in Observatory known for its injera-based vegetable and meat sharing platters, vintage African decor, and a wide range of vegetarian and gluten-free options.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 11:00-23:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://www.dining-out.co.za/md/Timbuktu-Cafe-Observatory/9419"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee Roasting is a coffee roastery and cafe in the Woodstock Foundry on Albert Road, roasting its own beans on-site from origins including Brazil, Peru, Rwanda and Guatemala alongside a simple food menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6623117-Reviews-Tribe_Coffee_Cafe-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/tribe-coffee-shop/", "https://thecoffeevine.com/reviews/cafes/southafrica/cape-town/tribe-coffee-roasting-cape-town-za/"]'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = '1890 House Sushi & Grill is a long-running Japanese and Chinese restaurant set in a converted old Observatory house, serving fresh sushi, sashimi and oriental grill dishes for over 15 years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-15:00, 17:00-22:30, Sun Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784", "https://winemag.co.za/food/restaurant-review/1890-house-of-sushi/", "https://www.eatout.co.za/venue/1890-house-sushi-and-grill/"]'
WHERE slug = '1890-house-sushi-grill-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Field Office is a cafe inside the Woodstock Exchange serving breakfast bowls, sandwiches and freshly baked pastries, including wheat-free cakes and brownies, in an industrial-chic space with alfresco seating.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d4702374-Reviews-Field_Office-Cape_Town_Central_Western_Cape.html", "https://nearbyza.com/place/field-office-3", "https://www.eatout.co.za/venue/field-office-woodstock/"]'
WHERE slug = 'field-office-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb Crazy is a plumbing, sanitaryware and hardware retailer on Voortrekker Road in Salt River, part of the Plumbcrazy Group which also operates branches across South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30',
    source_urls = '["https://www.hotfrog.co.za/company/1099860609650688/plumb-crazy-plumbing-sanitaryware-and-hardware/cape-town/home-improvement", "https://www.africabizinfo.com/ZA/plumb-crazy_35-021-511-7818", "https://www.netpages.co.za/Cape+Town/Plumb+Crazy-Plumbing+Sanitaryware+And+Hardware-788106.html"]'
WHERE slug = 'plumb-crazy-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonder Cafe is a vintage-style cafe in bohemian Observatory known for its New York-style bagels and sourdough sandwiches, alongside healthy breakfast and brunch options, cold-pressed juices and specialty coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html", "https://www.sonderobz.com/about"]'
WHERE slug = 'sonder-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Studios is a pole and aerial dance studio in Salt River established in 2019, offering pole dance, pole fitness, aerial hoop, aerial hammock, lyra and flexibility classes for all levels.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 18:00-21:00, Sat 08:45-12:45'
WHERE slug = 'south-pole-studios-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasca Mozambique is a halaal restaurant in Woodstock serving Mozambican and Portuguese-style dishes, including grilled chicken, prawns, langoustine tails and burgers.',
    description_enriched_at = datetime('now')
WHERE slug = 'tasca-mozambique-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbuktu Cafe is an Ethiopian restaurant in Observatory serving vegetable and meat combination platters on injera, in a space decorated with vintage African masks and sculptures.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:00-23:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020", "https://www.dining-out.co.za/md/Timbuktu-Cafe-Observatory/9419"]'
WHERE slug = 'timbuktu-cafe-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribe Coffee is a coffee roastery, training centre and bistro inside the Woodstock Foundry on Albert Road, serving cafe fare, coffee and light meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-15:00, Sat 08:30-13:00'
WHERE slug = 'tribe-coffee-woodstock' AND description_enriched_at IS NULL;

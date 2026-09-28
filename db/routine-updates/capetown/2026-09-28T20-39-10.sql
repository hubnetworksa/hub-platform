UPDATE businesses
SET description = 'Auto Panel Repair Centre is a panel beating and spray-painting workshop in Ottery handling accident repairs and autobody work for vehicles across most makes, working with insurers including Hollard on claims.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766", "https://autopanel.co.za/about/"]'
WHERE slug = 'auto-panel-repair-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingdom Kidz Educare Academy is a daycare and preschool in Ottery offering a family-oriented, English-medium early learning programme for children from 3 months to 5 years, spanning creche, toddler and pre-Grade R stages.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.holakids.co.za/centre/kingdom-kidz-educare-academy-daycarecreche-nursery-ottery/", "https://www.facebook.com/kingdomkidzeduacademy/", "https://findmynursery.net/nurseries/kingdom-kidz-educare-academy-daycarecreche-nursery-ottery/"]'
WHERE slug = 'kingdom-kidz-educare-academy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Meat Hyper & Deli is a butchery and deli in Portlands, Mitchells Plain, established in 1985, specialising in A-grade meat, braai packs and biltong.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://portlandsmeat.co.za/", "https://www.facebook.com/p/Portlands-Meat-Hyper-Deli-100066890422860/", "http://portlandsmeat.co.za/about/"]'
WHERE slug = 'portlands-meat-hyper-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ronwic Motors Panelbeaters is a factory-approved collision repair centre in Ottery, handling panel beating, spray painting, chassis straightening and air-conditioning regassing for brands including Ford, Mazda, Chevrolet, Opel, Isuzu, TATA and Great Wall Motors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-14:00, Sat-Sun Closed',
    source_urls = '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298", "https://panelbeatersdirectory.co.za/listing-maps-hours.php?listings_id=1140"]'
WHERE slug = 'ronwic-motors-panelbeaters-ottery' AND description_enriched_at IS NULL;

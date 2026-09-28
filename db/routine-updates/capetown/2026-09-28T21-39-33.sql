UPDATE businesses
SET description = 'Auto Panel Repair Centre is an Audi and Volkswagen Aluminium Approved panel beating and spray painting workshop in Ottery, offering accident repairs, repainting, dent and scratch removal, mechanical repairs, and ADAS recalibration.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766", "https://autopanel.co.za/about/"]'
WHERE slug = 'auto-panel-repair-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingdom Kidz Educare Academy is a home-based educare centre in Ottery East offering crèche, toddler and preschool care for children from 3 months to 5 years old in small group classes.',
    description_enriched_at = datetime('now')
WHERE slug = 'kingdom-kidz-educare-academy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Meat Hyper & Deli is a butchery and deli in Portlands, Mitchells Plain, established in 1985, manufacturing its own range of meat products including braai packs and biltong for the local community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://portlandsmeat.co.za/", "https://www.facebook.com/p/Portlands-Meat-Hyper-Deli-100066890422860/", "https://portlandsmeat.co.za/public/our-kitchen.php"]'
WHERE slug = 'portlands-meat-hyper-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ronwic Motors Panelbeaters is a panel beating and spray painting workshop in Ottery East offering collision repairs, chassis straightening, repolishing, aircon regassing, and insurance and private claims handling.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-16:45, Fri 07:00-14:00, Sat by appointment',
    source_urls = '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298", "https://panelbeatersdirectory.co.za/listing-maps-hours.php?listings_id=1140"]'
WHERE slug = 'ronwic-motors-panelbeaters-ottery' AND description_enriched_at IS NULL;

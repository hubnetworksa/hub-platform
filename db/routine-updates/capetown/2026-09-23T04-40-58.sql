UPDATE businesses
SET description = 'Wellness Warehouse at Plattekloof Village Shopping Centre is a health and wellness retailer stocking natural health, beauty and food products, along with supplements, baby and family care items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-18:00, Sun & Public Holidays 09:00-17:00',
    source_urls = '["https://www.fresha.com/lvp/wellness-warehouse-plattekloof-village-baronetcy-boulevard-cape-town-EvzNWW", "https://www.plattekloofvillageshoppingcentre.co.za/shop/wellness-warehouse/", "https://www.wellnesswarehouse.com/store-locator/plattekloof-village"]'
WHERE slug = 'wellness-warehouse-plattekloof-village-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wembley Meat Market is a butchery in the Wembley Building on Belgravia Road, Athlone, part of the Wembley Group of Companies, selling fresh and prepared meat products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-18:00 (closed 13:00-14:00), Fri 08:00-18:00 (closed 12:15-14:00), Sat 08:00-16:00, Sun 09:00-13:00'
WHERE slug = 'wembley-meat-market-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westgate Pharmacy is a retail pharmacy located within Westgate Mall in Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-20:00, Sat 09:00-17:00, Sun 09:00-13:30'
WHERE slug = 'westgate-pharmacy-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zaika Tandoor, in Kromboom Gardens Centre, Crawford, is a North Indian restaurant serving tandoor grills and curries such as tandoori lamb, butter chicken and chicken biryani, with sit-down and takeaway options.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Thu 11:30-15:00 & 17:00-22:00, Fri 14:00-23:00, Sat 11:30-15:00 & 17:00-23:00, Sun 11:30-21:00, Mon Closed',
    source_urls = '["https://za.polomap.com/cape-town/60485", "https://www.yep.co.za/biz/store/iyp/10427133_2", "https://www.africanadvice.com/1233077/Indian_Restaurants/Cape_Town/Zaika_Tandoor_Restaurant/", "https://www.eatout.co.za/venue/zaika-tandoor/"]'
WHERE slug = 'zaika-tandoor-crawford' AND description_enriched_at IS NULL;

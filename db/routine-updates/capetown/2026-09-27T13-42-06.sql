-- Job 4: description enrichment sweep -- clears entire backlog (7 businesses)

UPDATE businesses
SET description = 'Carlton Hair - Blue Route is a hair salon inside Blue Route Mall offering precision cuts and colour treatments, part of a South African hair salon chain operating since 1968.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00',
    source_urls = '["https://www.fresha.com/lvp/carlton-hair-blue-route-tokai-road-cape-town-VEo3r8", "https://za.africabz.com/western-cape/carlton-hair-168662", "https://blueroutemall.co.za/stores/pick/carlton-hair/"]'
WHERE slug = 'carlton-hair-blue-route-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Meadowridge is a branch of the Clicks pharmacy, health and beauty retail chain, located in the Park ''N Shop centre in Meadowridge.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'clicks-meadowridge-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ozone Clinic Cape Town is a wellness clinic in Harfield Village offering ozone therapy treatments, including a HOCATT (Hyperthermic Ozone and Carbonic Acid Transdermal Therapy) sauna pod session that combines a carbonic acid steam cycle with medical-grade ozone.',
    description_enriched_at = datetime('now')
WHERE slug = 'ozone-clinic-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Print Hut Meadowridge is a branch of a Cape Town-based printing chain founded in 1996, offering business cards, flyers, banners, signage and other printed materials with in-store collection.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/print-hut-meadowridge-10988", "https://www.brabys.com/za/western-cape/cape-town/meadowridge/printers/print-hut", "https://printhut.co.za/"]'
WHERE slug = 'print-hut-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sakura is a sushi-focused Japanese and Chinese restaurant in Harfield Village, known for a daily half-price sushi special until 22:00.',
    description_enriched_at = datetime('now'),
    hours = 'Lunch Mon-Sat 12:00-15:00, Dinner Mon-Sun 17:00-22:30',
    source_urls = '["https://www.sa-venues.com/things-to-do/westerncape/dine-at-sakura/", "https://www.dining-out.co.za/md/Sakura-Restaurant-Harfield-Village/4883", "https://www.eatout.co.za/venue/sakura/"]'
WHERE slug = 'sakura-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thai World is a Thai restaurant in Harfield Village serving red, yellow and green curries with a choice of chicken, beef, seafood, pork or vegetables, alongside rice and noodle dishes, satay and soups, with a changing daily special.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/thai-world/148796", "http://www.harfield-village.co.za/search-business-listings/restaurants/72-thai-world.html", "https://www.sa-venues.com/things-to-do/westerncape/thai-world/"]'
WHERE slug = 'thai-world-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store is a discount variety retail store in Meadowridge Shopping Centre, Meadowridge, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-18:00, Fri 08:30-19:00, Sat 08:30-17:00, Sun 09:00-16:00'
WHERE slug = 'the-crazy-store-meadowridge' AND description_enriched_at IS NULL;

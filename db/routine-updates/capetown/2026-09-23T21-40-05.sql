UPDATE businesses
SET description = '26 Sunset Villa is a boutique guest villa on Sunset Avenue in Llandudno, offering six sea-facing suites with butler and chef service, an outdoor pool, gym and steam room, a short walk from Llandudno Beach.',
    description_enriched_at = datetime('now')
WHERE slug = '26-sunset-villa-llandudno' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lakeside Clothing is a small, mother-and-son-run second-hand clothing shop on Main Road, restocked with seasonal clothing donated by locals from Lakeside and Muizenberg, with a colourful interior of hats, scarves, bags and other finds.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://2pos.co.za/2/5338", "https://www.brabys.com/za/western-cape/cape-town/lakeside/clothes-second-hand/lakeside-clothing", "https://blog.sa-venues.com/provinces/western-cape/second-hand-fashion-shops/"]'
WHERE slug = 'lakeside-clothing-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Old Bakery Market is a collection of small stalls at The Old Bakery, offering local coffee, freshly baked bread, cold beer and gift shops under one roof in Lakeside.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-16:00, Sun 08:00-15:00'
WHERE slug = 'old-bakery-market-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Little Fisherman is a seafood market and fish shop at The Old Bakery, sourcing fresh fish daily and, in season, oysters and crayfish, with a complimentary cleaning and preparation service for customers'' own braais.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g2280424-d23201179-Reviews-The_Little_Fisherman-Lakeside_Western_Cape.html", "https://www.foodbevg.com/ZA/Lakeside/124076011005854/The-Little-Fisherman", "https://www.thelittlefisherman.co.za/"]'
WHERE slug = 'the-little-fisherman-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vee''s Video is a DVD and games rental store at Lakeside Centre, stocking the latest releases alongside cult movies and box-set series, with staff on hand for recommendations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.readymap.info/4/59708", "https://www.searchinafrica.com/business/5544968/south-africa/western-cape/cape-town/lakeside/main-rd/video-hire/vees-video", "https://veesdvd.co.za/"]'
WHERE slug = 'vees-video-lakeside' AND description_enriched_at IS NULL;

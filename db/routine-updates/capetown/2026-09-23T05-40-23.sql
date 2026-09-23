UPDATE businesses
SET description = 'Bolton Shoes is a footwear factory outlet in Elsies River, part of Bolton Footwear, which has manufactured shoes in Cape Town since 1859, offering ladies'', men''s and children''s footwear at factory prices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:00, Fri 08:00-14:00, Sat-Sun Closed',
    source_urls = '["https://www.boltonshoes.co.za/shop/", "https://za.kompass.com/c/bolton-footwear-pty-ltd/zan021720/", "https://www.boltonshoes.co.za/", "https://businessfindersa.com/business/bolton-footwear-factory-shop-elsies-river/"]'
WHERE slug = 'bolton-shoes-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Busy Corner Bakery is a neighbourhood bakery in Grassy Park selling freshly baked bread, pastries and cakes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/7349559_3", "https://www.facebook.com/p/Busy-Corner-Bakery-100054426193734/", "https://www.sayellow.com/busy-corner-bakery-grassy-park"]'
WHERE slug = 'busy-corner-bakery-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Avonwood is a branch of the Cash Crusaders secondhand retail chain in Avonwood Square, Elsies River, buying and selling used electronics, appliances, tools and other goods.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/avonwood-centre-corner-35th-ave-balvenie-avenue-off-avonwood-avenue-elsies-river", "https://www.cylex.net.za/company/cash-crusaders-elsies-river-23688318.html", "https://www.cashcrusaders.co.za/locate-a-store/store/71/Cash-Crusaders-Elsies-River"]'
WHERE slug = 'cash-crusaders-avonwood-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza in Victoria Mall, Grassy Park is a branch of the national pizza chain, offering dine-in, takeaway and delivery, including its Triple-Decker and Real Deal pizza ranges.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 10:00-22:00, Fri-Sat 10:00-22:30, Sun 10:00-21:00',
    source_urls = '["https://locations.debonairspizza.co.za/restaurants-VictoriaMall-DebonairsPizzaGrassyPark", "https://www.tripadvisor.com/Restaurant_Review-g14251551-d17787063-Reviews-Debonairs_Pizza-Grassy_Park_Western_Cape.html", "https://app.debonairspizza.co.za/restaurant/5350/debonairs-pizza-grassy-park"]'
WHERE slug = 'debonairs-pizza-victoria-mall-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Heideveld Community Day Centre is a public primary healthcare clinic in Heideveld offering chronic care, emergency care, antenatal, dental and mental health services to the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:30, Sat-Sun Closed'
WHERE slug = 'heideveld-community-day-centre-heideveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Stores Grassy Park is a branch of the PEP value-retail chain in Victoria Mall, Grassy Park, selling clothing, footwear, homeware and other affordable everyday items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:00-14:00, Sun 09:00-13:00'
WHERE slug = 'pep-stores-victoria-mall-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Romatex Factory Shop is a home textiles factory outlet in Elsies River selling duvets, sheeting, blankets, curtains and other bedding and bathroom products made by Romatex.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-16:30, Fri 08:30-15:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://www.romatex.co.za/our-shops/factory-shop/", "https://www.thinklocal.co.za/biz/romatex-factory-shop-elsies-river", "https://www.factoryshopssa.co.za/directory/romatex-factory-and-hospitality-shop-elsies-river/"]'
WHERE slug = 'romatex-factory-shop-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Avonwood is a SuperSpar supermarket branch in Avonwood Square, Elsies River, stocking groceries, fresh produce and everyday household goods.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za/company/907251/spar-avonwood", "https://www.netpages.co.za/Elsies+River/Spar+Avonwood+-447718.html", "https://www.spar.co.za/home/store-view/superspar-avonwood-western-cape"]'
WHERE slug = 'spar-avonwood-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tile Factory Shop is a building-materials retailer in Elsies River Industrial selling tiles, mosaics, cladding and paint, including porcelain, matte, satin, glazed and large-format tile ranges.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/tilefactoryshop/", "https://www.cylex.net.za/company/tile-factory-shop-elsies-river-23826142.html", "https://tilefactoryshop1.godaddysites.com/"]'
WHERE slug = 'tile-factory-shop-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fashion World is an affordable fashion retailer in Golden Acre Shopping Centre in the Cape Town CBD, stocking shoes, dresses, tops, bottoms and accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.tiendeo.co.za/stores/cape-town/fashion-world-shop-g-golden-acre-shopping-centre-adderley-street-cape-town/78225", "https://www.shopshours.co.za/fashion-world/cape-town"]'
WHERE slug = 'fashion-world-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Faull''s Pharmacy is a retail pharmacy on Voortrekker Road in Parow, offering dispensing and everyday health and wellness services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'faulls-pharmacy-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fields is a contemporary menswear label at The Old Biscuit Mill in Woodstock, making shirts, trousers, jackets and knitwear from natural yarns sourced across southern Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'fields-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Flight Centre is a travel agency branch inside Waterstone Village in Somerset West, part of the wider Flight Centre travel agency network.',
    description_enriched_at = datetime('now')
WHERE slug = 'flight-centre-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Food Lover''s Market Willowbridge is a fresh food and grocery supermarket in Willowbridge North Shopping Centre, Bellville, offering fruit, vegetables, meat, bakery and grocery items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-19:00, Tue-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-16:00'
WHERE slug = 'food-lovers-market-willowbridge-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'For the Love of Silk is a silk couture specialist in Cape Quarter, De Waterkant, making silk bridal and evening wear, sleepwear, scarves and pillowcases, with its showroom available by appointment.',
    description_enriched_at = datetime('now')
WHERE slug = 'for-the-love-of-silk-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Formentos Bakery & Take-Aways is a bakery and takeaway on Voortrekker Road in Maitland, offering baked goods, a coffee shop and quick takeaway meals to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'formentos-bakery-take-aways-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Four Rosmead is a boutique guesthouse in Oranjezicht, built in 1903 and set on the slopes of Table Mountain, offering eight en-suite bedrooms, a spa, an outdoor pool and views across the city and mountain.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://fourrosmead.com", "https://www.sa-venues.com/things-to-do/westerncape/four-rosmead/", "https://www.booking.com/hotel/za/four-rosmead-boutique-guesthouse.html"]'
WHERE slug = 'four-rosmead-oranjezicht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Franco Ceccato is a footwear retailer in Golden Acre, part of a national chain of around 80 stores selling men''s, women''s and children''s shoes across a range of styles from classic to high fashion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.yep.co.za/biz/store/iyp/12964730_2", "https://francoceccato.co.za/about-us/"]'
WHERE slug = 'franco-ceccato-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'French Accent is an importer and retailer of luxury fragrances, beauty products and homeware in Cape Quarter, De Waterkant.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://getoccupi.com/malls/cape-quarter", "https://www.facebook.com/frenchaccentcapetown/"]'
WHERE slug = 'french-accent-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

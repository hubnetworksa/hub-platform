UPDATE businesses
SET description = 'Utah Spur is a family steakhouse inside Bothasig Square, part of the national Spur Steak Ranches chain, serving grills, burgers and a salad bar.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-21:00, Fri-Sat 08:30-22:00, Sun 08:30-21:00'
WHERE slug = 'utah-spur-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uwe Koetter Jewellers is a Cape Town jewellery house founded in 1968, now based in Cape Quarter after moves from Adderley Street and St George''s Mall, specialising in bespoke diamond and gemstone jewellery and regarded as one of South Africa''s most-awarded jewellers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://uwekoetter.com/pages/store-locator", "https://uwekoetter.com/about-us/"]'
WHERE slug = 'uwe-koetter-jewellers-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Webb and Savoy Pharmacy is a pharmacy on Main Road in Mowbray, dispensing medicine and stocking general health and personal care products.',
    description_enriched_at = datetime('now')
WHERE slug = 'webb-and-savoy-pharmacy-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Warehouse is a health store inside The Point in Sea Point, stocking vitamins, supplements and natural health and personal care products.',
    description_enriched_at = datetime('now')
WHERE slug = 'wellness-warehouse-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Warehouse is a health store inside Waterstone Village in Somerset West, stocking vitamins, supplements and natural health and personal care products.',
    description_enriched_at = datetime('now')
WHERE slug = 'wellness-warehouse-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Warehouse (Cape Quarter) is a health store inside Cape Quarter in De Waterkant, stocking vitamins, supplements and natural health and personal care products.',
    description_enriched_at = datetime('now')
WHERE slug = 'wellness-warehouse-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Whitney''s Hair & Beauty Boutique is a hair and beauty salon inside Kromboom Convenience Centre in Crawford, offering hairstyling, colour and treatments such as hair botox.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresha.com/lvp/whitneys-hair-beauty-boutique-jan-smuts-drive-cape-town-Kz2bB1", "https://wikideals.co.za/my-city/a-hair-botox-treatment-at-whitney-s-hair-beauty-boutique-kromboom-convenience-centre.html", "https://wikideals.co.za/catalog/product/view/id/6688/s/a-hair-botox-treatment-at-whitney-s-hair-beauty-boutique-kromboom-convenience-centre/"]'
WHERE slug = 'whitneys-hair-and-beauty-boutique-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wildsprout is a health-focused cafe and grocery store on Main Road in Kenilworth, serving a plant-forward menu of Buddha bowls, falafel wraps and smoothies alongside a grocery section of pantry staples and fresh produce from small local suppliers.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:00-17:00',
    source_urls = '["https://www.capetownmagazine.com/wild-sprout", "https://za.africabz.com/western-cape/wild-sprout-60038", "https://insideguide.co.za/cape-town/restaurants/wild-sprout/"]'
WHERE slug = 'wildsprout-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy is a family restaurant inside Bothasig Square, part of the national Wimpy chain, serving all-day breakfasts, burgers and grills.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 08:00-16:00, Sun 08:00-15:00'
WHERE slug = 'wimpy-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths at Waterstone Village in Somerset West is one of the chain''s largest food markets, spanning almost 2,500m2 with 19 tills including 5 express lanes and an in-store WCafe.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-21:00'
WHERE slug = 'woolworths-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

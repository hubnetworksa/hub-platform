UPDATE businesses
SET description = 'Woolworths is a supermarket inside Richmond Corner in Richwood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun 09:00-13:00'
WHERE slug = 'woolworths-food-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket on the corner of Prince George Drive and 5th Avenue in Grassy Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-grassy-park-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside Liberty Promenade in Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside Liberty Promenade in Beacon Valley.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'woolworths-liberty-promenade-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside Vangate Mall in Athlone.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wordsworth Books is an independent bookstore inside Gardens Shopping Centre in Gardens, part of a small Western Cape group of shops offering a wide range of books from popular titles to more niche picks, and hosting author events such as signings and launches.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/wordsworth-gardens-97091", "https://www.xpose.co.za/listings/wordsworth-booksgardens-garden-centre/", "https://www.gardensshoppingcentre.co.za/stores/wordsworth-books/"]'
WHERE slug = 'wordsworth-books-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wunders Furniture is a family-run upholstered furniture business inside Cape Quarter in De Waterkant, with over 40 years of local manufacturing experience, offering custom-designed furniture for homes, the interior design trade and hotel groups.',
    description_enriched_at = datetime('now')
WHERE slug = 'wunders-furniture-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xciter Sports is a multi-sport specialist inside Sherwood Centre in Bergvliet, focused on cycling, running and triathlon gear, with an in-house bike workshop offering servicing, repairs and puncture fixes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 08:00-15:00, Sun 08:30-12:00',
    source_urls = '["https://sherwoodshopping.co.za/xciter-sports/", "https://opening-hours.co.za/03952442/Xciter_Sports_-_Bergvliet", "https://bikeshops.heyplaces.co.za/01976221/Xciter_Sports_-_Bergvliet", "https://xciter.co.za/"]'
WHERE slug = 'xciter-sports-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yemaya Spa & Hair is a hair salon and spa inside The Point in Sea Point, offering hair and beauty treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 09:00-19:00'
WHERE slug = 'yemaya-hair-spa-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yumcious is a bistro-style restaurant inside Cape Quarter in De Waterkant, serving a pay-by-weight selection of hot dishes that changes daily, alongside burgers, sandwiches and milkshakes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "http://www.capetownmagazine.com/all-day-at-cape-quarter", "https://capetownmagazine.com/shopping/around-the-clock-at-the-cape-quarter-piazza/176_22_19234"]'
WHERE slug = 'yumcious-de-waterkant' AND description_enriched_at IS NULL;

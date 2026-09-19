UPDATE businesses
SET description = 'Barksole Edgemead is a shoe and leather repair specialist in Edgemead Village Centre, offering shoe repairs, key cutting, dry-cleaning drop-off and luggage repair.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://barksole.co.za/store-locator/edgemead/", "https://www.facebook.com/BarksoleEdgemead/", "https://247locksmithscapetown.co.za/directory/barksole-edgemead-7460/"]'
WHERE slug = 'barksole-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Edgemead is a branch of the Clicks pharmacy, health and beauty retail chain in Edgemead Shopping Centre, combining a dispensary with health, beauty and toiletry products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-20:00, Sat 08:00-20:00, Sun 09:00-19:00'
WHERE slug = 'clicks-pharmacy-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Welgemoed is a branch of the Clicks pharmacy, health and beauty retail chain in Welgemoed Forum, combining a dispensary with health, beauty and toiletry products.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-pharmacy-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Zevenwacht Mall Pharmacy is a branch of the Dis-Chem pharmacy and health retail chain inside Zevenwacht Mall, offering a dispensary alongside health, beauty and baby-care products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'dis-chem-zevenwacht-mall-pharmacy-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Essential Health Pharmacy Kuils River is an independent pharmacy on Van Riebeeck Road offering a dispensary, chronic medication management and everyday health and personal-care products, with extended trading hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-20:30, Sat 08:00-20:00, Sun 09:00-20:00'
WHERE slug = 'essential-health-pharmacy-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fishaways Zevenwacht Mall is a branch of the Fishaways seafood takeaway chain inside Zevenwacht Mall, serving hake and chips, grilled fish, sushi and hot pots for takeaway or delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'fishaways-zevenwacht-mall-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jason Sushi & Restaurant is a Chinese and sushi restaurant in Welgemoed Plaza, serving sushi platters and Chinese dishes including an all-you-can-eat option.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 11:00-22:00'
WHERE slug = 'jason-sushi-restaurant-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kauai Welgemoed Forum is a branch of the Kauai healthy fast-food chain in Welgemoed Forum, serving wraps, salads, smoothies and barista coffee.',
    description_enriched_at = datetime('now')
WHERE slug = 'kauai-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nando''s Rondebosch is a branch of the Nando''s peri-peri chicken restaurant chain in Rondebosch Main Centre, serving flame-grilled chicken and peri-peri sides for dine-in and takeaway.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 10:00-22:00, Fri-Sat 10:00-23:00',
    source_urls = '["https://www.rondeboschmain.co.za/divi_overlay/nandos/", "https://za.africabz.com/western-cape/nandos-rondebosch-2980", "https://menufacts.co.za/restaurant-nandos-cape-town/"]'
WHERE slug = 'nandos-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nap Living is a home decor and furniture store in the Cape Quarter, De Waterkant, selling furniture, decor and lifestyle accessories in a neutral, understated palette.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://getoccupi.com/malls/cape-quarter", "https://www.napliving.co.za/pages/stores"]'
WHERE slug = 'nap-living-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

-- Job 4: Description enrichment sweep, batch 1 of 10
UPDATE businesses
SET description = 'Constantia Uitsig is a historic wine estate in the Constantia Valley, tracing its roots back to 1685 and taking its present name in 1941, with two on-site restaurants -- the family-friendly Blockhouse Kitchen and the Italian-inspired La Grotto Ristorante.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.constantiauitsig.co.za", "https://capreo.com/en/wine-estates/constantia-uitsig/", "https://capetown101.co.za/listing/constantia-uitsig/"]'
WHERE slug = 'constantia-uitsig-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eagles'' Nest is a small, steep-sloped wine farm on the Constantia mountain range planted mainly to Shiraz, Merlot and Viognier, with wine tastings offered daily on the estate.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-16:30',
    source_urls = '["https://www.eaglesnestwines.com/contact-us/", "https://www.sa-venues.com/things-to-do/westerncape/eagles-nest-wine-estate/", "https://www.eaglesnestwines.com/", "https://constantiavalley.com/eagles-nest/"]'
WHERE slug = 'eagles-nest-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'El Burro is a Mexican restaurant and bar in Green Point serving tacos, quesadillas and other Mexican street food alongside a large tequila and mezcal selection, with vegan options available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-23:30, Sun 12:00-21:00',
    source_urls = '["https://www.elburro.co.za/", "https://www.capetownmagazine.com/el-burro", "https://www.eatout.co.za/venue/el-burro/"]'
WHERE slug = 'el-burro-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ellerman House is a boutique luxury hotel set in a cliffside mansion above Bantry Bay, with individually styled rooms and suites, two villas, a spa, an adults-only sea-facing pool and a dedicated South African wine gallery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ellerman.co.za/", "https://www.relaischateaux.com/us/hotel/ellerman-house/", "https://www.sa-venues.com/visit/ellermanhouse/"]'
WHERE slug = 'ellerman-house-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Four & Twenty Cafe & Pantry, in Chelsea Village, Wynberg, serves all-day breakfasts and a weekly-changing lunch menu alongside a deli pantry of house-made pastries, preserves and other sweet and savoury treats.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetownmagazine.com/four-and-twenty-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2426991-d4262933-Reviews-Four_Twenty-Wynberg_Western_Cape.html", "https://www.eatout.co.za/venue/four-twenty/", "https://www.fourandtwentycafe.co.za/"]'
WHERE slug = 'four-and-twenty-cafe-and-pantry-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Frying Nemo is a fish and chips takeaway at Kromboom Gardens in Rondebosch East, serving fried, grilled or braaied fish, calamari, prawns, seafood paella and a kids'' menu.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hungryforhalaal.co.za/listing/frying-nemo-rondebosch-east/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d23117101-Reviews-Frying_Nemo-Cape_Town_Central_Western_Cape.html", "https://frying-nemo-kromboom.business.site/"]'
WHERE slug = 'frying-nemo-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ghazala Food & Cafe is a takeaway in Walmer Estate serving South African and curry-based dishes such as boerewors, chicken tikka, chicken roti and curries, with a Friday and Sunday mutton akhni special.',
    description_enriched_at = datetime('now')
WHERE slug = 'ghazala-food-cafe-walmer-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harveys is the restaurant and bar at the Winchester Mansions hotel in Sea Point, offering South African cuisine with a European twist across an indoor dining room, sea-facing terrace and courtyard, with a weekly Sunday jazz brunch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dining-out.co.za/md/Harveys-at-Winchester-Mansions/1324", "https://news.wine.co.za/news.aspx?NEWSID=15281", "https://crushmag-online.com/dining-harveys-winchester-mansions/"]'
WHERE slug = 'harveys-at-winchester-mansions-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'High Constantia Wine Cellar is a boutique winery on a Constantia Valley property dating back to 1693, offering wine tastings in the cellar or on its outdoor stoep.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://highconstantia.co.za/contact-us/", "https://capeofgoodwine.com/high-constantia/", "https://www.winetourism.com/winery/high-constantia-wine-cellar/"]'
WHERE slug = 'high-constantia-wine-cellar-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Huang Mei Sushi & Chinese Food is a Mowbray takeaway serving Chinese dishes and sushi at affordable prices, with delivery and collection available via its online menu; cash only, cards are not accepted.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-21:00, Sun 12:00-20:00',
    source_urls = '["https://za.africabz.com/western-cape/huang-mei-sushi-chinese-food-177268", "https://www.africabizinfo.com/ZA/huang-mei-sushi-chinese-food-021-685-3985", "https://www.huangmei.co.za/"]'
WHERE slug = 'huang-mei-sushi-chinese-food-mowbray' AND description_enriched_at IS NULL;

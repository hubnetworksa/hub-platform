-- Job 4: description enrichment sweep (full backlog, 7 businesses)

UPDATE businesses
SET description = 'Cape Union Mart is a fashion and clothing retailer, with a store in Blue Route Mall, Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'cape-union-mart-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers is a supermarket in the Park ''n Shop Centre, Meadowridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'checkers-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mugg & Bean is a coffee and casual dining chain restaurant serving breakfast, lunch and coffee, with a branch in Blue Route Mall, Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-17:00'
WHERE slug = 'mugg-bean-blue-route-mall-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nando''s Tokai Drive Thru is a branch of the Nando''s flame-grilled chicken chain, offering drive-thru and dine-in service on Main Road at Tokai Junction.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-22:00',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g25046846-d7988913-Reviews-Nando_s_Tokai_Drive_Thru-Dreyersdal_Western_Cape.html", "https://showmesa.co.za/directory-listing/nandos-tokai-drive-thru/", "https://store.nandos.co.za/details/tokai"]'
WHERE slug = 'nandos-tokai-drive-thru-dreyersdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oblivion Bar & Kitchen is a day-to-night bar and restaurant in Harfield Village serving breakfast, burgers, wood-fired pizzas and cocktails.',
    description_enriched_at = datetime('now')
WHERE slug = 'oblivion-bar-kitchen-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twigs Nursery & Coffee Shop is a plant nursery and coffee shop in Harfield Village, selling plants, succulents and herbs alongside coffee, cake and light snacks in a garden setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat-Sun 09:00-17:00'
WHERE slug = 'twigs-nursery-coffee-shop-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket in the Park ''n Shop Centre, Meadowridge.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-16:00'
WHERE slug = 'woolworths-meadowridge' AND description_enriched_at IS NULL;

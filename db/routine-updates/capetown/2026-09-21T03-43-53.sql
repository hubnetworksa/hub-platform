-- Job 4: description enrichment sweep, checkpoint 3 of 3 (2 businesses)

UPDATE businesses
SET description = 'Woolworths Old Bakery Lakeside is a supermarket in The Old Bakery shopping centre, Lakeside, stocking groceries, prepared meals and household goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat-Sun 08:30-18:00',
    source_urls = '["https://www.sayellow.com/view/south-africa/woolworths-old-bakery-lakeside-in-muizenberg", "https://vymaps.com/ZA/Woolworths-Old-Bakery-157540/", "https://www.waze.com/livemap/directions/lakeside,-cape-town/woolworths-old-bakery?place=w.12125619.120994047.3631713"]'
WHERE slug = 'woolworths-old-bakery-lakeside-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Westgate Mall is a supermarket in Westgate Mall, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-westgate-mall-westgate' AND description_enriched_at IS NULL;

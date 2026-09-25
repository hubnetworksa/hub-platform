UPDATE businesses
SET description = 'Thumbs Up Plumbing & Construction is a plumbing and construction business operating from Monte Vista, offering general plumbing work with guaranteed workmanship at competitive rates.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'thumbs-up-plumbing-construction-monte-vista' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a branch of the national discount clothing and department store chain, trading from Shop 10 in Kensington Shopping Centre on 12th Avenue.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-kensington-shopping-centre-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR is a branch of the supermarket chain trading from Shop 18 in Kensington Shopping Centre on 12th Avenue, stocking groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-19:00, Fri 07:30-12:45 & 13:45-19:00, Sat 07:30-19:00, Sun 08:00-19:00',
    source_urls = '["https://za.africabz.com/western-cape/spar-kensington-61426", "https://za.polomap.com/cape-town/85235", "https://my-catalogue.co.za/stores/kensington/spar/shop-18-27-12th-avenue"]'
WHERE slug = 'spar-kensington-shopping-centre-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Candle Factory Shop is a factory outlet and wholesaler for candles, candle accessories and serviettes, serving retail customers as well as the event, hospitality and floristry trades from its Kensington premises.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-14:00, Sun Closed',
    source_urls = '["https://www.waze.com/live-map/directions/the-candle-factory-shop-8th-ave-kensington,-cape-town?to=place.w.12125621.121321744.16078262", "https://za.top10place.com/the-candle-factory-shop-1460360909.html", "https://www.factoryshopssa.co.za/directory/the-candle-factory-shop/"]'
WHERE slug = 'the-candle-factory-shop-kensington' AND description_enriched_at IS NULL;

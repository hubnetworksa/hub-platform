-- Job 4: description enrichment sweep, batch 2 (10 records)
UPDATE businesses
SET description = 'Bootlegger Harrington Street is a specialty coffee cafe in District Six''s Harrington Street precinct, serving all-day breakfast and lunch alongside its coffee menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-17:00, Sat-Sun 07:00-15:00'
WHERE slug = 'bootlegger-harrington-street-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bruegels Pizza Studio is a family-run pizzeria in Little Mowbray, serving thin-based, wood-fired pizzas alongside fresh pastas and salads.',
    description_enriched_at = datetime('now'),
    hours = 'Dinner daily 17:30-23:00'
WHERE slug = 'bruegels-pizza-studio-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Burger King 3Arts Drive-Thru is a branch of the Burger King fast-food chain, offering drive-thru service inside 3Arts Village in Plumstead.',
    description_enriched_at = datetime('now')
WHERE slug = 'burger-king-3arts-drive-thru-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Manhattan is a longstanding LGBTQI+ bar and kitchen in the heart of De Waterkant village, serving stone-baked pizzas, burgers and small plates for over thirty years.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:00-23:00, kitchen until 22:00'
WHERE slug = 'cafe-manhattan-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Paradise Lodge and Apartments is a guest house in Higgovale on the slopes of Table Mountain, offering five guest rooms and two self-catering apartments with a shared lounge and free parking.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-paradise-lodge-and-apartments-higgovale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chart Farm is a pick-your-own rose farm and farm stall in Wynberg, offering fresh fruit, jams, preserves and honey alongside The Terrace coffee shop with views over the Constantia Valley.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-16:00'
WHERE slug = 'chart-farm-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Codfather Seafood & Sushi is a long-running seafood restaurant in Camps Bay where diners choose from a fresh seafood display, alongside a sushi conveyor-belt bar, with ocean and mountain views.',
    description_enriched_at = datetime('now')
WHERE slug = 'codfather-seafood-and-sushi-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Constantia Glen is a boutique wine estate in the Constantia Valley producing cool-climate Sauvignon Blanc, Semillon and Bordeaux-variety wines, with wine tastings and lunch offered on-site.',
    description_enriched_at = datetime('now')
WHERE slug = 'constantia-glen-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Curate is a fine-dining restaurant at Ellerman House in Bantry Bay, offering an eight-course tasting menu celebrating South African cuisine paired with wine, with seating for up to 30 guests per sitting.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Sun 18:00-22:30'
WHERE slug = 'curate-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Doncaster Motors is a fuel station in Kenilworth at the corner of Doncaster Road and Punters Way, with a Caltex FreshStop convenience store on site.',
    description_enriched_at = datetime('now')
WHERE slug = 'doncaster-motors-kenilworth' AND description_enriched_at IS NULL;

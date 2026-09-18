UPDATE businesses
SET description = 'Artappel Prop Hire is a prop and furniture rental company based in the Transnet Industrial Park on Voortrekker Road, supplying props for film, TV and event productions in Salt River.',
    description_enriched_at = datetime('now'),
    hours = 'Summer (Oct-Apr): Mon-Fri 08:00-17:00, Sat 09:00-13:00, Sun Closed; Winter (May-Sep): Mon-Fri 09:00-17:00, Sat-Sun Closed'
WHERE slug = 'artappel-prop-hire-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BUCO Salt River is a branch of the BUCO hardware and building-materials chain on Brickfield Road, stocking hardware, timber and building supplies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:30, Fri 07:30-17:00, Sat 08:00-14:00, Sun 09:00-12:00'
WHERE slug = 'buco-salt-river-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Barksole Riverlands Mall is a pet store inside Riverlands Mall in Observatory, part of the Barksole pet-retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'barksole-riverlands-mall-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape of Storms Distilling Company is a craft rum distillery and tasting room at The Spice Yard in Salt River, producing small-batch sugar-free rums and offering distillery tours and tastings.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-of-storms-distilling-company-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Casa Woodstock Bar is a bar and pizza restaurant on Albert Road in Woodstock, serving pizza and drinks with a weekday happy hour.',
    description_enriched_at = datetime('now')
WHERE slug = 'casa-woodstock-bar-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Riverlands Mall is a branch of the Clicks pharmacy, health, beauty and homeware retail chain, located inside Riverlands Mall in Observatory.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-riverlands-mall-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cocoa Cha Chi is a cafe on Lower Main Road in Observatory serving coffee, all-day breakfasts, sandwiches and pizzas, open long hours daily.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:00-23:00'
WHERE slug = 'cocoa-cha-chi-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dimensions Tent & Structures is a Salt River-based company that designs and installs custom tents, steel-frame structures, mechanised blinds and outdoor heating for events and venues.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://dimensionstents.com/contact-us/", "https://www.facebook.com/DimensionsTentsAndStructures/", "https://dimensionstents.com/blog/tented-solution/"]'
WHERE slug = 'dimensions-tent-and-structures-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'District Cafe is a cafe on Roodebloem Road in Woodstock serving breakfast, lunch and coffee.',
    description_enriched_at = datetime('now')
WHERE slug = 'district-cafe-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'GoGo Woodstock is a specialty coffee shop on Sir Lowry Road in Woodstock, serving artisan coffee brews and light meals made with locally sourced ingredients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat-Sun Closed'
WHERE slug = 'gogo-woodstock-woodstock' AND description_enriched_at IS NULL;

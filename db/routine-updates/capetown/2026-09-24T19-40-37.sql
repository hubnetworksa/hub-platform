-- Job 4: description enrichment sweep (checkpoint 1)

UPDATE businesses
SET description = 'Basilico Steenberg is an Italian restaurant in Steenberg Village, Tokai, known for its wood-fired pizzas and a wine list featuring Constantia Valley labels alongside other South African wines.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:30, Sun 12:00-21:30'
WHERE slug = 'basilico-steenberg-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Col''Cacchio Meadowridge is a restaurant in Meadowridge Shopping Centre, Meadowridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'colcacchio-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Engen Meadowridge is a 24-hour fuel station and convenience facility on Ladies Mile Road in Meadowridge.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'engen-meadowridge-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fat Harry''s is a casual restaurant and bar in Harfield Village serving gourmet burgers, grills, seafood and tapas, with outside seating and a family-friendly atmosphere.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 16:00-22:00, Tue-Sun 12:00-23:00'
WHERE slug = 'fat-harrys-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Meadowridge is a stationery, arts and crafts store in Meadowridge Shopping Centre, part of the national PNA retail chain, stocking books, office supplies and craft materials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.cylex.net.za/company/p-n-a-stationers--meadowridge--23687520.html", "https://www.cybo.com/ZA-biz/pna-meadowridge", "https://pna.co.za/store-locator/pna-meadowridge/"]'
WHERE slug = 'pna-meadowridge-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Meadowridge is a printing and courier services outlet in Meadowridge Shopping Centre, offering document printing, copying, stationery and both domestic and international courier services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'postnet-meadowridge-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Fat German is a delicatessen and butchery in Meadowridge Shopping Centre, Meadowridge, offering a range of deli meats, sausages and butchery products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'the-fat-german-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Village Skincare & Medi Spa is a skin, beauty and aesthetics clinic in Meadowridge Shopping Centre, Meadowridge, offering facials, skin peels and other medi-spa treatments performed by qualified therapists.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=401148", "https://www.tuugo.co.za/Companies/village-skincare-medi-spa8/0260003513511", "https://www.yep.co.za/biz/store/iyp/15708384_5"]'
WHERE slug = 'village-skincare-medi-spa-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness Tokai is a gym in Blue Route Mall, Tokai, part of the Zone Fitness chain, offering fitness equipment and group classes with extended weekday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:30-21:00, Fri 05:30-20:00, Sat-Sun 07:00-17:00'
WHERE slug = 'zone-fitness-tokai-tokai' AND description_enriched_at IS NULL;

-- Job 4: description enrichment sweep, checkpoint 2 (10 businesses)
UPDATE businesses
SET description = 'Miller''s Thumb is a long-standing seafood restaurant on Kloof Nek Road in Gardens, open since 1996 and known for fresh linefish, mussels, calamari and prawns prepared with Cajun and Creole influences.',
    description_enriched_at = datetime('now')
WHERE slug = 'millers-thumb-restaurant-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miss Lyn is a branch of the Miss Lyn home and hospitality linen chain, located in the Cape Quarter Lifestyle Village in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-16:00, Sun 10:00-14:00'
WHERE slug = 'miss-lyn-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mobile Mate is a cellphone and MacBook repair shop in the Cape Quarter Lifestyle Village, offering screen, battery and charging-port repairs for smartphones, tablets and laptops with same-day service.',
    description_enriched_at = datetime('now')
WHERE slug = 'mobile-mate-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr K Rondebosch is a branch of the Mr K jewellery chain, specialising in gold and diamond jewellery and Krugerrand and precious-metal sales.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.mrk.co.za/get-in-touch/rondebosch/", "https://www.rondeboschmain.co.za/stores/", "https://jewellersnetwork.co.za/directory/mr-k-rondebosch/"]'
WHERE slug = 'mr-k-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Golden Acre is a branch of the Mr Price fashion chain, selling clothing, footwear and accessories for men, women and children in the Golden Acre Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'mr-price-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Kids is a branch of the Mr Price Kids children''s fashion chain, located in the Golden Acre Shopping Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'mr-price-kids-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mulholland Interior Solutions is a bespoke furniture and interior design studio in The Palms Decor and Lifestyle Centre in Woodstock, offering custom furniture, upholstery, curtains and blinds, wallpaper and metalwork.',
    description_enriched_at = datetime('now')
WHERE slug = 'mulholland-interior-solutions-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mullers Dental Studio is a family-focused dental practice in the Harry Goemans Centre in Bergvliet, open since September 2015 and offering a range of general dental treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat 08:00-12:00'
WHERE slug = 'mullers-dental-studio-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MultiQS (Multi Quantity Surveyors) is a quantity surveying practice based at The Point in Sea Point, providing cost consulting, tendering and procurement services for construction projects.',
    description_enriched_at = datetime('now')
WHERE slug = 'multiqs-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NV-80 Grill & Bar is a steakhouse and seafood restaurant on the first floor of The Point in Sea Point, specialising in 28-day aged prime steaks alongside fresh seafood and salads.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 12:00-15:00 & 18:00-22:30, Fri-Sat 12:00-15:00 & 18:00-23:00'
WHERE slug = 'nv-80-grill-bar-sea-point' AND description_enriched_at IS NULL;

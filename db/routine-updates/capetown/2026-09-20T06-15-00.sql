UPDATE businesses
SET description = 'The Village Bicycle is a wood-fired pizzeria in Harfield Village, Claremont, serving hand-made, thin-based pizzas, pasta and grills in a relaxed, family-friendly setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:00, Sun 12:00-20:00'
WHERE slug = 'the-village-bicycle-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ThreeZero is a boutique fitness studio in Cape Quarter Lifestyle Village, De Waterkant, built around a Biocircuit training system -- the first of its kind in South Africa -- with change rooms and shower facilities on site.',
    description_enriched_at = datetime('now')
WHERE slug = 'threezero-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger''s Milk Green Point is a grill and pizza restaurant on Main Road serving flame-grilled burgers, steaks, ribs and gourmet pizzas, with vegetarian and vegan options, part of the South African Tiger''s Milk chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'tigers-milk-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger''s Milk Camps Bay is a grill and pizza restaurant on Victoria Road serving flame-grilled burgers, steaks and gourmet pizzas, part of the South African Tiger''s Milk chain of grill-and-pizza restaurants.',
    description_enriched_at = datetime('now')
WHERE slug = 'tigers-milk-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger''s Milk Century City is a grill and pizza restaurant at Century City serving breakfast through dinner, from flame-grilled burgers and steaks to gourmet pizzas, part of the South African Tiger''s Milk chain.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-23:00'
WHERE slug = 'tigers-milk-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tonkil Optometrist is a boutique optometry practice in The Point shopping centre in Sea Point, offering eye examinations, contact lenses, spectacle frames and sunglasses.',
    description_enriched_at = datetime('now')
WHERE slug = 'tonkil-optometrist-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tops at Spar Heathfield is a liquor store attached to the Spar supermarket on Main Road, Heathfield, part of the national Tops at Spar chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 11:00-18:45'
WHERE slug = 'tops-at-spar-heathfield-heathfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports at Victoria Wharf is a sporting goods and sportswear retailer in the V&A Waterfront, stocking apparel, footwear and equipment for football, running and fitness from major sports brands.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-21:00'
WHERE slug = 'totalsports-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Traders Warehouse at Golden Acre is a family clothing retailer offering affordable branded fashion, part of a Western Cape chain of around 19 stores that also offers bulk discounts to resellers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:30, Sun 09:00-13:00'
WHERE slug = 'traders-warehouse-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths at Victoria Wharf is a branch of the South African fashion retailer offering clothing, accessories and footwear for men and women, in the V&A Waterfront''s Quays District.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-21:00'
WHERE slug = 'truworths-va-waterfront' AND description_enriched_at IS NULL;

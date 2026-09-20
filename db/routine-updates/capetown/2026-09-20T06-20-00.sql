UPDATE businesses
SET description = 'The Village Bicycle is a popular wood-fired pizzeria and grill in Harfield Village, also serving burgers, ribs, tapas, pasta, salads and desserts in a family-friendly setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:00, Sun 12:00-20:00',
    source_urls = '["https://harfield-village.co.za/business/the-village-bicycle/", "https://www.thevillageb.co.za/contact/", "https://thevillagebicycle.online/"]'
WHERE slug = 'the-village-bicycle-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ThreeZero is a boutique fitness studio in Cape Quarter, De Waterkant, built around a Technogym Biocircuit that delivers AI-personalised 30-minute full-body workouts with on-site qualified personal trainers.',
    description_enriched_at = datetime('now')
WHERE slug = 'threezero-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger''s Milk Green Point is a branch of the South African restaurant chain known for burgers, grills and pizza paired with its own Tiger''s Milk Lager.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 11:00-00:00, Sat-Sun 09:00-00:00'
WHERE slug = 'tigers-milk-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger''s Milk Camps Bay is a branch of the South African restaurant chain serving burgers, grills, pizza and seafood alongside its own Tiger''s Milk Lager.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-00:00, Fri-Sun 09:00-00:00'
WHERE slug = 'tigers-milk-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger''s Milk Century City is a branch of the South African restaurant chain serving burgers, grills and pizza alongside its own Tiger''s Milk Lager, with breakfast served daily.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 09:00-00:00, Fri 09:00-02:00, Sat 09:00-00:00'
WHERE slug = 'tigers-milk-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tonkil Optometrist is a boutique optometry practice in The Point shopping centre, Sea Point, offering eye examinations, contact lenses, spectacle frames and sunglasses; it also operates as Tonkil Abramson Optometrists with a branch in Parow.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://tonkiloptometrist.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=403870", "https://thepointmall.co.za/merchant/tonkil-optometrist/"]'
WHERE slug = 'tonkil-optometrist-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tops at Spar Heathfield is a liquor store attached to the Spar supermarket on Main Road, Heathfield.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 11:00-18:45'
WHERE slug = 'tops-at-spar-heathfield-heathfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports is a sporting goods retailer in Victoria Wharf Shopping Centre, V&A Waterfront, stocking apparel, footwear and equipment with a focus on football, running, fitness and team merchandise.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00',
    source_urls = '["https://www.shopshours.co.za/totalsports/cape-town/c-57f3cabc47d677c3b27e3e05", "https://www.tiendeo.co.za/stores/cape-town/totalsports-victoria-wharf-victoria-and-alfred-waterfront/6409", "https://www.waterfront.co.za/stores/totalsports/"]'
WHERE slug = 'totalsports-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Traders Warehouse is a branch of the South African family-fashion chain in Golden Acre Shopping Centre, Cape Town CBD, selling affordable clothing and offering bulk discounts to resellers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:30, Sun 09:00-13:00'
WHERE slug = 'traders-warehouse-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths is a fashion, clothing and accessories retailer in Victoria Wharf Shopping Centre, V&A Waterfront.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00',
    source_urls = '["https://sabusinesslistings.co.za/listings/truworths-v-a-waterfront/", "https://www.guzzle.co.za/truworths/cape-town", "https://www.waterfront.co.za/stores/truworths"]'
WHERE slug = 'truworths-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bistro Sixteen82 is a contemporary tapas and bistro restaurant on the Steenberg Wine Estate, serving breakfast, lunch and tapas-style dinner with views over the vineyards and mountains.',
    description_enriched_at = datetime('now'),
    hours = 'Breakfast 09:00-11:00, Lunch 12:00-15:00, Tapas 17:00-21:00 daily'
WHERE slug = 'bistro-sixteen82-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Klein Bosheuwel Guest House is an owner-managed guest house on the Bishopscourt Ridge, a short walk from Kirstenbosch Botanical Gardens, offering three en-suite rooms with views over the Constantia Valley and its vineyards, plus an outdoor pool and garden.',
    description_enriched_at = datetime('now')
WHERE slug = 'klein-bosheuwel-guest-house-bishopscourt' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Paul Bothner Music''s Plumstead branch, in the Richmond Centre, is a two-floor musical instrument superstore stocking guitars, drum kits, keyboards, orchestral instruments and PA and recording equipment, with in-store music teachers offering lessons.',
    description_enriched_at = datetime('now')
WHERE slug = 'paul-bothner-music-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simply Asia in Plumstead''s Richmond Centre is a branch of a South African Thai and Asian restaurant chain, serving dine-in and takeaway dishes such as curries, noodles and rice dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Tue 12:00-21:00, Wed-Thu 12:00-21:30, Fri-Sat 12:00-22:00',
    source_urls = '["https://www.eatout.co.za/venue/simply-asia-plumstead/", "https://www.crave.co.za/establishment.asp?est=17353", "https://www.tripadvisor.co.za/Restaurant_Review-g6776488-d7851398-Reviews-Simply_Asia_Plumstead-Plumstead_Western_Cape.html", "https://www.dining-out.co.za/restaurant-index.aspx?MemberID=8585&SiteVersion=desktop"]'
WHERE slug = 'simply-asia-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Terry''s Beds in Plumstead is a large bedding and mattress showroom in the Southern Suburbs, stocking a wide range of beds including Edblo and Serta.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00'
WHERE slug = 'terrys-beds-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tryn at Steenberg is a contemporary restaurant on the Steenberg Wine Estate, serving breakfast, lunch and dinner with views over the vineyards.',
    description_enriched_at = datetime('now'),
    hours = 'Breakfast 08:00-11:00, Lunch 12:00-15:00, Dinner 18:00-22:00 daily'
WHERE slug = 'tryn-at-steenberg-tokai' AND description_enriched_at IS NULL;

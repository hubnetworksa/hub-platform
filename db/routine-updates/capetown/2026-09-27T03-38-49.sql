-- Job 4: description enrichment sweep, batch of 7 (clears backlog to zero)

UPDATE businesses
SET description = 'Baia is a Portuguese-influenced seafood restaurant on the V&A Waterfront harbour, established in 2001, known for its elegant interior and covered terraces with panoramic harbour views and an extensive wine list.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dining-out.co.za/md/Baia-Seafood-Restaurant/2093", "http://baiarestaurant.co.za/", "https://www.waterfront.co.za/eat-and-drink/baia-seafood-restaurant"]'
WHERE slug = 'baia-seafood-restaurant-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Den Anker is a Belgian restaurant and bar on the Pierhead at the V&A Waterfront, serving Belgian cuisine and a wide range of Belgian beers with views across the harbour.',
    description_enriched_at = datetime('now'),
    hours = 'Kitchen Mon-Sun 11:00-22:30, Bar Mon-Sun 11:00-00:00'
WHERE slug = 'den-anker-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Garden Court Nelson Mandela Boulevard is a 292-room hotel on the corner of Melbourne and Coronation Roads in Walmer Estate, part of the Southern Sun group, with rooms overlooking Signal Hill or the harbour, an outdoor pool, a gym and an on-site restaurant serving breakfast and dinner.',
    description_enriched_at = datetime('now')
WHERE slug = 'garden-court-nelson-mandela-boulevard-walmer-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harbour House is an upscale seafood restaurant on the harbour at the V&A Waterfront, offering a la carte dining downstairs and a sushi and cocktail lounge upstairs with views over the marina.',
    description_enriched_at = datetime('now')
WHERE slug = 'harbour-house-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Louis Vuitton operates a flagship boutique at Victoria Wharf Shopping Centre in the V&A Waterfront, unveiled in August 2026 as the brand''s newly opened Cape Town store.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00',
    source_urls = '["https://uk.louisvuitton.com/eng-gb/point-of-sale/south-africa/louis-vuitton-cape-town", "https://nowinsa.co.za/2026/louis-vuitton-opens-new-store-va-waterfront-cape-town/", "https://www.bizcommunity.com/article/louis-vuitton-unveils-new-flagship-boutique-at-va-waterfront-967844a"]'
WHERE slug = 'louis-vuitton-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mitchell''s Scottish Ale House is a pub at the Old Dock Master Building on the V&A Waterfront serving Scottish and pub-style food alongside 16 draught beers on tap and a range of Single Malt whisky tasting trays, with regular live music and DJs on evenings and weekends.',
    description_enriched_at = datetime('now')
WHERE slug = 'mitchells-scottish-ale-house-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willoughby & Co is a sushi and seafood restaurant at Victoria Wharf Shopping Centre in the V&A Waterfront, well known for its sushi rolls and seafood dishes; it does not take reservations, so queues are common especially at peak times.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:00'
WHERE slug = 'willoughby-and-co-va-waterfront' AND description_enriched_at IS NULL;

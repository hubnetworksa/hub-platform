UPDATE businesses
SET description = 'Harbour House Camps Bay is a seafood restaurant at The Promenade offering refined coastal cuisine with Mediterranean influences, made from fresh, locally sourced ingredients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:00-23:00',
    source_urls = '["https://www.harbourhouse.co.za/", "https://www.foodandhome.co.za/entertaining/harbour-house-camps-bay-has-officially-opened-its-doors", "https://www.dineplan.com/restaurants/harbour-house-camps-bay"]'
WHERE slug = 'harbour-house-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salsify at The Roundhouse is a fine-dining restaurant inside the historic Roundhouse building in Camps Bay, offering a tasting-menu style dining experience with views over the Atlantic.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 12:30-14:00 & 18:00-20:00, Sun 12:30-14:00, Mon Closed',
    source_urls = '["https://salsify.co.za/", "https://www.theworlds50best.com/discovery/Establishments/South-Africa/Cape-Town/Salsify-at-the-Roundhouse.html", "https://www.dineplan.com/restaurants/salsify-the-roundhouse"]'
WHERE slug = 'salsify-at-the-roundhouse-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umi is a Japanese and Asian fusion restaurant on the upper deck of the Marly Hotel in Camps Bay, serving sushi, sashimi and seafood-focused dishes with views over the bay.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312658-d5966649-Reviews-Umi-Camps_Bay_Western_Cape.html", "https://www.eatout.co.za/article/umi-marly-hotel-just-another-overpriced-camps-bay-restaurant/", "https://www.capetownmagazine.com/news/umi-restaurant-in-camps-bay/10_22_19114"]'
WHERE slug = 'umi-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Villa Massage Spa offers massage and spa treatments in Bantry Bay, bookable by appointment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-19:00, Sun 09:00-17:00'
WHERE slug = 'villa-massage-spa-bantry-bay' AND description_enriched_at IS NULL;

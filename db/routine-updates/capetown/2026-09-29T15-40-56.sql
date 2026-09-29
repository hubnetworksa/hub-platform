UPDATE businesses
SET description = 'COY is a fine-dining restaurant at the V&A Waterfront overlooking Table Mountain, opened in August 2024, offering an ocean-inspired take on southern African cooking that draws on traditional preparation techniques and forgotten ingredients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun Lunch 12:00-14:30, Dinner 18:00-20:30',
    source_urls = '["https://coyrestaurant.com/", "https://www.foodandhome.co.za/entertaining/chef-ryan-cole-to-open-coy-restaurant-at-the-va-waterfront", "https://iol.co.za/sunday-tribune/lifestyle/2024-07-12-chef-ryan-cole-unveils-a-sea-to-table-culinary-journey-at-va-waterfronts-coy/"]'
WHERE slug = 'coy-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pier is a fine-dining restaurant in the Pierhead Building at the V&A Waterfront, from the team behind Constantia''s La Colombe, serving a multi-course tasting menu built around fresh local seafood with global influences, including dishes such as tableside-poached oysters and crayfish tortellini.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waterfront.co.za/eat-and-drink/pier", "https://www.lacolombe.restaurant/pier", "https://www.theworlds50best.com/discovery/Establishments/South-Africa/Cape-Town/Pier.html"]'
WHERE slug = 'pier-va-waterfront' AND description_enriched_at IS NULL;

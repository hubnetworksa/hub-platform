UPDATE businesses
SET description = 'Golden Food Market is a butchery and grocery store in Hanover Park, stocking fresh and prepacked meat, frozen goods, seafood, and everyday household groceries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-13:00',
    source_urls = '["https://goldenfoodmarket.co.za/", "https://www.facebook.com/p/Golden-Food-Market-Hanover-Park-100086994050533/", "https://www.instagram.com/goldenfoodmarket_hp/"]'
WHERE slug = 'golden-food-market-hanover-park' AND description_enriched_at IS NULL;

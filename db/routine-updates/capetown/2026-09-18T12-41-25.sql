UPDATE businesses
SET description = 'Mimi''s is a deli and cafe on Lower Main Road in Observatory serving homemade breakfasts, sandwiches and soups, with vegetarian and vegan options and takeaway available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dining-out.co.za/md/Mimi-The-Delicious-Food-Company/4807", "https://www.southafricablog.com/cape-town/mimis-deli-observatory-cape-town-cafe-review", "https://www.eatout.co.za/venue/mimis-deli/"]'
WHERE slug = 'mimis-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Neighbourgoods Market is a weekly food, drink and designer market held at The Old Biscuit Mill in Woodstock on Saturdays, with free entry.',
    description_enriched_at = datetime('now')
WHERE slug = 'neighbourgoods-market-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Salon Riverlands is a beauty salon inside Riverlands Mall in Observatory offering manicures, pedicures, massages, threading, tinting and waxing.',
    description_enriched_at = datetime('now')
WHERE slug = 'sorbet-salon-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Potluck Club is a restaurant on the top floor of the Silo Building at The Old Biscuit Mill in Woodstock.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-potluck-club-woodstock' AND description_enriched_at IS NULL;

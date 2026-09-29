UPDATE businesses
SET description = 'Wimpy Longbeach Mall is a branch of the Wimpy family restaurant chain inside Longbeach Mall, Noordhoek, serving breakfast, burgers and classic diner-style meals.',
    description_enriched_at = datetime('now')
WHERE slug = 'wimpy-longbeach-mall-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Paddocks is a family-friendly Wimpy restaurant in The Paddocks Shopping Centre, Milnerton, serving classic breakfasts, burgers and comfort food.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-17:00, Sun 08:30-15:00'
WHERE slug = 'wimpy-paddocks-milnerton' AND description_enriched_at IS NULL;

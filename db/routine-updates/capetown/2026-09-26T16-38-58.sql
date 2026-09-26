UPDATE businesses
SET description = 'Organic Zone is a wholefood grocer in Lakeside that began as a veggie box delivery scheme in 2003 before opening as a shop in 2008, sourcing organic and local produce, groceries and personal care items. Its in-house kitchen and deli turn out grass-fed meats, free-range eggs and poultry, ready-made meals and artisanal baked goods, alongside fermented foods, cheeses and raw pet food.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:15-18:00, Sat-Sun & Public Holidays 08:15-17:00',
    source_urls = '["https://aspirelifestyle.co.za/organic-zone-a-community-business/", "https://nearbyza.com/place/organic-zone-coffee-bar", "https://www.capetownetc.com/food-and-drink/the-story-behind-organic-zone-a-hidden-gem-grocer/", "https://farmstall.co.za/directory/organic-zone/"]'
WHERE slug = 'organic-zone-lakeside' AND description_enriched_at IS NULL;

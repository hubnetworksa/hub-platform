UPDATE businesses
SET description = 'Camel Rock Restaurant is a long-standing seafood and grill restaurant in Scarborough, open since 1963, serving line fish, seafood platters, wood-fired pizzas and gourmet burgers.',
    description_enriched_at = datetime('now')
WHERE slug = 'camel-rock-restaurant-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Folk Cafe is a restaurant in the old post office building on Main Road, St James, serving wood-fired pizza, fresh fish and grills alongside vegetarian options and house-blended coffee, with a garden area for families.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 07:00-16:00, Tue-Sat 07:00-22:00, Sun 07:00-21:00',
    source_urls = '["https://www.capetownmagazine.com/folk-cafe", "https://www.eatout.co.za/venue/folk-cafe-st-james/", "https://www.dineplan.com/restaurants/folk-cafe-st-james", "https://www.folkcafe.co.za/contact/"]'
WHERE slug = 'folk-cafe-st-james' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Foragers Deli & Wholefoods is a deli and whole foods store inside The Village Hub in Scarborough, stocking fresh and packaged wholefood groceries.',
    description_enriched_at = datetime('now')
WHERE slug = 'foragers-deli-wholefoods-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roberto Ricci Designs is a clothing boutique inside The Village Hub in Scarborough, stocking the Italian RRD brand''s outdoor and water-sports apparel, including swimwear, knitwear and weatherproof coats.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thevillagehub.co.za/roberto-ricci-design/", "https://za.locale.online/roberto-ricci-designs-scarborough-2111060499.html", "https://robertoriccidesigns.com/"]'
WHERE slug = 'roberto-ricci-designs-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sopra is an Italian restaurant upstairs at The Village Hub in Scarborough -- its name means "above" in Italian -- serving an a la carte Italian menu for dinner and weekend lunch.',
    description_enriched_at = datetime('now')
WHERE slug = 'sopra-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'St James Guesthouses offers accommodation on Main Road in St James.',
    description_enriched_at = datetime('now')
WHERE slug = 'st-james-guesthouses-st-james' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Whole Earth Cafe is a health-focused cafe in Scarborough serving breakfast dishes, salads, falafel and vegan, raw and gluten-free options, alongside cold-pressed juices and smoothies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:30-16:00'
WHERE slug = 'whole-earth-cafe-scarborough' AND description_enriched_at IS NULL;

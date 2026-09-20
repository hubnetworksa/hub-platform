UPDATE businesses
SET description = 'Cash Crusaders Blue Downs is a general retail store in Blue Downs Shopping Centre, Blue Downs, trading seven days a week including Sunday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00'
WHERE slug = 'cash-crusaders-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Blue Downs is a fashion and footwear store in Blue Downs Shopping Centre, Blue Downs, trading seven days a week including Sunday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-17:30, Fri 08:30-17:00, Sat 08:00-15:00, Sun 09:00-13:00'
WHERE slug = 'pep-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Blue Downs is a supermarket in Blue Downs Shopping Centre, Blue Downs, offering groceries and everyday essentials for the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Body Shop in Gardens Shopping Centre is a skincare, bath and beauty retailer in Gardens, Cape Town, trading seven days a week including Sunday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'the-body-shop-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Body Shop in Waterstone Village is a skincare, bath and beauty retailer in Somerset West, trading seven days a week including Sunday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'the-body-shop-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Bungalow is an oceanfront restaurant at The Glen Country Club in Clifton, serving a menu of fresh sushi, seafood, steak and South African fare with views of the Atlantic between Lion''s Head and the Twelve Apostles.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-bungalow-clifton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Butcher Shop & Grill is a long-standing, family-run steakhouse in Mouille Point whose meat-trading roots go back three generations, offering hand-carved, dry-aged steaks and a seafood-and-grill menu with seating for up to 250 guests.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-butcher-shop-and-grill-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Chiropractic Health Centre is a chiropractic practice on the 3rd floor of The Point in Sea Point, offering chiropractic consultations, biokinetics, massage therapy and foot care treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00',
    source_urls = '["https://www.chiropractor.co.za/location-atlantic-chiropractic/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=200407", "https://thepointmall.co.za/merchant/chiropractic-health-centre-sea-point/"]'
WHERE slug = 'chiropractic-health-centre-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Clarendon Boutique Hotel is a family-run, 16-room heritage guesthouse in Fresnaye established in 1996, with dual swimming pools overlooking Clifton Bay and breakfast served daily.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-clarendon-boutique-hotel-fresnaye' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Counselling Hub is a nonprofit counselling and mental-health service in The Palms Emporium, Woodstock, offering low-cost one-on-one counselling sessions and group workshops on trauma, anxiety, depression and grief.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00, Fri 09:00-15:00'
WHERE slug = 'the-counselling-hub-woodstock' AND description_enriched_at IS NULL;

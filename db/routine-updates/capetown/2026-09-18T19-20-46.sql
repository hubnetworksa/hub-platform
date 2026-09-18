UPDATE businesses
SET description = 'American Swiss is a national jewellery and watch retail chain, with this branch located on the lower concourse level of Golden Acre Shopping Centre in central Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'american-swiss-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bargain Books is a South African discount bookstore chain, with this branch trading from Waterstone Village shopping centre in Somerset West and offering bestsellers, stationery and general reading material at reduced prices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'bargain-books-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bergman, Ross & Partners is a private radiology practice with a branch at The Point in Sea Point, offering diagnostic imaging services as part of its network of Cape Town practices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'bergman-ross-partners-radiology-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Big Picture Company is a marketing and advertising business based at The Old Biscuit Mill in Woodstock.',
    description_enriched_at = datetime('now')
WHERE slug = 'big-picture-company-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bilboa is a Mediterranean-inspired seafood restaurant with an elevated deck overlooking the beach, located on the first floor of The Promenade in Camps Bay.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 12:00-22:30, Sat-Sun 11:00-22:30'
WHERE slug = 'bilboa-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Billy Now is a Cape Town-based clothing brand known for limited-run printed shirts and jackets designed and made locally, with a store in Cape Quarter Lifestyle Village in De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'billy-now-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Body20 Riverlands is a franchise studio offering 20-minute EMS (electrical muscle stimulation) personal training sessions, located in Riverlands Mall in Observatory.',
    description_enriched_at = datetime('now')
WHERE slug = 'body20-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company is a Cape Town coffee shop chain serving all-day breakfast, brunch and coffee, with this branch trading from The Point mall in Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 06:00-18:00, Sun 06:00-15:00',
    source_urls = '["https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerXSSeaPoint", "https://www.eatout.co.za/venue/bootlegger-coffee-company/", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerThePointMall"]'
WHERE slug = 'bootlegger-coffee-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Botanica Jewellery is a Cape Town studio creating handcrafted sterling silver and gold jewellery with a botanical theme inspired by local fauna and flora, including engagement rings and custom commissions, based at The Old Biscuit Mill in Woodstock.',
    description_enriched_at = datetime('now')
WHERE slug = 'botanica-jewellery-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Breitling is a Swiss luxury watchmaker with a boutique in Victoria Wharf at the V&A Waterfront, offering the brand''s range of aviation, diving and chronograph watches.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00',
    source_urls = '["https://www.thevault.co.za/en/our-shops-the-vault/the-vault-cape-town-breitling", "https://www.breitling.com/za-en/stores/breitling-boutiques/za/breitling-boutique-cape-town/", "https://www.waterfront.co.za/stores/breitling-boutique-cape-town/"]'
WHERE slug = 'breitling-va-waterfront' AND description_enriched_at IS NULL;

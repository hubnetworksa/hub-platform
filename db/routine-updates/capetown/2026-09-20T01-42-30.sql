UPDATE businesses
SET description = 'OK MiniMark Brooklyn Junction is a convenience supermarket in the Brooklyn Junction retail centre in Brooklyn.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-minimark-brooklyn-junction-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean Basket Vangate Mall is a branch of the Ocean Basket seafood restaurant chain, in Vangate Mall, Athlone.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-20:30, Fri-Sat 11:00-21:00, Sun 11:00-20:30'
WHERE slug = 'ocean-basket-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Richmond Corner is a branch of the Pick n Pay supermarket chain, in Richmond Corner shopping centre in Richwood, Milnerton.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Radebe''s Bed and Breakfast is a family-run guesthouse in Settlers Place, Langa, open since 2005, with three themed guest bedrooms and a coffee shack serving continental or African breakfasts, with lunch and dinner also available on request.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sa-venues.com/westerncape/guesthouses/langa.php", "https://heybedbreakfast.co.za/Cape_Town/Kwa-Langa_township/", "http://www.modernoverland.com/south-africa/cape-town/langa/radebes-bb/"]'
WHERE slug = 'radebes-bed-and-breakfast-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sapphire Corporate Solutions is a corporate clothing and promotional gifting company on Inyoni Street in Ndabeni, founded in 1975, offering in-house design, branded product sourcing and manufacturing, and warehousing, packaging and distribution logistics from a large on-site warehouse.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://sapplive.co.za/contact/", "https://brabys.com/south-africa/cape-town/verified-business/sapphire-corporate-solutions", "https://www.dnb.com/business-directory/company-profiles.sapphire_corporate_solutions_(pty)_ltd.7b897897def4e1891bebb5e5fe404420.html"]'
WHERE slug = 'sapphire-corporate-solutions-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street Vangate Mall is a branch of the Sheet Street home furnishings and textiles chain, in Vangate Mall, Athlone.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'sheet-street-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Eerste River is a branch of the Shoprite supermarket chain, in Grand Central Shopping Centre at the corner of Main and Plein Street, Eerste River.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-eerste-river-grand-central-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Khayelitsha CBD is a branch of the Shoprite supermarket chain at the corner of Walter Sisulu and Nomzamo Mongo Street in Khayelitsha, with an in-store bakery, deli, meat market and kosher butchery counter alongside banking and ATM facilities.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-21:00'
WHERE slug = 'shoprite-khayelitsha-cbd-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sotano is a seaside restaurant on Beach Road in Mouille Point, open since 2012, serving a Mediterranean-influenced menu of breakfasts, tapas, sushi, seafood linguine and paella.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:00-23:00',
    source_urls = '["https://www.eatout.co.za/venue/sotano-by-caveau/", "https://www.dining-out.co.za/md/Sotano-by-Caveau/5732", "https://www.capetownmagazine.com/sotano"]'
WHERE slug = 'sotano-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southern Ropes Factory Shop is the retail outlet of Southern Ropes, a synthetic rope manufacturer founded in 1984, on Section Street in Paarden Eiland, selling rope, twine, braids and netting off the reel for marine, industrial, mining and defence use, including splicing assistance.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com", "https://www.netpages.co.za", "https://www.southernropes.com/factoryshop"]'
WHERE slug = 'southern-ropes-factory-shop-paarden-eiland' AND description_enriched_at IS NULL;

-- Job 4: description enrichment sweep
UPDATE businesses
SET description = 'Central Pharmacy is a retail pharmacy located in the Mitchells Plain Town Centre, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'central-pharmacy-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eerste River Paint & Hardware is a hardware and paint retailer on Bobs Way, supplying building materials, tools and paint to the Eerste River community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-19:00, Sun Closed',
    source_urls = '["https://www.yellosa.co.za/company/838131/eerste-river-painthardware", "https://www.brabys.com/za/western-cape/cape-town/eerste-rivier/hardware-retailers/eerste-river-paint-hardware", "https://www.shopshours.co.za/eerste-river-paint-hardware/cape-town/c-57f3c9ec47d677c3b27a3a00"]'
WHERE slug = 'eerste-river-paint-hardware-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MTN Store is a mobile phone and network services outlet operating from Grand Central Shopping Centre in Eerste River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 08:30-13:30',
    source_urls = '["https://www.callupcontact.com/b/Mobile_Phone_Shop/MTN_Store_Grand_Central/6669505", "https://nearbyza.com/place/mtn-store-grand-central", "https://www.openhours-southafrica.com/en/cape-town/mtn-store-grand-central"]'
WHERE slug = 'mtn-store-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Furniture is a furniture and homeware retailer with a store in Eerste Rivier Mall, Eerste River.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-furniture-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers is a flame-grilled burgers, chicken and ribs quick-service restaurant operating in the food court at Liberty Promenade, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://location.steers.co.za/promenade", "https://libertypromenade.co.za/shops/steers/", "https://www.tiendeo.co.za/stores/mitchells-plain/steers-shop-promenade-food-court-promenade-centre/36043", "https://locations.steers.co.za/restaurants-LibertyPromonade-SteersPromenade"]'
WHERE slug = 'steers-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

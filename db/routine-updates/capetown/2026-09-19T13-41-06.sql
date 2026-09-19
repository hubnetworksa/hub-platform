UPDATE businesses
SET description = 'MTN Waterstone Village is a mobile phone and data store inside Waterstone Village, offering MTN airtime, data, devices and account services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 10:00-14:00'
WHERE slug = 'mtn-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MTN Golden Acre is a mobile phone and data store on the concourse level of Golden Acre Shopping Centre, offering MTN airtime, data, devices and account services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:30, Sat 08:30-13:30'
WHERE slug = 'mtn-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Malok is a homegrown South African fashion brand based at The Old Biscuit Mill in Woodstock, designing and producing feminine, versatile clothing from natural fabrics with a sustainable, ethical approach.',
    description_enriched_at = datetime('now')
WHERE slug = 'malok-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mamma Roma is an Italian restaurant on Dean Street in Newlands, serving lunch and dinner in a traditional trattoria-style setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-14:30, 18:00-22:00, Sun Closed'
WHERE slug = 'mamma-roma-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mantra Cafe is an all-day restaurant on Victoria Road in Camps Bay, serving fresh seafood, gourmet burgers and salads alongside coffee and cocktails in an ocean-facing space.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-22:30, Sun 09:00-22:30'
WHERE slug = 'mantra-cafe-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mariner''s Wharf is a harbourside seafood destination in Hout Bay combining the Wharfside Grill restaurant, a fast-food Seafood Bistro, a fishmarket, bakery and nautical gift shops.',
    description_enriched_at = datetime('now')
WHERE slug = 'mariners-wharf-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Markham Golden Acre is a men''s and women''s fashion retailer on the concourse level of Golden Acre Shopping Centre, stocking clothing, footwear and accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-14:00, Sun 09:00-13:00'
WHERE slug = 'markham-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Martins Bakery is a bakery, deli and coffee shop on Main Road in Diep River, known locally as something of a hidden gem for its baked goods and light meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-16:00, Sun 08:00-16:00',
    source_urls = '["https://martinsbakery.co.za/contact/", "https://www.eatout.co.za/venue/martins-bakery/", "https://www.sa-venues.com/things-to-do/westerncape/martins-bakery/", "https://www.capetownmagazine.com/hidden-gem-martins-bakery"]'
WHERE slug = 'martins-bakery-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matrix Warehouse Ysterplaat is a computer and IT retailer in Highway Park, stocking computer hardware, software and networking equipment and offering repairs and upgrades, part of the wider Matrix Warehouse Computers network.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cylex.co.za", "https://www.thinklocal.co.za", "https://matrixwarehouse.co.za/pages/stores"]'
WHERE slug = 'matrix-warehouse-ysterplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Waterstone is a fast-food restaurant inside Waterstone Village in Somerset West, serving the chain''s usual burgers, breakfast items and drive-thru menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 06:00-23:00, Fri-Sat 06:00-00:00, Sun 06:00-23:00'
WHERE slug = 'mcdonalds-waterstone-somerset-west' AND description_enriched_at IS NULL;

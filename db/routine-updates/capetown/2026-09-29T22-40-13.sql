UPDATE businesses
SET description = 'Bootlegger Coffee Company''s Kenilworth branch, in the Pam Golding on Main development, is part of the wider Bootlegger Coffee Company chain, serving coffee, breakfast, lunch and evening meals with extended hours toward the weekend.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 06:30-18:00, Thu-Fri 06:30-21:00, Sat 07:00-21:00, Sun 07:00-15:00'
WHERE slug = 'bootlegger-coffee-company-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cattle Baron Constantia is a steakhouse branch of the national Cattle Baron chain, inside Constantia Village Shopping Centre, serving steaks and a wine selection following a 2022 renovation that expanded its dining and bar areas.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:00, Sun 12:00-21:30',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312660-d2390553-Reviews-Cattle_Baron_Constantia-Constantia_Western_Cape.html", "https://triptap.com/places/za/western-cape/cape-town/cattle-baron-constantia-t000c6f2", "https://www.eatout.co.za/venue/cattle-baron-steak-ranch-constantia/"]'
WHERE slug = 'cattle-baron-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chardonnay Deli''s Constantia branch is a deli and cafe on Constantia Main Road, one of several branches of the Chardonnay Deli group that also has locations in Kalk Bay and on the Constantia Uitsig wine farm, serving deli fare daily.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-18:00',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312660-d7699737-Reviews-Chardonnay_Deli-Constantia_Western_Cape.html", "https://insideguide.co.za/cape-town/restaurants/chardonnay-deli/", "https://www.chardonnaydeli.co.za/"]'
WHERE slug = 'chardonnay-deli-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Desray''s Chelsea Courtyard branch sells locally made, slow-fashion ladies'' clothing, one of several stores of a family-run South African fashion brand trading for more than 30 years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:30, Sun Closed',
    source_urls = '["https://desray.co.za/pages/store-locations", "https://chelseacourtyard.com/directory/", "https://desray.co.za/pages/trading-hours"]'
WHERE slug = 'desray-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dimples Dumpling House is a dim sum and dumpling eatery on Main Road, Kenilworth, serving steamed dumplings and Asian small plates, with advance phone orders recommended in the evenings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-21:00, Sun Closed'
WHERE slug = 'dimples-dumpling-house-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Foxcroft is a restaurant and in-house bakery in the High Constantia Centre, offering lunch and dinner service alongside a bakery counter open daily for fresh pastries and bread.',
    description_enriched_at = datetime('now'),
    hours = 'Bakery daily 08:00-16:00, Lunch 12:00-14:00, Dinner 18:00-20:30',
    source_urls = '["https://www.capetownmagazine.com/foxcroft-restaurant-and-bakery", "https://www.tripadvisor.co.za/Restaurant_Review-g312660-d10755380-Reviews-Foxcroft-Constantia_Western_Cape.html", "https://www.eatout.co.za/venue/foxcroft/"]'
WHERE slug = 'foxcroft-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kleinsky''s Constantia branch is a New-York-style delicatessen in the High Constantia Centre, part of a small chain with sister branches in Sea Point and at the V&A Waterfront, serving deli sandwiches and baked goods daily.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-19:30'
WHERE slug = 'kleinskys-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Knead''s Kenilworth branch is a bakery and cafe located inside the Pick n Pay at the Pam Golding on Main development, serving freshly baked bread, pastries and brewed coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-18:00',
    source_urls = '["https://www.eatout.co.za/venue/knead-kenilworth/", "https://propertywheel.co.za/2015/07/new-multi-use-development-pam-golding-on-main-in-kenilworth-opens-its-doors/", "https://lantador.com/directoryplus/listing/72/1261/3906/6127309"]'
WHERE slug = 'knead-bakery-cafe-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Little Fox is a sister restaurant to Foxcroft at the historic Constantia Nek site, offering a la carte small and sharing plates for lunch and dinner seven days a week.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/article/la-colombe-group-opens-little-fox-their-new-restaurant-in-constantia/", "https://www.ewn.co.za/2026/03/01/little-fox-now-offers-second-dining-option-at-historic-constantia-nek", "https://www.lacolombe.restaurant/little-fox"]'
WHERE slug = 'little-fox-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moksh''s Kenilworth branch serves North Indian cuisine including South Indian dosas and coastal seafood curries, with dishes prepared fresh on-site without preservatives, offering dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 12:00-17:00, Mon 16:00-21:30, Tue-Sat 12:00-21:30'
WHERE slug = 'moksh-kenilworth' AND description_enriched_at IS NULL;

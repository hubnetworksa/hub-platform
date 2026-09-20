UPDATE businesses
SET description = 'Barracudas is a seafood restaurant on the Fish Hoek beachfront, on the corner of Beach and Recreation Roads.',
    description_enriched_at = datetime('now')
WHERE slug = 'barracudas-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bhandaris Indian Restaurant serves North Indian cuisine, including curries, tandoori dishes and freshly baked naan, on Main Road in Fish Hoek; it does not hold a liquor licence, so guests may bring their own alcohol.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g635515-d1988115-Reviews-Bhandaris_Indian_Restaurant-Fish_Hoek_Western_Cape.html", "https://www.eatout.co.za/venue/bhandaris-indian-restaurant-fish-hoek/", "https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/bhandaris-indian-restaurant-f53ceb"]'
WHERE slug = 'bhandaris-indian-restaurant-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bombay Chilli Indian Bistro is a family-run Indian restaurant on Beach Road in Muizenberg, serving curries, tandoori dishes and freshly baked naan.',
    description_enriched_at = datetime('now')
WHERE slug = 'bombay-chilli-indian-bistro-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'C''est La Vie is a French-style artisan bakery and coffee shop on Recreation Road in Fish Hoek, known for its freshly baked pastries, croissants and coffee.',
    description_enriched_at = datetime('now')
WHERE slug = 'cest-la-vie-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Pescado is a casual restaurant on St Georges Street in Simon''s Town serving pizzas, pastas, burgers and seafood, with prawns and calamari among its specialities, plus regular live music.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-23:00'
WHERE slug = 'cafe-pescado-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank is a bank branch inside Delft Mall, offering everyday banking services to shoppers in Delft.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank is a bank branch inside Capricorn Square, offering everyday banking services to shoppers in Muizenberg.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Casa Labia is a heritage Venetian-style villa on Main Road in Muizenberg, built in 1929 and now run as a museum and cultural centre with an art collection, gallery and event venue.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://blog.sa-venues.com/provinces/western-cape/casa-labia-in-muizenberg/", "https://www.tripadvisor.com/Restaurant_Review-g1509162-d2460106-Reviews-Casa_Labia_by_Ideas_Cartel-Muizenberg_Western_Cape.html", "https://sahistory.org.za/place/casa-labia198-main-road-muizenberg"]'
WHERE slug = 'casa-labia-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cattle Baron is a steakhouse restaurant inside Harbour Bay Mall in Simon''s Town, part of the Cattle Baron restaurant chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'cattle-baron-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza is a pizza takeaway and delivery outlet inside Delft Mall, part of the Debonairs Pizza chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'debonairs-pizza-delft-mall-delft' AND description_enriched_at IS NULL;

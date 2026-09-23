UPDATE businesses
SET description = 'Saveur Restaurant in the Simon''s Town Boardwalk Centre serves modern European cuisine, from gourmet burgers to fresh hake and chips, with a rotating catch-of-the-day and a weekly burger night.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 09:00-21:00, Sun-Mon 09:00-17:00',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g319718-d7195583-Reviews-Saveur_Restaurant-Simon_s_Town_Western_Cape.html", "https://www.eatout.co.za/venue/saveur-restaurant-simons-town/", "https://www.dining-out.co.za/md-menu/Saveur-Restaurant-Simons-Town/8045"]'
WHERE slug = 'saveur-restaurant-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seaforth Restaurant sits on Seaforth Beach near the Boulders penguin colony in Simon''s Town, serving seafood and sharing platters with views over False Bay.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:30-late'
WHERE slug = 'seaforth-restaurant-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simon''s Town Museum, housed in The Residency on Court Road, displays exhibits on the town''s local and naval history.',
    description_enriched_at = datetime('now')
WHERE slug = 'simons-town-museum-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simon''s Town Pharmacy operates inside the SPAR supermarket on St George''s Street, offering dispensing and everyday pharmacy services alongside the store''s grocery range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:00',
    source_urls = '["http://wecarepharmacy.co.za/pharmacy-at-spar-simons-town/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88963", "https://my-catalogue.co.za/stores/simon-s-town/spar/102-st-georges-street"]'
WHERE slug = 'simons-town-pharmacy-at-spar-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The South African Naval Museum in Simon''s Town displays naval uniforms, medals, ship models and a recreated submarine control room, with exhibits covering the SS Mendi tragedy and South Africa''s naval history through both world wars.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:30-15:30',
    source_urls = '["https://sanavymuseum.co.za/contact/", "https://www.tripadvisor.com/Attraction_Review-g319718-d4115586-Reviews-South_African_Naval_Museum-Simon_s_Town_Western_Cape.html", "https://www.sa-venues.com/things-to-do/westerncape/south-african-naval-museum/"]'
WHERE slug = 'south-african-naval-museum-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Fish Hoek Galley is a seafood restaurant at Bayside on Fish Hoek Beach, serving grilled prawns, linefish and a seafood platter alongside classic fish and chips.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fishhoekgalley.com/contact/", "https://www.tripadvisor.co.za/Restaurant_Review-g635515-d6714793-Reviews-The_Galley_Restaurant-Fish_Hoek_Western_Cape.html", "https://www.capepointroute.co.za/moreinfoRestaurants.php?aID=74"]'
WHERE slug = 'the-fish-hoek-galley-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Stag & Maiden Cafe is a coffee shop on Recreation Road in Fish Hoek, serving breakfast and light meals through the day.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 06:30-16:00, Sun 08:00-14:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g635515-d12557424-Reviews-The_Stag_Maiden_Cafe-Fish_Hoek_Western_Cape.html", "https://za.africabz.com/western-cape/the-stag-coffee-company-10485", "https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/the-stag-maiden-cafe-2bade7/menu"]'
WHERE slug = 'the-stag-and-maiden-cafe-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Warren''s Pharmacy is a community pharmacy on Main Road in Fish Hoek, offering dispensing and everyday health and wellness products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-19:00, Sun 09:00-19:00',
    source_urls = '["https://za.africabz.com/western-cape/warrens-pharmacy-62617", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=326529", "https://www.yellosa.co.za/company/747341/warrens-pharmacy"]'
WHERE slug = 'warrens-pharmacy-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Warrior Toy Museum on King George Way in Simon''s Town displays a collection of around 4,000 model cars and 500 vintage dolls, alongside two working model railways.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-14:00, Sat-Sun 10:00-15:00',
    source_urls = '["https://www.capetownmagazine.com/vintage-toy-museum", "https://www.sa-venues.com/things-to-do/westerncape/warrior-toy-museum/", "https://www.simonstown.com/listing/warrior-toy-museum-and-shop/"]'
WHERE slug = 'warrior-toy-museum-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Watson''s Meat Market is a butchery on Main Road in Fish Hoek, selling fresh meat and related products to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'watsons-meat-market-fish-hoek' AND description_enriched_at IS NULL;

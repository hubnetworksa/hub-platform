-- Job 4: description enrichment sweep, checkpoint 2 of 2 (records 11-20)
UPDATE businesses
SET description = 'Harvest Moon Watercolours is a small Cape Town business at Imhoff Farm in Kommetjie making handcrafted, 100% vegan watercolour paints with ethically sourced, cruelty-free pigments.',
    description_enriched_at = datetime('now')
WHERE slug = 'harvest-moon-watercolours-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Total Rocklands is a branch of the KFC fast-food chicken restaurant chain, located at the Total filling station in Rocklands, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-total-rocklands-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kalk Bay Gallery is an art gallery on Main Road in Kalk Bay.',
    description_enriched_at = datetime('now')
WHERE slug = 'kalk-bay-gallery-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kommetjie Estate Agency is an estate agency based on Main Street in Kommetjie.',
    description_enriched_at = datetime('now')
WHERE slug = 'kommetjie-estate-agency-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kommetjie Village Vet, part of the Two Oceans Veterinary Group, offers routine wellness check-ups, vaccinations, dental care, general consultations, diagnostics and surgical procedures, alongside emergency treatment.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=237592", "https://www.vetdirectory.co.za/categories/public/western-cape/veterinary-practices/kommetjie-village-veterinary-consulting-room", "https://savet.co.za/vet/kommetjie-village-veterinary-consulting-room"]'
WHERE slug = 'kommetjie-village-vet-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Femme Health & Beauty Salon has operated in Noordhoek for over 20 years, now part of the Noordhoek Garden Emporium complex, offering massages, manicures, pedicures and other beauty treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-14:30, Sun Closed',
    source_urls = '["https://www.facebook.com/lafemmenoordhoek/", "https://lafemmebeauty.co.za/", "https://www.fresha.com/lvp/la-femme-health-and-beauty-katzenellenbogen-street-cape-town-G57kbP"]'
WHERE slug = 'la-femme-health-and-beauty-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lakeside Brewing Co Taproom is a craft brewery and taproom at Imhoff Farm in Kommetjie, established in 2013, offering a range of house-brewed beer styles and a fully stocked bar with indoor and outdoor seating, run in collaboration with Blue Water Cafe.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatplaydrink.capetown/play/imhoff-farm-in-kommetjie-revived-as-unique-retail-destination/", "https://www.facebook.com/imhofffarm.co.za/posts/great-news-the-lakeside-beer-garden-is-finished-and-its-looking-very-coollakesid/3221476517964953/", "https://www.tripadvisor.com/Attraction_Review-g1214290-d25966773-Reviews-Lakeside_Brewing_Co-Kommetjie_Western_Cape.html"]'
WHERE slug = 'lakeside-brewing-co-taproom-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Las Paletas makes handmade sorbet and dairy ice lollies in small batches from real fruit, herbs, spices, nuts and dairy, with no artificial colours, flavours, preservatives or additives; orders must be placed in advance.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.bestdirectory.co.za/las-paletas-ice-cream-ice-cream-dairy-food-and-related-products-in-milnerton-cape-town-western-cape.html", "https://2pos.co.za/2/14734", "https://laspaletas.co.za/"]'
WHERE slug = 'las-paletas-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Live Bait is a seafood restaurant built on the breakwater at Kalk Bay Harbour, open since 1999, serving sushi, calamari, line fish and seafood platters alongside other non-seafood options, with views over False Bay and the working harbour.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetownmagazine.com/live-bait-restaurant", "https://www.eatout.co.za/venue/live-bait-kalk-bay/", "https://livebait.co.za/"]'
WHERE slug = 'live-bait-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Logica Beauty Supplies is a professional beauty industry supplier in Montague Gardens, providing salon, spa and educational-facility essentials with delivery, in-store pickup and in-store shopping options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:00',
    source_urls = '["https://www.logicabeauty.com/pages/contact-us", "https://www.probeautydirectory.co.za/western-cape/montague-gardens/what-you-supply/logica-beauty-supplies", "https://www.brabys.com/za/western-cape/milnerton/montague-gdns-ind/cosmetic-manufacturers-distributors/logica-beauty-supplies"]'
WHERE slug = 'logica-beauty-supplies-montague-gardens' AND description_enriched_at IS NULL;

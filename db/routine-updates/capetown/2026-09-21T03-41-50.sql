-- Job 4: description enrichment sweep, checkpoint 1 of 3 (10 businesses)

UPDATE businesses
SET description = 'Bella Pizza is a wood-fired pizzeria in Lakeside Centre, Lakeside, serving thin-crust pizzas alongside burgers, salads and ribs, with delivery and collection available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-21:00',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/2333506_2", "https://www.bellapizza.co.za/contact-2/", "https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/bella-pizza-472ab4"]'
WHERE slug = 'bella-pizza-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Estilo Hair is a unisex hair salon in The Old Bakery, Lakeside, offering cuts and styling using Davines products, plus manicures and pedicures with Opi and Essie polishes.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 09:00-17:00, Sat 09:00-15:00, Sun-Mon Closed',
    source_urls = '["https://www.fresha.com/lvp/estilo-hair-salon-lincoln-road-cape-town-gn306o", "https://www.estilohairsa.com/", "https://oldbakerylakeside.wordpress.com/book-world/"]'
WHERE slug = 'estilo-hair-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lakeside Pharmacy is a pharmacy on Main Road in Lakeside.',
    description_enriched_at = datetime('now')
WHERE slug = 'lakeside-pharmacy-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pet Plus Lakeside is a pet supply store in The Old Bakery, Lakeside, stocking pet food, treats and accessories from well-known brands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun 09:00-15:00',
    source_urls = '["https://za.africabz.com/western-cape/pet-plus-lakeside-178271", "https://www.pooh.co.za/listing/pet-plus-lakeside/", "http://www.petdirectorysa.co.za/pet-plus-vet-store---lakeside-255.html"]'
WHERE slug = 'pet-plus-lakeside-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Lakeside is a supermarket in Lakeside Centre, Lakeside, stocking groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-21:00',
    source_urls = '["https://za.africabz.com/western-cape/pick-n-pay-lakeside-26909", "https://my-catalogue.co.za/stores/lakeside/pick-n-pay-supermarket/main-road", "https://yandex.com/maps/org/pick_n_pay_lakeside_store/40771037060/"]'
WHERE slug = 'pick-n-pay-lakeside-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Lakeside, in Lakeside Shopping Centre, offers copying and printing, domestic and international courier services, stationery, digital business solutions and mailbox rental.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 09:00-12:00, Sun Closed',
    source_urls = '["https://www.postnet.co.za/stores/lakeside", "https://www.callupcontact.com/b/Courier_amp_Postal_Services/Postnet_Lakeside/3832", "https://opening-hours.co.za/04509470/PostNet_Lakeside"]'
WHERE slug = 'postnet-lakeside-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rouge Day Spa Old Bakery, in The Old Bakery, Lakeside, offers facials, skincare and massage treatments, including acne and men''s facials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun Closed'
WHERE slug = 'rouge-day-spa-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunningdale Pharmacy is a pharmacy in Parklands Shopping Centre, Parklands.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunningdale-pharmacy-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafelsig Moslem Butchery is a butchery in Tafelsig, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'tafelsig-moslem-butchery-tafelsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Toad in the Village is a casual pub and beer garden in Noordhoek Farm Village, serving classic pub fare with a South African twist, including pies and wood-fired pizza, across indoor and outdoor seating.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/the-toad-in-the-village-26354", "https://www.capepointroute.co.za/moreinfoRestaurants.php?aID=401", "https://www.eatout.co.za/venue/the-toad-in-the-village/"]'
WHERE slug = 'the-toad-in-the-village-noordhoek' AND description_enriched_at IS NULL;

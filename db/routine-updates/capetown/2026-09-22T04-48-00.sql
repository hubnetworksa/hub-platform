UPDATE businesses
SET description = 'Ashley''s Family Restaurant is a long-standing family restaurant in Goodwood serving seafood, steaks, burgers, pasta, pizzas, ribs and chicken, with a carvery on Wednesday evenings and Sunday lunchtimes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:30 till late',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1841250-d3878588-Reviews-or45-Ashley_s_Family_Restaurant-Goodwood_Western_Cape.html", "https://www.facebook.com/Ashleysfamilyrestaurant/", "https://ashleysrestaurant.co.za/"]'
WHERE slug = 'ashleys-family-restaurant-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Sanlam (Parow) is a pharmacy, health and beauty retail branch inside Parow Centre offering a dispensary and clinic services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://clicks.co.za/store/Sanlam-(Parow)/111", "https://za.africabz.com/western-cape/clicks-pharmacy-32844", "https://my-catalogue.co.za/stores/bellville/clicks/sanlam-centre-voortrekker-road-parow"]'
WHERE slug = 'clicks-parow-centre-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Grill Baby is a halaal, flame-grilled restaurant in Parow East serving steaks, ribs, burgers and pizza.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 12:00-21:00, Fri 14:00-22:00, Sat 12:00-22:00, Sun 12:00-20:00',
    source_urls = '["https://www.grillbaby.co.za/", "https://za.africabz.com/western-cape/grill-baby-parow-416570", "https://magicpin.com/south-africa/Parow/Parow/Restaurant/Grill-Baby-Parow/store/28b4299"]'
WHERE slug = 'grill-baby-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Randy Warthog Bar & Grill is a backpacker-style bar and grill in Green Point serving breakfast, burgers and chicken schnitzels, with a daily happy hour and weekly themed nights.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-22:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g12880258-d15856847-Reviews-Randy_Warthog_Bar_Grill-Green_Point_Western_Cape.html", "https://www.dining-out.co.za/md/Randy-Warthog-Restaurant-and-Bar/9761", "https://randywarthog.com/"]'
WHERE slug = 'randy-warthog-bar-grill-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Readers Warehouse Factory Store is a discount bookshop in the Diep River Industrial Park selling reduced-price fiction, non-fiction and children''s books, plus toys and board games.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:30',
    source_urls = '["https://www.findglocal.com/ZA/Cape-Town/606029066419340/Readers-Warehouse-Factory-Store", "https://www.waze.com/live-map/directions/za/wc/cape-town/readers-warehouse?to=place.ChIJyUmP0otDzB0RdSmeC8zEHrM", "https://www.readerswarehouse.co.za/pages/store-locator"]'
WHERE slug = 'readers-warehouse-factory-store-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RocoMamas Green Point is a branch of the RocoMamas burger chain on Main Road, serving burgers, ribs and loaded fries in a casual dining setting.',
    description_enriched_at = datetime('now')
WHERE slug = 'rocomamas-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rose Corner Cafe is a small corner cafe and convenience store in Bo-Kaap, serving the local community with everyday essentials and light refreshments.',
    description_enriched_at = datetime('now')
WHERE slug = 'rose-corner-cafe-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ryan Boon Speciality M.eat is a butchery in Dean Street Arcade specialising in pasture-reared, sustainably sourced meat, and has supplied several top Cape Town restaurants since 2011.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://vymaps.com/ZA/Ryan-Boon-speciality-m-eat-103911387727180/", "https://rsa.worldorgs.com/catalog/cape-town/butcher-shop/ryan-boon-speciality-meats-newlands", "https://baymeatmarket.co.za/order-meat-online-shop/brand/ryan-boon/"]'
WHERE slug = 'ryan-boon-speciality-meats-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sabria''s Restaurant is one of Cape Town''s first Halaal fine-dining establishments, a family-run restaurant in Wynberg serving prime grills, fragrant curries, fresh seafood and pastas.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetown.travel/listing/sabrias-restaurant/", "https://hungryforhalaal.co.za/listing/sabrias-wynberg/", "https://www.sabrias.co.za/", "https://www.sabrias.co.za/about-us"]'
WHERE slug = 'sabrias-restaurant-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Savoy Lodge is a budget guesthouse in Rondebosch East offering en-suite rooms, an outdoor pool and jacuzzi, an event space for up to 180 guests, and a paid airport shuttle service.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.savoylodge.co.za/", "https://holidays.africastay.com/accommodation/in-Cape_Town/South_Africa/savoy-lodge-rondebosch-east-south-africa/", "https://www.tripadvisor.com/Hotel_Review-g2426452-d1745327-Reviews-Savoy_Lodge-Rondebosch_Western_Cape.html"]'
WHERE slug = 'savoy-lodge-rondebosch-east' AND description_enriched_at IS NULL;

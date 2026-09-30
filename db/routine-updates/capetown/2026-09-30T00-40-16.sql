-- Job 4: description enrichment sweep (10 businesses)

UPDATE businesses
SET description = 'Bergvliet Pet Centre is a pet supplies store located in the Sherwood Shopping Centre in Bergvliet, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'bergvliet-pet-centre-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kirstenhof Bookshop is a charity bookshop run by Help the Rural Child, selling second-hand and donated books from its Main Road premises in Kirstenhof, with proceeds supporting rural children''s programmes run by the Goedgedacht Trust in the Swartland.',
    description_enriched_at = datetime('now')
WHERE slug = 'kirstenhof-bookshop-kirstenhof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Louis'' On The Block is a family-run steakhouse and pizzeria on the corner of Children''s Way and Hiddingh Road in Bergvliet, serving grilled steaks, fresh seafood and wood-fired pizzas alongside a dedicated kids'' menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 17:00-20:30, Sat 14:00-20:30, Sun Closed'
WHERE slug = 'louis-on-the-block-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Perky Pets and Vet is a pet superstore on Main Road in Diep River, stocking a wide range of pet food and supplies alongside a dedicated marine and aquarium section with in-house grown live coral, plus an on-site veterinary service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-14:00, Sun/PH 09:00-13:00',
    source_urls = '["https://topvet.net/practices/south-africa/western-cape/cape-town/perky-pets-and-vet-26567", "https://southafricafirm.com/western-cape/perky-pets-3945", "http://www.fieldandforest.co.za/store/perky-pets-diep-river/"]'
WHERE slug = 'perky-pets-and-vet-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Petworld XXL Diep River is a large-format branch of the national pet retail chain on Main Road, Diep River, stocking a wide range of pet food, supplies and accessories for a variety of animals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'petworld-xxl-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharmacy at Spar - Bergvliet is a retail pharmacy inside the Harry Goemans Centre on Main Road, Bergvliet, offering dispensing and everyday pharmacy services alongside the adjoining Spar supermarket.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-20:00, Sat 08:00-17:00, Sun 10:00-14:00',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=385391", "https://www.sayellow.com/view/south-africa/bergvliet-pharmacy-at-spar-in-cape-town", "https://www.spar.co.za/Home/Store-View/Pharmacy-Bergvliet-Pharmacy-at-Western-Cape"]'
WHERE slug = 'pharmacy-at-spar-bergvliet-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pho & Bun Vietnamese Kitchen is a halal Vietnamese eatery on Main Road, Diep River, serving dishes such as bun (vermicelli noodle soup), spring rolls and stir-fries.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 10:00-21:00, Mon Closed'
WHERE slug = 'pho-bun-vietnamese-kitchen-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Bergvliet is a full-service SPAR supermarket on Main Road, Bergvliet, stocking groceries, fresh produce and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-20:00',
    source_urls = '["https://www.spar.co.za/home/store-view/kwikspar-bergvliet-western-cape", "https://southafricafirm.com/western-cape/kwikspar-bergvliet-9281", "https://my-catalogue.co.za/stores/bergvliet/spar/151-main-road"]'
WHERE slug = 'spar-bergvliet-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'St Francis Veterinary Clinic is a full-service veterinary hospital on Main Road, Bergvliet, offering general veterinary care, surgery, vaccinations, dental treatment and a grooming parlour, operating since 1968.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 08:00-12:00, Sun 08:00-10:00'
WHERE slug = 'st-francis-veterinary-clinic-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WINK Café (Eaton Square) is a café inside the WINK Aparthotel on Main Road, Diep River, serving breakfasts and à la carte light meals with vegetarian options, open to the public as well as hotel guests.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:00-15:00'
WHERE slug = 'wink-cafe-eaton-square-diep-river' AND description_enriched_at IS NULL;

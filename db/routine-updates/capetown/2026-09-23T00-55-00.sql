-- Job 4: description enrichment sweep, batch 2 of this run (10 records)

UPDATE businesses
SET description = 'Campwell Hardware is a hardware store on Belgravia Road in Athlone.',
    description_enriched_at = datetime('now')
WHERE slug = 'campwell-hardware-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy retailer trading from the Howard Centre in Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'clicks-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy retailer trading from the Plattekloof Shopping Centre in Plattekloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-plattekloof-shopping-centre-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Colosseum Hotel is a four-star hotel in Century City offering deluxe rooms, suites and penthouses with mountain and bay views, along with 24-hour reception, secure parking, a gym and massage services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://colosseum.co.za/contact/", "https://www.capetown.travel/listing/colosseum-hotel/", "https://colosseum.co.za/"]'
WHERE slug = 'colosseum-hotel-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'DC Meat is a butchery in Beacon Valley, part of a Western Cape chain that began as a small corner butchery in Paarl in 1996 and has grown into one of the region''s established meat retailers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za/company/764940/dc-meat-mitchels-plain", "https://www.worldofmeats.co.za/view/dc-meat-mitchels-plain", "https://www.dcmeat.co.za/contact-us/contact-our-stores/"]'
WHERE slug = 'dc-meat-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dawood Butchery is a halaal butchery in Hanover Park that has served the community for more than 50 years, known locally for its boerwors alongside a range of meats, spices, sauces and braai accessories.',
    description_enriched_at = datetime('now')
WHERE slug = 'dawood-butchery-hanover-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dawood Butchery is a halaal butchery in Delft, part of a business that has served Cape Town communities with affordable, quality meat for more than 50 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/dawood-butchery_1I", "https://www.yep.co.za/biz/store/iyp/6885283_2", "https://dawoodbutchery.co.za/"]'
WHERE slug = 'dawood-butchery-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza Cavalier Belhar is a pizza and fast-food outlet in the Cavalier Shopping Centre, part of the national Debonairs Pizza chain, offering pizza and chicken alongside its Real Deal and Triple-Decker ranges for eat-in, collection and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'debonairs-pizza-cavalier-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza Mitchells Plain Express is a pizza and fast-food outlet in Town Centre, part of the national Debonairs Pizza chain, offering pizza and chicken meals for collection and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-20:00, Sat 10:00-18:00'
WHERE slug = 'debonairs-pizza-town-centre-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dentist on 4th is a dental practice in Kensington offering general dentistry, cosmetic dental services and denture restoration.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat 08:00-12:00',
    source_urls = '["https://www.cybo.com/ZA-biz/dentist-on-th_1P", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=373668", "https://www.dentiston4th.co.za/contact/"]'
WHERE slug = 'dentist-on-4th-kensington' AND description_enriched_at IS NULL;

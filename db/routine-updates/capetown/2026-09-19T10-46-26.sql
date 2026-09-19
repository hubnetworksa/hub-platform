-- Job 4: description enrichment sweep, batch 2 of 2 (10 businesses)
UPDATE businesses
SET description = 'Hometown Cafe is a cafe and gift shop in Rosebank serving coffee, freshly pressed juice and light meals, with a small retail selection alongside its seating area.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 07:30-16:30, Sat 08:30-16:00, Sun 08:30-14:30, Mon Closed'
WHERE slug = 'hometown-cafe-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hudson''s The Burger Joint is a branch of the South African burger chain, serving burgers and grills on Protea Road in Claremont.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 12:00-23:30'
WHERE slug = 'hudsons-the-burger-joint-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Identity is a South African fashion retail chain founded in 1999, offering on-trend clothing and accessories for young shoppers, with a branch in the Golden Acre Shopping Centre in the Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'identity-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Il Leone Mastrantonio is an Italian trattoria in Green Point serving handmade pasta and traditional dishes since the 1990s, recognised with a Gambero Rosso award, and stocking an extensive Italian and South African wine cellar.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/il-leone-mastrantonio/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d2084244-Reviews-Il_Leone_Mastrantonio-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/il-leone-mastrantonio/"]'
WHERE slug = 'il-leone-mastrantonio-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inhouse Design Studio is an interior design, architecture and construction firm based in Sea Point, with commercial and hospitality projects across Cape Town, Johannesburg and Durban including corporate offices and well-known restaurants.',
    description_enriched_at = datetime('now')
WHERE slug = 'inhouse-design-studio-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Intercare Waterstone is a medical and dental centre offering general practitioner, dental and diagnostic radiology services from Waterstone Village in Somerset West.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waterstonevillage.co.za", "https://getoccupi.com/malls/waterstone-village", "https://www.intercare.co.za/facilities/intercare-waterstone"]'
WHERE slug = 'intercare-waterstone-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'J&S Sushi Claremont is a sushi restaurant on Main Road offering a range of rolls and Asian-inspired dishes, available for delivery via Mr D Food.',
    description_enriched_at = datetime('now')
WHERE slug = 'j-s-sushi-claremont-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JJ Cale Premiere Tobacconist is a specialist tobacconist inside The Point stocking Cuban and non-Cuban cigars, vaping products and smoking accessories.',
    description_enriched_at = datetime('now')
WHERE slug = 'jj-cale-premiere-tobacconist-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JMR Body Works is a panel beating and spray painting workshop in Epping Industria, established in 1995.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/jmr-body-works", "https://www.brabys.com", "https://showme.co.za/cape-town/lifestyle/jmr-body-works/"]'
WHERE slug = 'jmr-body-works-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JUMBO Wholesale SA in Epping is a bulk cash-and-carry wholesaler of food, liquor and personal care products, serving independent traders and commercial buyers, and part of the Massmart group.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-15:00, Sun 08:00-13:00',
    source_urls = '["https://www.waze.com/live-map", "https://www.infobel.com/en/south_africa", "https://za.africabz.com/western-cape/jumbo-epping-cash-carry-32458"]'
WHERE slug = 'jumbo-wholesale-sa-epping' AND description_enriched_at IS NULL;

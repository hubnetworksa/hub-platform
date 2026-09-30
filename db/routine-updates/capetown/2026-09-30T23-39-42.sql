-- Job 4: description enrichment sweep (6 businesses, full backlog this run)
UPDATE businesses
SET description = 'Classic Bakery is a halaal-certified bakery on Thornton Road in Crawford that has been baking since 1980, offering a wide range of cakes including custom wedding, engagement and birthday cakes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00, Fri 09:00-12:30 & 14:00-17:00, Sat 09:00-13:30, Sun 08:00-11:00',
    source_urls = '["https://za.africabz.com/western-cape/classic-bakery-39241", "http://www.classicbakery.co.za/", "https://www.findglocal.com/ZA/Cape-Town/138636872852371/Classic-Bakery", "https://www.shopshours.co.za/classic-bakery/cape-town/c-57f3ca5147d677c3b27c33e1"]'
WHERE slug = 'classic-bakery-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Colorado Motor Spares is a motor spares retailer in Colorado, Mitchells Plain, supplying car parts and accessories to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'colorado-motor-spares-colorado' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hassans Colorado Service Station is a Shell-branded fuel station in Colorado, Mitchells Plain, offering petrol, diesel and a convenience store, open 24 hours a day.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'hassans-colorado-service-station-colorado' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pet Utopia is a pet supply store in Crawford stocking pet food, accessories and other requirements for the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'pet-utopia-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Lounge On Kromboom is a restaurant in Crawford serving a Cape Malay-inspired menu of curries, grills, burgers and other casual dining dishes.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-lounge-on-kromboom-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unimedics International is a multi-disciplinary medical and dental practice in Crawford, part of a group founded in 2015 that also operates branches in Parow and Mitchells Plain, combining general healthcare and dental services with community outreach initiatives.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1910743", "https://unimedicsinternational.co.za/contact-us/", "https://unimedicsinternational.co.za/about-us/"]'
WHERE slug = 'unimedics-international-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Richmond Corner is a pharmacy and health, beauty and homeware retailer in Richmond Corner shopping centre, Richwood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://clicks.co.za/store/Richmond-Corner/1965", "https://za.africabz.com/western-cape/clicks-pharmacy-richmond-corner-416130", "https://www.tiendeo.co.za/stores/cape-town/clicks-richmond-corner-cnr-tygerberg-valley-plattekloof-roads/71558"]'
WHERE slug = 'clicks-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Copper Club Plattekloof is a bar and restaurant in Plattekloof Shopping Centre known for burgers, cheesesteaks and other casual American-style dishes, with beers on tap and cocktails.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://coppercollection.co.za/copper-club/", "https://www.dineplan.com/restaurants/copper-club-plattekloof", "https://app.dinesurf.com/restaurants/copper-club-plattekloof"]'
WHERE slug = 'copper-club-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'De Kelder Restaurant & Winery is a family-friendly restaurant and wine venue in Plattekloof Shopping Centre, offering a range of local and international dishes alongside an extensive wine list featuring local wineries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-23:00, Sun 11:30-22:00',
    source_urls = '["https://www.dekelderrestaurant.com/", "https://www.eatout.co.za/venue/de-kelder-restaurant-winery/", "https://www.dining-out.co.za/md/De-Kelder-Restaurant-and-Winery-Plattekloof/1767"]'
WHERE slug = 'de-kelder-restaurant-winery-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Formula 1 Fitment Centre is a tyre and fitment centre in Brooklyn offering tyre sales, wheel alignment and balancing, mag wheels, shock absorbers, car batteries and exhaust fitment.',
    description_enriched_at = datetime('now')
WHERE slug = 'formula-1-fitment-centre-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Game is a general merchandise and appliance retailer in Liberty Promenade shopping centre, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'game-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Giant Hyper is a large food, household and grocery hypermarket in Epping, tracing back to a Giant Sweets and Chocolates store that first opened in Epping in 2001.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-12:30 & 14:15-17:00, Sat 08:00-13:00, Sun 08:30-12:30'
WHERE slug = 'giant-hyper-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'HBC Systems is a manufacturer and supplier of emergency-services equipment in Epping Industria, including dual battery systems and solar panels, serving the emergency services industry for more than 15 years.',
    description_enriched_at = datetime('now')
WHERE slug = 'hbc-systems-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Chips (Nutripick Mr Chips) is a potato crisp and snack food producer based in Epping Industria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mr-chips-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Sport is a sportswear and sporting goods retailer in Liberty Promenade shopping centre, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'mr-price-sport-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mzoli''s Place is a butchery and braai restaurant off Klipfontein Road in Gugulethu, a well-known Cape Town braai destination.',
    description_enriched_at = datetime('now')
WHERE slug = 'mzolis-place-gugulethu' AND description_enriched_at IS NULL;

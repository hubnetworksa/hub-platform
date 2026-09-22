UPDATE businesses
SET description = 'Eversdal Pre-Primary School runs a Grade R programme taught in English for children aged five to six, with pre-care available from 07:00 and aftercare, including a meal, until 17:30, in Eversdal, Durbanville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:30',
    source_urls = '["https://durbanvillehub.com/directory/schools/eversdal-pre-primary-school", "https://www.holakids.co.za/centre/eversdal-pre-primary-school/", "https://www.schoolguide.co.za/schools/pre-primary-schools/eversdal-pre-primary-school.html"]'
WHERE slug = 'eversdal-pre-primary-school-eversdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eversdal Primary School is a public primary school on Stepping Stones Road in Eversdal, Durbanville, and a feeder school to both Durbanville High School and Fairmont High School.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-15:00, Fri 07:00-14:30',
    source_urls = '["https://www.waze.com/live-map/directions/za/wc/cape-town/eversdal-primary-school", "https://textmap.co.za/3/39720", "https://www.eversdal.org.za/contact-us/"]'
WHERE slug = 'eversdal-primary-school-eversdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Evertsdal Guest House is a guest house in Eversdal, Durbanville, established in 2002, offering 27 four-star and 5 five-star rooms along with conference and wedding facilities on over an acre of grounds with swimming pools and braai facilities.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://evertsdal.com/", "https://www.tripadvisor.com/Hotel_Review-g1057715-d2177211-Reviews-Evertsdal_Guesthouse-Durbanville_Western_Cape.html", "https://evertsdal.com/about-us/"]'
WHERE slug = 'evertsdal-guest-house-eversdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fabric Friends is a fabric and haberdashery shop in Boston, Bellville, stocking a wide range of material, ribbons, buttons and trimmings for the local sewing and craft community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/business/4813212/south-africa/western-cape/bellville/boston/cleveland-st/fabrics/fabric-friends", "https://za.africabz.com/western-cape/fabric-friends-101962", "http://www.thisjones.co.za/2011/08/19/fabric-friends-boston-bellville-cape-town/"]'
WHERE slug = 'fabric-friends-boston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gringo''s Cantina is a pub and pizzeria in Boston, Bellville, serving pizzas, burgers and Mexican-style pub fare, with pub lunches, pool and darts competitions and regular karaoke nights.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/gringos-cantina-62393", "https://triptap.com/places/za/western-cape/cape-town/gringos-cantina-pizzeria-t00bf748", "https://www.eatout.co.za/venue/gringos-cantina/"]'
WHERE slug = 'gringos-cantina-boston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hillside Properties is a family-owned estate agency founded in 1988, based in the IPIC Shopping Centre in Kenridge, selling residential property across greater Durbanville and Bellville, including Kenridge, Stellenberg, Eversdal and Sonstraal Heights.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 09:00-12:00, Sun Closed',
    source_urls = '["https://www.thinklocal.co.za/biz/hillside-properties-durbanville", "https://www.africanadvice.com/1374408/Real_Estate_Brokers_And_Agencies/Western_Cape/Hillside_Properties/", "https://www.brabys.com/za/western-cape/durbanville/kenridge/real-estate-agents/hillside-properties"]'
WHERE slug = 'hillside-properties-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAH Kenridge is a veterinary hospital and vetshop on De Bron Avenue in Kenridge, Durbanville, with separate dog and cat wards, an on-site laboratory and pharmacy, and a retail shop stocking pet food, treats and toys.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/tah-kenridge-81432", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=196922", "https://tah.co.za/kenridge/"]'
WHERE slug = 'tah-kenridge-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willem Hair Design is a hair salon on 13th Avenue in Boston, Bellville, offering haircuts, blow-dry treatments, colouring, highlights and other specialised hair treatments in a refined salon setting.',
    description_enriched_at = datetime('now')
WHERE slug = 'willem-hair-design-boston' AND description_enriched_at IS NULL;

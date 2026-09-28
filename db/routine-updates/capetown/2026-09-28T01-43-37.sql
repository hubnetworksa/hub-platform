-- Job 4: description enrichment sweep, batch 2 of 2 (10 records)

UPDATE businesses
SET description = 'Gusto Urban Italian is a modern Italian restaurant in the Bridgeways Precinct, Century City, offering a full Italian menu alongside a daily aperitivo hour of small plates and drinks.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-10:30 & 12:00-21:30, Sat-Sun 07:00-11:00 & 12:00-21:30',
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/gusto-urban-italian/", "https://www.gustourbanitalian.co.za/contact", "https://aspirelifestyle.co.za/gusto-a-new-italian-inspired-restaurant-located-in-century-city-is-open-for-business/"]'
WHERE slug = 'gusto-urban-italian-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harcourts Maynard Burgoyne Edgemead is an estate agency handling residential sales and rentals across Edgemead, Bothasig, Monte Vista, Richwood, Plattekloof Glen and Goodwood, trading in the Cape Town area for nearly 50 years before joining the Harcourts group in 2008.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.harcourts.co.za/branches/harcourts-maynard-burgoyne-edgemead/36/", "https://www.privateproperty.co.za/estate-agency/harcourts-maynard-burgoyne-edgemead/8997", "https://www.property24.com/estate-agents/harcourts-maynard-burgoyne-edgemead/12552"]'
WHERE slug = 'harcourts-maynard-burgoyne-edgemead-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Heyns & Partners Inc is a law firm operating from the Panorama Healthcare Centre, serving individuals, businesses and organisations across the Western and Eastern Cape as a member of the international Geneva Group International network.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://heyns.co.za/contact-us/", "https://za.africabz.com/western-cape/heyns-and-partners-inc-101443", "https://www.panoramahcc.co.za/tenants/attorneys/"]'
WHERE slug = 'heyns-and-partners-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hugo The Hair Company is a hair salon in Panorama offering cuts, colour, balayage and anti-frizz treatments, trading since 2005 and working with brands including Goldwell, Kevin.Murphy and Paul Mitchell.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 08:30-17:00, Sat 08:00-14:00, Sun-Mon Closed',
    source_urls = '["https://www.fresha.com/lvp/hugo-the-hair-company-panorama-road-cape-town-q8QyrD", "https://www.brabys.com/za/western-cape/parow/panorama/hair-salons/hugo-the-hair-company", "https://www.cylex.net.za/company/hugo-the-hair-company-23764196.html"]'
WHERE slug = 'hugo-the-hair-company-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Impressions Hair Design is a hair salon inside Edgemead Shopping Centre offering haircuts, colouring and styling services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun Closed',
    source_urls = '["https://www.fresha.com/lvp/impressions-hair-design-louis-thibault-drive-cape-town-gn38LW", "https://za.africabz.com/western-cape/impressions-hair-design-190584", "https://www.yep.co.za/biz/store/impressions-hair-design/540042"]'
WHERE slug = 'impressions-hair-design-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Italtile Cape is a tile, bathroom and building-materials showroom in the Northgate Estate retail park, Brooklyn, part of the national Italtile chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/italtile-cape-town-49339", "https://northgateestate.co.za/italtile/", "https://www.italtile.co.za/storefinder"]'
WHERE slug = 'italtile-cape-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Welgemoed is a KFC fried-chicken and fast-food outlet inside Welgemoed Forum, Welgemoed.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 06:00-22:00',
    source_urls = '["https://locations.kfc.co.za/western-cape/welgemoed/welgemoed-forum-cnr-jip-de-jager-road-&-kommissaris-st-welgemoed-cape-town", "https://za.africabz.com/western-cape/kfc-welgemoed-195751", "https://openhours-southafrica.com/en/cape-town/kfc-welgemoed"]'
WHERE slug = 'kfc-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kehl''s Upholstery Suppliers has supplied upholstery fabric, vinyl, foam and trimming supplies to Cape Town''s interior decorators, upholsterers and motor-trimming trade since the late 1960s, operating from its landmark Maitland premises since 1988.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.kehls.co.za/contact-us/", "https://za.africabz.com/western-cape/kehls-upholstery-suppliers-17241", "https://www.kehls.co.za/about-us/"]'
WHERE slug = 'kehls-upholstery-suppliers-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kenridge Primary School is a public primary school in Kenridge, Durbanville, founded in 1955 and a feeder school for Durbanville High School and Fairmont High School.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/kenridge-primary-school/", "https://schoolseek.co.za/school/kenridge-primary-school-101309272/", "https://www.schoolguide.co.za/schools/ordinary-schools/kenridge-prim.html"]'
WHERE slug = 'kenridge-primary-school-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Khoisan Gourmet produces and exports rooibos, honeybush and other indigenous herbal teas, plus Bourbon vanilla, as part of the JSE-listed Libstar group, from its Ysterplaat facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.khoisantea.com/contact-us/", "https://www.libstar.co.za/the-libstar-family/khoisan-gourmet/", "https://www.khoisangourmet.com/contact"]'
WHERE slug = 'khoisan-gourmet-ysterplaat' AND description_enriched_at IS NULL;

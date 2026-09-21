-- Job 4: description enrichment sweep, checkpoint 2 of 3 (10 businesses)

UPDATE businesses
SET description = 'Tiger''s Milk Muizenberg is a pizza, grill and burger restaurant on Beach Road, with a daily happy hour from 4-6pm and live music on Sunday evenings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-23:00, Fri-Sun 08:00-23:00',
    source_urls = '["https://www.tigersmilk.co.za/location/muizenberg/", "https://specialsza.co.za/restaurant/tigers-milk-muizenberg/", "https://www.eatout.co.za/venue/tigers-milk/"]'
WHERE slug = 'tigers-milk-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths Westgate Mall is a fashion clothing store in Westgate Mall, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://www.callupcontact.com/b/Clothing_Stores/Truworths_Weltevreden/5811", "https://www.brabys.com/za/western-cape/mitchells-plain/truworths", "https://www.westgate.co.za/store/16058/truworths"]'
WHERE slug = 'truworths-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umami Sushi, on the Imhoff Farm property in Kommetjie, has served sushi and Asian-inspired cuisine since 2015, with a garden courtyard and indoor dining area, plus catering for private functions.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 12:00-late',
    source_urls = '["https://imhofffarm.co.za/umami-sushi/", "https://www.eatout.co.za/venue/umami-sushi/", "https://www.eatout.co.za/venue/umami-restaurant/"]'
WHERE slug = 'umami-sushi-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Village Sushi, in Noordhoek Farm Village, serves sushi alongside Thai curries, dim sum, noodle dishes and oysters.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 12:00-21:00',
    source_urls = '["https://thefarmvillage.co.za/village-sushi/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d5872795-Reviews-Village_Sushi-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/village-sushi/"]'
WHERE slug = 'village-sushi-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellington Fruit Growers, based in Wetton, has processed and distributed dried fruit, nuts and confectionery since 1904, manufacturing products such as mebos, mixed nuts and fruit lollies that are certified Halaal and Kosher.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wellingtonfruitgrowers.co.za/", "https://www.brabys.com/za/western-cape/cape-town/wetton/dry-fruit/wellington-fruit-growers-head-office", "https://wellingtonfruitgrowers.co.za/about-us/"]'
WHERE slug = 'wellington-fruit-growers-wetton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Coast Fisheries Milnerton is a seafood takeaway on Koeberg Road serving fish and chips, calamari, burgers, ribs and gatsbys, along with fresh snoek and hake.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-20:30',
    source_urls = '["https://westcoastfisheries.co.za/milnerton-menu/", "https://www.facebook.com/WestCoastFisheriesMilnerton/", "https://www.mrdfood.com/food-delivery/restaurant/west-coast-fisheries-milnerton_milnerton/11190", "https://www.dining-out.co.za/md-menu/West-Coast-Fisheries-Milnerton/10502"]'
WHERE slug = 'west-coast-fisheries-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Coast Personnel is a recruitment agency in Table View that has placed permanent, temporary and contract staff since 1996, also offering CV services and employer-of-record support for hiring in South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/west-coast-personnel-38157", "https://www.yep.co.za/biz/store/iyp/6362178_2", "https://westcoastpersonnel.co.za/"]'
WHERE slug = 'west-coast-personnel-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wetton Hardware is a hardware and building-materials store on Dolphin Way, stocking sand, cement, bricks, paint, timber, tiling tools and security products, with advice on waterproofing and building plans.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:45 (closed 13:00-13:30), Fri 08:00-16:30 (closed 12:00-14:00), Sat 08:00-13:00, Sun 09:00-12:00',
    source_urls = '["https://buildandsave.co/", "https://sabusinesslistings.co.za/listings/wetton-hardware/", "https://www.yep.co.za/biz/store/iyp/10644236_3"]'
WHERE slug = 'wetton-hardware-wetton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wilcote Cape Town is a waterproofing, roofing and painting contractor based in Killarney Gardens, working with builders, property managers and architects on residential, commercial and industrial renovation projects for over 30 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wilcotecapetown.co.za/contact/", "https://www.snupit.co.za/milnerton/killarney-gardens/wilcote-cape-town/548665", "https://wilcotecapetown.co.za/home-renovation-contractors-cape-town/"]'
WHERE slug = 'wilcote-cape-town-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Hout Bay is a supermarket in Mainstream Mall, Hout Bay.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Atlantic View Pharmacy is a family-oriented pharmacy at the Belzac Centre in Melkbosstrand, offering chronic medication management, a daily dispensary and medical aid acceptance for the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-16:30, Sun 09:00-13:30',
    source_urls = '["https://2pos.co.za/2/52", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=193441", "https://www.chemistatlanticview.co.za/"]'
WHERE slug = 'atlantic-view-pharmacy-melkbosstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BUCO Montague Gardens is a branch of the BUCO building materials chain in Montague Gardens, stocking building supplies, timber and hardware for trade and DIY customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/buco-montague-gardens-73992", "https://www.cylex.net.za/company/buco-montague-gardens-23739410.html", "https://www.buco.co.za/store-location-details?loc=BUCO+Montague+Gardens&locationid=ba48bb5e-88ed-469f-9208-0f44ad8faf0f"]'
WHERE slug = 'buco-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Belting Edge is an industrial conveyor and transmission belting specialist in Killarney Gardens, fabricating food-grade conveyor and plastic modular belting and offering on-site hot and cold splicing and pulley lagging for local industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1226035544018944", "https://www.brabys.com/business/4815476/south-africa/western-cape/milnerton/killarney-gardens/lauda-rd/belting-transmission-conveyor/belting-edge-pty-ltd", "https://www.environmental-expert.com/companies/belting-edge-pty-ltd-100849"]'
WHERE slug = 'belting-edge-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Black Marlin is a seafood restaurant at Miller''s Point in Simon''s Town, known for Cape rock lobster, seafood platters and fresh oysters and mussels served with coastal views.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 12:00-22:00, Sat-Sun 08:00-22:00',
    source_urls = '["https://za.africabz.com/western-cape/black-marlin-restaurant-230818", "https://afktravel.com/restaurant/black-marlin/", "https://blackmarlin.co.za/"]'
WHERE slug = 'black-marlin-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Blouberg Manor is a boutique guesthouse in Bloubergstrand with individually decorated en-suite rooms, several with balconies and views over Big Bay.',
    description_enriched_at = datetime('now')
WHERE slug = 'blouberg-manor-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bluebottle Guesthouse is a seven-room guesthouse in Muizenberg with sea, lake and mountain views, offering en-suite rooms, a garden, an honesty bar and an on-site restaurant serving South African dishes.',
    description_enriched_at = datetime('now')
WHERE slug = 'bluebottle-guesthouse-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bradlows Westgate Mall is a furniture and appliance store inside Westgate Mall in Mitchells Plain, part of the Bradlows retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-13:00, Sun 09:00-13:00'
WHERE slug = 'bradlows-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Central Mica Hardware is a branch of the Mica hardware chain at Valyland Shopping Centre in Fish Hoek, stocking hardware, paint and building supplies for trade and DIY customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-16:00, Sun 09:00-13:00'
WHERE slug = 'central-mica-hardware-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Westgate Mall is an anchor supermarket inside Westgate Mall in Mitchells Plain, part of the Checkers grocery chain and including an in-store MediRite pharmacy.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-18:00',
    source_urls = '["https://my-catalogue.co.za/stores/mitchells-plain/checkers/shop-no-12-cnr-vanguard-dr-and-morgenster-roads", "https://www.callupcontact.com/b/Supermarkets/Checkers_Weltevreden/5358", "https://www.westgate.co.za/store/15929/checkers-hyper"]'
WHERE slug = 'checkers-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Hout Bay is a branch of the Clicks pharmacy and health chain inside Mainstream Mall in Hout Bay, offering a dispensary and health and beauty retail.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-18:00, Wed 09:00-18:00, Thu-Fri 08:00-18:00, Sat 08:30-17:00, Sun 09:00-15:00',
    source_urls = '["https://za.africabz.com/western-cape/clicks-pharmacy-46814", "https://za.textmap.info/3/444", "https://www.mainstreammall.co.za/clicks/"]'
WHERE slug = 'clicks-pharmacy-hout-bay' AND description_enriched_at IS NULL;

-- Job 4: description enrichment sweep, slice 33 (50 businesses)
-- Each UPDATE guarded by description_enriched_at IS NULL so it only ever applies once.

UPDATE businesses
SET description = 'Touring South Africa is a tour operator running guided South Africa tours, private holidays and custom small-group itineraries since 2004, including Kruger National Park safaris, seasonal Namaqualand flower tours, and trips along the Garden Route, Drakensberg and into Namibia.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.touringsouthafrica.co.za/", "https://www.touringsouthafrica.com/"]'
WHERE slug = 'touring-south-africa-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Towerset (Pty) Ltd. provides telecommunications infrastructure-sharing solutions, building and operating cell towers across Gauteng and Mpumalanga, and is based in Nieuw Muckleneuk, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://towerset.com/", "https://b2bhint.com/en/company/za/towerset--K2013088940"]'
WHERE slug = 'towerset-pty-ltd-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toy Kingdom Menlyn is a toy, game and gift retailer inside Menlyn Park Shopping Centre, stocking brands such as Lego and Barbie, with in-store pickup, delivery and wheelchair-accessible access.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-19:00, Fri-Sat 09:00-21:00, Sun 09:00-17:00',
    source_urls = '["https://www.openstreetmap.org/node/7202499589", "https://my-catalogue.co.za/stores/pretoria/toy-kingdom/shop-uf9-10-11-atterbury-rd-lois-ave-menlyn-shopping-centre-menlyn-park"]'
WHERE slug = 'toy-kingdom-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trailarent Montana Pretoria is a branch of the nationwide Trailarent network, renting and selling trailers of all sizes (luggage, cargo, flat-deck, cattle and car-hauler trailers), plus bakkie and van hire, trailer parts and servicing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-17:00, Sun 07:00-13:00'
WHERE slug = 'trailarent-montana-pretoria-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trailarent Montana Pretoria is a branch of the nationwide Trailarent network, renting and selling trailers of all sizes (luggage, cargo, flat-deck, cattle and car-hauler trailers), plus bakkie and van hire, trailer parts and servicing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-17:00, Sun 07:00-13:00',
    source_urls = '["https://www.jamii.co.za/380-pretoria-north-east-trailer-rental-service-trailarent-bakkie-trailer-rental", "https://www.cybo.com/ZA-biz/trailarent-montana-pretoria", "http://www.trailarent.co.za/"]'
WHERE slug = 'trailarent-montana-pretoria-montana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trakade Business Solutions is a business consulting firm based in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trakade-business-solutions-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tramigo South Africa provides fleet management and vehicle-tracking solutions, including GPS tracking, dashcam video monitoring, push-to-talk communication and fleet management software, serving the transport, logistics, mining, and vehicle finance and insurance industries.',
    description_enriched_at = datetime('now')
WHERE slug = 'tramigo-south-africa-pty-ltd-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trans African Concessions (TRAC) manages and maintains the N4 toll route, a roughly 570km Build-Operate-Transfer road connecting Gauteng to Maputo, Mozambique, through toll collection, electronic e-Tag lanes and ongoing road maintenance.',
    description_enriched_at = datetime('now')
WHERE slug = 'trans-african-concessions-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trans-Africa Telecoms distributes telecommunications, security and renewable-energy solutions, including VOIP and PABX systems, fibre installations, CCTV and solar panels, for homes and businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'trans-africa-telecoms-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transcend Dynamix is a leadership and organisational-performance consultancy offering executive coaching, team building, corporate training and business consulting focused on improving team execution and workplace dynamics.',
    description_enriched_at = datetime('now')
WHERE slug = 'transcend-dynamix-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transducer Developments Co, trading as Loadcell Services, has manufactured South African-made load cells and force-measurement transducers since 1979, supplying instrumentation for roll-force and strip-tension measurement to the steel, mining, chemical and cement industries.',
    description_enriched_at = datetime('now')
WHERE slug = 'transducer-developments-co-pty-ltd-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transformco Electric (Pty) Ltd supplies transformers and electrical solutions, based in Rosslyn.',
    description_enriched_at = datetime('now')
WHERE slug = 'transformco-electric-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transiedoc is a business consulting firm operating from Clubview Forum in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'transiedoc-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transnet Engineering''s Koedoespoort plant is a major rail-engineering facility that manufactures, assembles and re-engineers locomotives, including the local final assembly of diesel and electric locomotive units.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.transnetengineering.net/contact-us/koedoespoort", "https://www.waze.com/live-map/directions/transnet-engineering-koedoespoort-lynette-st-koedoespoort,-pretoria", "https://truckandfreight.co.za/transnet-engineering-hosted-an-industry-day-at-the-koedoespoort-plant-in-pretoria/"]'
WHERE slug = 'transnet-engineering-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transpharm is a pharmaceutical wholesaler, founded by retail pharmacists in 1970 and now part of the Shoprite Group, distributing ethical, over-the-counter, veterinary and surgical products nationwide to pharmacies, practitioners and medical businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.transpharm.co.za/contact-us", "https://pretoria.co.za/listing/transpharm-pretoria-pty-ltd/"]'
WHERE slug = 'transpharm-pretoria-pty-ltd-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Travail Steel Works is a steel fabrication and construction business based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'travail-steel-works-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Travel Counsellors consultant arranges tailor-made holidays, including beach, cruise, family and touring trips, along with flights, accommodation and travel insurance, operating on a mobile, appointment-based model with support via the myTC app.',
    description_enriched_at = datetime('now')
WHERE slug = 'travel-counsellors-sa-mbali-skosana-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Travel With Flair (TWF) is a corporate travel management company offering personalised travel arrangements through technology-driven booking and account support for business travellers.',
    description_enriched_at = datetime('now')
WHERE slug = 'travel-with-flair-pty-ltd-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Travel with Flair is a corporate travel management company offering personalised travel arrangements through technology-driven booking and account support for business travellers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/6554564499", "http://www.travelwithflair.co.za/"]'
WHERE slug = 'travel-with-flair-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trebo is a business consulting firm operating from Hutton Gate in Midstream, Olifantsfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'trebo-midstream-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tree Felling is a tree-felling service operating in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tree-felling-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tree Felling Centurion offers tree felling and removal, stump and palm tree removal, trimming and pruning, plus 24/7 emergency call-outs for storm damage and hazardous trees, with free quotations.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'tree-felling-centurion-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tree Felling Pretoria is a tree-felling service based in Mayville, Pretoria, serving the greater Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'tree-felling-pretoria-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tree Felling Pretoria East offers tree felling and removal, stump grinding, palm tree removal, trimming and pruning, and 24/7 emergency tree removal for dangerous situations, with free, fully insured quotes.',
    description_enriched_at = datetime('now')
WHERE slug = 'tree-felling-pretoria-east-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tree Felling Pros Eldoraigne is a tree-felling service based in Eldoraigne, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tree-felling-pros-eldoraigne-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tree Felling Pros Waterkloof offers premium tree removal, pruning and stump-grinding services for both residential and commercial properties in the Waterkloof area.',
    description_enriched_at = datetime('now')
WHERE slug = 'tree-felling-pros-waterkloof-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tree Felling Services Pretoria East is a tree-felling service based in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tree-felling-services-pretoria-east-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Treebags is an industrial supplier based in the Donkerhoek area near Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'treebags-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tremco is a roofing and painting contractor with over 30 years'' experience, specialising in roof repairs, waterproofing and roof painting across tile, zinc, flat, concrete and metal roofs, plus interior and exterior paint contracting and damp-proofing, serving Pretoria, Centurion, Midrand and Johannesburg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 06:00-18:00'
WHERE slug = 'tremco-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TrenStar supplies returnable packaging and pooled container solutions for supply-chain logistics, with RFID, barcoding and GPS tracking technology for real-time inventory visibility; this is its Rosslyn depot.',
    description_enriched_at = datetime('now')
WHERE slug = 'trenstar-rosslyn-depot-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TrenStar supplies returnable packaging and pooled container solutions for supply-chain logistics, with RFID, barcoding and GPS tracking technology for real-time inventory visibility; this is its South African head office in Centurion''s Highveld Techno Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'trenstar-sa-head-office-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trending Services is a business consulting firm operating from Lydiana, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trending-services-lydiana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trendy Gadgets is an electronics and gadgets store in Shopping on Ridgeway, Midstream Ridge, that also offers repairs on most mobile devices.',
    description_enriched_at = datetime('now')
WHERE slug = 'trendy-gadgets-midstream-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tri-Star Construction (Pty) Ltd is a building and construction company based in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tri-star-construction-pty-ltd-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TriBeCa Coffee Company roasts and supplies coffee beans, capsules and brewing equipment through wholesale and online retail channels, operating from Highway Business Park in Rooihuiskraal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tribeca-coffee-company-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TriFi Tech is an IT services provider based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'trifi-tech-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Triakon Engineering is a civil and structural engineering consultancy, established in 2011, offering property development, municipal infrastructure, roads and stormwater, and mining and industrial engineering services from its Die Hoewes office.',
    description_enriched_at = datetime('now')
WHERE slug = 'triakon-engineering-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tribeca Standard is a coffee cafe run by TriBeCa Coffee Company inside Lynnwood Bridge Shopping Centre, serving coffee and light fare from early morning into the evening.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:00-22:30, Sat-Sun 06:30-22:30'
WHERE slug = 'tribeca-standard-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trigger Digital RSA is a Gauteng-based digital marketing agency offering social media management, web development, SEO, copywriting, graphic design and photography services.',
    description_enriched_at = datetime('now')
WHERE slug = 'trigger-digital-rsa-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trigger Telecoms (Pty) Ltd is a computer and IT services provider operating from Annlin Forum Business Park in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trigger-telecoms-pty-ltd-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trinergy Business Solutions (Pty) Ltd is an IT services provider operating from Persequor Park in Lynnwood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trinergy-business-solutions-pty-ltd-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Triniti Business Solutions offers enterprise ICT services, business analysis, and project, programme and portfolio management consulting, supporting methodologies including PMBOK, Prince2 and Agile, alongside education and training partnerships with universities and business schools.',
    description_enriched_at = datetime('now')
WHERE slug = 'triniti-business-solutions-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trinityhouse Heritage Hill is an independent Christian school campus in Centurion operating on the IEB curriculum, part of the Trinityhouse network of private schools.',
    description_enriched_at = datetime('now')
WHERE slug = 'trinityhouse-heritage-hill-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trios Liquor Store is a liquor store based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trios-liquor-store-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Triple Object Systems (Pty) Ltd is a software development company based in Lyttelton, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'triple-object-systems-pty-ltd-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Triple S Business is a financial and investment services firm operating from Muthray Corner in Brooklyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'triple-s-business-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Triple Threat Security Solutions is a security services provider based in Laudium, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'triple-threat-security-solutions-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Triskelion Internet is an IT and internet services provider based in Les Marais, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'triskelion-internet-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tristone Consulting (Pty) Ltd is an accounting firm based in Roseville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tristone-consulting-pty-ltd-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Triune Premium Spirits House is a commercial property and office space business based in Sunnyside, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'triune-premium-spirits-house-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

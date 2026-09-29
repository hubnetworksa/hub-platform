-- Description enrichment sweep (job 4) -- slice 09
-- Researched: 13, Reworded: 37, Hours found: 6

UPDATE businesses
SET description = 'ST Nubian Architects is an architecture and project management firm in Die Wilgers, Pretoria, offering master planning, urban design and concept design services for commercial and residential buildings, plus turnkey project management and engineering solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'st-nubian-architects-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STADIO Higher Education''s Pretoria Centurion Campus in Eco-Park Estate, Centurion, offers undergraduate and postgraduate qualifications in Commerce, Law, Teacher Education, Information Technology and Fashion, with a 500-seat auditorium and modern lecture theatres.',
    description_enriched_at = datetime('now')
WHERE slug = 'stadio-higher-education-pretoria-centurion-campus-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STANRIO PIPE & STEEL is a steel merchant established in 1979 in Silverton, Pretoria, supplying tubing, angle iron, sheeting, stainless steel and aluminium sections, plus CNC plasma cutting, welding and fabrication services to contractors, mines and DIY customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-16:00, Sat 08:00-12:00'
WHERE slug = 'stanrio-pipe-steel-pty-ltd-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stapelberg Eiendomme is an estate agency established in 1996, based in Pretoria, handling residential, farm, vacant land and commercial property sales as well as rentals across Pretoria''s northern, southern, eastern, western and central areas, including Eloffsdal.',
    description_enriched_at = datetime('now')
WHERE slug = 'stapelberg-property-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STC Ingco Concept Store (Silverton Tool Centre) is a hardware and tool retailer in Silverton, Pretoria, stocking power tools, hand tools, gardening equipment and LP gas for tradespeople and DIY customers, and also offering key cutting, number plate and bicycle repair services.',
    description_enriched_at = datetime('now')
WHERE slug = 'stc-ingco-concept-store-silverton-tool-centre-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STE Business Specialists is a business consulting firm based at the Springbok Complex on Park Street, Arcadia, in the Ashley Gardens area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ste-business-specialists-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STEELOREX manufactures commercial kitchen and foodservice equipment in Lyttelton Manor, Centurion, including fryers, griddles, boiling tables, refrigeration units, extraction canopies and mobile kitchen trailers for the hospitality and foodservice industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'steelorex-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STEFANOS is a restaurant and takeaway on Doreen Avenue in Karenpark, Akasia, serving the greater Orchards area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stefanos-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STERAMINE is a logistics, courier and transport company based in Eldo Meadows, Centurion, serving the Eldo Lakes Estate area.',
    description_enriched_at = datetime('now')
WHERE slug = 'steramine-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STHEMINFRA Business Solutions is a business consulting firm on Bosvlier Street in The Orchards, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'stheminfra-business-solutions-pty-ltd-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STR Engineering Services supplies and maintains industrial gearboxes and power transmission equipment for the mining and industrial sectors in Centurion, partnering with manufacturers including SEW, Siemens, Rossi, Bonfiglioli and Flender for support, service and repairs.',
    description_enriched_at = datetime('now')
WHERE slug = 'str-engineering-services-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STR Technology Holdings is an IT services company on Mulder Street in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'str-technology-holdings-pty-ltd-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STRATLAW is a boutique law firm founded in 2015, based in Lynnwood Ridge, Pretoria, offering corporate, commercial, labour, tax and estate-planning legal advice along with BBBEE compliance and dispute-resolution services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00'
WHERE slug = 'stratlaw-pty-ltd-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUM (Spectrum Utility Management) is a utility management company based in Boardwalk Office Park, Faerie Glen, Pretoria, providing water and electricity management solutions for municipalities, including streetlight monitoring and prepaid/postpaid electricity vending systems.',
    description_enriched_at = datetime('now')
WHERE slug = 'sum-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPER STAAL // BHL @ J SERVICES is a hardware store on Swaan Street in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'super-staal-bhl-j-services-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Monument Park is a full-service SPAR supermarket in the Monument Park Shopping Centre, Pretoria, with in-house bakery, butchery and hot-food counters, fresh produce, sushi and floral departments, stocking over 24,000 product lines.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-19:45'
WHERE slug = 'superspar-monument-park-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Elardus Park is a SPAR-branded supermarket on Barnard Street in Elardus Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-elardus-park-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Hercules is a SPAR-branded supermarket on Moot Street in Daspoort, Pretoria, serving the neighbouring Hercules community.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-hercules-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Karen Park is a SPAR-branded supermarket in the Karenpark Crossing shopping centre in Karen Park, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-karen-park-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Karenpark is a SPAR-branded supermarket on Daffodil Avenue in Karenpark, serving the Hesteapark area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-karenpark-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Kilner Park is a SPAR-branded supermarket on Lynette Street in Kilner Park, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-20:00'
WHERE slug = 'superspar-kilner-park-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Lyttelton is a SPAR-branded supermarket in the Highlands Shopping Centre in Die Hoewes, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-lyttelton-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Midstream is a SPAR-branded supermarket at the Square@Midstream shopping centre in Midstream Estate, Olifantsfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-midstream-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Montana is a SPAR-branded supermarket at Montana Corner on Dr Swanepoel Street in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-montana-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Nina Park is a SPAR-branded supermarket at the Northdale Centre on Grafenheim Street in Ninapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-nina-park-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Saxby is a SPAR-branded supermarket in Eldoraigne, Centurion, with an in-store bakery and butchery, the Saxby Sizzle braai counter, a Bean Tree Cafe and sushi prepared on-site.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-20:00'
WHERE slug = 'superspar-saxby-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Sutherland is a SPAR-branded supermarket in Wierdapark, Centurion, with an ATM, bakery, butchery, coffee shop and Lotto services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-20:00'
WHERE slug = 'superspar-sutherland-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Wonderboom Junction is a SPAR-branded supermarket on Lavender Road West in Annlin West, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-wonderboom-junction-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPRA CONSTRUCTION is a construction company on Breed Street in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'supra-construction-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SVM Scaff Hire is a scaffolding hire business based in the Mondustria industrial area of Derdepoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'svm-scaff-hire-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SVZ Construction Projects is a construction company on Mundt Street in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'svz-construction-projects-pty-ltd-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SWC Tech is a business consulting firm on Transnet Avenue in Capital Park, in the Eloffsdal area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'swc-tech-pty-ltd-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SWITCHBOARD SERVICES (PTY) LTD is an industrial supplier on Fairwood Road in Rosslyn, Akasia, specialising in switchboards.',
    description_enriched_at = datetime('now')
WHERE slug = 'switchboard-services-pty-ltd-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SY Accounting is an accounting firm at Yaseen''s Square on 12th Avenue in Laudium, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sy-accounting-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SYMOTREE CONSULTING is a business consulting firm on the 2nd floor of The Village Shopping Centre in Moreleta Park, serving the Wingate Park area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'symotree-consulting-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SYNERGOS XTREME (PTY) LTD is a business consulting firm in the Wapadrand Security Village, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'synergos-xtreme-pty-ltd-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SYR Southern Africa (Pty) Ltd is a commercial property and office space company on Park Avenue North in Rooihuiskraal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'syr-southern-africa-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SaOntime Solutions CC is a business consulting firm based in South Downs Estate, Irene, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'saontime-solutions-cc-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Saab Grintek is an industrial supplier and manufacturer based at Highveld Techno Park in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'saab-grintek-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sabertek (Pty) Ltd is an industrial supplier and manufacturer at Gateway Industrial Park in Rooihuiskraal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sabertek-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sable Shores Restaurant is a restaurant on Eland Road in the Sable Hills Waterfront Estate, Roodeplaat.',
    description_enriched_at = datetime('now')
WHERE slug = 'sable-shores-restaurant-sable-hills-waterfront-estate-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sabrina is an accounting firm on Cycad Place in Val-De-Grace, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sabrina-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sabrix is an industrial supplier and manufacturer on Haarlem Street in Hermanstad, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sabrix-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sabuni Detergents supplies cleaning products and detergents from Rooiwal Street in Honingnestkrans, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sabuni-detergents-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sacramento Spur is a Spur-branded restaurant at the corner of Heinrich and Madelief Streets in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sacramento-spur-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sadcon Consulting is a business consulting firm on Lievaart Street in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sadcon-consulting-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safari Centre is a motor spares supplier on Kersieboom Crescent in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'safari-centre-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safari Garden Centre is a nursery and garden centre on Lynnwood Road in The Willows, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'safari-garden-centre-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safari Outdoor - Lynnwood is an outdoor equipment retailer in the Lynnwood Bridge Centre, Lynnwood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'safari-outdoor-lynnwood-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safaripack Packaging supplies packaging products from Price Street in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'safaripack-packaging-waltloo' AND description_enriched_at IS NULL;

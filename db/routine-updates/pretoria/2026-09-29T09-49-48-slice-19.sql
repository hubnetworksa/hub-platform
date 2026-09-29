-- Slice 19 description-enrichment batch (job 4)
-- 50 businesses, spot-reaction-pty-ltd-mayville .. steelwood-projects-wonderboom-south

UPDATE businesses
SET description = 'Spot Reaction is a private security company in Mayville offering armed emergency response, VIP protection with bodyguards and transport, and professional guarding with access control, alongside PSiRA-accredited training in close protection and firearms.',
    description_enriched_at = datetime('now')
WHERE slug = 'spot-reaction-pty-ltd-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spot Signs is a printing services business in Eldo Lakes Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spot-signs-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SpotOn Consulting is a Google Ads management and digital marketing consultancy in Pierre van Ryneveld Park, helping small and medium businesses grow through targeted search and display advertising, conversion tracking and analytics optimisation.',
    description_enriched_at = datetime('now')
WHERE slug = 'spoton-consulting-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spout Coffee Co is a specialty coffee roaster and espresso and pastry bar in Ashley Gardens, also serving cookies and Basque cheesecake and offering wholesale coffee with custom co-branded packaging for other businesses.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 07:00-16:00, Sat 08:00-13:00, Sun 08:00-12:00'
WHERE slug = 'spout-coffee-co-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spur Drive Thru (Karenpark, Pretoria) is a drive-thru restaurant and takeaway outlet in Karenpark.',
    description_enriched_at = datetime('now')
WHERE slug = 'spur-drive-thru-karenpark-pretoria-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spyke Net is a printing services business in Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spyke-net-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spyroinc Fashion Store is a business in Sable Hills Waterfront Estate, listed in the industrial suppliers and manufacturing category.',
    description_enriched_at = datetime('now')
WHERE slug = 'spyroinc-fashion-store-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Square Edge Construction Projects is a construction company in Mooiplaats handling residential developments, commercial fit-outs, and renovations and alterations, with hands-on project management to deliver on time and on budget.',
    description_enriched_at = datetime('now')
WHERE slug = 'square-edge-construction-projects-mooiplaats' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Square One Consulting is a business solutions firm in Claudius specialising in workforce management, process management, and AI-driven digital transformation, including cloud and cybersecurity consulting for public and private sector clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://sq1consulting.co.za/", "https://squareoneconsulting.co.za/"]'
WHERE slug = 'square-one-consulting-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Square Time Cafe is a cafe and restaurant at Boardwalk Lakeside in Boardwalk Manor, serving cappuccino and breakfast alongside steaks and ribs.',
    description_enriched_at = datetime('now')
WHERE slug = 'square-time-cafe-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Squash Hub is a club-management software platform in Bergtuin built for squash clubs and facilities to handle administration and operations.',
    description_enriched_at = datetime('now')
WHERE slug = 'squash-hub-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Squeaky Clean Window & Solar Panel Cleaners is a residential and commercial cleaning business in Boardwalk Manor specialising in window cleaning and solar panel cleaning.',
    description_enriched_at = datetime('now')
WHERE slug = 'squeaky-clean-window-solar-panel-cleaners-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Squid Art is a creative agency in Irene offering brand development, strategic consulting, and design work across digital, online, social and print platforms.',
    description_enriched_at = datetime('now')
WHERE slug = 'squid-art-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ssgtechnologysolution is an electronics and appliances business in Amberfield Glen, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ssgtechnologysolution-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SSW Construction is a family-owned steel fabrication and construction company in Klerksoord specialising in steel roof trusses and roof sheeting, industrial structures such as factories and warehouses, and specialised buildings including hangars and churches.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:30, Sun Closed'
WHERE slug = 'ssw-construction-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Staalboer Aqua is a manufacturer in Kameeldrift East of galvanised steel panel water reservoirs, water tank stands, and steel guard towers for perimeter security, providing design, manufacturing, delivery and installation.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["http://www.staalboer.com/", "https://staalboer.co.za/"]'
WHERE slug = 'staalboer-aqua-pty-ltd-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stabilis Treatment Centre is a registered treatment centre in Moregloed providing residential programmes for alcohol, medication and drug dependence, with a multi-disciplinary team including medical, psychological and nursing staff.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresha.com/lvp/stabilis-treatment-centre-haarhoff-street-pretoria-a2GDNv", "https://www.africabizinfo.com/ZA/stabilis-treatment-centre_2P-012-333-7702", "http://www.stabilistc.co.za/"]'
WHERE slug = 'stabilis-treatment-centre-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stable Empire Contractors is a residential and commercial construction company in Proclamation Hill handling new builds, renovations, demolitions and extensions, including interiors, plumbing, painting and waterproofing.',
    description_enriched_at = datetime('now')
WHERE slug = 'stable-empire-contractors-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stack Doors is a supplier in Leeuwfontein of A-grade Meranti folding stacking doors, designing, manufacturing and installing their own range.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.stackdoors.co.za/", "https://www.facebook.com/stackdoors/"]'
WHERE slug = 'stack-doors-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stackworx is a software engineering firm in Alphen Park building end-to-end web and mobile platforms, covering analysis, prototyping, development, deployment and technical project management, using React, React Native, Node.js and cloud infrastructure on AWS and Azure.',
    description_enriched_at = datetime('now')
WHERE slug = 'stackworx-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stadentot Special Projects is a business consulting business in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'stadentot-special-projects-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stadium Pharmacy is a pharmacy in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stadium-pharmacy-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stafix - Electric Fence & Security Centre is the Southern African distributor of imported and locally-manufactured electric fence energizers, based in Kloofsig, also supplying CCTV, alarm systems, electric locks, perimeter mesh and taut-wire fencing and gate automation, alongside accredited electric-fence and CCTV training.',
    description_enriched_at = datetime('now')
WHERE slug = 'stafix-electric-fence-security-centre-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stage Effects Group is a technical event production and rental company in Derdepoort providing staging, lighting, LED screens and rigging for concerts, festivals, theatre productions, corporate events and broadcast and film work, with over 18 years of experience.',
    description_enriched_at = datetime('now')
WHERE slug = 'stage-effects-group-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Staging is a furniture and homeware business in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'staging-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stainless Steel Designs is an industrial supplier and manufacturer in Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stainless-steel-designs-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stallion Business and Communication is a books and stationery business in Southdowns, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stallion-business-and-communication-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stallion Drafting & Printing is a printing business in Kilner Park offering printing, 3D printing and custom stamp-making services.',
    description_enriched_at = datetime('now')
WHERE slug = 'stallion-drafting-printing-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stallion Turbos is a turbocharger specialist in Dorandia with over 33 years in the trade, providing turbo repair, OEM-spec reconditioning, performance upgrades and failure-analysis diagnostics, plus new turbochargers for over 574 vehicle models with a 12-month guarantee on reconditioned units.',
    description_enriched_at = datetime('now')
WHERE slug = 'stallion-turbos-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Sunnyside is a Standard Bank branch inside Sunnypark Shopping Centre in Sunnyside, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-sunnyside-sunnyside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Wonderpark Cashless Branch is a Standard Bank branch inside Wonderpark Shopping Centre in Karenpark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-wonderpark-cashless-branch-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stander Accountants is an accounting business in Woodhill Golf Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stander-accountants-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stanton Porter Marketing is a marketing, advertising and publishing business in Erasmia managing advertising sales for several niche South African publications, including motoring sections in Business Day and Landbouweekblad, a trucks and heavy-equipment magazine, and a property section in Business Day.',
    description_enriched_at = datetime('now')
WHERE slug = 'stanton-porter-marketing-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Star Cell & Computers is a mobile phone business in Ninapark, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'star-cell-computers-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Starbright Solutions is a full-service digital marketing agency in Blue Valley Golf Estate offering web design and development, SEO and Google Ads management, Meta Ads and social media content, plus email marketing, copywriting and graphic and UX design.',
    description_enriched_at = datetime('now')
WHERE slug = 'starbright-solutions-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stargas is an LPG gas supplier in Zwartkop offering cylinder delivery and swap services, domestic, commercial and industrial gas installations with COC certification, bulk and industrial gas supply, and a retail range of gas appliances including stoves, geysers, heaters and braais.',
    description_enriched_at = datetime('now')
WHERE slug = 'stargas-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Starke Industries cc is an industrial automation and engineering manufacturer in Rosslyn designing and fabricating special-purpose machines and operator guidance systems for the agriculture, automotive, FMCG and renewable-energy sectors, alongside maintenance and engineering support.',
    description_enriched_at = datetime('now')
WHERE slug = 'starke-industries-cc-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Starpack Pretoria is a packaging manufacturer and supplier in Glen Lauriston with over 30 years'' experience, producing paper, plastic, polystyrene and foil packaging for supermarkets, butcheries, bakeries, delis and restaurants, with custom branding and bulk ordering.',
    description_enriched_at = datetime('now')
WHERE slug = 'starpack-pretoria-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Start Your Own Business is a business consulting company in Andeon, Pretoria West.',
    description_enriched_at = datetime('now')
WHERE slug = 'start-your-own-business-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Startup Digital Solutions is a software development business in Wonderboom South, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'startup-digital-solutions-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'StatAdmin is a company secretarial and statutory administrative services provider in Woodhill Golf Estate, handling company secretarial work and administrative compliance so clients do not have to manage it in-house.',
    description_enriched_at = datetime('now')
WHERE slug = 'statadmin-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Statesmen Media (Pty) Ltd is a marketing and advertising business in Sable Hills Waterfront Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'statesmen-media-pty-ltd-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Station Lounge is a restaurant and takeaway business in Salvokop, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'station-lounge-salvokop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stay@37 is an accommodation business in Amberfield, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stay-37-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steel & Pipes for Africa is a steel, tubing and hardware merchant whose Pretoria West branch serves as head office among the company''s branches nationwide, stocking steel goods, hardware, paint, roofing and fencing supplies for DIY customers and contractors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'steel-pipes-for-africa-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steel Axis is an industrial supplier and manufacturer in Amandasig.',
    description_enriched_at = datetime('now')
WHERE slug = 'steel-axis-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steel and Pipes for Africa''s Centurion branch, on Sarel Baard Crescent in Rooihuiskraal, is one of the steel, tubing and hardware merchant''s branches, stocking steel goods, hardware, paint, roofing and fencing supplies for DIY customers and contractors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'steel-and-pipes-for-africa-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steelfit SA is an industrial supplier and manufacturer in Donkerhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'steelfit-sa-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steelman Engineering CC is an industrial supplier and manufacturer in Dorandia, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'steelman-engineering-cc-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steelwood projects is a building and construction company in Wonderboom South, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'steelwood-projects-wonderboom-south' AND description_enriched_at IS NULL;

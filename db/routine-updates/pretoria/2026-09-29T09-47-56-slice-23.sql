-- Slice 23 description-enrichment batch (job 4)

UPDATE businesses
SET description = 'Synced Sites is a computer and IT services provider based in Kleinfontein, Donkerhoek, on the eastern outskirts of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'synced-sites-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Syncro Dynamics is a security and risk-management firm in Zwartkop, Centurion, offering armed escort and response-team services, criminal background screening, security and firearm training, and on- and off-site surveillance and investigations for corporate clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'syncro-dynamics-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Syndacor Property Group (Pty) Ltd is a commercial property and office space company based in Amandasig, on the northern edge of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'syndacor-property-group-pty-ltd-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Synercore Manufacturing is a food-ingredient and formulation company based in Hermanstad, Pretoria, developing customised blends, cultures, emulsifiers and grain-flour products for dairy, bakery, beverage, meat and plant-based food manufacturers since 2016, alongside contract blending, spray-drying and milling services.',
    description_enriched_at = datetime('now')
WHERE slug = 'synercore-manufacturing-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Synergy Design SA is an engineering and surveying firm based in Glen Lauriston, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'synergy-design-sa-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Synergy Energy Solutions is a renewable-energy and heating installer headquartered in Lyttelton Manor, Centurion, designing and installing solar PV systems, lithium battery storage, EV chargers and heat-pump and underfloor heating, and has completed over 1,700 installations since 2010.',
    description_enriched_at = datetime('now')
WHERE slug = 'synergy-energy-solutions-pty-ltd-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Synergy Video Productions is a full-service video production company in Wingate Park, Pretoria East, producing corporate and explainer videos, brand films, animation, event videography and livestreaming for clients ranging from small businesses to international corporations, with 18 years in the industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'synergy-video-productions-pty-ltd-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Synexus SA Watermeyer Clinical Research Centre is a commercial clinical-trials research site in Val de Grace, Pretoria, one of Synexus Clinical Research SA''s three dedicated centres in the country, recruiting participants for studies covering conditions such as diabetes, cardiovascular disease, kidney disease and emphysema.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellowpages.net/phone_27-128037733_research-institute_Pretoria_ZA218815.html", "https://www.tuugo.co.za/Companies/synexus-clinical-research-sa/0260003255742", "https://www.synexusclinicalresearch.co.za/clinic.php?id=228", "https://app.patientwing.com/organization/synexus-sa-watermeyer-clinical-research-centre"]'
WHERE slug = 'synexus-sa-watermeyer-clinical-research-centre-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Synopsis Group is an ICT consulting firm in Doornpoort, Pretoria, helping businesses set up secure, cloud-hosted and remote-enabled technology infrastructure with custom solutions scaled to each client''s budget and growth needs.',
    description_enriched_at = datetime('now')
WHERE slug = 'synopsis-group-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Syntech is a technology-products distributor and reseller supplying computer components, peripherals, networking equipment and consumer electronics to resellers across South Africa, operating a distribution site in Samrand Business Park, Kosmosdal.',
    description_enriched_at = datetime('now')
WHERE slug = 'syntech-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Syntell (Pty) Ltd is a technology company based in Highveld Techno Park, Centurion, providing road-safety, traffic-management and revenue-collection systems to national, provincial and local government entities across South Africa, in operation since 2003.',
    description_enriched_at = datetime('now')
WHERE slug = 'syntell-pty-ltd-centurion-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Syrup Entertainment is an events and function-venue business based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'syrup-entertainment-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'System Design Experts (Pty) Ltd is a Zwartkop, Centurion-based supplier and installer of ICASA-approved cell-phone signal boosters for homes, farms, lodges, vehicles and industrial and mining sites, supporting all major South African mobile networks, and also runs a video-surveillance division.',
    description_enriched_at = datetime('now')
WHERE slug = 'system-design-experts-pty-ltd-signal-booster-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T & M Electrical is a property-maintenance company in Karenpark, Pretoria, offering electrical, plumbing, property-management and gardening services to clients including law firms, restaurants, residential estates and government facilities.',
    description_enriched_at = datetime('now')
WHERE slug = 't-m-electrical-website-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T & R Graphic & Print is a printing services business based in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 't-r-graphic-print-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T C B Machine Moving & Rigging is a heavy-lifting and industrial relocation specialist based near Wonderboom, Pretoria, moving machinery, transformers, presses and other heavy equipment for factory relocations across Gauteng, with over 35 years in the trade since being established in 1990.',
    description_enriched_at = datetime('now')
WHERE slug = 't-c-b-machine-moving-rigging-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T Sikhala Attorneys is a general legal practice in Arcadia, Pretoria, handling commercial and contract law, litigation and dispute resolution, labour law, property and estate matters, and construction, water and environmental law, with more than ten years in practice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:00, Sat By appointment'
WHERE slug = 't-sikhala-attorneys-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T Sphere Geomatica is a geospatial-services company in Amberfield Glen, Centurion, providing aerial mapping, LiDAR, orthophotography and GIS data for infrastructure, mining, urban-planning, agricultural and environmental projects since being registered in 2015.',
    description_enriched_at = datetime('now')
WHERE slug = 't-sphere-geomatica-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T-Mac Projects is a construction company in Klerksoord, Pretoria, specialising in alternative building methods including wendy houses, Nutec fibre-cement structures and timber log homes, along with custom designs, installation and repairs, aiming to complete builds faster and more affordably than traditional brick construction.',
    description_enriched_at = datetime('now')
WHERE slug = 't-mac-projects-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T.H.J Services is a building and construction business based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 't-h-j-services-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'T.Y.D. Construction is an NHBRC-registered building contractor based in Leeuwfontein, Pretoria, handling new home construction, extensions and renovations, and commercial and industrial projects such as office blocks and factories across Pretoria, Midrand, Cullinan, Bela-Bela and Brits, in business since 1993.',
    description_enriched_at = datetime('now'),
    hours = '08:00-17:00'
WHERE slug = 't-y-d-construction-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAC Glass & Aluminium (Pty) Ltd is a Rosslyn-based supplier and installer of aluminium and glass doors and windows, including sliding, pivot and folding doors and aluminium, steel and uPVC window systems.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/tac-glass-aluminium-pty-ltd"]'
WHERE slug = 'tac-glass-aluminium-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAG is a hardware store based in Wolmer, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'tag-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TALKR Communications is a two-way radio and business-communications specialist in Mayville, Pretoria, supplying and renting VHF/UHF radios with geo-fencing and reporting features from brands including Motorola, Kenwood, Icom and Hytera, alongside drone services.',
    description_enriched_at = datetime('now')
WHERE slug = 'talkr-communications-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAROWORX Petroleum is part of the Taroworx Group, a Centurion-based conglomerate established in 2012 spanning marine bunkering and chandling, hygiene services, and construction and infrastructure, operating from Eco-Origin Business Park in Highveld, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'taroworx-petroleum-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TASEZ (Tshwane Automotive Special Economic Zone) is a government-backed industrial hub near The Willows, Pretoria, providing tenant accommodation, investment incentives and supplier-development support to automotive manufacturers, jointly held by the Department of Trade, Industry and Competition, the Gauteng provincial government and the City of Tshwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'tasez-tshwane-automotive-special-economic-zone-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TASHWE Rollback and Crane Hire is a logistics and transport business offering rollback and crane-hire services, based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tashwe-rollback-and-crane-hire-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAUBARITA SUPPLIERS AND PROJECTS is a building and construction supplies and projects business based in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'taubarita-suppliers-and-projects-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAYFIN is an accounting firm based in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tayfin-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAZAMA Media is a computer and IT services business based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tazama-media-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TBT is a printing services business based in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tbt-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TBi - Team Building Institute is a team-development company based in Wapadrand, Pretoria, running experiential team-building programmes, coaching, facilitator training and HBDI assessments using its own Adventure-related Experiential Learning methodology for corporate clients including major South African mining and resources companies.',
    description_enriched_at = datetime('now')
WHERE slug = 'tbi-team-building-institute-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TCT Civil and Construction is a building and construction company with its head office in Die Hoewes, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tct-civil-and-construction-head-office-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TDT Acid Solution is an industrial supplier based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tdt-acid-solution-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TEAM SUPPORT LABELS CC is a custom-label manufacturer based near Parktown Estate, Pretoria, producing digitally printed barcode, price and promotional labels on a range of materials for retail and logistics businesses, operating since 1999.',
    description_enriched_at = datetime('now')
WHERE slug = 'team-support-labels-cc-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TECH TEAM SOLUTIONS (Pty) Ltd is an IT services company based in Willow Park Manor, Pretoria, providing network infrastructure, cloud computing, cybersecurity and custom software development alongside an online store selling laptops, networking equipment and IT peripherals from over 100 brands, with an 11-year track record.',
    description_enriched_at = datetime('now')
WHERE slug = 'tech-team-solutions-pty-ltd-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TECHNOSGN is a 100%-Black-owned IT consulting firm in Olievenhoutbosch, Centurion, offering managed IT support, network installation and cloud backup alongside website and app development and graphic design, partnering with AWS, Microsoft and Pinnacle.',
    description_enriched_at = datetime('now')
WHERE slug = 'technosgn-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TECWENI SOLUTIONS is an engineering firm in Mayville, Pretoria, offering prototype design and manufacturing, automation design and custom monitoring systems that combine mechanical and electronic hardware with bespoke software, registered since 2017.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00'
WHERE slug = 'tecweni-solutions-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TELESHAW ELECTRONICS is an electronics business in Magalieskruin, Pretoria, selling electronic components and providing TV repair, sales and installation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'teleshaw-electronics-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TELLUMAT (PTY) LTD - Air Traffic Management is an industrial supplier based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tellumat-pty-ltd-air-traffic-management-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TENGATEC is an electronics and appliances business based in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tengatec-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TESIMOND Business Solutions is a business-consulting firm based in Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tesimond-business-solutions-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TFM Events is an events and function-venue business based in Kameeldrift, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tfm-events-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TG ART REAL is a marketing and advertising business based in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tg-art-real-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TH-Vision is a business-development and ICT consulting firm near Zwavelpoort, Pretoria East, offering website and mobile-app development, graphic design and branding, and company-registration and compliance consulting, working with clients across Gauteng and into the Free State, Western Cape, Limpopo and North West.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-17:00, Fri 08:30-15:00, Sat-Sun Closed'
WHERE slug = 'th-vision-business-development-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'THE BUSINESS HUB is a business-consulting firm based in Heatherview, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-business-hub-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Companies Tribunal is a statutory agency of the Department of Trade, Industry and Competition, based at the dti Campus in Sunnyside, Pretoria, that resolves company disputes such as directorship and name disputes under the Companies Act through adjudication and alternative dispute resolution, with jurisdiction across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-companies-tribunal-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'THE CORNICE MAKER manufactures cornices, bulkheads and ceiling-trim products in Wonderboom South, Pretoria, supplying contractors, retailers and architects across South Africa and into Lesotho, Eswatini, Botswana, Namibia and Zambia, with over 1,000 cubic metres produced monthly since the company was established in 2011.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-cornice-maker-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'THE HOLDINGS GROUP is a building and construction business based in Mooiplaats.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-holdings-group-mooiplaats' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'THE PTP CORPORATIONS is a building and construction business based in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-ptp-corporations-rietfontein' AND description_enriched_at IS NULL;

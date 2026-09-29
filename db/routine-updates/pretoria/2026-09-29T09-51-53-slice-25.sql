-- Slice 25 description-enrichment sweep (job 4)
-- 50 businesses: tshwane-school-for-business-and-society-bryntirion .. team-agent-boardwalk-meander

UPDATE businesses
SET description = 'Tshwane School for Business and Society is an accredited postgraduate business school in Pretoria, offering the PDBA, MBA and DBA degrees along with 13 executive development programmes covering leadership, management, entrepreneurship, agribusiness and innovation.',
    description_enriched_at = datetime('now')
WHERE slug = 'tshwane-school-for-business-and-society-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tshwaneng Construction is a building contractor in Sinoville that has provided professional construction services since 1985, specialising in house extensions, renovations and building work for domestic, commercial and industrial clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/tshwaneng", "https://www.procompare.co.za/providers/tshwaneng-construction"]'
WHERE slug = 'tshwaneng-construction-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tsipe Engineering (Pty) Ltd is a steel fabrication company in Klerksoord offering palisade fencing and gates, carports, braais, steel furniture, burglar proofing, security gates, plasma cutting and trailer manufacturing, alongside general steelwork repairs and maintenance.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'tsipe-engineering-pty-ltd-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TSRM Africa is a chartered accountancy and business consulting firm in Monavoni offering audit and assurance, accounting and bookkeeping, business rescue support and management consulting, along with professional development training programmes.',
    description_enriched_at = datetime('now')
WHERE slug = 'tsrm-africa-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TSSD Projects & Engineering is a steel fabrication and laser cutting company in Roodeplaat with over a decade of experience, focused on cost-effective manufacturing solutions for industrial clients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-13:00'
WHERE slug = 'tssd-projects-roodeplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TTS-Top Talent Solutions (TTS Talent) is a recruitment and HR consultancy in Monument Park specialising in talent assessment and selection, using proprietary psychometric assessment technology to support screening, development and succession planning for organisations.',
    description_enriched_at = datetime('now')
WHERE slug = 'tts-top-talent-solutions-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tudu Safety Boots is an industrial supplier of safety boots and protective footwear in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tudu-safety-boots-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tudu Unlimited Safety is a wholesale supplier of safety equipment and PPE in Heuwelsig Estate, Centurion, also stocking bricks, diesel, cleaning chemicals and stationery.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://tuduunlimited.business.site/"]'
WHERE slug = 'tudu-unlimited-safety-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TWK Insurance Pretoria is a branch of the TWK financial services group, offering short-term and long-term insurance, medical aid and gap cover, crop and plantation insurance, and fiduciary services, in Parktown Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'twk-insurance-pretoria-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TWL Engineering Solutions is an electronic security design and consulting firm in Queenswood, providing access control, CCTV, fire and life-safety systems, public address systems and turnkey security project management for commercial, institutional and residential clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'twl-engineering-solutions-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TYNKM Enterprises is a solar and renewable energy business in Sable Hills Waterfront Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'tynkm-enterprises-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TYREWORX Dastek Monument Park is a tyre dealer, fitment and service centre offering multiple tyre brands alongside shock absorber, battery, brake and suspension repairs, plus free nitrogen tyre top-ups, in Monument Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tyreworx.co.za/dastek/?utm_source=google_maps&utm_medium=website_button&utm_campaign=SP&utm_content=SP", "https://txdastek.co.za/"]'
WHERE slug = 'tyreworx-dastek-monument-park-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TaaSA Group (Trailers-as-a-Service Africa) is a fleet maintenance business in Doornpoort that supports truck and trailer operators across Africa with maintenance, refurbishment, tarpaulin repairs and digital fleet-management tools.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'taasa-group-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafarie Holdings is a building and construction company in De Wilgers.',
    description_enriched_at = datetime('now')
WHERE slug = 'tafarie-holdings-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafel Bring Everyone Together is a women-owned furniture business in Derdepoort blending traditional craftsmanship with contemporary design, offering custom furniture by appointment with off-site delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00',
    source_urls = '["https://tafelfurniture.com/", "https://pretoria.co.za/place/tafel-bring-everyone-together"]'
WHERE slug = 'tafel-bring-everyone-together-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taiken Business Solution is a fashion and clothing business in Proclamation Hill, Pretoria West.',
    description_enriched_at = datetime('now')
WHERE slug = 'taiken-business-solution-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tailor-Made Risk Solutions is a BEE Level 1 risk-management provider in Sable Hills Waterfront Estate, supplying industrial absorbent and degreaser products alongside tailored risk-solution services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00'
WHERE slug = 'tailor-made-risk-solutions-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TakeOn Design is a business consulting firm in Monument Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'takeon-design-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Takelight Log Cabin Projects is a timber-home builder in Pretoria North with over six years'' experience and more than 136 completed projects, designing, constructing and renovating log cabins and Nutec homes from one to four bedrooms, using pre-existing or custom floor plans.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.takelightprojects.co.za/", "https://wendyhouses.co.za/places/takelight-log-cabin-projects/"]'
WHERE slug = 'takelight-log-cabin-projects-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Takgalang Consulting is a 100% Black-owned, BEE Level 1 built-environment firm in Heuwelsig Estate offering construction project management, quantity surveying and concrete pump hire, with over 19 years'' experience and offices across Gauteng, Limpopo and KwaZulu-Natal.',
    description_enriched_at = datetime('now')
WHERE slug = 'takgalang-consulting-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Talisman Hire Klerksoord (Rosslyn) is a branch of the Talisman Hire equipment rental group, offering access equipment, scaffolding, power tools, generators, compressors, concrete equipment and other site equipment for hire.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 07:30-12:00, Sun Closed'
WHERE slug = 'talisman-hire-klerksoord-rosslyn-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Talking Heads Advertising is a marketing and advertising business in Leeuwfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'talking-heads-advertising-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Talon Dynamix is a business consulting firm in Die Hoewes offering entrepreneurial support and business representation across sectors including automotive customisation, commercial fit-outs and niche product branding.',
    description_enriched_at = datetime('now')
WHERE slug = 'talon-dynamix-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tammy Vusi Building Construction and Project Pty Ltd is a building and construction company in Parktown Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'tammy-vusi-building-construction-and-project-pty-ltd-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tan Pixels Creative Studio is a software and web design studio in Eloffsdal offering website design, logo design, branding and poster design, along with digital marketing services for clients across legal, wellness and other industries.',
    description_enriched_at = datetime('now')
WHERE slug = 'tan-pixels-creative-studio-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tanatswa Consulting is an experiential training provider in East Lynne offering courses in health, human resources, leadership and business management for corporate, government and community clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'tanatswa-consulting-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tangasize (Pty) Ltd is a BEE Level 1, CIDB-registered construction company in Doornpoort offering civil engineering, general building and drilling and blasting services nationwide.',
    description_enriched_at = datetime('now')
WHERE slug = 'tangasize-pty-ltd-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tanium Trailers (Pty) Ltd is an industrial supplier and manufacturer in Booysens.',
    description_enriched_at = datetime('now')
WHERE slug = 'tanium-trailers-pty-ltd-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tanya''s Private Entities is a holding company in Andeon founded by a qualified nephrology clinical technologist, providing funding and operational support to dialysis and renal-care subsidiaries operating across Gauteng, Limpopo and Mpumalanga.',
    description_enriched_at = datetime('now')
WHERE slug = 'tanya-s-private-entities-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tappo Industries is a Level 2 BBBEE-rated manufacturer in Rosslyn, operating since 2006, producing lint-free and anti-static garments, cleanroom and paintshop wipes, protective covers and material-handling services for the pharmaceutical and automotive OEM sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'tappo-industries-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tar surfaces Pretoria, Asphalt Driveways & Brick paving Pretoria is a paving and surfacing contractor with over 20 years'' experience, offering hot and cold mix asphalt, pothole patching, crack sealing, road milling and brick paving across Gauteng.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 09:00-15:00, Sun Closed'
WHERE slug = 'tar-surfaces-pretoria-asphalt-driveways-brick-paving-pretoria-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tarps & Canvas Kings Projects Pty Ltd supplies and installs custom-fitted canvas pool covers and awnings in Hesteapark, Akasia, with pool covers designed to reduce evaporation by up to 80% and inhibit algae growth.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-14:00, Sat-Sun Closed'
WHERE slug = 'tarps-canvas-kings-projects-pty-ltd-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tartec Media is a printing services business in Brooklands Lifestyle Estate, Kosmosdal.',
    description_enriched_at = datetime('now')
WHERE slug = 'tartec-media-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tasker247.com is a virtual business-support firm in Val-De-Grace offering outsourced administrative assistance, corporate compliance and governance aligned with CIPC and POPIA, and business administration services across Johannesburg, Pretoria and the Vaal Triangle.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:30, Sat-Sun Closed'
WHERE slug = 'tasker247-com-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taste Restaurant Blue Valley is a farm-to-table restaurant and event venue at Blue Valley Golf Estate, offering a full menu of starters, mains and desserts alongside a full bar and event-planning services including catering, floral arrangements and equipment hire.',
    description_enriched_at = datetime('now')
WHERE slug = 'taste-restaurant-blue-valley-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tata Motors (SA) (Pty) Rosslyn Plant is an industrial supplier and manufacturer in Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'tata-motors-sa-pty-rosslyn-plant-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tatenda Research Consultancy is a business consulting firm in Annlin.',
    description_enriched_at = datetime('now')
WHERE slug = 'tatenda-research-consultancy-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tattoo Academy is a tattoo and piercing studio in Moregloed offering tattooing, tattoo removal, body piercing, ear piercing and nose piercing.',
    description_enriched_at = datetime('now')
WHERE slug = 'tattoo-academy-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taty Graphix is a printing services business in Booysens.',
    description_enriched_at = datetime('now')
WHERE slug = 'taty-graphix-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taunyane Krea-tivs is a software development business in Thatchfield Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'taunyane-krea-tivs-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taurus Vision is a security services business in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'taurus-vision-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taute, Bouwer & Cilliers Inc. is an attorneys'' firm in Rietfontein providing legal services.',
    description_enriched_at = datetime('now')
WHERE slug = 'taute-bouwer-cilliers-inc-attorneys-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tawny Creek Spur is a family-friendly Spur Steak Ranches restaurant in Northdale Shopping Centre, Ninapark, serving steaks, ribs, burgers and a range of vegetarian and vegan options.',
    description_enriched_at = datetime('now')
WHERE slug = 'tawny-creek-spur-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SME.TAX is a small-business accounting and advisory firm in Midstream Estate offering bookkeeping, company registrations, individual tax services, payroll and secretarial support, with tiered fixed-fee packages based on annual turnover and free phone support included.',
    description_enriched_at = datetime('now')
WHERE slug = 'tax-accounting-advisory-firm-sme-tax-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tax Shop Pretoria South-East is a branch of the Tax Shop franchise, providing accounting, payroll and tax services to individuals and businesses in Constantia Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'tax-shop-pretoria-south-east-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TaxMast Pretoria is a professional tax practitioner in Waterkloof Park offering fast SARS eFiling and tax return preparation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'taxmast-pretoria-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taxi Business Solutions is a car dealership business in Ashley Gardens.',
    description_enriched_at = datetime('now')
WHERE slug = 'taxi-business-solutions-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taypim Group (Pty) Ltd is a construction and waterproofing contractor in Zwavelpoort offering renovations, alterations and new home builds, alongside Kerakoll waterproofing coatings, screeds and self-levelling compounds.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-14:00'
WHERE slug = 'taypim-group-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Teachme LMS is a white-label learning management system provider in Wingate Park, enabling organisations to build custom-branded training platforms with course management, certification, event hosting and progress-reporting tools.',
    description_enriched_at = datetime('now')
WHERE slug = 'teachme-lms-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Team Agent is a real estate agency with over 30 years'' experience, specialising in property sales, rentals and free appraisals, and has operated in Boardwalk Meander Estate for more than two decades.',
    description_enriched_at = datetime('now')
WHERE slug = 'team-agent-boardwalk-meander' AND description_enriched_at IS NULL;

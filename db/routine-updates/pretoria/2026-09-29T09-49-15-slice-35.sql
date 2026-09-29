-- Description enrichment sweep (job 4) — slice 35
-- 50 businesses (tulip-laundromat-ninapark .. ukuvuma-solutions-it-business-computer-support-and-services-eldo-lakes-estate)

UPDATE businesses
SET description = 'Tulip Laundromat is a laundry and dry-cleaning business in Ninapark, Akasia, with close to two decades of experience in the laundry trade.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tuliplaundry.co.za/", "https://www.facebook.com/tuliplaundrycleaning/"]'
WHERE slug = 'tulip-laundromat-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tulip Management Accounting Services is a Centurion accounting practice founded in 2005 by a professional accountant, providing management accounting and taxation support to established businesses and startups.',
    description_enriched_at = datetime('now')
WHERE slug = 'tulip-management-accounting-services-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tumisho Sedi Chemical Holdings is a cleaning services business based in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tumisho-sedi-chemical-holdings-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tumo is a building and construction business based in Centurion North, Centurion, serving the Amberfield Valley area.',
    description_enriched_at = datetime('now')
WHERE slug = 'tumo-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turaco Business Logix is an asset and fleet management company based in Irene, Centurion, providing GPS, IoT and cellular-based tracking and operational-intelligence solutions for mining, construction, coal and passenger-vehicle fleets, in operation since 2012.',
    description_enriched_at = datetime('now')
WHERE slug = 'turaco-business-logix-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turbo K Enterprise PTY LTD is an estate agency based in Theresapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'turbo-k-enterprise-pty-ltd-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turbo Surge Microsystems is a business consulting firm based in Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'turbo-surge-microsystems-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turf Mobile Panel Beaters is a Centurion-based auto body repair business offering panel beating, spray painting and mobile paintless dent removal for dents, scratches and hail damage, along with wheel-trim and headlight restoration and ABS/ASR/ESP brake-system diagnostics.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.turfpanelbeaters.co.za/", "https://givingmore.co.za/turf-panel-beaters"]'
WHERE slug = 'turf-mobile-panel-beaters-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turn ''n Tender Midstream is a branch of the Turn ''n Tender steakhouse chain, trading from Shop 25 & 26 at The Square @ Midstream in Midstream Estate, Olifantsfontein.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:30-22:00, Sun 11:30-21:00',
    source_urls = '["https://location.turnntender.co.za/olifantsfontein", "https://www.dining-out.co.za/md/Turn-n-Tender-Midstream/8970", "https://locations.turnntender.co.za/restaurants-SquareMidstream-TurnnTenderSteakhouseMidstream"]'
WHERE slug = 'turn-n-tender-midstream-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turner Morris is a South African industrial equipment supplier and manufacturer established in 1936, distributing agricultural and construction equipment, generators and power systems, solar and home-energy products, and power and hand tools; this location trades from Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'turner-morris-pretoria-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turnkey Business Advisors (Proprietary) Limited is a business consulting firm based in Lynnwood Ridge, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'turnkey-business-advisors-proprietary-limited-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tusk Construction Support Services (Pty) Ltd is a multidisciplinary construction management company established in 1997, offering programme and project management, finance management, and professional services such as architectural design, quantity surveying and engineering, from its Lyttelton Manor, Centurion office.',
    description_enriched_at = datetime('now')
WHERE slug = 'tusk-construction-support-services-pty-ltd-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tutor Trust is an insolvency and estate-administration agency in Rietondale, Pretoria, handling sequestrations, liquidations, business rescue and corporate insolvency services, and describes itself as one of the largest insolvency agencies in the country.',
    description_enriched_at = datetime('now')
WHERE slug = 'tutor-trust-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twenty2Twenty Consulting is an employee benefits and investment consultancy in Die Hoewes, Centurion, offering fund investigations and advisory services as a licensed Financial Services Provider to small and medium-sized companies.',
    description_enriched_at = datetime('now')
WHERE slug = 'twenty2twenty-consulting-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TwentyONE Properties is an estate agency serving Centurion, Pretoria and Midrand, handling property sales and rentals across suburbs including Amberfield, Lyttelton Manor and Heuweloord.',
    description_enriched_at = datetime('now')
WHERE slug = 'twentyone-properties-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twiga Warehouse is a facility of Twiga, a South African defence and security engineering company that has provided turnkey armoured-vehicle, patrol-boat and weapon-mount acquisition projects to defence, security and humanitarian clients for more than 30 years.',
    description_enriched_at = datetime('now')
WHERE slug = 'twiga-warehouse-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twinsaver Group Pretoria West Converting Plant is a production facility of Twinsaver, a national tissue and hygiene-paper manufacturer supplying toilet tissue, facial tissue and roller towels to household and institutional markets.',
    description_enriched_at = datetime('now')
WHERE slug = 'twinsaver-group-pretoria-west-converting-plant-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twist Electrical Supplies Montana is a branch of the Twist Electrical Supplies wholesaler, selling electrical products and accessories for industrial, commercial and domestic use from Montana Park, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.twistelectrical.com/", "https://twistelectrical.co.za/"]'
WHERE slug = 'twist-electrical-supplies-montana-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twist Electrical Supplies Pretoria North is an electrical wholesaler on President Steyn Street in Pretoria North, open since July 2011, supplying electrical products and accessories for industrial, commercial and domestic customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-16:30, Sat 08:00-13:00, Sun Closed',
    source_urls = '["http://www.twistelectrical.co.za/", "https://www.facebook.com/TwistElectricalSuppliesWholesaler/"]'
WHERE slug = 'twist-electrical-supplies-pretoria-north-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twist Engineering is an engineering and surveying business based in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'twist-engineering-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tyler Hire Centurion is an equipment hire business in Monavoni, Centurion, offering tools and equipment for hire at affordable prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://tylerhirecenturion.business.site/"]'
WHERE slug = 'tyler-hire-centurion-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Typewrite Office Equipment is a stationery and office-equipment supplier in Wonderboom South, Pretoria, trading since 1980 and selling printer, ink and toner cartridges, Trodat self-inking stamps and office equipment from brands including Brother, Canon, Epson, HP and Samsung.',
    description_enriched_at = datetime('now')
WHERE slug = 'typewrite-office-equipment-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tyremart Centurion is a tyre and automotive repair business on Hendrik Verwoerd Drive in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tyremart-centurion-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tyris Construction (Pty) Ltd is a Pretoria-based builder with more than 30 years of experience in residential, commercial, industrial and civil construction, holding ISO 9001, ISO 45001, NHBRC and CIDB accreditations.',
    description_enriched_at = datetime('now')
WHERE slug = 'tyris-construction-pty-ltd-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tyson Wheel Technologies is an industrial supply and manufacturing business based in Hesteapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tyson-wheel-technologies-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UBS Silverton (Unlimited Building Supplies SA) is a branch of the nationwide UBS ceiling and partitioning supplier, also stocking a wider range of building products from brands including Isover, Dulux, Gyproc and Knauf, in Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubs-silverton-unlimited-building-supplies-sa-silvertondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UBVELELA SIGNAGE AND PROMOTIONS is a branding company in Olievenhoutbosch, Pretoria, offering indoor and outdoor signage, vehicle wrapping and fleet branding, printing and corporate gifting.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubvelela-signage-and-promotions-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UFI Distribution Centre is an industrial supply and manufacturing business based in Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ufi-distribution-centre-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ULTIMATE HVAC & SERVICES is a building and construction business based in Roodeplaat, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ultimate-hvac-services-roodeplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UMM Contracting Services is a building and construction business based in Irene, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'umm-contracting-services-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UMPHs Pro Homestics is a commercial property and office-space business based in Montana AH, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'umphs-pro-homestics-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UNATSHO TRADING PTY LTD is a Centurion-based reseller of electronic and ICT equipment, supplying biometric access control, IP-based CCTV, networking and audio-visual solutions, as well as boom gate and electric fence installations.',
    description_enriched_at = datetime('now')
WHERE slug = 'unatsho-trading-pty-ltd-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UNIPROP Real Estate Centurion is an estate agency based in Amberfield Glen, Rooihuiskraal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'uniprop-real-estate-centurion-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UNTOUCHABLE HOLDINGS (PTY)LTD is a building and construction business based in Proclamation Hill, Pretoria West.',
    description_enriched_at = datetime('now')
WHERE slug = 'untouchable-holdings-pty-ltd-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UP A TONE EVENTS AGENCY is a corporate event-planning agency based in Menlo Park, Pretoria, trading since 2007 and offering event management, audio-visual production, catering, venue sourcing and professional conference organising across the SADC region.',
    description_enriched_at = datetime('now')
WHERE slug = 'up-a-tone-events-agency-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UPGRADED WITH VUSI MAHLANGU is a business consulting service based at Golf Gardens Office Park, Highveld, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'upgraded-with-vusi-mahlangu-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'USN Head Office is the South African headquarters of USN, a sports nutrition brand producing protein powders, pre-workouts, creatine, mass gainers, fat burners and hydration products, based at Louwlardia Logistics Park in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'usn-head-office-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ubangi Transport is a logistics, courier and transport business based in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubangi-transport-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uber Build Renovations is a solar and renewable-energy business based in Mountain View, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'uber-build-renovations-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ubert electronic repairs is an electronics and appliance repair business based in Sunnyside, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubert-electronic-repairs-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ubuntu Ewaste Recycling is a Silverton, Pretoria-based electronic-waste handler offering eWaste pickup and removal, serialised asset inventories, physical and software data destruction, and electronic-asset buy-back, continuing operations begun by the Tshwane Electronic Waste Company in 2012.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubuntu-ewaste-recycling-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ubuntu Projects is a business consulting firm based in Pretoria North, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubuntu-projects-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ubuntu Scrap Metals And Recycling is a scrap-metal buyer and recycler in Klerksoord, Akasia, purchasing copper, aluminium, brass and stainless steel as well as plastic, paper, cardboard and electronic waste, with collection from homes, contractors and businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubuntu-scrap-metals-and-recycling-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ubuntu Technologies is a Pretoria-based ICT systems integrator established in 1997, offering business applications, infrastructure, networking, security and unified-communications solutions, including CCTV, access control and cloud services, from its Erasmuskloof office.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-13:00, Sat-Sun Closed'
WHERE slug = 'ubuntu-technologies-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ubuntu Trans Logistics is an industrial supply and manufacturing business based in Zandfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ubuntu-trans-logistics-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uflow Automation South Africa is an engineering and surveying business based in Hermanstad, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'uflow-automation-south-africa-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ujala Consulting is a marketing and advertising agency offering brand strategy, campaign management, lead generation, social media, SEO and web development, as well as event management and corporate branding services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-17:00, Sat-Sun Closed'
WHERE slug = 'ujala-consulting-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukhozi Consulting Engineers is a Kilner Park, Pretoria-based multidisciplinary engineering consultancy operating since 1998, undertaking electrical and mechanical engineering projects for hospitals, residential developments, industrial facilities and security systems, and merged with SVR Engineers in 2020.',
    description_enriched_at = datetime('now')
WHERE slug = 'ukhozi-consulting-engineers-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukuvuma Security (Pty) Ltd is a computer and IT services business based at Heuwelsig Office Park in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ukuvuma-security-pty-ltd-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukuvuma Solutions is a managed IT services provider in Zwartkop, Centurion, offering managed IT support, cloud and networking services, and Microsoft 365 and Azure deployment as a certified Microsoft Partner, operating since 2004.',
    description_enriched_at = datetime('now')
WHERE slug = 'ukuvuma-solutions-it-business-computer-support-and-services-eldo-lakes-estate' AND description_enriched_at IS NULL;

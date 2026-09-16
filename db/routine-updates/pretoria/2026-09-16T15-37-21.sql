-- Job 4: description enrichment sweep (100-business batch per ROUTINE.pretoria.md)

UPDATE businesses
SET description = 'BDJ Auditors Incorporated is a firm of registered chartered accountants and auditors formed in 1995, based in Garsfontein, offering audit, tax, accounting, payroll and estate-administration services mainly to small and medium-sized enterprises.',
    description_enriched_at = datetime('now')
WHERE slug = 'bdj-auditors-incorporated-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Botha & Lovegrove Inc is a law firm in Garsfontein practising since 2006, specialising in conveyancing, contracts, commercial law, deceased estates and estate planning, as well as property law and High Court litigation.',
    description_enriched_at = datetime('now')
WHERE slug = 'botha-lovegrove-inc-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Gezina Galleries is a health and beauty retailer inside Gezina Galleries, offering pharmacy, healthcare and beauty products alongside homeware and gifts, with an in-store pharmacy for prescription and over-the-counter medicines.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://clicks.co.za/store/Gezina-Galleries/1560", "https://www.tiendeo.co.za/stores/pretoria/clicks-gezina-galleries-michael-brink-street/27798", "https://my-catalogue.co.za/stores/pretoria/clicks/gezina-galleries-michael-brink-street-gezina"]'
WHERE slug = 'clicks-gezina-galleries-gezina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza Gezina is a pizza takeaway and delivery outlet inside Gezina Galleries, known for its Triple-Decker pizzas and the budget-friendly Real Deal range, available for dine-in, takeaway or online delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'debonairs-pizza-gezina-gezina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jones & Kie is a single-practitioner accounting and auditing firm in Garsfontein, providing bookkeeping, tax advisory and financial statement preparation to local small businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'jones-kie-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LKTT Event Management & Catering CC is an event planning and catering company in Lotus Gardens with over 10 years in business, offering wedding coordination and catering alongside hire of tents, tables, linen, chair covers and decor for both adult and children''s events.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.yellosa.co.za/company/771393/lktt-event-managementcatering"]'
WHERE slug = 'lktt-event-management-catering-cc-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LLP Transport (Pty) Ltd is a logistics, courier and transport company in Raslouw.',
    description_enriched_at = datetime('now')
WHERE slug = 'llp-transport-pty-ltd-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LM Attorneys is a firm of attorneys in Sable Hills Waterfront Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'lm-attorneys-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LM Electrical and Plumbing is a team of qualified electricians and plumbers serving Claudius and the wider Centurion area, offering residential and commercial installations, repairs and 24/7 emergency maintenance.',
    description_enriched_at = datetime('now')
WHERE slug = 'lm-electrical-and-plumbing-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LM Mundalamo Inc. Attorneys is a 100% black-owned law firm in Booysens established in 2009, focused on providing accessible legal services and promoting access to justice, particularly for vulnerable members of the community.',
    description_enriched_at = datetime('now')
WHERE slug = 'lm-mundalamo-incorporated-attorneys-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LM Printers is a printing services provider in Hermanstad.',
    description_enriched_at = datetime('now')
WHERE slug = 'lm-printers-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LMC is an engineering services company in Brooklands Lifestyle Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'lmc-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LMI (Libra Measuring Instruments) is a manufacturer of electronic weighing and scale systems in Waltloo, founded in 1985, specialising in weighbridges, livestock and silo scales, batching systems and custom axle weighers for mine vehicles.',
    description_enriched_at = datetime('now')
WHERE slug = 'lmi-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LMS group is a business consulting firm in Constantia Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'lms-group-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LMV Attorneys is a women-owned law firm in Rietfontein, founded by a practising attorney with rights of appearance in the High Court of South Africa and local Magistrates'' Courts, offering services in deceased estates, wills and trusts, family law and divorce, criminal law, commercial law, construction law, property law and notarial work.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:00, Fri 08:00-15:00'
WHERE slug = 'lmv-attorneys-pretoria-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LNR Accountants is an accounting and tax advisory firm in Doornpoort operating since 2003, offering bookkeeping, tax accounting, tax consulting, financial accounting, payroll and business-structure advice to local and international clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'lnr-accountants-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LOG HOME SOLUTIONS (Pty) Ltd is a building and construction company in Klerksoord.',
    description_enriched_at = datetime('now')
WHERE slug = 'log-home-solutions-pty-ltd-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LOGISTICSMITH (PTY)LTD is a logistics, courier and transport company in Eersterust.',
    description_enriched_at = datetime('now')
WHERE slug = 'logisticsmith-pty-ltd-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Look Up Solar is a residential and commercial solar installer in Constantia Park, providing solar energy solutions to help customers reduce electricity costs and improve energy independence.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://lookupsolar.co.za/", "https://servicesource.co.za/solar-installers/pretoria"]'
WHERE slug = 'look-up-solar-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LOUW SOLAR - 5, 8, 16, 24 & 50kW Solar Installations, Sales, Settings, Fault Finding is a solar and renewable energy business in Rooiwal.',
    description_enriched_at = datetime('now')
WHERE slug = 'louw-solar-5-8-16-24-50kw-solar-installations-sales-settings-fault-finding-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LPM Steel (Pty) Ltd installs single, double and multiple pitched carports and gazebos across domestic, industrial and commercial sites in the greater Centurion area, and has worked on projects including carports at Centurion Mall.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.lpmsteel.co.za/", "https://www.lpmsteelroofs.co.za/wabout.php"]'
WHERE slug = 'lpm-steel-pty-ltd-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LRT Electrical is an electrical contractor in Kameeldrift East serving Gauteng with repairs, installations and upgrades for commercial and residential clients, specialising in earthing, lightning and surge protection systems and lightning masts for thatched roofs.',
    description_enriched_at = datetime('now')
WHERE slug = 'lrt-electrical-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LS SEBONE PROJECTS Pty LTD is a building and construction business in Proclamation Hill.',
    description_enriched_at = datetime('now')
WHERE slug = 'ls-sebone-projects-pty-ltd-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LS Windings is an electric motor repair and rewinding specialist in Annlin, servicing motors, pumps, generators, industrial fans and gearboxes, and also offering AC/DC welding.',
    description_enriched_at = datetime('now')
WHERE slug = 'ls-windings-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LSMA Engineering is an engineering services company in The Reeds.',
    description_enriched_at = datetime('now')
WHERE slug = 'lsma-engineering-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LSV Global is a financial services firm in Southdowns.',
    description_enriched_at = datetime('now')
WHERE slug = 'lsv-global-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LTA Accountants is an accounting firm serving Pierre van Ryneveld Park and Centurion, offering a complete accounting, payroll, tax and administration solution for individuals and companies.',
    description_enriched_at = datetime('now')
WHERE slug = 'lta-accountants-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LTG Logistics Transport Globally is a freight forwarding and clearing company based in Rosslyn, established in 2006 originally to serve the automotive supply chain and since expanded into mining, engineering, agricultural, perishable and general freight, handling sea and air freight, imports, exports and cross-country distribution for over 100 permanent clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'ltg-logistics-transport-globally-rosslyn-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LTK Construction (Pty) Ltd is a building construction company offering tiling, ceilings, walling, electrical and plumbing work, and registers and enrols the homes and units it builds with the NHBRC.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.yellosa.co.za/company/384084/l-t-k-construction-pty-ltd"]'
WHERE slug = 'ltk-construction-pty-ltd-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LUDICK ATTORNEYS is a firm of attorneys in Daspoort.',
    description_enriched_at = datetime('now')
WHERE slug = 'ludick-attorneys-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LVP Accountants (Pty) Ltd is a registered SAIPA accounting practice and SARS tax practitioner in Garsfontein, incorporated in 2013, offering accounting and tax consulting services to businesses and individuals as well as company secretarial services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://garsfonteinofficepark.co.za/2024/07/21/lvp-accountants/", "https://b2bhint.com/en/company/za/lvp-accountants--K2013028096"]'
WHERE slug = 'lvp-accountants-pty-ltd-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LZ Cross Country Carriers is a logistics, courier and transport company in Meyerspark.',
    description_enriched_at = datetime('now')
WHERE slug = 'lz-cross-country-carriers-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Coco C Food Purveyors is a bakery, cafe and health food store in Shere Lifestyle Centre, serving homemade dishes and fresh juices made from fresh, locally-sourced ingredients, with grab-and-go options available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 07:00-14:00, Sun Closed',
    source_urls = '["https://foodpurveyors.co.za/pretoria-contact/", "https://www.dining-out.co.za/md/La-Coco-C-Food-Purveyors/8428", "https://foodpurveyors.co.za/pretoria-about/"]'
WHERE slug = 'la-coco-c-food-purveyors-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Louise Venue is a wedding and function venue in Hesteapark trading since 2006, offering a chapel, an outdoor ceremony area and a patio for functions, and hosting weddings, parties, conferences, graduations and year-end events for up to 300 wedding guests or 500 conference delegates.',
    description_enriched_at = datetime('now')
WHERE slug = 'la-louise-venue-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Montagne Pharmacy is an independent community pharmacy in La Montagne that has provided pharmacy services for over 24 years, including a medicine depot where prescriptions can be dropped off and dispensed medication collected.',
    description_enriched_at = datetime('now')
WHERE slug = 'la-montagne-pharmacy-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Montagne Primary School is a fee-charging public primary school in La Montagne covering Grades R-7 within the Tshwane South education district, with an enrolment of around 884 learners and 31 educators.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/la-montagne-primary-school/", "https://www.school-register.co.za/school/la-montagne-primary-school/", "https://www.lm1.co.za/contact", "https://schoolrank.co.za/gauteng/la-montagne-primary-school"]'
WHERE slug = 'la-montagne-primary-school-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Pentola is a restaurant in Riviera that has served international fusion cuisine drawing on French, Italian and Mediterranean flavours combined with local produce since opening in 1995, with two dining areas suited to year-end parties and corporate functions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat Lunch & Dinner, Sun Closed'
WHERE slug = 'la-pentola-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Promotion Cc is a promotional-products supplier in Rietondale offering branded apparel, custom corporate gifts and branded giveaways for corporate events and marketing campaigns.',
    description_enriched_at = datetime('now')
WHERE slug = 'la-promotion-cc-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Vita Living Products is a manufacturing and network-marketing company in Muckleneuk founded in 1995, producing health products including aloe vera juice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-15:30',
    source_urls = '["https://www.lavitaliving.co.za/", "https://za.linkedin.com/company/la-vita-living-products1"]'
WHERE slug = 'la-vita-living-products-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La-Grace Aesthetics & Beaute bar is a beauty salon in Kameeldrift.',
    description_enriched_at = datetime('now')
WHERE slug = 'la-grace-aesthetics-beaute-bar-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LaRu Coffee Essentials is a coffee shop and barista-training business in Rietondale, serving coffee to the local community while also training baristas.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "http://www.larucoffee.co.za/"]'
WHERE slug = 'laru-coffee-essentials-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Label & Litho is a printing services company in Bergtuin.',
    description_enriched_at = datetime('now')
WHERE slug = 'label-litho-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Label Solutions is a labelling and printing equipment supplier in Lyttelton Manor with over 30 years in the industry, offering tamper-proof security labels and high-performance linerless labels alongside label printers, consumables and technical support.',
    description_enriched_at = datetime('now')
WHERE slug = 'label-solutions-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lakey Logistics and Transport (Pty) Ltd is a multi-discipline logistics and transport company in Valhalla, procuring products and materials to clients'' specifications and providing transport and storage services.',
    description_enriched_at = datetime('now')
WHERE slug = 'lakey-logistics-and-transport-pty-ltd-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lambda Automation is a system integrator in The Willows specialising in custom automation, robotics and system integration for the automotive, mining and process-engineering sectors, offering PLC programming, SCADA, vision applications and turn-key solutions from mechanical and electrical design through to panel construction.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-16:30'
WHERE slug = 'lambda-automation-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lamp Delights is a decorative lighting business in Murrayfield, designing and supplying lamps and lighting pieces.',
    description_enriched_at = datetime('now')
WHERE slug = 'lamp-delights-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lancea Konsult is a business consulting firm in Ashlea Gardens providing tailored SYSPRO ERP solutions, including shop-floor scheduling, inventory planning and business intelligence, delivered by a team of industrial engineers and software developers.',
    description_enriched_at = datetime('now')
WHERE slug = 'lancea-konsult-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lancet Laboratories - Wilgers Hospital Medical Centre (Depot) is a pathology and diagnostic laboratory depot inside Wilgers Hospital Medical Centre, part of the wider Lancet Laboratories network of over 100 reference laboratories and 250 branches across more than 14 African countries.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=121412"]'
WHERE slug = 'lancet-laboratories-wilgers-hospital-medical-centre-depot-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Land Wealth Pty ltd- Properties and Cars is an estate agency in Sable Hills Waterfront Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'land-wealth-pty-ltd-properties-and-cars-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LandPlan is an engineering services company in Lynnwood Glen.',
    description_enriched_at = datetime('now')
WHERE slug = 'landplan-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Landje is a family-oriented event and wedding venue on a smallholding in Shere, between Silver Lakes and Lombardy Estates, offering farm-to-fork dining, venue hire for weddings and events, and a mobile coffee bar.',
    description_enriched_at = datetime('now')
WHERE slug = 'landje-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Landrover is a Jaguar Land Rover dealership in Centurion offering Land Rover, MG and Jaguar vehicles for sale alongside servicing, maintenance and accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:30, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'landrover-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Landscape Specialist in Pretoria is a landscaping service in Donkerhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'landscape-specialist-in-pretoria-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lanifen business investments is a financial services firm in Doornpoort.',
    description_enriched_at = datetime('now')
WHERE slug = 'lanifen-business-investments-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lantador Pty (Ltd) is a marketing and advertising business in Heritage Hill Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'lantador-pty-ltd-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lantis Electronic Repairs, trading since 1994, repairs HiFi amplifiers, AV receivers, CD/DVD players, home theatres, PA equipment, speakers and microwaves in Garsfontein.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/10264847755", "https://lantis.co.za/index.php?information_id=4&route=information%2Finformation"]'
WHERE slug = 'lantis-electronic-repairs-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lantis Electronics, trading in Garsfontein since 1994, supplies audio accessories, turntable styluses and belts alongside electronics components such as Arduino and Microchip products for students and professionals.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/3568651493", "https://lantis.co.za/index.php?information_id=4&route=information%2Finformation"]'
WHERE slug = 'lantis-electronics-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lantis Electronics (Imports and Supply), trading since 1994, imports and supplies electronics components and audio accessories in Willow Glen.',
    description_enriched_at = datetime('now')
WHERE slug = 'lantis-electronics-imports-and-supply-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lapis Lazuli Beauty Bar is a beauty salon at Glenfair Boulevard in Lynnwood Manor offering nail services, professional waxing, advanced facials, microneedling, a Signature Hydra Facial and massage.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-14:00'
WHERE slug = 'lapis-lazuli-beauty-bar-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lara Van Der Merwe is a dental practice in Waterkloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'lara-van-der-merwe-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Laros Consulting (Pty) Ltd is a business consulting firm in Clubview helping South African businesses of all sizes avoid liquidation, offering a free initial business assessment.',
    description_enriched_at = datetime('now')
WHERE slug = 'laros-consulting-pty-ltd-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Laserpressing Pty (Ltd) is a metal products and machinery manufacturing business in the Rosslyn industrial area.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/laser-pressing"]'
WHERE slug = 'laserpressing-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lategan Website Hosting is a computer and IT services provider in Parktown Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'lategan-website-hosting-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Le Roux & Du Plessis Attorneys is a niche law firm in Eldoraigne established in 2001, specialising in family law (divorce, and child and spouse maintenance), property law including conveyancing, and High Court litigation, with additional expertise in commercial law, business rescue, employment law, estate planning and liquidation and sequestration.',
    description_enriched_at = datetime('now')
WHERE slug = 'le-roux-du-plessis-attorneys-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lea Printing and graphics design is a printing services company in Roseville.',
    description_enriched_at = datetime('now')
WHERE slug = 'lea-printing-and-graphics-design-roseville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lead Life Coaching is a spa and wellness business in Woodhill Golf Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'lead-life-coaching-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lead Your Brand. is a business consulting firm in Waterkloof Glen.',
    description_enriched_at = datetime('now')
WHERE slug = 'lead-your-brand-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leahy Attorneys is a firm of attorneys in Waterkloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'leahy-attorneys-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leano Complete Solutions is a computer and IT services provider in Kilner Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'leano-complete-solutions-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leano Marketing and Online Business Management is a women-owned marketing agency in Rooihuiskraal offering social media management, SEO optimisation and digital strategy for clients ranging from small businesses to large corporations, with online appointment scheduling available.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing/leano-marketing-and-online-business-management/"]'
WHERE slug = 'leano-marketing-and-online-business-management-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lear Corporation (Pty) Ltd''s Rosslyn facility is part of Lear Corporation, a global automotive seating and E-Systems supplier with more than 100 years of heritage as the largest US-based automotive supplier.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://ccbc.co.za/business-directory-2/rosslyn-improvement-district/lear"]'
WHERE slug = 'lear-corporation-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LearnMe Learnerships - BEE Consultants is a 100% black-female-owned Learnerships and Skills Programme provider based in Centurion, offering B-BBEE consulting, learnership and disability-learnership placement, and outsourced HR services including recruitment, payroll, performance management and employment-equity submissions.',
    description_enriched_at = datetime('now')
WHERE slug = 'learnme-learnerships-bee-consultants-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Learnet International (Pty) Ltd is a business consulting firm in Sterrewag.',
    description_enriched_at = datetime('now')
WHERE slug = 'learnet-international-pty-ltd-sterrewag' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leatherite International (Pty) Ltd is an industrial supplier in Salieshoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'leatherite-international-pty-ltd-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leayloh is a marketing and advertising business in Olympus.',
    description_enriched_at = datetime('now')
WHERE slug = 'leayloh-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lebo Business Consulting is a business consultancy in Annlin, 100% black-woman-owned and established in 2006, offering strategic business planning, operational efficiency assessments, market analysis and business transformation and change-management support, and is SETA accredited across several training areas.',
    description_enriched_at = datetime('now')
WHERE slug = 'lebo-business-consulting-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lebo Tebo Trading is a trading and projects company in Highveld founded in 2008, offering construction, general supply, catering, cleaning, waste removal, logistics and security services across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'lebo-tebo-trading-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lebuy Corporate Services is a business development consultancy in Rooihuiskraal North offering business plan writing, company formation and bookkeeping services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/LebuyCompany/"]'
WHERE slug = 'lebuy-corporate-services-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ledgers on Call is a business consulting firm in Constantia Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'ledgers-on-call-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lee Rhodes Logistics is a logistics, courier and transport company in Proclamation Hill.',
    description_enriched_at = datetime('now')
WHERE slug = 'lee-rhodes-logistics-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leegra is a marketing and advertising business in Raslouw.',
    description_enriched_at = datetime('now')
WHERE slug = 'leegra-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leeroy Business Firm Tshwane is a business consulting firm in East Lynne.',
    description_enriched_at = datetime('now')
WHERE slug = 'leeroy-business-firm-tshwane-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lefa La Bokamoso is a travel agency in Sable Hills Waterfront Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'lefa-la-bokamoso-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lekker Solutions is a software development company in Waverley.',
    description_enriched_at = datetime('now')
WHERE slug = 'lekker-solutions-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lekubu Media Group is a marketing and advertising business in Hesteapark.',
    description_enriched_at = datetime('now')
WHERE slug = 'lekubu-media-group-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lelani Creations is a printing services company in Murrayfield.',
    description_enriched_at = datetime('now')
WHERE slug = 'lelani-creations-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lemonjack Studios is an AA Superior-graded guest house, theatre and conference venue on a 1.8-hectare smallholding in Raslouw, also operating as a performance-art theatre and recording studio.',
    description_enriched_at = datetime('now')
WHERE slug = 'lemonjack-studios-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Len Dekker Attorneys Inc. is a law firm in Monument Park established in 1996, specialising in municipal, provincial, administrative and labour law and litigation.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'len-dekker-attorneys-inc-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lenga Solutions (PTY) LTD is a 100% black-owned ICT consulting company in Parktown Estate specialising in IT infrastructure, business process re-engineering, change management and data analytics.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "http://www.lenga.co.za/"]'
WHERE slug = 'lenga-solutions-pty-ltd-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lenk and Les General Trading is a business consulting firm in Philip Nel Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'lenk-and-les-general-trading-philip-nel-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lenmark Consulting is a business consulting firm in Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'lenmark-consulting-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leo Africa Business is a business consulting firm in Geolina.',
    description_enriched_at = datetime('now')
WHERE slug = 'leo-africa-business-geolina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leo Wendy Huts is a log-cabin and Wendy-house builder in Pretoria North, offering 1-5 bedroom log cabins in various configurations with nationwide delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'leo-wendy-huts-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leobot Electronics is an industrial supplier in Bergtuin.',
    description_enriched_at = datetime('now')
WHERE slug = 'leobot-electronics-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leon de Kock Garage Doors has provided garage door installation and repair services in the Kameeldrift area for over 10 years, covering double, sectional, glass, steel, roller, wooden and aluminium garage doors as well as pivot, folding and sliding doors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:15-16:45, Sat-Sun Closed'
WHERE slug = 'leon-de-kock-garage-doors-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leona Corporate South Africa (L.E.C.S.A -Consulting) is a financial services firm offering tax advisory, accounting and internal auditing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'leona-corporate-south-africa-l-e-c-s-a-consulting-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leonard''s Jewellers is a jewellery store in Sinoville Corner, Sinoville.',
    description_enriched_at = datetime('now')
WHERE slug = 'leonards-jewellers-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leouro Geology is an industrial supplier in Woodhill Golf Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'leouro-geology-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leozzy Accounting (South Africa) is an accounting firm in Blue Valley Golf Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'leozzy-accounting-south-africa-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lepopoo Solutions is a solar and renewable energy business in Theresapark.',
    description_enriched_at = datetime('now')
WHERE slug = 'lepopoo-solutions-theresapark' AND description_enriched_at IS NULL;

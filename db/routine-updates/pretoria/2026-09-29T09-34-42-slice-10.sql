-- Description enrichment sweep (job 4) — slice 10
-- Each UPDATE guarded so it only ever applies once per business.

-- Safestore SA (reworded: website domain is parked, no content)
UPDATE businesses
SET description = 'Safestore SA is a commercial property and office space business in Wonderboom, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'safestore-sa-wonderboom' AND description_enriched_at IS NULL;

-- Safesun Systems (Pty) Ltd (researched)
UPDATE businesses
SET description = 'Safesun Systems (Pty) Ltd is a software development company specialising in custom web applications, ERP implementation and AI-driven automation agents, with more than 15 years of experience and over 50 completed projects for enterprise clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'safesun-systems-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

-- Safety Management Group - Pretoria (researched: service catalogue from the firm's own site, no branch-specific facts used)
UPDATE businesses
SET description = 'Safety Management Group - Pretoria is a health and safety consulting firm offering occupational health and safety compliance (including ISO 45001), event safety planning, ergonomics, food safety, construction safety and workers'' compensation consulting for businesses in and around Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'safety-management-group-pretoria-boardwalk-meander' AND description_enriched_at IS NULL;

-- Safspec International Services (researched)
UPDATE businesses
SET description = 'Safspec International Services designs and distributes automated single-point lubrication systems, including its electromechanical and electrochemical SAL Elite range, used to precisely lubricate bearings, gears, spindles and electric motors in industrial equipment.',
    description_enriched_at = datetime('now')
WHERE slug = 'safspec-international-services-doornpoort' AND description_enriched_at IS NULL;

-- Saintsburg (researched; source redirected to https://saintsburg.com/)
UPDATE businesses
SET description = 'Saintsburg is an online and hybrid homeschooling provider for learners aged 6 to 18, preparing students for Cambridge International GCSE and Pearson Edexcel AS/A-Level exams through live online classes, self-paced courses and onsite campus instruction.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://saintsburgonline.com/", "https://saintsburg.com/"]'
WHERE slug = 'saintsburg-zwavelpoort' AND description_enriched_at IS NULL;

-- Sakabuka Kennels (researched)
UPDATE businesses
SET description = 'Sakabuka Kennels is a pet boarding facility offering accommodation for dogs, cats and other small animals such as birds, hamsters and reptiles, with heated kennels available on request.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun 10:00-14:00'
WHERE slug = 'sakabuka-kennels-derdepoort' AND description_enriched_at IS NULL;

-- Sakabuka Kennels (second listing, same business/site — researched)
UPDATE businesses
SET description = 'Sakabuka Kennels is a pet boarding facility offering accommodation for dogs, cats and other small animals such as birds, hamsters and reptiles, with heated kennels available on request.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun 10:00-14:00'
WHERE slug = 'sakabuka-kennels-derdepoort-smallholdings' AND description_enriched_at IS NULL;

-- Salamus Spices (researched via infobel directory listing)
UPDATE businesses
SET description = 'Salamus Spices is an import-export and international trading business based in East Lynne, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'salamus-spices-east-lynne' AND description_enriched_at IS NULL;

-- Sales Lab (reworded: no website, scraped Google Places listing only)
UPDATE businesses
SET description = 'Sales Lab is a marketing and advertising business in Midstream Ridge, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sales-lab-midstream-ridge' AND description_enriched_at IS NULL;

-- SalesCollab (researched)
UPDATE businesses
SET description = 'SalesCollab is a sales enablement business offering marketing and lead generation, strategic business consulting, and fibre/VOIP connectivity solutions through its Marketing, Consulting and Connect divisions, and has been operating for more than five years.',
    description_enriched_at = datetime('now')
WHERE slug = 'salescollab-erasmusrand' AND description_enriched_at IS NULL;

-- Saltus Holdings Africa Pty Ltd (reworded: no website, scraped Google Places listing only)
UPDATE businesses
SET description = 'Saltus Holdings Africa Pty Ltd, owner of Saltus Poles, is an industrial supplier and manufacturer in Donkerhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'saltus-holdings-africa-pty-ltd-owner-of-saltus-poles-donkerhoek' AND description_enriched_at IS NULL;

-- Salvagente (researched)
UPDATE businesses
SET description = 'Salvagente supplies ozone therapy wellness technology, including ozone steam saunas, insufflation kits, oxygen concentrators and related health and beauty products, serving spas, salons, clinics and individual customers.',
    description_enriched_at = datetime('now')
WHERE slug = 'salvagente-waterkloof-glen' AND description_enriched_at IS NULL;

-- SamaBuilt Structures (reworded: no website, scraped Google Places listing only)
UPDATE businesses
SET description = 'SamaBuilt Structures is a building and construction business in Wolmer, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'samabuilt-structures-wolmer' AND description_enriched_at IS NULL;

-- Samarina Pty Ltd (researched)
UPDATE businesses
SET description = 'Samarina Pty Ltd distributes IASO Detox Tea, a herbal wellness tea aimed at supporting digestive health and healthy lifestyles, with nationwide delivery across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'samarina-pty-ltd-mayville' AND description_enriched_at IS NULL;

-- Samba Solutions (researched)
UPDATE businesses
SET description = 'Samba Solutions is a financial and audit services firm offering internal and external audit, tax, accounting, and advisory and consulting services, operating since 2018.',
    description_enriched_at = datetime('now')
WHERE slug = 'samba-solutions-hazeldean' AND description_enriched_at IS NULL;

-- Sambo and Makgabutlane Attorneys (researched; phone number on the firm's site matches this listing)
UPDATE businesses
SET description = 'Sambo and Makgabutlane Attorneys is a law firm practising family law, labour law, statutory and regulatory compliance, commercial contracts, personal injury, dispute resolution and litigation, debt collection and criminal law.',
    description_enriched_at = datetime('now')
WHERE slug = 'sambo-and-makgabutlane-attorneys-pretoria-north' AND description_enriched_at IS NULL;

-- Samcro Consulting & Services (Pty) Ltd (researched)
UPDATE businesses
SET description = 'Samcro Consulting & Services (Pty) Ltd is a business consultancy offering payroll and bookkeeping, recruitment, compliance support and internship onboarding services to local enterprises.',
    description_enriched_at = datetime('now')
WHERE slug = 'samcro-consulting-services-pty-ltd-wapadrand' AND description_enriched_at IS NULL;

-- Sammy Marks Museum (researched)
UPDATE businesses
SET description = 'Sammy Marks Museum is a Victorian mansion museum at Zwartkoppies Hall, the former home of entrepreneur Sammy Marks and his family from 1885 to 1909, preserving original Victorian silver, porcelain and furniture and offering guided tours.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 07:30-16:00'
WHERE slug = 'sammy-marks-museum-donkerhoek' AND description_enriched_at IS NULL;

-- Samnols Travels (reworded: business's own domain no longer resolves)
UPDATE businesses
SET description = 'Samnols Travels is a travel agency in Lotus Gardens.',
    description_enriched_at = datetime('now')
WHERE slug = 'samnols-travels-lotus-gardens' AND description_enriched_at IS NULL;

-- Samrand Panel Beaters (researched)
UPDATE businesses
SET description = 'Samrand Panel Beaters is an auto body repair shop specialising in dent, scratch and hail damage repairs, panel replacement and spray painting, with an in-house paint-matching facility and mobile paintless dent removal, and works with insurers including Miway, M-Sure and Wesbank Fleet.',
    description_enriched_at = datetime('now')
WHERE slug = 'samrand-panel-beaters-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

-- Samrand Plumber Inc (researched)
UPDATE businesses
SET description = 'Samrand Plumber Inc is an emergency plumbing service handling burst geyser repairs, blocked drains, leak detection, and bathroom, kitchen and solar geyser work across Samrand, Centurion and Pretoria East.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'samrand-plumber-inc-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

-- Samuel Pauw Inc (researched; original URL redirects to a Core Group company profile page, added as a new source)
UPDATE businesses
SET description = 'Samuel Pauw Inc is a chartered accounting firm offering accounting, tax and audit services, established in 1998 and serving small and medium enterprises including closed corporations, trusts, non-profits and professional practices.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pauws.co.za/", "https://www.coregroup.digital/all-core-companies/samuel-pauw-inc"]'
WHERE slug = 'samuel-pauw-inc-murrayfield' AND description_enriched_at IS NULL;

-- Sana Properties (researched)
UPDATE businesses
SET description = 'Sana Properties is a property development and real estate services company offering property development, facility management, property sales and rentals, and manages office parks including Hazeldean Office Park, Route 21 Corporate Park and Glenwood Office Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'sana-properties-hazeldean' AND description_enriched_at IS NULL;

-- SandblastZA (Mobile Sandblasting Wet & Dry) (researched)
UPDATE businesses
SET description = 'SandblastZA (Mobile Sandblasting Wet & Dry) provides mobile wet and dry sandblasting for surface preparation, rust removal and coating prep, and also hires out sandblasting pots, compressors, hoses and nozzles on daily, weekly or monthly rates.',
    description_enriched_at = datetime('now')
WHERE slug = 'sandblastza-mobile-sandblasting-wet-dry-derdepoort-smallholdings' AND description_enriched_at IS NULL;

-- Sandown Commercial Vehicles Centurion (researched)
UPDATE businesses
SET description = 'Sandown Commercial Vehicles Centurion is a commercial vehicle dealership selling new and used Mercedes-Benz and FUSO trucks, buses and vans, and provides after-sales support including genuine parts, service contracts, fleet telematics and driver training.',
    description_enriched_at = datetime('now')
WHERE slug = 'sandown-commercial-vehicles-centurion-rooihuiskraal' AND description_enriched_at IS NULL;

-- Sankofa Specialist Caterers (reworded: no website, scraped Google Places listing only)
UPDATE businesses
SET description = 'Sankofa Specialist Caterers is a catering business in Murrayfield, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sankofa-specialist-caterers-murrayfield' AND description_enriched_at IS NULL;

-- Sanlam - Pretoria (reworded: source URL redirects to a dead/404 page, no content found)
UPDATE businesses
SET description = 'Sanlam - Pretoria is a financial and investment services provider in Willow Park Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sanlam-pretoria-willow-park-manor' AND description_enriched_at IS NULL;

-- Sans souci Towing (researched)
UPDATE businesses
SET description = 'Sans souci Towing offers light, medium and heavy-duty towing and vehicle recovery, specialised transport and goods-in-transit support, operating a 24/7 control room with branches across Gauteng and Limpopo including Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'sans-souci-towing-rooiwal' AND description_enriched_at IS NULL;

-- Santa's Warehouse Pretoria (researched)
UPDATE businesses
SET description = 'Santa''s Warehouse Pretoria is a year-round Christmas store selling ornaments, lighting, artificial trees, tree decor, wreaths and garlands, and festive apparel, established in 2000 and expanded into a full warehouse by 2014.',
    description_enriched_at = datetime('now')
WHERE slug = 'santa-s-warehouse-pretoria-shere' AND description_enriched_at IS NULL;

-- Santam (researched; general company product lines, no branch-specific facts used)
UPDATE businesses
SET description = 'Santam is a short-term insurance provider offering personal insurance (motor, home, travel), business insurance, specialised risk cover and agricultural insurance.',
    description_enriched_at = datetime('now')
WHERE slug = 'santam-die-hoewes' AND description_enriched_at IS NULL;

-- Santie Snyman Begrafnisdienste (reworded: no website, scraped Google Places listing only)
UPDATE businesses
SET description = 'Santie Snyman Begrafnisdienste is a funeral service provider in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'santie-snyman-begrafnisdienste-rietfontein' AND description_enriched_at IS NULL;

-- Sapcor (Pty) Ltd (researched; address on the firm's site matches this listing)
UPDATE businesses
SET description = 'Sapcor (Pty) Ltd is an independent insurance brokerage offering insurance solutions from a range of providers to individuals and businesses, trading since 1992.',
    description_enriched_at = datetime('now')
WHERE slug = 'sapcor-pty-ltd-constantia-park' AND description_enriched_at IS NULL;

-- Sapience Communications (researched)
UPDATE businesses
SET description = 'Sapience Communications is a communication and research company offering reputation management, research and drafting, and tailored legal-communication services, drawing on expertise across political, social, economic and legal fields.',
    description_enriched_at = datetime('now')
WHERE slug = 'sapience-communications-amandasig' AND description_enriched_at IS NULL;

-- Sapphire Industrial Supplier (researched)
UPDATE businesses
SET description = 'Sapphire Industrial Supplier distributes transformer raw materials and accessories, sealing products, valves, hoses and couplings to the energy and industrial sectors across South Africa and the wider SADC region, established in 2008.',
    description_enriched_at = datetime('now')
WHERE slug = 'sapphire-industrial-supplier-villieria' AND description_enriched_at IS NULL;

-- Sardius Business Services (Pty) Ltd (reworded: business's own domain refused connection)
UPDATE businesses
SET description = 'Sardius Business Services (Pty) Ltd is a business and management consulting firm in Salieshoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sardius-business-services-pty-ltd-salieshoek' AND description_enriched_at IS NULL;

-- Sarel Venter Custom Knives (researched)
UPDATE businesses
SET description = 'Sarel Venter Custom Knives specialises in knife sharpening, repairs and custom knife manufacturing for hunting, fishing, cooking and crafting, also offering scissor and kitchen-knife sharpening and knife-making courses.',
    description_enriched_at = datetime('now')
WHERE slug = 'sarel-venter-custom-knives-eloffsdal' AND description_enriched_at IS NULL;

-- Saskey (PTY) ltd (reworded: no website, scraped Google Places listing only)
UPDATE businesses
SET description = 'Saskey (PTY) ltd is a business and management consulting firm in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'saskey-pty-ltd-rietfontein' AND description_enriched_at IS NULL;

-- Sasol fuel stations (reworded: corporate sasol.co.za/sasol.com site is generic, no per-branch facts;
-- Sasol Quagga Road's own domain now redirects to an unrelated, unaffiliated site)
UPDATE businesses
SET description = 'Sasol Amkor Road is a fuel station and garage in Lyttelton, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-amkor-road-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Dastek is a fuel station and garage in Monument Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-dastek-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Derdepoort is a fuel station and garage in Derdepoort Smallholdings.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-derdepoort-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Dorandia is a fuel station and garage in Dorandia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-dorandia-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol K8 North is a fuel station and garage in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-k8-north-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol K8 South is a fuel station and garage in Rooiwal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-k8-south-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Kgabotse is a fuel station and garage in Wolmer, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-kgabotse-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol La Montagne Motors is a fuel station and garage in La Montagne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-la-montagne-motors-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Lyttelton Manor is a fuel station and garage in Lyttelton, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-lyttelton-manor-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Midridge is a fuel station and garage in Midstream Ridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-midridge-midstream-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Ninapark is a fuel station and garage in Ninapark.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-ninapark-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Quagga Road is a fuel station and garage in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-quagga-road-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Stormvoel is a fuel station and garage in Kilner Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sasol-stormvoel-kilner-park' AND description_enriched_at IS NULL;

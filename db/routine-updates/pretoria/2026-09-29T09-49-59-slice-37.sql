-- Slice 37 description-enrichment batch (job 4)
-- 50 businesses, "Urban Cultivation" .. "VMT Mining Services (Pty) Ltd"

UPDATE businesses
SET description = 'Urban Cultivation is a hydroponics and indoor-farming specialist in The Willows, supplying grow tents, lighting and climate-control equipment, nutrients and complete growing systems, and serving as an authorised distributor for brands including TrolMaster, Gardena and CANNA.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-cultivation-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Focus Communications is a business consulting firm operating from Kameelfontein in the Leeuwfontein area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-focus-communications-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Mzansi is an online marketplace based in Olievenhoutbosch that connects South African local brands and independent entrepreneurs with shoppers, offering fashion, footwear, accessories, beauty products and handmade goods with nationwide delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-mzansi-pty-ltd-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Pride Town Planning and Architecture is a Centurion-based firm offering town planning, land surveying, architecture, rezoning and subdivision, and environmental and geotechnical services to public, government and private developers.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-pride-town-planning-and-architecture-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Property Group is a Wonderboom-based estate agency handling residential, commercial, industrial and land sales and rentals across Pretoria and other South African regions, with tools such as a bond calculator and property alerts.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-property-group-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Roast Eldoraigne is a grill restaurant in Eldoraigne Village Shopping Centre serving 21-day matured steaks, signature smash burgers, grilled chicken and seafood alongside salads and a kids menu.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-roast-eldoraigne-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Skips is a Kameeldrift-based skip-bin rental service, operating since 2009, providing 4 and 6 cubic-metre skips for construction rubble, garden refuse and renovation debris with disposal at registered landfill sites.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-14:00'
WHERE slug = 'urban-skips-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urbanite Holdings is an industrial supplier and manufacturing business based in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'urbanite-holdings-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UrgMed Medical Couriers is a courier and logistics business based in Rietfontein, Pretoria, specialising in medical courier transport.',
    description_enriched_at = datetime('now')
WHERE slug = 'urgmed-medical-couriers-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urithi Technologies is an Eldoraigne-based technology company specialising in the bulk delivery, installation and support of ICT products and services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.urithitech.co.za/", "https://urithitech.co.za/"]'
WHERE slug = 'urithi-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Usave is a discount supermarket serving the Pretorius Park area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'usave-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Used Plant Africa is a building and construction supplier based in Kameeldrift, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'used-plant-africa-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Utility Africa Gauteng is a solar and renewable-energy supplier based in Dorandia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'utility-africa-gauteng-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Utsuri Sushi is a Japanese fusion sushi business in Club Gables Shopping Centre, Annlin, offering sushi orders, catering and in-house or off-site sushi-making classes.',
    description_enriched_at = datetime('now')
WHERE slug = 'utsuri-sushi-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uv Green is a solar and renewable-energy business based in Valhalla, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'uv-green-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uvirco Technologies is a Pretoria-based industrial supplier specialising in corona/ultraviolet discharge-detection equipment for the power industry, including handheld and UAV-mounted CoroCAM cameras, and has supplied the market since 1992.',
    description_enriched_at = datetime('now')
WHERE slug = 'uvirco-technologies-pty-ltd-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uysie de Klerk Eiendomme is a Waterkloof-based estate agency specialising in property sales and rentals across Pretoria''s eastern and south-eastern suburbs, active in the area for around 25 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.uysiedeklerk.co.za/", "https://www.udkproperties.co.za/"]'
WHERE slug = 'uysie-de-klerk-eiendomme-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uzuri Tech Solutions is a Centurion-based software development company that designs and manufactures bespoke technology platforms, including an interactive food-ordering touchscreen kiosk for fast-food outlets.',
    description_enriched_at = datetime('now')
WHERE slug = 'uzuri-tech-solutions-copperleaf-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'V Cor Group is a Raslouw-based business consulting group offering an integrated range of services through its divisions, spanning security and cleaning, HR consulting, branded promotional products, workplace safety risk management and SME accounting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'v-cor-group-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'V4 Creative is an Erasmuskloof-based web design and digital marketing agency building custom WordPress websites, e-commerce stores and online marketing solutions, including hosting, SEO and brand design.',
    description_enriched_at = datetime('now')
WHERE slug = 'v4-creative-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'V4 Marketing is a full-service marketing and branding agency in Pierre van Ryneveld Park offering marketing strategy, logo and visual-identity design, website development, and content and social-media management.',
    description_enriched_at = datetime('now')
WHERE slug = 'v4-marketing-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VADER Industries is a Boardwalk Manor-based software development company providing managed IT services, cybersecurity and cloud solutions under a cyber-resilient, cloud-first approach.',
    description_enriched_at = datetime('now')
WHERE slug = 'vader-industries-pty-ltd-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valhalla General Dealers is an independent hardware and building-materials store in Valhalla stocking tools, cement, bricks, tiles, paint, plumbing and electrical supplies, with glass-cutting, key-cutting and gas-bottle refill services, and is a member of the Essential Hardware buying group.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00, Fri 07:30-17:30, Sat 07:30-13:00, Sun 08:00-12:00'
WHERE slug = 'valhalla-general-dealers-pty-ltd-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Huyssteens is a Brummeria-based commercial law firm with 30 years of experience, focusing on tax law and commercial legal work.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-huyssteens-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vanrail is a Hennopspark-based engineering manufacturer and supplier serving the rolling-stock industry, producing engineering products exclusively for train and rail-vehicle manufacturing.',
    description_enriched_at = datetime('now')
WHERE slug = 'vanrail-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vantage Internet Projects is a software development business based in Kilner Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vantage-internet-projects-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VBKOM is a mining and geological consulting engineering firm based in Clubview, Centurion, offering mineral-resource estimation, exploration, financial modelling and project support to the mining sector across Africa, Australia and Canada, with a focus on commodities such as diamonds, platinum-group metals and coal.',
    description_enriched_at = datetime('now')
WHERE slug = 'vbkom-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VD5 Properties is a Moregloed-based estate agency handling residential, commercial, retail and agricultural property sales and rentals, registered with the Property Practitioners Regulatory Authority.',
    description_enriched_at = datetime('now')
WHERE slug = 'vd5-properties-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VDH Attorneys Incorporated is an Alphen Park-based law firm specialising in debt-review law under the National Credit Act, representing debt counsellors nationwide and handling court referrals, having processed more than 77,000 debt-review cases since 2009.',
    description_enriched_at = datetime('now')
WHERE slug = 'vdh-attorneys-incorporated-gauteng-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VDM Tax and Legal Consultants is an accounting firm based in Val de Grace, Pretoria, offering tax and legal consulting services.',
    description_enriched_at = datetime('now')
WHERE slug = 'vdm-tax-and-legal-consultants-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VDT Attorneys Inc is a Pretoria law firm established in 1932, offering litigation and dispute resolution, property and conveyancing, commercial law, and estates and fiduciary services from its Waterkloof Ridge offices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30'
WHERE slug = 'vdt-attorneys-inc-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VDW Accountants is a Queenswood-based accounting firm offering monthly bookkeeping, SARS tax administration, payroll, CIPC secretarial services and financial management for small and medium enterprises, led by a SAIPA-accredited accountant with over 10 years of experience.',
    description_enriched_at = datetime('now')
WHERE slug = 'vdw-accountants-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VDW Quantity Surveyors is a Pretoria-based quantity-surveying and construction cost-consultancy firm established in 2007, serving clients from The Willows Fintech Campus.',
    description_enriched_at = datetime('now')
WHERE slug = 'vdw-quantity-surveyors-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VEA Road Maintenance and Civils is a Centurion-based road maintenance and civil-construction company carrying out road repair, earthworks and rehabilitation projects for clients including SANRAL and the Gauteng Department of Roads and Transport.',
    description_enriched_at = datetime('now')
WHERE slug = 'vea-road-maintenance-and-civils-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vector CNC is a Zwavelpoort-based supplier of CNC machines, spindles, motors and precision cutting tools, offering custom machine builds, installation, training and technical support from an appointment-based showroom.',
    description_enriched_at = datetime('now')
WHERE slug = 'vector-cnc-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venture Otto SA is a Boardwalk Meander-based engineering and surveying firm forming part of the Venture Global group, a multinational industrial manufacturer active in automotive systems, prefabricated construction and tool design with facilities in South Africa and abroad.',
    description_enriched_at = datetime('now')
WHERE slug = 'venture-otto-sa-pty-ltd-boardwalk-meander' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VFV Attorneys is an Ashley Gardens law firm established in 1979 with five partners, handling corporate and commercial law, family law, litigation, conveyancing, insolvency and cross-border transactions, and offering boardroom facilities for hire.',
    description_enriched_at = datetime('now')
WHERE slug = 'vfv-attorneys-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VGI Consulting is a Highveld-based multidisciplinary engineering firm specialising in engineering, procurement and construction management for petrochemical, civil and structural projects, drawing on more than 50 years of industry experience.',
    description_enriched_at = datetime('now')
WHERE slug = 'vgi-consulting-inc-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VILAMA Business and Tax Consulting is a Centurion-based consulting firm established in 2012, offering management consulting, HR and human-capital solutions, business-process and ICT services, and tax and accounting advisory to SMEs, finance-sector clients and government.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00'
WHERE slug = 'vilama-business-and-tax-consulting-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VINCI TRADING is a Doringkloof-based agricultural commodities trading company buying and selling grains, oilseeds, pulses and sugar, and providing market analysis, hedging and risk-management services alongside milling and agricultural logistics.',
    description_enriched_at = datetime('now')
WHERE slug = 'vinci-trading-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VIP Consulting Engineers is a Shere-based civil and structural engineering consultancy with more than 48 years of experience, offering construction management, environmental impact assessment, urban planning and low-cost housing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'vip-consulting-engineers-pty-ltd-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VISA LIMITED is a travel agency based in Little Manhattan Village, Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'visa-limited-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Visto Mouldings is a Jan Niemand Park-based manufacturer and supplier of skirting boards, architraves, cornices, laminate and vinyl flooring, decking and wall cladding, offering factory-direct pricing and installation across Gauteng.',
    description_enriched_at = datetime('now')
WHERE slug = 'visto-mouldings-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VITZ Travel and Tours is a Brooklands Lifestyle Estate-based tour and transfer company offering guided excursions to destinations such as Soweto, the Cradle of Humankind and the Apartheid Museum, plus airport transfers and Mercedes-Benz vehicle rentals.',
    description_enriched_at = datetime('now')
WHERE slug = 'vitz-travel-tours-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VLANS WATER is an industrial supplier based in Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'vlans-water-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VLC Consult Group is a business consulting firm based in Queenswood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vlc-consult-group-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VM AUTOMOTIVE STATE OF THE ART is a motor spares supplier based in Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vm-automotive-state-of-the-art-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VMK Managed Solution is a Weavind Park-based ICT infrastructure company providing network design and installation, cybersecurity, structured cabling, helpdesk support and equipment sourcing, with more than 10 years of experience serving government and enterprise clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'vmk-managed-solution-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VMMP Financials is a financial and investment services business based in Theresapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'vmmp-financials-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VMT Mining Services is an industrial supplier and manufacturing business based in Brooklands Lifestyle Estate, Centurion, serving the mining sector.',
    description_enriched_at = datetime('now')
WHERE slug = 'vmt-mining-services-pty-ltd-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

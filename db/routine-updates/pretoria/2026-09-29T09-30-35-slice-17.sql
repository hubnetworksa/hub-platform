-- Description enrichment sweep (job 4) -- slice 17 of 50 parallel agents
-- Solar/renewable-energy and general businesses (solar-wizard-pretoria-bronberrik .. space-technology-television-kloofsig)

UPDATE businesses
SET description = 'Solar Wizard - Pretoria is a solar and renewable energy installer serving Bronberrik and the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-wizard-pretoria-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar and Electrical DIY supplies solar and electrical equipment for do-it-yourself installations in Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-and-electrical-diy-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar by GLM is a solar energy installer based in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-by-glm-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar nite is a solar energy provider serving Amberfield Ridge and the surrounding Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-nite-amberfield-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar troopers is a solar power installer serving the Boardwalk Meander area of Olympus, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-troopers-boardwalk-meander' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar4You has designed and installed residential and commercial solar power systems, including panels, inverters, batteries and solar geysers, since 2008, and holds a patent on its own solar geyser design.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-14:00'
WHERE slug = 'solar4you-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SolarAfrica Energy provides commercial and industrial energy solutions including financed on-site solar and battery installations, electricity wheeling and trading, and gas-to-power systems, working with businesses across agriculture, manufacturing and retail to cut costs and improve energy security.',
    description_enriched_at = datetime('now')
WHERE slug = 'solarafrica-energy-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SolarGo Electrical designs and installs bespoke solar and electrical systems across Southern Africa, ranging from residential backup power to industrial installations exceeding 600kW, working with inverter brands including Huawei, Victron and Goodwe.',
    description_enriched_at = datetime('now')
WHERE slug = 'solargo-electrical-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solarch Consulting is an AI and digital transformation consultancy based in Irene, Centurion, helping businesses plan and implement artificial intelligence strategy.',
    description_enriched_at = datetime('now')
WHERE slug = 'solarch-consulting-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solaristic installs residential and commercial solar panel systems and is registered with the Sapvia PV Green Card scheme, positioning solar power as a way to cut electricity costs and boost property value.',
    description_enriched_at = datetime('now')
WHERE slug = 'solaristic-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solarite South Africa has manufactured solar mast mounting structures for residential and commercial installations since 2005, also supplying components for broader solar power projects.',
    description_enriched_at = datetime('now')
WHERE slug = 'solarite-south-africa-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solem Solar designs and installs bespoke solar systems for loadshedding backup and everyday use, including Sun Fuel, a solar-powered EV home charging system, backed by 10-year installation warranties.',
    description_enriched_at = datetime('now')
WHERE slug = 'solem-solar-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soliad (Pty) Ltd, established in 2014, is a civil engineering and construction firm offering roadworks, stormwater management, earthworks, bulk civil services and plant hire across the Centurion area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00'
WHERE slug = 'soliad-pty-ltd-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solidhope Tech is an ICASA-licensed internet service provider offering fibre, fixed LTE, VoIP and web hosting packages for homes and businesses in Pretoria and Centurion, with month-to-month contracts and no long-term commitment.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.solidhopetech.co.za/", "https://solidhope.co.za/"]'
WHERE slug = 'solidhope-tech-pty-ltd-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solidworks. is an authorised SOLIDWORKS software reseller in Centurion, providing 3D CAD, simulation and design software along with professional training courses for engineering and manufacturing teams.',
    description_enriched_at = datetime('now')
WHERE slug = 'solidworks-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solidworx Engineering has manufactured aluminium components since 2008, offering high-pressure and gravity die casting, plastic injection moulding, tool and die making, precision CNC machining and powder coating as a one-stop manufacturing shop.',
    description_enriched_at = datetime('now')
WHERE slug = 'solidworx-engineering-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solistic is a marketing and advertising agency based in Geolina, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solistic-geolina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solmix is a building and construction company based in Bryntirion, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solmix-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solo Pro Contractors (PTY) LTD is a family-owned electrical and solar installation company operating since 2003, accredited by the Electrical Contractors Association and offering solar systems ranging from 5kW to 50kW alongside general electrical and construction work.',
    description_enriched_at = datetime('now')
WHERE slug = 'solo-pro-contractors-pty-ltd-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solutions Tree is a business consulting firm serving clients in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'solutions-tree-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solvendi is a firm of practising attorneys specialising in insolvency law, offering sequestration, liquidation, bankruptcy and credit rehabilitation services with 20 years of experience in the field.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'solvendi-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solvesure Consulting is a solar energy consultancy based in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'solvesure-consulting-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solvetech Electronics CC is an electronics and appliance business based in Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solvetech-electronics-cc-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Somakhawula Language consultancy provides translation, editing, proofreading and interpreting services in South Africa''s official languages, plus sign language, alongside branding, web design and copywriting services.',
    description_enriched_at = datetime('now')
WHERE slug = 'somakhawula-language-consultancy-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Somalogic Laser Clinic offers laser hair, vein and skin treatments alongside medical aesthetic services such as Botox, dermal fillers, microneedling and chemical peels for women, men and teenagers.',
    description_enriched_at = datetime('now')
WHERE slug = 'somalogic-laser-clinic-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonfin Pty Ltd has structured green power and solar energy solutions for agricultural and commercial clients for more than 15 years, working with manufacturers including SMA, Canadian Solar and REC.',
    description_enriched_at = datetime('now')
WHERE slug = 'sonfin-pty-ltd-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonja Smith Elite Funeral Group, Midstream Franchise is a funeral services provider serving the Midstream Estate area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sonja-smith-elite-funeral-group-midstream-franchise-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonjinga Digital Boss is a marketing and advertising business based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sonjinga-digital-boss-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sooper Italian Restaurant is an Italian restaurant in Watermeyer Park Shopping Centre, Val-De-Grace, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sooper-italian-restaurant-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sophisticated Personnel is an industrial supplies and manufacturing business based in Amandasig, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'sophisticated-personnel-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Salon Groenkloof, in Groenkloof Plaza, offers facials, skincare treatments, eyebrow threading, massages and makeup services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'sorbet-salon-groenkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Salon Irene Village, in Irene Village Mall, offers manicures, pedicures, massages, threading, tinting, waxing, facials, gel nails and brow and lash treatments.',
    description_enriched_at = datetime('now')
WHERE slug = 'sorbet-salon-irene-village-mall-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sotech engineering is an electronics and appliances business based in Heatherview, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'sotech-engineering-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SoundsFurni is an engineering and surveying business based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'soundsfurni-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SourceNet Consulting is a software development consultancy based in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sourcenet-consulting-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SourcePrinting supplies signage, branding displays and printing machines, including sublimation, DTF and large-format printers, along with printing supplies and equipment training, serving customers locally and across Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:00, Sat 08:30-12:30, Sun Closed'
WHERE slug = 'sourceprinting-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sourcebranding Digital Agency offers website design and development, SEO, branding, social media management and custom software development for businesses across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'sourcebranding-digital-agency-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sourcing Options (Pty) Limited is a business consulting firm based in Wierdapark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sourcing-options-pty-limited-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Africa Electronic Seven star wholesalers is an industrial supplies and manufacturing wholesaler based in Eldoraigne, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-africa-electronic-seven-star-wholesalers-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South African Business Minds is a building and construction business based in Bryntirion, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-african-business-minds-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The South African Mint Company, a subsidiary of the South African Reserve Bank, designs and produces numismatic collector coins, bullion products and circulation currency, including its high-relief African Range series.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-african-mint-company-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South African National Blood Service is a healthcare facility based in Brooklyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-african-national-blood-service-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South African Small Business Association is a business consulting organisation based in Bergtuin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-african-small-business-association-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Zambezi Engineering Services (Pty) Ltd is a multidisciplinary engineering and construction consultancy offering civil, structural, electrical and mechanical engineering, project management and town planning services across Southern Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-zambezi-engineering-services-pty-ltd-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southdowns Shopping Centre - Centre Management provides commercial property and office space management services in Southdowns, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'southdowns-shopping-centre-centre-management-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southpole Freight and Logistics handles sea and air cargo clearing and forwarding, road transport and distribution, and customs consultancy for import and export shipments across Southern Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'southpole-freight-and-logistics-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sowe Business Trading (Pty) Ltd is a financial and investment services business based in Sinoville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sowe-business-trading-pty-ltd-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Space Designers Company is an engineering and surveying business based in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'space-designers-company-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Space Frame Solutions is a hardware supplier based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'space-frame-solutions-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Space Technology/Television, formerly known as Space Television, has operated for more than 30 years as a wholesale distributor of audio-visual, electrical, security, satellite and fibre networking equipment across Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'space-technology-television-kloofsig' AND description_enriched_at IS NULL;

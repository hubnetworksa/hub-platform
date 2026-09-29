-- Job 4: description enrichment sweep, slice 02
-- Guarded by description_enriched_at IS NULL so each UPDATE only ever applies once.

UPDATE businesses
SET description = 'Renda Business Consultants is a growth-focused consultancy that helps business owners in the Pretoria area improve their operations through business process optimisation and one-on-one coaching, aiming to lift efficiency and profitability.',
    description_enriched_at = datetime('now')
WHERE slug = 'renda-business-consultants-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Renew Recyclers is a waste and recycling-focused cleaning services business operating in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'renew-recyclers-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Renewonline provides an online and in-store vehicle licence disc renewal service, letting customers renew their car licence through the Renewonline website or at partnered retail outlets such as Spar, Pick n Pay and PostNet locations across Gauteng, with renewed discs delivered to their door.',
    description_enriched_at = datetime('now')
WHERE slug = 'renewonline-pty-ltd-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reniers Electrical and Solar Solutions is a Bergtuin-based electrical and solar contractor offering solar system and inverter installations, upgrades and fault-finding, general electrical repairs, and Certificate of Compliance inspections for property sales.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'reniers-electrical-and-solar-solutions-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Renovation and Demolition Home Services (trading as TNTE Renovations) provides home renovation solutions for both corporate and individual clients in the Equestria area, drawing on a network of experienced, skilled tradespeople for each project.',
    description_enriched_at = datetime('now')
WHERE slug = 'renovation-and-demolition-home-services-pty-ltd-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rent Me Self Storage operates a custom-built self-storage facility in Montana/Doornpoort offering four unit sizes on flexible month-to-month leases with no deposit required, plus 24-hour armed-response security and access control for registered clients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'rent-me-self-storage-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pretoria East rental agency handles tenant placement and rental management for landlords in areas including Garsfontein, Moreletapark and Faerie Glen, covering tenant screening, lease preparation, property marketing and rent collection support to help landlords avoid vacancies and problem tenants.',
    description_enriched_at = datetime('now')
WHERE slug = 'rental-agent-pretoria-east-francois-kretsman-re-max-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rental Pro''s is a property rental and management agency based in Lyttelton, Centurion, assisting landlords and tenants with residential and commercial rental properties in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rental-pro-s-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rento Cars Pty Ltd is a car dealership in Les Marais, Pretoria, offering vehicles for sale to buyers in the central Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rento-cars-pty-ltd-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RenuSec (Pty) Ltd is a renewable-energy and security solutions provider operating from a warehouse in Rietfontein, Rayton, offering solar installations alongside security system services for the wider Pretoria area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat-Sun Closed'
WHERE slug = 'renusec-pty-ltd-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Republic Knitwear (Pty) Ltd is a knitwear manufacturer based in Laudium, Centurion, supplying textile products to the surrounding industrial and retail market.',
    description_enriched_at = datetime('now')
WHERE slug = 'republic-knitwear-pty-ltd-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Resmoke Services (Pty) Ltd offers service, repair and diagnostics for household appliances such as microwaves, dishwashers, washing machines, tumble dryers and ovens, along with car, motorcycle and select electronics repairs, from its base in Valhalla, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'resmoke-services-pty-ltd-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Responsum is a business consulting firm based in Eldoraigne, Centurion, providing advisory services to businesses in the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'responsum-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Restec (Pty) Ltd is a software development company operating from The Reeds, Centurion, serving businesses across the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'restec-pty-ltd-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Results Techniques & Associates CC is a business consulting firm based in Monument Park, Pretoria, offering advisory services to businesses in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'results-techniques-associates-cc-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Resyn Biosciences, based at the CSIR campus in Brummeria, develops and supplies MagReSyn magnetic microparticle products used in mass spectrometry and proteomics research, along with custom microparticle development services, distributed to laboratories worldwide.',
    description_enriched_at = datetime('now')
WHERE slug = 'resyn-biosciences-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retail Development Solutions is a Doringkloof-based retail consultancy helping brands navigate strategy management, key account and category management, sales and merchandising planning, and retailer capability development.',
    description_enriched_at = datetime('now')
WHERE slug = 'retail-development-solutions-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retail Edge Analytix Consultancy is a business consulting firm operating from Highveld Techno Park in The Reeds, Centurion, offering advisory services focused on the retail sector.',
    description_enriched_at = datetime('now')
WHERE slug = 'retail-edge-analytix-consultancy-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retail Solutions supplies and services electronic scales and weighing equipment for butcheries, bakeries, delis and supermarkets, also offering till rolls, self-adhesive labels and point-of-sale integration software from its Pretoria West base.',
    description_enriched_at = datetime('now')
WHERE slug = 'retail-solutions-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retail Star supplies trained merchandising and replenishment staff to retail stores, handling shelf management, stock replenishment and customer assistance, plus free retail-operations audits, from its base in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'retail-star-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retro Cafe & Motel offers accommodation on a plot in Zeekoegat, Kameeldrift East, on the outskirts of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'retro-cafe-motel-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retro Rabbit is a design-first digital consultancy that builds custom software, UX/UI design and digital products, including its Smartboxx AI offering, with clients spanning South Africa''s major banking and insurance groups.',
    description_enriched_at = datetime('now')
WHERE slug = 'retro-rabbit-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retro Rabbit Ruins is part of the Retro Rabbit digital consultancy, which designs and builds custom software, UX/UI design and digital products for clients including several of South Africa''s major banks and insurers.',
    description_enriched_at = datetime('now')
WHERE slug = 'retro-rabbit-ruins-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reuben''s Auto Services is a BMW and Mercedes-Benz specialist workshop in Pierre van Ryneveld, Centurion, offering vehicle diagnostics, engine repairs, and brake, clutch and suspension work backed by over 35 years of experience.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'reuben-s-auto-services-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Revamp Arena is a business consulting service based in Thatchfield, Olievenhoutbosch, Centurion, offering advisory support to businesses in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'revamp-arena-business-consulting-services-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Revamp Project Management Company provides project management services for building and construction work in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'revamp-project-management-company-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reverse Osmosis System supplies water filtration and treatment equipment from Lyttelton, Centurion, serving customers across the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'reverse-osmosis-system-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ReviewIT Training Institute is a software development-focused training provider based in Amberfield City, Centurion, serving students and businesses in the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'reviewit-training-institute-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Revival Projects is a commercial property services business based in Kilner Park, Pretoria, serving clients in the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'revival-projects-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ReviveX International is a marketing and advertising agency based in Rietfontein, Pretoria, serving businesses across the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'revivex-international-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Revo Hobbies is a hobby and toy store located in the Magalieskruin Shopping Centre, Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'revo-hobbies-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rex Diff and Gearbox Pretoria (RDG) is an automotive repair specialist based at Montana Boulevard Lifestyle Centre in Magalieskruin, Pretoria, serving vehicle owners in the northern Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rex-diff-and-gearbox-pretoria-rdg-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rhapsody''s Sunnyside is a restaurant located in Sunnypark Shopping Centre, Sunnyside, offering dining for shoppers and visitors in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rhapsody-s-sunnyside-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rheo Systems (Pty) Ltd is an engineering and surveying firm based in Eldoraigne, Centurion, serving clients across the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rheo-systems-pty-ltd-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rherhandzo Contruction And Projects (Pty) Ltd is a building and construction company based in Proclamation Hill, Pretoria, serving the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rherhandzo-contruction-and-projects-pty-ltd-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rhoda (Pty) Ltd is a printing services provider based in Rietfontein, Pretoria, serving businesses and individuals in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rhoda-pty-ltd-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rhodium Precision Manufacturing is a precision manufacturing business based in Irene Farm Villages, Pretoria, supplying manufactured components to industrial customers in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'rhodium-precision-manufacturing-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riaan Eksteen Accountants provides accounting and financial services to individuals and businesses from Montana Park, Bergtuin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'riaan-eksteen-accountants-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riakona Electrical Solutions and Projects is an electrical contractor based in Eldorette, Pretoria, providing electrical installation and project services to the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'riakona-electrical-solutions-and-projects-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riaphela General Services CC is a business consulting and general services provider based in Silverton, Pretoria, serving businesses in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'riaphela-general-services-cc-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ricairo Accounting and Business Advisory offers accounting and business advisory services to clients in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ricairo-accounting-and-business-advisory-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RichRand Infinite Solutions is an IT services company based in Doornpoort, Pretoria, supporting businesses and individuals in the area with computer and technology services.',
    description_enriched_at = datetime('now')
WHERE slug = 'richrand-infinite-solutions-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richard Seerane and Associates is a law firm operating from Corporate 66 Office Park in Die Hoewes, Centurion, providing legal services to clients in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'richard-seerane-and-associates-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richester Distribution Centre is a logistics and distribution operation based in Sunderland Ridge, Centurion, serving customers across the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'richester-distribution-centre-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richester Foods is a food retail business based in Sunderland Ridge, Centurion, serving customers in the greater Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'richester-foods-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richfield College is an education and training institute with a campus on Helen Joseph Street in Pretoria Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'richfield-college-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richflex (Pty) Ltd is an industrial supplier and manufacturer operating from Icon Industrial Park in Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'richflex-pty-ltd-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richman Poorman Jewellers is a jewellery store based in Monument Park, Pretoria, serving customers in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'richman-poorman-jewellers-monument-park-shopping-centre-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richter Engineering is an engineering and surveying firm serving The Orchards and the surrounding northern Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'richter-engineering-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richter Sand CC supplies building sand and related construction materials from Farm Kleinklipkop in Boekenhoutskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'richter-sand-cc-boekenhoutskloof' AND description_enriched_at IS NULL;

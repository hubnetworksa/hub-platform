-- Description enrichment sweep (job 4) — slice 50
-- Generated 2026-09-29T10-00-02Z

UPDATE businesses
SET description = 'Sequerra Business Systems is a software development company based in the Pegasus Building at Menlyn Maine, Waterkloof Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sequerra-business-systems-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'setsolar Pretoria assembles, imports, distributes and installs solar power equipment, including solar panels, charge controllers, inverters, batteries, cabling, connectors and mounting structures, serving the Hermanstad area of Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.ecohubmap.com/company/business/setsolar-pretoria/83q4m1e0rl1xyegiq", "https://solarkx.com/solar-listing/setsolar-pretoria/"]'
WHERE slug = 'setsolar-pretoria-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sharpe Projects is a building and construction business operating in Valhalla, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sharpe-projects-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simplex Holdings Group is a multi-disciplinary consulting firm offering simplified professional services across labour law, insurance claims, immigration, fraud and risk management, and general legal consulting, based in Eldoraigne, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'simplex-holdings-group-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SMM24 is a marketing and advertising business based in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smm24-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'smoupm Windows is a software development business based in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smoupm-windows-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SparklyFresh Cleaners & Laundry offers cleaning and laundry services in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparklyfresh-cleaners-laundry-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This business is a stationery supplier, wholesaler and distributor of items such as staplers and pens, operating in Laudium, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stationery-products-stapler-pen-office-stationery-supplier-wholesaler-distributo-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taxichoice is a specialised intermediary in South Africa''s minibus taxi industry, connecting financial institutions, taxi associations and operators to verify membership, assess route profitability and facilitate compliant vehicle finance; it also runs a Taxi Rescue recovery service and the Zola Taxi Sales dealership, based in Ashlea Gardens, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://taxichoice.co.za/about/"]'
WHERE slug = 'taxichoice-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thankfully Investment is a business consulting firm operating in The Orchards, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'thankfully-investment-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The South African Creative Industries Incubator is a turnkey creative hub in Eersterust, Pretoria, offering technical skills training, business incubation, production facilities and networking support for creative-industry entrepreneurs and SMMEs, alongside sister sites in Johannesburg and Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-south-african-creative-industries-incubator-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'thisismarketing is a software development business based in Faerie Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'thisismarketing-this-is-marketing-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'threeframes is a boutique consulting firm using an analyse-design-implement methodology to help government and corporate clients with modernisation, strategy, defence, programme and project management, enterprise architecture and business process re-engineering, based in Eco Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'threeframes-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transmatta Logistics is a logistics and transport company based in Wolmer, Pretoria, incorporated in 2018 as part of the Valmak Asset Management group.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.transmatta.com/", "https://b2bhint.com/en/company/za/transmatta--K2018585003"]'
WHERE slug = 'transmatta-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tunnage is a freight logistics company in Kosmosdal, Centurion, whose own site positions it around "redefining the future of freight."',
    description_enriched_at = datetime('now')
WHERE slug = 'tunnage-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Turkish Table is a strictly halal Turkish restaurant in Hatfield, Pretoria, serving traditional kebabs, wraps and dips from open-flame grills, along with original Baklava and Kunefe, all made on the premises.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-20:30',
    source_urls = '["https://www.openstreetmap.org/node/9028385601", "https://www.eatout.co.za/venue/turkish-table/"]'
WHERE slug = 'turkish-table-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'v.Services is a software development company operating from Southdowns Office Park in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'v-services-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'vIP IT is a computer and IT services provider based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vip-it-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'van Aswegen Attorney is a law firm in Pretoria North specialising in magistrate and high court litigation, family law and divorce, civil litigation, debt collection, insolvencies, commercial contracts, and wills and deceased estate administration.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://lvaa.co.za/"]'
WHERE slug = 'van-aswegen-attorney-pretoria-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Heerden & Associates Attorneys is a Pretoria law firm based in Wonderboom, handling Road Accident Fund claims, property law and conveyancing, tax law, family law, corporate and commercial law, and correspondent services for other firms.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-heerden-associates-attorneys-pretoria-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Varsity Lodge (Lynnwood Varsity Lodge) is secure student accommodation in Brooklyn, Pretoria, about 250m from the University of Pretoria, offering 92 units of five, six or seven bedrooms sharing a lounge, dining room and kitchen, with basement parking, on-site laundry and wireless internet.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/9026458082", "https://www.graduates24.com/jobs/viewjob/541"]'
WHERE slug = 'varsity-lodge-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'viZin Group (trading as IT Network) is an IT-sector recruitment and staffing firm in Wierda Park, Centurion, with more than two decades in talent management, offering contractor management, payroll, work permit, tax advisory, relocation and CV-support services through its TechStar Hub.',
    description_enriched_at = datetime('now')
WHERE slug = 'vizin-group-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'vici mobile is a software development business operating from Castle Walk Corporate Park in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vici-mobile-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'vida e caffe Hazeldean Square is a branch of Africa''s largest privately owned speciality coffee franchise, serving espresso-based drinks, smoothies, juices, and breakfast, lunch and snack items with vegetarian, vegan, Halal and dairy-free options, at Hazeldean Square in Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'vida-e-caff-hazeldean-square-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'vida e caffe Southdowns is a branch of Africa''s largest privately owned speciality coffee franchise, serving espresso-based drinks, smoothies, juices, and breakfast, lunch and snack items with vegetarian, vegan, Halal and dairy-free options, at Southdowns Centre in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'vida-e-caff-southdowns-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'vinDIT is a local business directory and advertising platform based in Kameelfontein, Pretoria, helping regional businesses gain visibility through categorised online listings and a premium featured-listing partnership model.',
    description_enriched_at = datetime('now')
WHERE slug = 'vindit-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'visasecurity, trading as Elite Force, is a PSIRA-registered guarding and security services company based in Highveld Techno Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'visasecurity-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vision Steps is a marketing and advertising business based in Sunnyside, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vision-steps-salvokop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'weDesiign is a one-team design and digital consulting agency in Irene, Centurion, offering website design, brand identity, software development, mobile apps, photography and brand marketing under a single roof, with a research-first process and transparent published pricing; established in 2020, it has completed roughly 1,000 projects for clients across South Africa and increasingly the UK.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00 (office visits by appointment)'
WHERE slug = 'wedesiign-pty-ltd-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'whattagrafix provides sandblasting services for houses and businesses in Erasmia, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing-category/sandblasting-service/"]'
WHERE slug = 'whattagrafix-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'wkinc (WK Attorneys) is a law firm in Doornpoort, Pretoria, covering ante-nuptial contracts and matrimonial law, labour law and CCMA representation, wills and estate administration, divorce, contract drafting, corporate services, debt collection and rent interdicts, and conveyancing.',
    description_enriched_at = datetime('now')
WHERE slug = 'wkinc-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'xpansion is a software development business based in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'xpansion-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'z is a computer and IT services business based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'z-daspoort' AND description_enriched_at IS NULL;

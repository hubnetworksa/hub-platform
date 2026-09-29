-- Slice 46 description enrichment (job 4)
-- 50 businesses, woolworths-lynnwood-bridge-lynnwood-manor .. xaro-erasmuskloof

UPDATE businesses
SET description = 'Woolworths'' supermarket branch inside Lynnwood Bridge Shopping Centre in Lynnwood Manor, stocking the retailer''s food, grocery and household range for the surrounding neighbourhood.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-lynnwood-bridge-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths'' clothing and lifestyle store inside Eastwood Village Shopping Centre in Arcadia, part of the retailer''s fashion and homeware range.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-arcadia-eastwood-village-arcadia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Woolworths clothing store on Atterbury Road in Menlyn, offering the retailer''s fashion, footwear and accessories range.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-atterbury-road-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Woolworths store at Atlyn Shopping Centre in Atteridgeville, trading seven days a week and stocking the retailer''s clothing, food and homeware range for the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'woolworths-atteridgeville-atteridgeville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths'' supermarket at Castle Walk Shopping Centre in Erasmuskloof, offering the retailer''s food, grocery and household range to the surrounding area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00',
    source_urls = '["https://za.africabz.com/gauteng/woolworths-5828", "https://za.polomap.com/pretoria/62500", "https://my-catalogue.co.za/stores/pretoria/woolworths/castle-walk-shopping-centre"]'
WHERE slug = 'woolworths-castle-walk-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket inside IL Posto Shopping Centre in Nina Park, Ninapark, offering the retailer''s grocery and fresh food range to the neighbourhood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:30-18:00, Sun 09:00-17:00',
    source_urls = '["https://www.woolworths.co.za/?utm_source=google&utm_medium=gmb&utm_campaign=gmb&utm_id=gmb", "https://my-catalogue.co.za/stores/ninapark/woolworths/shop-12-il-posto-shopping-centre-cnr-rachel-de-beer-rd-grafenheim-rd"]'
WHERE slug = 'woolworths-food-nina-park-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket near the corner of Soutpansberg Road and Webb Road in Queenswood, stocking the retailer''s grocery and fresh food range.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-food-queenswood-centre-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Sinoville Corner, on the corner of Braam Pretorius and Vinko Streets in Sinoville, serving the surrounding neighbourhood with groceries and fresh food.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:30-18:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-food-sinoville-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Thatchfield Retail Centre on Brakfontein Road, Thatchfield, offering the retailer''s grocery and fresh food range to Centurion shoppers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-food-thatchfield-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Woolworths clothing store at Centurion Park, between Gordon Hood Avenue and Crawford Road, offering the retailer''s fashion and accessories range.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/1434454690", "https://my-catalogue.co.za/stores/centurion/woolworths/shop1-centurion-park-btwn-gordon-hood-crawford-rd"]'
WHERE slug = 'woolworths-gordon-hood-avenue-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Woolworths store at Grey Owl Village on Brakfontein Road, Centurion, part of the retailer''s general merchandise range for the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-grey-owl-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Hazeldean Shopping Centre on Silverlakes Road, offering the retailer''s grocery and fresh food range to the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-hazeldean-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths'' clothing store at Irene Link, on the corner of Alexandra Road and Impala Street in Doringkloof, Centurion, offering the retailer''s fashion range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-15:00'
WHERE slug = 'woolworths-irene-link-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths'' clothing store at Irene Village Mall, on the corner of Nellmapius Drive and Pierre van Ryneveld Avenue in Irene, Centurion, offering the retailer''s fashion range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-irene-village-mall-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths'' distribution centre on Olievenhoutbosch Road in Louwlardia, an 80,000m2 facility completed in 2006 that houses off-site stockrooms for clothing, home, groceries, perishables and returnable crates, and runs a grid-tied solar PV system covering part of its power needs.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.woolworths.co.za/", "https://www.globalroofs.co.za/post/woolworths-70-000m2-distribution-centre-completed", "https://www.solareff.co.za/projects/woolworths-distribution-centre/"]'
WHERE slug = 'woolworths-midrand-distribution-centre-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Olympus Village Mall in Olympus, offering the retailer''s grocery and fresh food range to the surrounding area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-olympus-village-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths'' clothing store at Jean Crossing, on the corner of Jean Avenue and Rabie Street in Hennopspark, Centurion, offering the retailer''s fashion range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00',
    source_urls = '["https://www.openstreetmap.org/node/5374499717", "https://my-catalogue.co.za/stores/centurion/woolworths/cnr-jean-avenue-rabie-street"]'
WHERE slug = 'woolworths-rabie-street-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Ruth First Mall in Soshanguve Crossing, offering the retailer''s grocery and fresh food range to the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 08:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'woolworths-soshanguve-crossing-soshanguve' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Sunnypark Shopping Centre in Sunnyside, offering the retailer''s grocery and fresh food range to the surrounding neighbourhood.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-sunnypark-trevenna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Watermeyer Park Shopping Centre on Cussonia Road, Val de Grace, offering the retailer''s grocery and fresh food range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-watermeyer-park-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths'' clothing store at Wonderpark Shopping Centre on Heinrich Avenue in Karenpark, offering the retailer''s fashion range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00',
    source_urls = '["https://www.woolworths.co.za/?utm_source=google&utm_medium=organic&utm_content=wonderpark&utm_campaign=places", "https://my-catalogue.co.za/stores/pretoria/woolworths/wonder-park-centre-340-heinrich-ave-karen-park-ext-9"]'
WHERE slug = 'woolworths-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food''s supermarket at Zambezi Junction Shopping Centre in Montana Park, offering the retailer''s grocery and fresh food range to the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-zambezi-junction-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An industrial manufacturing supplier based on Florauna Road, Florauna, with 25 years'' experience producing components such as steam boilers, gear couplings and drives, conveyor chains and belts, marine bearings and industrial shafts.',
    description_enriched_at = datetime('now')
WHERE slug = 'wordpress-website-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A small business consultancy operating from Irene, Centurion, offering project and consulting support to local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'wordy-projects-consulting-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A recruitment and HR services provider based in Wonderpark, Akasia, connecting local employers with job seekers.',
    description_enriched_at = datetime('now')
WHERE slug = 'work-dignity-sa-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Workforce Staffing''s Rosslyn branch, part of a national staffing group offering fully managed labour and recruitment solutions across manufacturing, logistics, hospitality and other sectors, plus payroll, HR and industrial-relations outsourcing.',
    description_enriched_at = datetime('now')
WHERE slug = 'workforce-staffing-rosslyn-pretoria-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Workshop@LPM Trading is a car service and repair workshop in Raslouw, Centurion, servicing all vehicle makes and models with air-conditioning work, auto electrical repairs, battery sales, clutch work, computerised diagnostics, wheel alignment and balancing, diesel particulate filter service and tow-bar fitment, plus 24/7 emergency call-outs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-15:30, Sat-Sun Closed'
WHERE slug = 'workshop-lpm-trading-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'World Link Consulting is a SAP partner offering SAP ERP implementation and configuration, SAP Fiori and SAPUI5 mobile app development, RISE with SAP and S/4HANA Cloud migrations, and SAP Analytics Cloud reporting, serving government, mining, retail and oil & gas clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'world-link-consulting-midstream-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Worldwatch Trading trades as Constructive Audio Visual from Woodhill Golf Estate, supplying audio-visual equipment and services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "http://www.cav2.co.za/contact.html"]'
WHERE slug = 'worldwatch-trading-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Worldwide Automotive Group is the distributor and franchisor behind the Goldwagen Group, an automotive replacement-parts network founded in 1992 that supplies original-equivalent parts for brands including Audi, BMW, Ford, Toyota and VW through around 100 franchised outlets, operating from its distribution warehouse in Louwlardia, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.goldwagen.com/", "https://za.africabz.com/gauteng/worldwide-automotive-group-70750"]'
WHERE slug = 'worldwide-automotive-group-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A computer and IT services provider operating from Green Street, Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wovelna-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wrap Your Brand is a Kilner Park creative studio offering vehicle branding and wraps, indoor and outdoor signage and banners, promotional products and branded merchandise, corporate identity design, and digital marketing services including websites and social media.',
    description_enriched_at = datetime('now')
WHERE slug = 'wrap-your-brand-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wrapsa is a pharmaceutical contract manufacturer established in 1983, one of the first third-party pharmaceutical manufacturing and packing operators in South Africa, offering manufacturing, packaging and laboratory services including consignment raw-material handling, medicine registration assistance and validation support.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun Closed'
WHERE slug = 'wrapsa-pty-ltd-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wrapsa Packaging & Manufacturing, at the corner of Bell and Edison Crescent in Hennopspark, is part of the Wrapsa pharmaceutical contract manufacturing business, providing blister packaging, liquid-fill packaging, carton manufacturing, custom design and labelling and printing services for pharmaceutical clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.wrapsa.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=104151"]'
WHERE slug = 'wrapsa-packaging-manufacturing-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WYSA Engineering specialises in CNC machining and manufacturing, producing high-tolerance precision components with final inspection using SANAS-calibrated measuring equipment, from its Highway Business Park premises in Rooihuiskraal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'wysa-engineering-services-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wurth South Africa''s dedicated branch shop in Silverton, on Dykor Street, serving trade and industrial customers with its own shop staff and contact lines.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://eshop.wurth.co.za/en/GB/ZAR/", "https://www.wurth.co.za/en/wuerth_za/shop_locations/branches_3712.php"]'
WHERE slug = 'w-rth-south-africa-silverton-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A marketing and advertising business operating from La Montagne, Pretoria, offering lead-generation services to local clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'x-factor-lead-generation-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A computer and IT services provider based in Wonderboom South, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'x-stream-computers-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development business operating from Alphen Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'x4-solutions-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A computer and IT services provider based in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'xannops-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'XContent Business Solutions is a Microsoft cloud partner founded in 2009, offering cloud deployment, migration, support and management, AI-enhanced Azure and Microsoft 365 dashboards, digital identity tools, a CRM product and master product data management, from its Highveld, Centurion office.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://xcontent.com/", "https://za.linkedin.com/company/xcontent-software-solutions-pty-ltd"]'
WHERE slug = 'xcontent-business-solutions-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'XPest Pest Control Services has operated across Gauteng since 1986, specialising in the eradication of ant, cockroach, rat and termite infestations from residential, commercial and industrial premises, and offering STERIFOG microbial disinfection fogging and wood-destroying-insect clearance certificates.',
    description_enriched_at = datetime('now')
WHERE slug = 'xpest-pest-control-services-pty-ltd-head-office-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'XS Health is a South African health and wellness company that manufactures and sells supplement brands including Slimz (metabolic support), Noolit (cognitive support), Relevoderm (skin care), ProBio (probiotics) and VitaleMen/VitaleFemme (gender-specific wellness ranges).',
    description_enriched_at = datetime('now')
WHERE slug = 'xs-health-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'XS Sure is an authorised financial services provider (FSP 21101) offering short-term insurance add-on products such as excess and deductible waivers, tyre, windscreen and rim cover, geyser and power-surge protection, and credit-shortfall cover, designed to supplement existing policies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:30'
WHERE slug = 'xs-sure-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business consultancy operating from Elardus Park in the Rietvalleirand area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'xte-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development business based in Midstream Estate, Olifantsfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'xvz-interactive-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'XXXL Coatings has operated as a metal coatings company in Hermanstad, Pretoria since its incorporation in 2006, serving the minerals and metals manufacturing industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.africabizinfo.com/ZA/xxxl-coatings-pty-ltd-012-377-2600"]'
WHERE slug = 'xxxl-coatings-pty-ltd-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xakwa Holdings is an African mining company managing mining operations and a mineral portfolio across multiple commodities, running exploration projects and supporting community development through the Xakwa Foundation, from its Park Lane West office in Waterkloof Glen.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'xakwa-holdings-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xana''s Hyper Furnishers is a furniture retailer on Paul Kruger Street stocking appliances, bedding, furniture, and TV and audio equipment.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/8140933438", "https://www.facebook.com/xanashyperfurnishers/"]'
WHERE slug = 'xana-s-hyper-furnishers-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xaro is a CETA-accredited mining training provider delivering programmes in Dangerous Goods handling, Working at Heights, forklift and crane operation, lifting equipment, First Aid, environmental awareness, hazmat handling and rigging, serving the mining industry nationwide from Erasmuskloof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00'
WHERE slug = 'xaro-erasmuskloof' AND description_enriched_at IS NULL;

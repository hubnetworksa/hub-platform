-- Slice 48 description enrichment (job 4)
-- 50 businesses, alphabetical "your-dot-com" through "zurisure-business-consulting-training"

UPDATE businesses
SET description = 'Your dot com is a software development company based in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'your-dot-com-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ysterman Safety and Security CC specialises in custom steel manufacturing and security products, including security gates, sandblasting and powder coating, for residential, commercial and industrial properties in Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'ysterman-safety-and-security-cc-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yuri Property is a residential estate agency focused on Pretoria East, offering property sales, rentals, landlord services and free valuations across suburbs including Woodhill, Faerie Glen and Garsfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'yuri-property-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yusra Tours is a travel agency specialising in Hajj and Umrah pilgrimage packages to Saudi Arabia, alongside leisure travel packages to destinations across Africa, Asia, the Middle East and Europe.',
    description_enriched_at = datetime('now')
WHERE slug = 'yusra-tours-head-office-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yzel Trustees is a legal services firm based in Parktown Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yzel-trustees-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZA Wit provides HR, labour relations and skills development services, including SETA-accredited training and compliance support for organisations in the public and private sectors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00'
WHERE slug = 'za-wit-pty-ltd-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZARON Business Solutions designs technology platforms spanning GIS and earth observation, AI-driven automation, drone data capture and digital twins for organisations including SMMEs, government and NGOs.',
    description_enriched_at = datetime('now')
WHERE slug = 'zaron-business-solutions-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZATER manufactures custom-branded still and sparkling water bottles, offering in-house label design and fast turnaround delivery, with a focus on sustainable bottle collection and recycling.',
    description_enriched_at = datetime('now')
WHERE slug = 'zater-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZERO Q Project''s is a computer and IT services business based in Bergtuin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zero-q-project-s-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZF Lemforder South Africa''s Rosslyn axle division has supplied axle sets to BMW Group South Africa for the 3 Series since 1998, and marked production of its one millionth axle set.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.zf.com/", "https://metalworkingnews.info/zf-lemforder-south-africa-celebrates-the-production-of-its-one-millionth-axle-set/"]'
WHERE slug = 'zf-lemf-rder-south-africa-pty-ltd-axle-division-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZGS Security Services provides alarm installations, CCTV monitoring, armed reaction and gate automation from a 24-hour control room, serving homes, schools, churches and businesses across Pretoria''s northern suburbs.',
    description_enriched_at = datetime('now')
WHERE slug = 'zgs-security-services-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZINITHX (Pty) Ltd develops cloud-based, SARS-compliant invoicing and accounting software for South African freelancers, small businesses and accounting practices.',
    description_enriched_at = datetime('now')
WHERE slug = 'zinithx-pty-ltd-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZKTeco South Africa distributes biometric and card-based access control systems, turnstiles, time and attendance solutions, and vehicle entry equipment such as license plate recognition and boom gates.',
    description_enriched_at = datetime('now')
WHERE slug = 'zkteco-south-africa-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZOEY manufactures and sells locally-made furniture and homeware online, including headboards and pedestals across several in-house collections, with courier delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'zoey-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZRC Consulting is a business consulting firm based in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zrc-consulting-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZaPOP is a shopper marketing company providing in-store static and digital media campaigns for brands and retailers, working with over 2,000 stores and 500 FMCG brands across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'zapop-montana-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Za-Eng Consulting is a multidisciplinary engineering and architecture firm offering civil, structural, electrical and mechanical engineering, project management and quantity surveying, holding ISO9001 and CIDB accreditation.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00'
WHERE slug = 'zaeng-consulting-and-construction-engineers-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zale the shop is a computer and IT services business based in Moregloed, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zale-the-shop-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zaleeka Event Management provides event planning services in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'zaleeka-event-management-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zam Cloud Solutions is a software development business based in Southdowns, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'zam-cloud-solutions-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zambesi Glass & Aluminium is a family-run business operating since 1997, supplying custom shower doors, glazing and aluminium doors, frames and shop fronts for homes, offices and warehouses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://www.zambesiglass.co.za/", "https://www.findmy.co.za/services/business/zambesi-glass-aluminium/102217"]'
WHERE slug = 'zambesi-glass-aluminium-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zambesi Wash Bay is a state-of-the-art truck and tanker cleaning facility in north Pretoria near the N1, serving the transport industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'zambesi-wash-bay-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zambesi bolt and nut is a hardware store based in Kameeldrift, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zambesi-bolt-and-nut-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zambezi (Montana) Midas is a Midas-branded motor spares outlet at Montana Piazza, stocking service parts, engine components, tools, electrical supplies and fluids for vehicle repairs.',
    description_enriched_at = datetime('now')
WHERE slug = 'zambezi-montana-midas-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZanZou Bar & Lounge is an upscale nightlife venue in Hatfield offering cocktails, shisha, live music and DJ sets, plus event and birthday hosting.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Sun 20:00-03:30',
    source_urls = '["https://www.waze.com/live-map/directions/za/gp/pretoria/zanzou-bar-and-lounge?to=place.ChIJJ7LXMuNhlR4RmX31I1KleOU", "https://www.cybo.com/ZA-biz/zanzou-bar-lounge", "https://zanzou.co.za/", "https://evendo.com/locations/south-africa/pretoria/hatfield/nightclub/zanzou-bar-lounge"]'
WHERE slug = 'zanzou-bar-lounge-hatfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zanshin Karate Dojo Les Marais is an SA JKA-affiliated karate school offering classes for all ages and skill levels, with beginner through advanced groupings taught by a qualified sensei.',
    description_enriched_at = datetime('now'),
    hours = 'Tue, Thu 17:45-19:45',
    source_urls = '["scraped:google-places-no-website", "https://www.zanshinsajkakarate.com/les-marais"]'
WHERE slug = 'zanshin-karate-dojo-les-marais-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zap zone electrical services is an electrician based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zap-zone-electrical-services-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zappas Restaurant is a family restaurant in Murrayfield serving traditional comfort food since 1987, known for its Eisbein, Mozambican chicken and beef trinchado.',
    description_enriched_at = datetime('now')
WHERE slug = 'zappas-restaurant-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zasm Industrial Park is a financial and investment services provider in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zasm-industrial-park-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zed One Construction and Mining specialises in building and civil works, offering design-and-build construction services in Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/Z1Construction"]'
WHERE slug = 'zed-one-construction-and-mining-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zee Accounting provides outsourced accounting, tax and company services, helping clients save time and reduce costs on their bookkeeping.',
    description_enriched_at = datetime('now')
WHERE slug = 'zee-accounting-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zeesprop is an estate agency based in Raslouw, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zeesprop-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zela-Tech Centurion designs, manufactures and distributes wireless alarm systems and electronic security products for homes and businesses, including Cellsecure, Kwe-Beams and DTS Security lines, with professional installation and after-sales support.',
    description_enriched_at = datetime('now')
WHERE slug = 'zela-tech-centurion-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zela-Tech Zambesi CC has supplied electronic security equipment since 1999, specialising in gate automation, wireless alarms, CCTV and outdoor detection systems including the Kwebeams range.',
    description_enriched_at = datetime('now')
WHERE slug = 'zela-tech-zambesi-cc-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zen Accountants offers bookkeeping, tax and SARS compliance, payroll and business advisory services on fixed monthly retainers, using cloud accounting platforms such as QuickBooks and Xero.',
    description_enriched_at = datetime('now')
WHERE slug = 'zen-accountants-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zenith Global Consultant (Pty) Ltd is a printing services business based in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'zenith-global-consultant-pty-ltd-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zero Plus Printers offers litho and digital printing up to A3, wide format printing, embroidery and branded promotional products, with pre-press design and finishing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'zero-plus-printers-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zest for Life Teambuilding and Events provides team building and events services in Queenswood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zest-for-life-teambuilding-and-events-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zetty Electrical Wholesale stocks over 12,500 electrical lines for trade professionals, spanning power distribution, control, wiring, automation and motor control products, with nationwide courier delivery and Centurion pickup.',
    description_enriched_at = datetime('now')
WHERE slug = 'zetty-electrical-wholesale-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zeus Industrial Plastics (Pty) Ltd manufactures plastic products and operates in plastics recycling from its Rosslyn premises.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.ccbc.co.za/citionline/chambers/forums/rosslyn-business-forum/1616-zeus-industrial-plastics-pty-ltd"]'
WHERE slug = 'zeus-industrial-plastics-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zeyn Solutions is a business consulting firm based in Erasmia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zeyn-s-olutions-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zimele Technologies provides enterprise software implementation including SAP ERP, custom application development, ICT governance consulting and IT training for public and private sector clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'zimele-technologies-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZinZoTech is a software development business based in Theresapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'zinzotech-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zippy Press has provided branding and printing services since 2002, including custom labels, calendars, signage, corporate clothing and corporate gifting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-13:30, Sat-Sun Closed'
WHERE slug = 'zippy-press-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zire Fresh Produce Distribution Centre is an agri-services platform that helps producers stage, pack and prepare fresh produce for retail customers, bridging the gap between farm and retailer.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.linkedin.com/posts/zandr%C3%A9-k%C3%B6hne-718004103_site-vist-to-zire-fresh-produce-distribution-activity-7129904193863073792-GEvg"]'
WHERE slug = 'zire-fresh-produce-distribution-centre-pretoria-roseville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ziyana Group is a 100% Black-owned, majority women-owned professional services provider offering HR, talent recruitment, project management and digital skills training across Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["http://www.ziyanagroup.com/", "https://ziyanagroup.com/about-us/"]'
WHERE slug = 'ziyana-group-pty-ltd-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Chemicals has manufactured chemical products for the industrial cleaning and sanitation industries since 1997, supplying disinfectants, degreasers and eco-friendly cleaners to healthcare, hospitality, food and mining sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'zone-chemicals-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zorbas Supermarket is a supermarket and grocery store based in Wolmer, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zorbas-supermarket-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zozazi Digital Marketing Services provides marketing and advertising services based in Eldo Lakes Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'zozazi-digital-marketing-services-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zurisure Business Consulting & Training is a business consulting firm based in Boekenhoutskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'zurisure-business-consulting-training-boekenhoutskloof' AND description_enriched_at IS NULL;

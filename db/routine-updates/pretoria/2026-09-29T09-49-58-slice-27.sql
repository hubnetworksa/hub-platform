-- Description enrichment sweep (job 4) -- slice 27 of 50 parallel agents
-- Researched: 35, Reworded: 15, Hours found: 7

UPDATE businesses
SET description = 'Teqco is an IT consultancy in Doornpoort offering South African-based cloud hosting with data-sovereignty guarantees, backend and end-user IT support for SMEs and government agencies, custom IoT hardware and software development, and specialist IT project management.',
    description_enriched_at = datetime('now')
WHERE slug = 'teqco-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Teraoka SA supplies and services electronic scales, automated weighing systems, wrapping and labelling equipment, thermal printers and inspection systems from its Montana Park branch, serving both retail supermarkets and food manufacturers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.teraoka.co.za/", "https://www.teraoka.co.za/branch/pretoria/"]'
WHERE slug = 'teraoka-sa-pretoria-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Terotechnica Asset Management College is an accredited training institution in Montana Park specialising in maintenance engineering and physical asset management, offering diplomas, short courses and QCTO-approved occupational certificates, with accreditation from ASIC, CHIETA, FASSET and SAQA.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://terotechnica.com/", "https://www.skillsportal.co.za/train/training_providers/view/terotechnica-asset-management-college"]'
WHERE slug = 'terotechnica-asset-management-college-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Terravua is a Garsfontein-based engineering firm specialising in geotextile dewatering tubes, sludge and wastewater dewatering, coastal erosion protection and engineered civil infrastructure solutions for municipal, mining, industrial and agricultural clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'terravua-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tersus GNSS South Africa supplies high-precision GNSS RTK positioning equipment out of Rooihuiskraal North, including OEM boards, smart antennas and mapping controllers used in surveying, precision agriculture, drones and autonomous-vehicle applications.',
    description_enriched_at = datetime('now')
WHERE slug = 'tersus-gnss-south-africa-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tesk & Amandla Pumps manufactures and supplies submersible borehole pumps, motors, controllers and vertical turbine and axial flow pump systems from its Koedoespoort warehouse, and exhibited its pump range at Electra Mining Africa 2024.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://teskpump.co.za/", "https://electramining.co.za/tesk-sa-pty-ltd-and-amandla-pumps-manufacturing-pty-ltd-to-showcase-cutting-edge-solutions-at-electra-mining-africa-2024/"]'
WHERE slug = 'tesk-amandla-pumps-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tevo Factory Outlet in Kosmosdal sells the Tevo brand''s outdoor, backup power, electronics, toys, health and beauty, and household product ranges, including the Bennett Read line, with nationwide delivery and an extended warranty programme.',
    description_enriched_at = datetime('now')
WHERE slug = 'tevo-factory-outlet-midrand-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tevo Warehouse is a furniture and homeware outlet based in Samrand Business Park, Kosmosdal, trading Monday to Friday.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.tevo.co.za/", "https://www.africabizinfo.com/ZA/tevo-warehouse-012-740-5000"]'
WHERE slug = 'tevo-warehouse-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Texan is an industrial supplier and manufacturer based in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'texan-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Texican Willows is a Mexican eatery and tequila bar at Willows Crossing Shopping Centre serving burgers, grills, tacos and enchiladas in a homely bar setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-21:00, Sun 11:00-20:00'
WHERE slug = 'texican-willows-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ThaKgo Facility Solutions provides cleaning, facility maintenance, security, and grounds and property management services to commercial clients from its Karenpark base.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'thakgo-facility-solutions-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thabang Printers offers garment and t-shirt printing, banners, signage, stickers and vinyl decals, books, certificates, invitations and photo enlargements alongside graphic design services.',
    description_enriched_at = datetime('now')
WHERE slug = 'thabang-printers-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thabi Consulting is a 100% black-owned audit and advisory firm in Heuweloord offering internal and statutory audit support, bookkeeping, fraud-prevention training and IT audit services, with staff holding CA(SA), CFE, CIA and CISA certifications.',
    description_enriched_at = datetime('now')
WHERE slug = 'thabi-consulting-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thabo''s Gardening Services provides lawn mowing, garden design, small tree felling, gutter cleaning and general garden maintenance for residents in and around Brooklands Lifestyle Estate, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/p/Thabos-Gardening-Services-100064193227261/"]'
WHERE slug = 'thabo-s-gardening-services-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thai Summit Autoparts Industry South Africa, a subsidiary of Thailand''s Thai Summit Group, manufactures body-in-white components, chassis, body systems, welded assemblies and deep-draw stampings for Ford Motor South Africa from its facility in The Willows, having begun operations in 2019.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://naacam.org.za/member/thai-summit-autoparts-industry-south-africa-pty-ltd/"]'
WHERE slug = 'thai-summit-autoparts-industry-south-africa-ltd-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thakale IT Solutions (Pty) Ltd is a software development company based in Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'thakale-it-solutions-pty-ltd-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thakha Holdings is a software development company based in Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'thakha-holdings-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thaliwe''s is a Level 1 BBBEE, 100% black woman-owned skills-development company in Theresapark, registered with the CIPC in January 2009, providing accredited training, entrepreneurship assistance, internships and learnerships across the services, agriculture and mining sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'thaliwe-s-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thaluyami Consulting is a financial and investment services firm based in The Orchards, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'thaluyami-consulting-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'That Couch Place Zambezi Warehouse manufactures corner, division, sleeper and U-shape couches, beds and mattresses built for durability and comfort, with a hospitality-focused range aimed at hotels and guesthouses, from its Zambezi Mall showroom in Derdepoort.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'that-couch-place-zambezi-warehouse-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thatchfield Residential Estate.rentals operates alongside the Thatchfield Estates homeowners association in The Reeds, Centurion, which manages a group of gated residential estates with round-the-clock access control and security.',
    description_enriched_at = datetime('now')
WHERE slug = 'thatchfield-residential-estate-rentals-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thato Laundry Services is a cleaning and laundry business based in Kirkney Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'thato-laundry-services-kirkney' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ThatoM Projects is a business consulting firm based in Chantelle, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'thatom-projects-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The 13th Check Business Services provides outsourced payroll and HR administration -- including payslips, leave management, statutory submissions, IRP5/IT3 certificates and COIDA reporting -- alongside HR services such as employment equity planning and policy development, from offices in Centurion and Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-13th-check-business-services-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The ASI Group (Pty) Ltd is an insurance business based in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-asi-group-pty-ltd-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Accountants offers outsourced CFO services, bookkeeping, financial statement preparation, CIPC company-secretarial work, payroll processing and tax services for entrepreneurs and small to medium businesses in Grootfontein Country Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-accountants-grootfontein-country-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Admin Bistro is a business consulting service based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-admin-bistro-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The At Company is a branding and marketing agency in Montana Park offering corporate and brand identity design, interior decorating, events, marketing materials and gifts, digital marketing and corporate workwear.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-at-company-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Baron Kyalami is a branch of The Baron restaurant group, trading since 1993, serving its menu of grills alongside date-night, platter and office menus from Kyalami Corner Shopping Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-baron-kyalami-midrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Base (Base Excellence Technologies) is an IT services provider based in Lyttelton Manor, Centurion, offering service management, technology architecture, infrastructure support, in-house training and IT outsourcing across on-premises, cloud and private-cloud environments.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-base-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Beauty Connexion is a beauty salon in Heritage Hill offering facials, acne facials, chemical peels and makeup services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:30, Sat-Sun Closed'
WHERE slug = 'the-beauty-connexion-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Bed Shop is a furniture and homeware retailer at Menlyn Retail Park, Menlyn.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-bed-shop-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Biltong Corner is an industrial supplier based in Ninapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-biltong-corner-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Biltong House trades from Checkers Kosmosdal in Centurion, selling beef biltong, beef droewors, chilli and plain stix, kudu biltong, game wors and bacon biltong.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/TheBiltongHouse/"]'
WHERE slug = 'the-biltong-house-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Biltong Shop is a butchery inside The Square at Midstream, Midstream Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-biltong-shop-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Blank Canvas Print & Design offers a wide range of printing services, from signage and business cards to books, files, flyers, posters, canvas prints, letterheads, notepads, foiling and laser cutting.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-blank-canvas-print-design-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Blue Crane Restaurant and Bar sits next to the Austin Roberts Bird Sanctuary in Nieuw Muckleneuk, with a Boma area for functions and bonfire evenings, and has recently been renovated under new ownership.',
    description_enriched_at = datetime('now')
WHERE slug = 'blue-crane-restaurant-and-bar-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This listing offers short-term furnished accommodation within The Blyde Riverwalk Estate in Willow Park, a lifestyle development built around a crystal-clear lagoon with a restaurant, gym, spa and 24-hour security.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wa.me/qr/SDYIXBIXHY3VL1", "https://balwin.co.za/developments/the-blyde"]'
WHERE slug = 'the-blyde-lagoon-tranquil-estate-namahlangu-sbo-blyde-riverwalk-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Box Pro supplies corrugated moving boxes, custom moving kits, bubble wrap and tape in single- and double-wall cardboard options for households and businesses relocating in and around Hennopspark.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-box-pro-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Boyz Travel Merchants is a full-service leisure and corporate travel agency in Midstream Estate booking flights, accommodation and holiday packages, from beach and bush breaks to cruises, tours and romantic getaways.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-boyz-travel-merchants-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The BrewHub is a pet-friendly coffee lounge on Lynnwood Road in The Willows, serving coffee, breakfast and pastries, with free wifi and a wooden deck that doubles as a workspace for remote workers.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/the-brewhub"]'
WHERE slug = 'the-brewhub-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Bullion Group (Pty) Ltd provides precious-metal investment and asset-management services for retail and institutional investors, including vaulting and precious-metals refining and minting.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://thebulliongroup.com/"]'
WHERE slug = 'the-bullion-group-pty-ltd-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Carved Door Company is an industrial supplier and manufacturer based in Die Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-carved-door-company-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Cavaleros Group is a property investment, development and management company handling commercial, industrial, hotel and retail assets across South Africa and the United Kingdom.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-cavaleros-group-brakfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Cleaners Dry Cleaning/Laundry, based at Wapadrand Shopping Centre, specialises in residential and commercial dry cleaning and laundry services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 09:00-12:00, Sun Closed',
    source_urls = '["scraped:google-places-no-website", "https://fixfind.co.za/cleaning-services/the-cleaners-dry-cleaning-laundry/"]'
WHERE slug = 'the-cleaners-dry-cleaning-laundry-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Company Buddy handles corporate compliance and company-secretarial work from Irene -- forming new companies, submitting annual returns and Beneficial Ownership filings, and managing director changes, share capital and MOI amendments for company directors.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-company-buddy-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Cotton Canvas Company in Lyttelton manufactures stretched canvas frames for artists, including circular and half-circular canvases, and stretches loose paintings and drawings onto custom frames.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:00-16:00, Thu-Fri Closed, Sat-Sun 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://www.thecottoncanvascompany.co.za/service/"]'
WHERE slug = 'the-cotton-canvas-company-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Coupon Company is a marketing and advertising business based in Olympus, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-coupon-company-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy - Equestria is a logistics and courier branch operating from Willow Rock Value Centre, Equestria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-equestria-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Centurion Golf Estate Locker is a parcel locker point serving residents of Centurion Golf Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-centurion-golf-estate-locker-centurion-golf-estate' AND description_enriched_at IS NULL;

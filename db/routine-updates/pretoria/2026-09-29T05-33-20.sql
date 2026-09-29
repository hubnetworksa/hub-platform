UPDATE businesses
SET description = 'Bay Leaf Restaurant in Laudium is a licensed Halaal Indian eatery serving North Indian cuisine for lunch and dinner, with takeaway and vegetarian options, and is one of three Bay Leaf branches across Gauteng.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waze.com/live-map/directions/bay-leaf-restaurant-tangerine-st-259-laudium,-centurion", "https://www.eatout.co.za/venue/bay-leaf-indian-restaurant-laudium/", "https://bayleaflaudium.co.za/"]'
WHERE slug = 'bay-leaf-restaurant-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Link Hydraulics & Seals runs a fully equipped hydraulic workshop in Onderstepoort with its own pump test station, offering cylinder repair and manufacture, power pack design and repair, hydraulic hose and seal supply, and urgent breakdown call-outs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun Closed',
    source_urls = '["http://prolinkhydraulics.com/", "https://www.prolinkhydraulics.com/about-us", "https://www.facebook.com/prolinkhydraulicsandsealspretoria/"]'
WHERE slug = 'pro-link-hydraulics-seals-pretoria-onderstepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Procure Pty Ltd is an industrial supplier based in Rooiwal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-procure-pty-ltd-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Pure Water supplies bulk and bottled drinking water plus water cooler rentals from its Riviera premises, delivering to offices, factories, nurseries and restaurants in bottle sizes ranging up to 1000L drums.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-13:00',
    source_urls = '["http://propurewater.co.za/", "https://propurewater.co.za/bulk-water/", "https://www.facebook.com/ProPureWaterSA/"]'
WHERE slug = 'pro-pure-water-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Quartz manufactures engineered quartz surface products from its Zwavelpoort premises, blending around 93% natural quartz with resins and pigments to create a non-porous stone that is harder than granite or marble.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.proquartz.co.za/contactus", "https://www.sadecor.co.za/supplier/proquartz/", "https://www.stonecontact.com/products-a200367/pro-quartz-stone-tile"]'
WHERE slug = 'pro-quartz-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-IT (Your Technology Partner) provides IT support, networking, CCTV installation and cabling, and hardware troubleshooting for desktops, laptops and servers from its Annlin base.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pro-it.biz/", "https://www.snupit.co.za/pretoria/annlin/pro_it-your-technology-partner/556672"]'
WHERE slug = 'pro-it-your-technology-partner-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-Intellect Research and Consulting is a business consulting firm based in Amberfield, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-intellect-research-and-consulting-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-Line Signs & Projects produces large-format digital and dye-sublimation printing, signage, banners, stickers, vehicle branding and business cards, along with sign installation services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.prolinesigns.co.za/", "https://www.facebook.com/pline.sp/"]'
WHERE slug = 'pro-line-signs-projects-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-Master Mechanical is an automotive repair workshop in Mayville, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00'
WHERE slug = 'pro-master-mechanical-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-Namic Real Estate is a highly-rated agency handling property sales and rentals in Magalieskruin and nearby suburbs such as Montana and Doornpoort, operating from wheelchair-accessible offices on Besembiesie Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:00-19:00, Sat 08:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://pronamicproperties.co.za/", "https://www.property24.com/estate-agents/pro-namic-real-estate/10879"]'
WHERE slug = 'pro-namic-real-estate-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-Video International has operated as a film and video production company in Roseville since 1997, producing corporate training videos, school event and health-and-safety videos, live event filming, and animation and motion graphics.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.provideointernational.co.za/", "https://pretoria.co.za/place/pro-video-international"]'
WHERE slug = 'pro-video-international-roseville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-tec Panel Beaters is a panelbeating and auto body repair shop in Willow Park Manor offering dent repair, bodywork and spray-painting to restore accident-damaged vehicles.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.thinklocal.co.za/biz/pro-tec-panelbeaters-pretoria"]'
WHERE slug = 'pro-tec-panel-beaters-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProAfrica Mapping is an engineering and surveying firm based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'proafrica-mapping-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProBlast BS is a drilling and blasting services provider, founded in 2017, supplying explosives and blasting operations to surface and open-cast mines in the platinum, chrome, coal and limestone sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.problastbs.co.za/", "https://pitchbook.com/profiles/company/608110-30"]'
WHERE slug = 'problast-bs-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProCM - The Owners'' Team is a construction and project management consultancy established in 2011, providing project, construction, engineering and commercial management services with a focus on the mining and food-and-beverage sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.procm.co.za/", "https://www.youtube.com/@ProCM-Owners/shorts"]'
WHERE slug = 'procm-the-owners-team-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProDis is the professional value-added distributor of Mobotix industrial IP surveillance systems in South Africa, founded in 2013 and supplying high-resolution cameras, network storage devices and video management systems from its Waverley base.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.prodis.co.za/", "https://www.hsbd.co.za/supplier.aspx?acc=3221"]'
WHERE slug = 'prodis-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProEthics is a professional ethics consultancy in Muckleneuk founded by a criminal-law advocate who has practised since 1991, offering ethics investigations, stakeholder perception surveys and in-house ethics training for corporations, municipalities and government departments across South Africa and other African countries.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.proethics.co.za/", "https://www.proethics.co.za/about/"]'
WHERE slug = 'proethics-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProGraphix Signs & Branding has provided signage and branding services in Annlin for more than five years, producing vehicle wraps, storefront signage, banners and vinyl and canvas prints with a standard 3-5 business day turnaround.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.prographix.co.za/", "https://www.facebook.com/prographix1/"]'
WHERE slug = 'prographix-signs-branding-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProMax Construction is a building and construction contractor based in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'promax-construction-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProPoorLegal Consultants is a legal consultancy based in Woodhill Golf Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'propoorlegal-consultants-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProSeal - Waterproofing was founded in 2008 by a former co-owner of an earlier Pretoria waterproofing firm, and specializes in waterproofing and damp-proofing for roofs, walls, balconies, basements and foundations.',
    description_enriched_at = datetime('now')
WHERE slug = 'proseal-waterproofing-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProSolutions is a books and stationery supplier serving Wingate Park and the surrounding Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'prosolutions-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProTours is a coach charter and bus hire company based in Lyttelton, running a fleet that ranges from 7-seater minibuses to 60-seater Scania coaches for charters across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.protourscoaches.co.za/", "https://protourscoaches.co.za/contact-us/"]'
WHERE slug = 'protours-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProWebs Website development, based on Berg Avenue in Ninapark, specializes in WordPress website design, SEO and internet marketing to help local businesses build their online presence.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/prowebs-website-development"]'
WHERE slug = 'prowebs-website-development-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Proceed Group Africa is a computer and IT services company based in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'proceed-group-africa-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Process Plant & Engineering Services is an industrial equipment supplier and engineering services provider based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'process-plant-engineering-services-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Procon Projects and Construction is a family-run building and maintenance company with more than 30 years in the industry, offering everything from plumbing, painting, drywalling and waterproofing to steelwork, leak detection, civil work and granite countertops.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.proconprojects.co.za/", "https://www.facebook.com/proconprojectsofconstructions/"]'
WHERE slug = 'procon-projects-and-construction-pty-ltd-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Procure 2 Pay Intellection is a specialist procure-to-pay consultancy in Alphen Park, whose multidisciplinary team spans finance, supply chain and information technology to help businesses streamline procurement and payment processes.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.intellection.co.za/", "https://intellection.co.za/"]'
WHERE slug = 'procure-2-pay-intellection-pty-ltd-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Production X Sign - Print - Brand is a signage, printing and branding company serving Sinoville and the surrounding Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'production-x-sign-print-brand-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Productive Systems, based in Rooihuiskraal, designs and manufactures downstream automation systems for blow-moulding and injection-moulding production lines, and provides factory, logistics and process automation, plus robotics installation and programming, for industries such as automotive manufacturing, data centres and warehousing.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.productivesystems.co.za/", "https://www.facebook.com/ProductiveSystems1989/"]'
WHERE slug = 'productive-systems-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ProfNet Medical is a healthcare practice administrator in Die Hoewes, providing business management tools and support services to help medical practices maximise income and operational efficiency.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.profnetmedical.co.za/", "https://www.facebook.com/profnetmedical/"]'
WHERE slug = 'profnet-medical-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Profcor is an accounting and advisory firm based in The Willows Office Park, offering bookkeeping, tax consulting, payroll management and auditing services through a team of qualified chartered accountants.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.profcor.co.za/", "https://profcor.co.za/about-us/"]'
WHERE slug = 'profcor-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Profection Manufacturers, based in Silvertondale, offers welding (MIG, TIG and Arc), powder coating and other finishing processes, CNC milling, turning and 5-axis machining, laser cutting and 3D inspection, serving industries from aerospace and defence to medical and mobile container units.',
    description_enriched_at = datetime('now')
WHERE slug = 'profection-manufacturers-silvertondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Profection Switchboards Cc is an industrial manufacturer and supplier based in Bergtuin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'profection-switchboards-cc-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Profession Hub, based in Wierdapark and founded in 2009, is a one-stop recruitment and HR agency offering recruitment solutions, labour relations support, payroll services and professional CV writing.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://professionhub.co.za/", "https://www.facebook.com/Professionhub/"]'
WHERE slug = 'profession-hub-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Professional Branding & Design - Southern Africa is a marketing and branding agency based in Boardwalk Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'professional-branding-design-southern-africa-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Professional Business Support (Pty) Ltd is an accounting firm based in Val de Grace, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'professional-business-support-pty-ltd-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Professional Linen, based in Hennopspark, supplies linen to the medical profession and trade, and is the Southern African distributor for the Australian incontinence-care brand Conni.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30',
    source_urls = '["https://www.proflin.co.za/", "https://www.instagram.com/professional_linen/"]'
WHERE slug = 'professional-linen-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Professional Management Support Ops is a business consulting and management support company based in Doringkloof, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'professional-management-support-ops-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Professor Building Construction Gauteng, based in Proclamation Hill, is a construction company serving Pretoria, Centurion and Johannesburg with new-build and repair work, bricklaying and masonry, plastering, and the supply of building materials.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://professor-building-construction-gauteng.business.site/"]'
WHERE slug = 'professor-building-construction-gauteng-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A handyman service based in Tijger Valley offering general home repairs, maintenance and small building jobs to residents in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'proficient-handyman-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A bookkeeping and accounting firm serving Bergtuin, offering monthly bookkeeping, payroll and UIF submissions, tax preparation, and new company registration with CIPC for small and medium businesses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat-Sun Closed',
    source_urls = '["https://www.oliviasambobusiness.com/", "https://www.procompare.co.za/providers/profits-books-bookkeeping-services-pretoria"]'
WHERE slug = 'profits-books-bookkeeping-services-pretoria-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A project-control solutions provider in Clubview that has, since 1998, supplied engineering, procurement, construction and manufacturing companies with project cost, procurement and document-control software, later expanding into SAGE payroll and HR solutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://profoundsolutions.co.za/", "https://profoundsolutions.co.za/about/"]'
WHERE slug = 'profound-project-control-solutions-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An industrial and employee-relations consultancy in Murrayfield assisting businesses with labour disputes, disciplinary hearings and CCMA representation.',
    description_enriched_at = datetime('now')
WHERE slug = 'progressive-industrial-relations-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction services provider based in Bronberrik, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'project-solutions-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An experiential team-building and events consultancy established in 2006 in Elardus Park, running outdoor-based corporate team-building, leadership-training and business-coaching programmes.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.projectsummit.co.za/", "https://www.hotfrog.co.za/company/1099857311055872/project-summit-consulting/elardus-park-pretoria/consultants"]'
WHERE slug = 'project-summit-consulting-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A marketing and business-growth consultancy based in Equestria.',
    description_enriched_at = datetime('now')
WHERE slug = 'project-pro-grow-your-business-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A project-management consultancy operating in Centurion since 1998, providing project-management consulting, accredited training and career-development programmes to companies in the mining, engineering, infrastructure and energy sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.projectlink.co.za/", "https://projectlink.co.za/about-us/"]'
WHERE slug = 'projectlink-holdings-pty-ltd-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A project-management training and consulting firm based in Clubview, offering accredited project-management training, facilitation, project reviews and PMP-related programmes.',
    description_enriched_at = datetime('now')
WHERE slug = 'projectpro-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An automotive repair workshop based in the Hermanstad industrial area.',
    description_enriched_at = datetime('now')
WHERE slug = 'prolong-africa-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A paint manufacturer founded in 1992 on Derdepoort Road, specialising in textured paint, roof paint, decorative wall paint and bespoke woodcare, and also producing house-brand paints for several major retail chains.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-14:00',
    source_urls = '["http://www.promacpaints.co.za/", "https://www.cybo.com/ZA-biz/promac-paints"]'
WHERE slug = 'promac-paints-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A civil engineering survey practice based in Murrayfield specialising in aerial LiDAR, mobile mapping, oblique and thermal imagery, and ground-based survey services across South Africa and sub-Saharan Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.promap.co.za/", "https://za.africabz.com/gauteng/promap-civil-engineering-surveys-147051"]'
WHERE slug = 'promap-civil-engineering-surveys-pty-ltd-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A marketing and advertising design business based in Florauna.',
    description_enriched_at = datetime('now')
WHERE slug = 'promo-designs-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A promotional and marketing services business based in Zwartkop, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'promotions-company-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A cosy all-day restaurant in Greenlyn Village Centre, Menlo Park, serving breakfast through dinner with dine-in, takeaway and delivery options, outdoor seating and an on-site bar.',
    description_enriched_at = datetime('now')
WHERE slug = 'pronk-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An aluminium and glass specialist established in 2004 and based in Koedoespoort, manufacturing and installing windows, doors, shopfronts, frameless showers, mirrors and balustrades for homes and commercial developments.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pronkalu.co.za/", "https://www.yellowpages.co.za/business/14981179_3"]'
WHERE slug = 'pronk-aluminium-cc-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business consulting service based in Booysens.',
    description_enriched_at = datetime('now')
WHERE slug = 'pronto-business-services-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A ready-mix concrete and mortar supplier serving the Proclamation Hill area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pronto-readymix-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A cloud-based property management software provider based in Waterkloof Glen, giving estate agents, landlords and franchisors tools for managing rentals, sales, trust accounting, maintenance and inspections, with roots dating back to 2004.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://propworx.co.za/", "https://pretoria.co.za/place/propworx-property-management-software-for-estate-agents-amp-landlords"]'
WHERE slug = 'propworx-property-management-software-for-estate-agents-landlords-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A large nightclub and events venue in Pretoria Central spanning three floors, with an elevated stage, rooftop pool, braai house and VIP areas hosting parties, festivals and live music events.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.propagandapretoria.co.za/connect", "https://www.facebook.com/PropagandaPretoria/", "https://evendo.com/locations/south-africa/pretoria/brooklyn/nightclub/propaganda-pretoria"]'
WHERE slug = 'propaganda-pretoria-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Proper Document Storage has provided records management services since 2000, offering document storage, scanning and digitisation, secure shredding, and archiving through to final destruction.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pds-sa.co.za/", "https://pds-sa.co.za/", "https://pds-sa.co.za/?page_id=46"]'
WHERE slug = 'proper-document-storage-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A property and movable asset valuation firm serving Wonderboom South and the wider Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'property-movable-asset-valuations-precision-value-pty-ltd-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property 100 is an estate agency based in Riviera, Pretoria, assisting clients with buying, selling and renting property in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'property-100-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property At Home provides commercial property and office space services in Heritage Hill Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'property-at-home-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property Auction House is an estate agency in Murrayfield, Pretoria, specialising in property auctions.',
    description_enriched_at = datetime('now')
WHERE slug = 'property-auction-house-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property Guru is an estate agency serving Florauna and the surrounding Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'property-guru-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property Legends is a real estate agency based in Montana Park, specialising in property sales and rentals across Montana, Moot and Pretoria East, and holds a Fidelity Fund Certificate as a registered property practitioner.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://propertylegends.co.za/", "https://www.propertylegends.co.za/", "https://property.mg.co.za/estate-agency/property-legends/22282"]'
WHERE slug = 'property-legends-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property Monopolie is a real estate agency in Magalieskruin with a small team of agents offering wheelchair-accessible, LGBTQ+-friendly service through every stage of buying and selling, from consultation to viewing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.privateproperty.co.za/estate-agent/dorothy-hermsen/2286994/", "https://pretoria.co.za/place/property-monopolie", "https://www.privateproperty.co.za/estate-agency/property-monopolie/14836"]'
WHERE slug = 'property-monopolie-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property Shop is an estate agency based on St Bernard Street in the Garsfontein area, marketing architecturally designed homes and other residential properties for sale.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.propertyshop.co.za/", "https://www.propertyshop.co.za/results/residential/for-sale/pretoria/garsfontein/", "https://www.facebook.com/PropertyShopZA/"]'
WHERE slug = 'property-shop-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property Studios Ltd provides engineering and surveying services in Amberfield Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'property-studios-ltd-amberfield-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Property.CoZa Homefront Centurion is an estate agency handling property sales and rentals in Heritage Hill Estate and the wider Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'property-coza-homefront-centurion-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Propshaft People & General Engineering, based on Steve Biko Road in Wonderboom South, specialises in propshafts, gearbox and differential rebuilds, and engine rebuilds, and will source propshaft components they don''t have in stock.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.propshaftpeople.co.za/", "http://www.propshaftpeople.co.za/contact.html", "https://www.facebook.com/propshaftpeople/"]'
WHERE slug = 'propshaft-people-general-engineering-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prosatelliteinstallations offers satellite installation and IT services in Sterrewag, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'prosatelliteinstallations-sterrewag' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Proshield Security, based on Steve Biko Road in Wonderboom South, provides armed response and tailor-made security guarding solutions, operating around the clock.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://proshield.co.za/", "https://pretoria.co.za/listing/proshield-security/", "https://www.goafricaonline.com/za/1286254-proshield-security"]'
WHERE slug = 'proshield-security-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prosopa is a Greek restaurant in Waterkloof Heights known for an extensive Mediterranean menu blending Greek, Portuguese and Spanish influences, including its signature Kleftiko of slow-roasted, feta-stuffed leg of lamb, with halal and vegetarian options and a private dining room available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://prosopa.co.za/contact-us/", "https://www.eatout.co.za/venue/prosopa-restaurant/", "https://prosopa.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312583-d822837-Reviews-Prosopa_Restaurant-Pretoria_Gauteng.html"]'
WHERE slug = 'prosopa-restaurant-waterkloof-heights' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prosper kt holdings offers business consulting services in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'prosper-kt-holdings-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prosperitas Personnel is a recruitment agency based in Wierdapark with 25 years of specialist experience placing candidates in finance, engineering, medical, supply chain and IT roles, including C-level and executive search assignments across South Africa, the rest of Africa and the UAE.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.prosperitaspersonnel.co.za/", "https://za.linkedin.com/company/prosperitas-personnel", "https://pretoria.infoisinfo.co.za/card/prosperitas-personnel/763900"]'
WHERE slug = 'prosperitas-personnel-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Proteam Marketing East is a property marketing specialist based in Amandasig, in the Akasia area, working primarily on marketing campaigns for the Magaliesberg Country Estate and Thornbrook Golf Estate.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.proteameast.co.za/", "https://www.africa2trust.com/B2BAfrica/south-africa/advertising-marketing/marketing-agencies/proteam-marketing-east-za/Profile/AboutUs/1/8/61054/2/"]'
WHERE slug = 'proteam-marketing-east-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Protec Energy Solutions, based in Derdepoort, has served clients since 1994 and supplies solar power components from brands including Jinko Solar, Shoto and Dyness Digital Energy Technology.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://proteces.com/", "https://www.instagram.com/protecenergysolutions/", "https://www.enfsolar.com/protec-energy-solutions"]'
WHERE slug = 'protec-energy-solutions-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Protech Batteries Pretoria North (Solite), established in 2009 and operating from Wolmer since 2011, supplies new and reconditioned batteries, including Solite-branded stock backed by a 30-month warranty, along with free fitting, testing, battery charging and the purchase of old batteries for cars, aircraft and boats.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://protech-batteries.co.za/contact.html", "https://www.africabizinfo.com/ZA/protech-batteries-pretoria-north-solite-076-590-0154", "https://www.waze.com/live-map/directions/protech-batteries-pretoria-north-(solite)-president-steyn-st-697-wolmer,-pretoria?to=place.w.18482695.184564809.17094479", "https://protech-batteries.co.za/about.html", "https://www.aiyellow.com/batteriespretorianorth/"]'
WHERE slug = 'protech-batteries-pretoria-north-solite-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An IT services and software development company based in Rooihuiskraal, Centurion, offering IT support and software solutions to local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'protech-it-solutions-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A security services provider serving the Wapadrand area of Pretoria, offering protection and safety solutions to homes and businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'protectador-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Protector Build Wonderboom deals in second-hand and reclaimed building materials, including bricks, doors, windows, roofing and timber, and also offers demolition and salvage services; the group traces its roots back to 1987.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://protectorbuild.co.za/", "https://protectorbuild.co.za/contact-us/"]'
WHERE slug = 'protector-build-wonderboom-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Protégé Power designs and installs tailor-made solar and renewable energy systems from its Pretoria East base, serving clients across Gauteng and neighbouring provinces using top-quality components.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://protegepower.co.za/", "https://www.protegepower.co.za/"]'
WHERE slug = 'prot-g-power-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business consulting firm operating in Irene, Centurion, assisting local businesses with strategy and advisory services.',
    description_enriched_at = datetime('now')
WHERE slug = 'proudgroup-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Provisual Media is a visual media agency specialising in animation, design, video production, interactive touch-screen technology and live streaming, helping brands engage customers through dynamic displays.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "http://www.provisual.media/"]'
WHERE slug = 'provisual-media-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A waste management and cleaning services company serving the Annlin area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'prs-waste-management-pty-ltd-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business consulting practice in Doringkloof, Centurion, offering psychometric testing and evaluation services to organisations.',
    description_enriched_at = datetime('now')
WHERE slug = 'psychometric-testing-and-evaluation-services-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Public Investment Corporation, established in 1911 and corporatised in 2005, is Africa''s largest asset manager, investing pension and public sector funds such as the Government Employees Pension Fund from its Menlyn Maine offices in Waterkloof Glen.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pic.gov.za/", "https://en.wikipedia.org/wiki/Public_Investment_Corporation"]'
WHERE slug = 'public-investment-corporation-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business consulting firm based in Annlin, Pretoria, providing advisory services to local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'pul-kep-consulting-pty-ltd-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pulpit Media Group, established in May 2014 and based in Kilner Park, mobilises several Christian media organisations, including the long-running Radio Pulpit, under one umbrella to spread Christian content across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://pulpitmediagroup.co.za/", "https://themediaonline.co.za/2014/06/briefly-new-pulpit-media-group-pmg-mobilises-christian-media/"]'
WHERE slug = 'pulpit-media-group-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pulse Architects, based on Hoewe Road in Rietvalleirand, specialises in up-market residential and commercial architecture and design.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://pulsearchitects.co.za/", "https://www.facebook.com/PulseArchitect/"]'
WHERE slug = 'pulse-architects-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pulse Waterkloof Rand operates from Shop 10 in the Waterkloof Rand Centre, on the corner of Rigel Avenue and Buffelsdrift Street in Erasmusrand, alongside the centre''s other retail tenants.',
    description_enriched_at = datetime('now')
WHERE slug = 'pulse-waterkloof-rand-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PulseDroid Technology, founded in 2019, is a digital solutions agency offering software development, e-commerce consultancy, IT infrastructure management and user experience design to small businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pulsedroid.com/", "https://pulsedroid.com/about-us/"]'
WHERE slug = 'pulsedroid-technology-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An accounting firm serving businesses and individuals in Akasia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pundit-accountants-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A computer and IT services provider based in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pure-advanced-solutions-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pure Diamond Tours runs guided day tours from Pretoria, including a 4-hour city tour as well as excursions to the Cullinan Diamond Mine and Kruger National Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://purediamondtours.com/", "https://www.tripadvisor.com/Attraction_Review-g312578-d23963136-Reviews-Pure_diamond_tours-Johannesburg_Greater_Johannesburg_Gauteng.html"]'
WHERE slug = 'pure-diamond-tours-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pure IT Group, headquartered on Rotsvygie Street in La Montagne, provides small and medium-sized businesses with a one-stop solution for their IT requirements.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pureitgroup.co.za/", "https://b2bhint.com/en/company/za/pure-it-group--K2014258271"]'
WHERE slug = 'pure-it-group-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pure Joy Guest Lodge in Kameeldrift East offers 49 en-suite rooms plus two self-catering units, sleeping up to 98 guests, along with a boma and lapa for functions and free-roaming small game such as springbok and duiker on the property.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.purejoyguestlodge.co.za/", "https://www.sa-venues.com/visit/purejoy/"]'
WHERE slug = 'pure-joy-guest-lodge-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An industrial supplier in Eldoraigne, Centurion, providing water treatment and related products to businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'pure-vida-h2o-pty-ltd-eldoraigne' AND description_enriched_at IS NULL;

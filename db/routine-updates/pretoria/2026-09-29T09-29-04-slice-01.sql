-- Job 4: description enrichment sweep, slice 01 (50 businesses)
-- realm-string-boardwalk-manor .. remotenet-pty-ltd-kloofsig

UPDATE businesses
SET description = 'Realm String is a computer and IT services provider in Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'realm-string-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Realty Link is an independent real estate agency in Queenswood specialising in property sales and rentals, managing a portfolio of residential listings for sale and to let across the greater Pretoria area.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://realtylink.co.za/", "https://www.property24.com/for-sale/agency/realty-link/34964"]'
WHERE slug = 'realty-link-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rebec Mas Group is a home care provider offering personalised medical and support services, including specialised nursing care, professional cleaning, and patient transport, with hospital-quality care delivered in patients'' own homes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:00'
WHERE slug = 'rebec-mas-group-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reboni Furniture Manufacturing is Africa''s largest institutional furniture manufacturer, founded in 1971, producing SABS and ISO 9001 certified desks, chairs, storage and student-living furniture for schools, colleges, hospitals and offices.',
    description_enriched_at = datetime('now')
WHERE slug = 'reboni-furniture-manufacturing-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Records Management SA provides document scanning and digitisation, off-site document storage, a cloud-based digital document management system, secure shredding, computer recycling, and office moves and storage for businesses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:30'
WHERE slug = 'records-management-sa-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Recruit 360 develops recruitment management software for staffing and recruitment agencies, helping them manage vacancies, search candidate databases, and schedule interviews.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://recruit360.co.za/"]'
WHERE slug = 'recruit-360-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RecruitCo is a recruitment and staffing group operating several specialist brands spanning IT search, executive headhunting, learnership placements, and blue-collar and BPO staffing, with a focus on B-BBEE compliant workforce solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'recruitco-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Recruitsmiths & AuthenticateDocs is a Pretoria-based document authentication service, handling apostille certification, certified translation, notary services, and authentication of academic, police clearance and civil certificates for clients in over 120 countries; the business began as a specialist IT recruitment agency before expanding into document authentication.',
    description_enriched_at = datetime('now')
WHERE slug = 'recruitsmiths-authenticatedocs-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Red Alert Service Solutions office is part of a national facility-management company, offering cleaning and hygiene services alongside security guarding, alarm monitoring and armed response.',
    description_enriched_at = datetime('now')
WHERE slug = 'red-alert-service-solutions-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red Dot Branding is an outdoor advertising specialist with over 16 years'' experience, producing billboards, building wraps and lightbox installations from its Pretoria head office, with branches also in Durban and Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://www.rdbranding.co.za/", "https://pretoria.co.za/listing/red-dot-branding/"]'
WHERE slug = 'red-dot-branding-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red Herring Studio is a commercial property and office space business in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'red-herring-studio-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red September is an independently owned, full-service advertising and digital marketing agency founded in 2011, combining brand strategy, creative campaigns, media planning and marketing technology for clients including Honda, Mahindra and Mitsubishi.',
    description_enriched_at = datetime('now')
WHERE slug = 'red-september-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red Spiral Printing offers digital and offset printing of books, business cards, flyers, posters, stationery, forms and certificates, with nationwide courier delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30',
    source_urls = '["http://www.redspiral.co.za/", "https://pretoria.co.za/place/red-spiral-printing"]'
WHERE slug = 'red-spiral-printing-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red Stone Global (Pty) Ltd is a logistics, courier and transport business in Amandasig, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'red-stone-global-pty-ltd-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red Tree Garden Centre is a nursery in Roodeplaat selling garden plants and fruit trees, with staff on hand to offer planting advice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://za.africabz.com/gauteng/red-tree-garden-centre-208528"]'
WHERE slug = 'red-tree-garden-centre-roodeplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red Truck Coffee Roastery is a small coffee bar and roastery in Derdepoort serving premium single-origin coffee in a cosy, hidden setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-14:00, Sat 08:00-12:00, Sun Closed',
    source_urls = '["scraped:google-places-no-website", "https://redtruckcoffee.co.za/"]'
WHERE slug = 'red-truck-coffee-roastery-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RedCap Industries is a laser engraving and marking specialist with over a decade of experience, working on steel, rubber stamps, wood and glass, plus school uniform marking kits, windscreen repair kits and personalised corporate gifts.',
    description_enriched_at = datetime('now')
WHERE slug = 'redcap-industries-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RedHouse Services is a specialised property, landlord and debt-collection consultancy assisting property owners, managers, homeowners'' associations and body corporates, offering both soft and hard debt collection in partnership with law firms.',
    description_enriched_at = datetime('now')
WHERE slug = 'redhouse-services-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Redbean Projects & Signage is a full-service commercial signage company with over 30 years'' experience, producing 3D signs, building and facade signage, pylon signs, LED lightbox signs, window graphics and wayfinding systems for retail, corporate, industrial, hospitality and healthcare clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'redbean-projects-signage-sign-shop-in-centurion-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Redblock Branding Solutions is a Pretoria signage, printing and branding company offering vehicle branding and wrapping, large-format and banner printing, laser engraving and cutting, 3D printing, and branded corporate gifts and clothing, all produced in-house.',
    description_enriched_at = datetime('now')
WHERE slug = 'redblock-branding-solutions-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reddford House The Hills is a private school within The Hills Game Reserve Lifestyle Estate, part of the Inspired Education Group, offering preschool to Grade 12 on the NSC (CAPS) and IEB curricula with boarding, sports fields, science laboratories and a swimming pool.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thehills.reddford.co.za/", "https://mabumbe.com/reddford-house-the-hills-estate-online-application-courses-fees-contacts/", "https://www.bizcommunity.com/Article/196/498/234100.html"]'
WHERE slug = 'reddford-house-the-hills-the-hills-eco-game-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Redento Events & Hire is a party and event equipment rental company in Silverlakes, supplying chairs, tables, tents, table linen, cutlery, crockery and artificial lawn for weddings, birthdays and baby showers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-12:00, Sun Closed',
    source_urls = '["https://redento.co.za/", "https://pretoria.co.za/listing/redento-events-hire/"]'
WHERE slug = 'redento-events-hire-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Redeosys Business Solutions is a software development business in Amandasig, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'redeosys-business-solutions-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Redheads Engineering Solutions is the South African arm of the Germany-based Redheads Group, providing engineering consulting to industrial, commercial, retail, institutional and government clients, alongside temporary personnel placement and recruiting services for engineering roles.',
    description_enriched_at = datetime('now')
WHERE slug = 'redheads-engineering-solutions-pty-ltd-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reece Creative Events is a one-stop event planning business handling corporate and conference events, anniversaries, baby showers, birthday and children''s parties and catering, and also buys and supplies event decor.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.facebook.com/AJegels/", "https://reececreativeevents.co.za/"]'
WHERE slug = 'reece-creative-events-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reef Castor manufactures and distributes supermarket and industrial trolleys, castors, wheels and ladders from a 1,300 square metre factory in Rosslyn it has operated since 2011, alongside a Durban branch, and also offers trolley repair and refurbishment.',
    description_enriched_at = datetime('now')
WHERE slug = 'reef-castor-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reef Caterers provides outsourced catering services including contract, corporate, hospital and old-age-home catering, with custom menu planning and on-site event setup.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00',
    source_urls = '["http://www.reefcaterers.co.za/", "https://za.africabz.com/gauteng/reef-caterers-167462"]'
WHERE slug = 'reef-caterers-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reef Chainsaw Centre (Pretoria West) is an authorised Husqvarna dealer selling and repairing chainsaws, brush cutters, lawnmowers, ride-on mowers, polesaws, blowers and chippers, and offers free operator training; it also manufactures the locally-built TurfKing 750 mower.',
    description_enriched_at = datetime('now')
WHERE slug = 'reef-chainsaw-centre-pretoria-west-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ref-Pro is a software development business in Florauna, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ref-pro-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Refined Homes Projects is a building and construction business in Villieria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'refined-homes-projects-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Refurb Online sells certified, manufacturer-refurbished laptops, desktops, monitors, servers and mobile devices from brands such as Dell, HP and Lenovo, with graded stock, warranties of 12 to 24 months, fleet rental options and bulk ordering with VAT invoicing for corporate clients, delivered nationwide by courier.',
    description_enriched_at = datetime('now')
WHERE slug = 'refurb-online-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reger Finley designs, manufactures and supplies geotechnical, exploration and percussion drilling rigs.',
    description_enriched_at = datetime('now')
WHERE slug = 'reger-finley-pty-ltd-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Regie Protection Services is a security services business in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'regie-protection-services-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Register Your Business handles company and tax registrations with CIPC, SARS and the Department of Labour, including Pty Ltd, Inc, NPC and co-operative registration, VAT, PAYE and UIF registration, and secretarial services such as annual returns, typically completing a company registration within five to seven working days.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-16:00, Fri 09:00-12:00, Sat-Sun Closed'
WHERE slug = 'register-your-business-pty-ltd-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Regus is a commercial property and office space provider in Boardwalk Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'regus-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Regus - Centurion, Centurion Mall is a commercial property and office space provider inside Centurion Mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'regus-centurion-centurion-mall-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Regus - Centurion, Southdowns Ridge Office Park is a commercial property and office space provider in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'regus-centurion-southdowns-ridge-office-park-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Regus - Pretoria, Brooklyn Bridge is a commercial property and office space provider in Brooklyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'regus-pretoria-brooklyn-bridge-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Regus - Pretoria, Central is a commercial property and office space provider in Pretoria Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'regus-pretoria-central-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Regus - Pretoria, Lynnwood Bridge is a commercial property and office space provider in Lynnwood Ridge, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'regus-pretoria-lynnwood-bridge-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reinforcing Steel Pretoria is a building and construction business in Klerksoord, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'reinforcing-steel-pretoria-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reis JC & Co is an accounting firm in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'reis-jc-co-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rekord is a marketing and advertising business in Lydiana, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rekord-lydiana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rekord is a marketing and advertising business in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rekord-noth-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Relax Consulting is an estate agency in Rooihuiskraal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'relax-consulting-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reliance Laboratory Equipment supplies testing equipment for the construction and civil engineering sectors, covering soil, asphalt and bitumen, concrete, coring and sampling, and particle-size analysis, manufactured to SANS specifications with SANAS calibration services; the family-owned business was established in 1947 and is now in its third generation.',
    description_enriched_at = datetime('now')
WHERE slug = 'reliance-laboratory-equipment-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Relianz Business Accounting is an accounting firm in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'relianz-business-accounting-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Remax Pretoria is a franchise of the RE/MAX real estate network, helping clients buy, sell and rent residential and commercial property with access to the group''s bond calculator and property valuation tools.',
    description_enriched_at = datetime('now')
WHERE slug = 'remax-pretoria-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rembu Construction is a building and construction business in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'rembu-construction-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RemoteNet (PTY) Ltd is a software development business in Kloofsig, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'remotenet-pty-ltd-kloofsig' AND description_enriched_at IS NULL;

-- Description enrichment sweep (job 4) — slice 24
-- 50 businesses, researched + reworded, hours where found.

UPDATE businesses
SET description = 'The Solar Box designs and installs tailored solar power systems for homes and businesses in Roodeplaat, offering site assessments, cost analysis and full installation to help clients get off the grid and cut energy costs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'the-solar-box-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'THE SPICY SOFTDEV is a software development company in Andeon, Pretoria, building enterprise software for local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-spicy-softdev-software-company-creating-enterprise-software-for-your-busines-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'THEDOSADO TRADING & PROJECTS is a Karenpark-based construction and structural company, established in 2015, offering welding, structural steel and aluminium door and window installations alongside building repairs and upgrades.',
    description_enriched_at = datetime('now')
WHERE slug = 'thedosado-trading-projects-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thokoman Foods SA (Pty) Ltd is a food manufacturer based in Sunderland Ridge, Centurion, recognised as one of South Africa''s leading peanut butter producers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.thokoman.co.za/", "https://thokomanfoods.co.za/"]'
WHERE slug = 'thokoman-foods-sa-pty-ltd-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TI Automotive is an automotive repair business based in Rosslyn, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'ti-automotive-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TIBS is a business and management consultancy operating from Berkeley Office Park in Highveld Techno Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tibs-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TICELMA GROUP (PTY) LTD is an engineering and surveying firm based in Wonder Park, Karenpark.',
    description_enriched_at = datetime('now')
WHERE slug = 'ticelma-group-pty-ltd-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tilt Interactive (Pty) Ltd is a Pretoria-based digital agency with over 15 years of industry experience, offering web design, website development, e-commerce and search/Google Ads marketing services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.tiltinteractive.co.za/", "https://www.procompare.co.za/providers/tilt-interactive-pty-ltd"]'
WHERE slug = 'tilt-interactive-pty-ltd-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timber Trends ZA designs and sells handcrafted, solid-wood furniture such as console and coffee tables, benches and TV stands, blending modern minimalist styling with wood and metal finishes.',
    description_enriched_at = datetime('now')
WHERE slug = 'timber-trends-za-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timity Travel CC has organised airport, lodge and corporate transfers plus guided day tours and multi-day wildlife safaris across South Africa and the region since 2014.',
    description_enriched_at = datetime('now')
WHERE slug = 'timity-travel-cc-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TITSA Consulting (Pty) Ltd is a business and management consultancy based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'titsa-consulting-pty-ltd-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TJ Kiti Trading (Pty) Ltd is a business consultancy operating out of Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tj-kiti-trading-pty-ltd-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TJ Mahapa Accountants is an independent accounting and tax firm in Wingate Park offering payroll, bookkeeping, tax return submissions, company secretarial and business registration services, along with financial statement compilation and review.',
    description_enriched_at = datetime('now')
WHERE slug = 'tj-mahapa-accountants-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TJ System Integrators (Pty) Ltd, founded in 2016, specialises in industrial electrification, automation and critical power infrastructure, including switchgear, UPS and DC power systems, serving sectors such as mining, oil and gas, and cement production from its Mayville base.',
    description_enriched_at = datetime('now')
WHERE slug = 'tj-system-integrators-pty-ltd-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TL Store manufactures and sells brick- and concrete-making equipment from Laudium, including brick machines, precast paver and wall-cladding moulds, vibrating tables and concrete mixers, distributed through major retailers such as Takealot and Makro.',
    description_enriched_at = datetime('now')
WHERE slug = 'tl-store-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TLL Holdings and Projects (Pty) Ltd is a building and construction company based in Olievenhoutbosch, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tll-holdings-and-projects-pty-ltd-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TLS IT Solutions is a computer and IT services provider based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tls-it-solutions-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TM Global Distributors is a logistics, courier and transport company based in Sable Hills Waterfront Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'tm-global-distributors-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TM Global Forwarding (Pty) Ltd is a Clubview-based freight and logistics company offering air, sea and road freight, cargo courier, customs clearing and household removal services, drawing on more than 20 years of industry relationships.',
    description_enriched_at = datetime('now')
WHERE slug = 'tm-global-forwarding-pty-ltd-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TMA Express Road provides cross-border express cargo transport between South Africa, Zimbabwe and Zambia, part of the TMA Group''s Southern African logistics network operating since 1994 and serving FMCG, pharmaceutical, automotive and mining sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'tma-express-road-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TMACC Systems cc is a software development company based in Wonderboom, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tmacc-systems-cc-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TMGServ (Pty) Ltd is a business and management consultancy based in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tmgserv-pty-ltd-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TMK Eminence Solutions (Pty) Ltd is a business and management consultancy based in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tmk-eminence-solutions-pty-ltd-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TMM Construction is a building and construction company based in Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tmm-construction-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TMS-Redec, established in 1998 and part of the Sekta Group, is an industrial services provider based in Irene offering turnkey solutions such as abrasive blasting, chemical and high-pressure cleaning, corrosion protection and asbestos removal to the energy and petrochemical sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'tms-redec-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOP 100 FRANCHISES is a franchise consulting business based in Waterkloof Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'top-100-franchises-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOP SIX GRAPHICS & STATIONERY is a printing and stationery business based in Olievenhoutbosch, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'top-six-graphics-stationery-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Kilner Park is the liquor store attached to the SPAR supermarket on Lynette Street, Kilner Park, stocking wines, spirits and beer.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 09:00-15:30'
WHERE slug = 'tops-at-spar-kilner-park-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Kloofsig is the liquor store attached to the SPAR supermarket on the corner of Theodore and Kruger Street, Kloofsig, stocking wines, spirits and beer.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 09:00-15:30'
WHERE slug = 'tops-at-spar-kloofsig-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Orchards is the liquor store inside The Orchards Shopping Centre, Akasia, stocking wines, spirits and beer with extended daily trading hours.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-20:00'
WHERE slug = 'tops-at-spar-orchards-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR The Hill is the liquor store attached to the Lanos Spar Shopping Centre in La Montagne, Pretoria, stocking wines, spirits and beer.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 09:00-15:00'
WHERE slug = 'tops-at-spar-the-hill-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Valhalla is the liquor store attached to the SPAR supermarket at the corner of Shirley Road and Broadway East, Valhalla, stocking wines, spirits and beer.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 09:00-13:00'
WHERE slug = 'tops-at-spar-valhalla-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Wierda Park is the liquor store attached to the Wierda 2 Shopping Centre in Wierda Park, Centurion, stocking wines, spirits and beer.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-20:00, Sat 08:00-20:00, Sun 09:00-14:00'
WHERE slug = 'tops-at-spar-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Torque Africa Group, established in 2014, is a specialist drilling contractor based in Donkerhoek offering water, mineral, and oil and gas exploration, piling and geotechnical drilling services across Southern Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'torque-africa-group-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TPS SERVICES is a business and management consultancy operating from the CSIR Campus in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tps-services-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TR Projects is a business and management consultancy based in Lyttelton, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tr-projects-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trail-Link, established in 2004, manufactures electrical trailer connectors and accessories, including suzis, plugs, sockets, harnesses and LED lighting, for the transport industry, with products fitted as standard on major original-equipment brands.',
    description_enriched_at = datetime('now')
WHERE slug = 'trail-link-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TRANSVAAL BAG CO (PTY) LTD is a general retail supplier operating from a storage depot on Es''kia Mphahlele Drive, Roseville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'transvaal-bag-co-pty-ltd-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TRAVEL DEPOT is a travel agency based in Erasmia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'travel-depot-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TRD Sandblasting is a sandblasting and building-related contractor based in Andeon, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trd-sandblasting-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TREE CROWN CONSULTING is a business and management consultancy operating from Brooklyn Bridge Office Park in Brooklyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tree-crown-consulting-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TRIBUTUM Accounting in Rooihuiskraal provides bookkeeping, tax planning, VAT and PAYE submissions, company secretarial and estate-planning services, with practitioners accredited by SAIPA and SAICA.',
    description_enriched_at = datetime('now')
WHERE slug = 'tributum-accounting-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TRILONG PROJECTS CC is a building and construction company based in Wonderboom South, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trilong-projects-cc-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tritechnium is an ICT solutions provider based in Rietondale offering IT support, server and network management, Microsoft 365 cloud services and IT consulting, serving businesses across Gauteng as a cost-effective alternative to an in-house IT department.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00'
WHERE slug = 'tritechnium-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TRX Electronics (Pty) Ltd is an industrial supplier and manufacturer based in Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'trx-electronics-pty-ltd-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TSA RORA is a commercial property and office space provider based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tsa-rora-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TSHABALALA ATTORNEYS is a legal practice based in Valhalla, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tshabalala-attorneys-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TSHANDUKO ESSENTIAL SERVICES is a general retail business based in Andeon, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tshanduko-essential-services-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tshedza is an engineering, plant hire and management consulting group offering construction machinery hire, bridge-building and earthworks equipment alongside research and financial-strategy consulting, based in Montana.',
    description_enriched_at = datetime('now')
WHERE slug = 'tshedza-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TSHWALEC POWER PROJECTS (PTY) LTD is a building and construction company specialising in power projects, operating from Willows Office Park in De Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tshwalec-power-projects-pty-ltd-de-wilgers' AND description_enriched_at IS NULL;

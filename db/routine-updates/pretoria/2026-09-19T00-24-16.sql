UPDATE businesses
SET description = 'PG Engineering (PTY) Ltd is an engineering and surveying services provider based in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pg-engineering-pty-ltd-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PG Glass Menlyn, which serves the Newlands area of Pretoria, is part of South Africa''s largest vehicle glass repair and replacement network, offering windscreen chip repairs, anti-smash-and-grab film, and fitment of new windscreens and vehicle glass.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/pg-glass-menlyn-46052", "https://www.gps-data-team.com/where/south_africa/trade/PG_Glass-ZA/PG-Glass-Menlyn.html", "https://www.pgglass.co.za/"]'
WHERE slug = 'pg-glass-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PGI Holdings is a financial and investment services provider located in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pgi-holdings-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PGSI Group is a Black majority-owned business collective based in Hermanstad, offering services across automotive engineering, logistics, hospitality, and professional services, and holds Level 1 BBBEE contributor status.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pgsigroup.com/", "https://www.pgsigroup.com/"]'
WHERE slug = 'pgsi-group-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PHAMA Cabling Solution, based in Lotus Gardens, Pretoria, supplies and installs fibre optic and structured cabling systems (Category 5e through 7A), along with wireless network installation and video surveillance and remote monitoring solutions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://phamacs.co.za/"]'
WHERE slug = 'phama-cabling-solution-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PHARMACHEM HOUSE / CITY MEDICAL operates as an independent pharmaceutical wholesaler and distributor, supplying over 20,000 pharmaceutical and related products and ranking among South Africa''s largest privately owned pharmaceutical wholesalers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.citymedical.co.za/", "https://citymedical.co.za/about/"]'
WHERE slug = 'pharmachem-house-city-medical-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PHEFUMULAS PAINTER''S AND HANDYMAN provides building and renovation services in Olievenhoutbosch, including house extensions, kitchen and bathroom renovations, and interior, exterior and roof painting.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/phefumulas-painters-and-handyman"]'
WHERE slug = 'phefumulas-painter-s-and-handyman-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PHSONS GROUP SA is a building and construction business operating in Kameeldrift, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'phsons-group-sa-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Piet Retief Body Builders, founded in 1969, expanded beyond its original Mpumalanga base to establish a production line and factory in Donkerhoek, Pretoria, where it manufactures heavy trailers.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://prbb.co.za/"]'
WHERE slug = 'piet-retief-body-builders-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PIPECO South Africa is an engineering company with over 20 years of experience supplying and installing engineered water tanks, with its corporate office based in Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://pipecoza.com/", "https://za.linkedin.com/company/pipeco-tanks-south-africa"]'
WHERE slug = 'pipeco-south-africa-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PJ Electrical is an electrician serving Pierre van Ryneveld Park in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pj-electrical-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PJW Management is a marketing and advertising business based in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pjw-management-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PK Legodi Incorporated Attorneys is a legal services firm based in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pk-legodi-incorporated-attorneys-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PKF Pretoria is an established auditing and professional services firm with a 16-year track record, offering clients a one-stop auditing service in the Pretoria area.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.pkf.co.za/locations/pkf-pretoria/"]'
WHERE slug = 'pkf-pretoria-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PLTFRM Hazeldean is a family and pet-friendly restaurant nestled along the Pienaars River in Hazeldean, set in a historic old calf barn with rustic, farmyard-style charm. The menu features fresh pizzas, sushi, burgers and fireside drinks, along with an outdoor play area for children.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pltfrmhazeldean.co.za/", "https://www.facebook.com/61573575991084/posts/where-youll-find-us-pltfrm-hazeldean-is-nestled-along-the-pienaars-river-in-haze/122144619842785866/"]'
WHERE slug = 'pltfrm-hazeldean-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PM Attorneys is a Centurion-based law firm that has been operating since 2008, specialising in conveyancing and property law, commercial and corporate law, and family law and estate matters, with a combined 30 years of experience across its practice areas.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pmattorneys.co.za/", "https://www.pmattorneys.co.za/about-us/"]'
WHERE slug = 'pm-attorneys-centurion-pretoria-conveyancing-property-law-commercial-corporate-l-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PM Properties is a commercial property and office space business based in Cornwall Hill Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pm-properties-cornwall-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PMA Developments (Pty) Ltd operates from the Tijger Valley Office Park in Pretoria, where it has developed office premises known as PMA House.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.office-hub.com/za/properties/tijger-vallei-silver-lakes-road-silver-lakesground-floor-pma-house-block-a-pretoria-pretoria-a0vQg00000OwjGfIAJ"]'
WHERE slug = 'pma-developments-pty-ltd-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PMC Electronics is an appliance repair specialist in Garsfontein, Pretoria, servicing household appliances and television and video equipment, and operating as a Samsung service centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-12:00',
    source_urls = '["scraped:google-places-no-website", "https://www.brabys.com/za/gauteng/pretoria/garsfontein/electrical-appliances-repairs/p-m-c-electronics"]'
WHERE slug = 'pmc-electronics-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PMC Networks CC is a computer and IT services provider based in Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pmc-networks-cc-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PMFH Consulting is a software development business based in Brooklands Lifestyle Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pmfh-consulting-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PMK Laminates has operated from its Proclamation Hill premises since 2002, offering sales, installation and maintenance of laminate flooring, blinds and carpets, along with solid wood floor refurbishment.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://pmklaminates.co.za/", "https://pmklaminatedflooring.co.za/"]'
WHERE slug = 'pmk-laminates-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Castle Gate Lifestyle is a stationery, art supplies and books store within the Castle Gate Lifestyle retail centre, which launched in 2024 as part of a 24,000 square metre expansion, and the store offers wheelchair-accessible shopping and same-day delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pna.co.za/", "https://pna.co.za/store-locator/pna-castle-gate-lifestyle/"]'
WHERE slug = 'pna-castle-gate-lifestyle-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Hazeldean is a one-stop stationery, arts and crafts and book store at Hazeldean Square, stocking school, home and office stationery, art and craft materials, and books ranging from educational titles to fiction and non-fiction.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pna.co.za/", "https://pna.co.za/store-locator/pna-hazeldean/"]'
WHERE slug = 'pna-hazeldean-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Northpark Mall is a stationery and books store located in North Park Mall, Florauna.',
    description_enriched_at = datetime('now')
WHERE slug = 'pna-northpark-mall-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Raslouw trades from Raslouw Lifestyle Centre in Centurion as part of the PNA chain, which has supplied stationery, school supplies and arts and crafts essentials across South Africa and Namibia since 1992.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pna.co.za/", "https://pna.co.za/store-locator/pna-raslouw/"]'
WHERE slug = 'pna-raslouw-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Silverton is a stationery, art supplies and books store trading from Silverwater Crossing on the corner of Pretoria and Watermeyer Road in Silverton.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 08:00-14:00',
    source_urls = '["https://www.pna.co.za/", "https://pna.co.za/store-locator/pna-silverton/"]'
WHERE slug = 'pna-silverton-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Sinoville is a one-stop stationery, books and arts and crafts store operating from Shop 21 in Sinoville Corner Shopping Centre, stocking everything from school and office stationery to art and craft supplies and books.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pna.co.za/", "https://pretoria.co.za/place/pna-sinoville"]'
WHERE slug = 'pna-sinoville-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Southdowns stocks a diverse range of stationery, art supplies, books and office essentials from Shop 3 and 4 in Southdowns Shopping Centre, and offers delivery for off-site orders.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pna.co.za/", "https://pna.co.za/store/gauteng/pna-southdowns/ae7yyLiNJc"]'
WHERE slug = 'pna-southdowns-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Waverley is a stationery, art supplies and books store trading from Shop 14 in Waverley Plaza on Hertzog Street.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pna.co.za/", "https://www.yep.co.za/biz/store/iyp/13240616_2"]'
WHERE slug = 'pna-waverley-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Zambezi operates from the Zambezi Junction shopping centre in Montana Park, offering stationery, books and arts and crafts supplies as part of the PNA retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-19:00, Fri 08:00-18:00',
    source_urls = '["https://www.pna.co.za/", "https://pna.co.za/store-locator/pna-zambezi/"]'
WHERE slug = 'pna-zambezi-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNME Consulting (Pty) Ltd is a business and management consulting firm based in Brummeria, Pretoria, that was registered as a private company in 2019.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://primeconsulting.co.za/", "https://clarifiedby.diligenciagroup.com/company/summary/8160106-pnme-consulting--pty--ltd/"]'
WHERE slug = 'pnme-consulting-pty-ltd-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development company based in Lynnwood Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pns-it-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Powerbuild Doornpoort, also trading as DIY Hardware and Crafts Doornpoort, is a hardware store in the Doornpark Shopping Centre that belongs to the Power Build national buying group, giving it access to competitively priced products from established suppliers and brands.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.diycrafts.co.za/", "https://powerbuild.africa/power-stores/diyhardwareandcraftsdoornpoort/"]'
WHERE slug = 'powerbuild-doornpoort-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction business based in Constantia Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pp-papangeli-trading-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PPC Hercules Factory is an integrated cement plant in Hermanstad that traces its roots to 1892, when it began operating as Eerste Fabrieken Zement, making it the first Portland cement manufacturer in Africa. It remains a major cement production site supplying much of the cement used across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ppc.co.za/", "https://www.gem.wiki/Pretoria_Cement_Plant"]'
WHERE slug = 'ppc-hercules-factory-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PPC Mooiplaas Aggregate Mine is a dolomite quarry in Erasmia and one of PPC''s key aggregate operations in the Centurion area, supplying construction aggregates for civil construction as well as materials used in the chemical, metallurgical and agricultural sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.sayellow.com/view/south-africa/ppc-aggregates-mooiplaas-dolomite-in-centurion"]'
WHERE slug = 'ppc-mooiplaas-aggregate-mine-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A marketing and advertising company based in La Montagne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pplug-pty-ltd-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PR Powerhouse is a public relations firm based in Eco-Park, Centurion, that specializes in reputation management services for its clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://prpowerhouse.co.za/", "https://www.zoominfo.com/pic/pr-powerhouse/431539638"]'
WHERE slug = 'pr-powerhouse-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRBB Trailers - Factory in Donkerhoek manufactures Tautliner, Flatdeck and Side Tipper trailers, having grown from its roots as a trailer manufacturer founded in Piet Retief, Mpumalanga in 1969 into one of the fastest-growing players in the industry, with all trailers now manufactured and delivered from this Pretoria facility.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-16:30, Fri 07:00-16:00',
    source_urls = '["http://www.prbb.co.za/", "https://prbb.co.za/"]'
WHERE slug = 'prbb-trailers-factory-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRBB Trailers Sales and Parts manufactures commercial trailers from its base in Donkerhoek, Pretoria, and also supplies OEM-manufactured parts and accessories for trailers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://prbb.co.za/"]'
WHERE slug = 'prbb-trailers-sales-and-parts-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRELLEX is a general retail business based in Parktown Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'prellex-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria East Gate Motor Repairs/Installations repairs, installs and upgrades all types of gate motors for customers in the Pretoria East area, including Garsfontein Smallholdings.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.electricfencingandgates.co.za/", "https://www.facebook.com/gatemotorrepairsandinstallation/"]'
WHERE slug = 'pretoria-east-gate-motor-repairs-installations-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Gates & Garage Doors Automation specializes in gate motor and garage door automation, including intercoms, beams, boom gates and GSM access systems, and lists Boardwalk among the areas it services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ptagatesngaragedoors.co.za/", "https://www.ptagatesngaragedoors.co.za/"]'
WHERE slug = 'pretoria-gates-garage-doors-automation-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRINT BURO is a printing services provider located in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'print-buro-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRK Projects offers building and construction services in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'prk-projects-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRO-BC (Pty) Ltd provides business and management consulting services in Florauna, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-bc-pty-ltd-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRO-HARNESSING PRIMARY CO-OPERATIVE LIMITED is an industrial supplier and manufacturer based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-harnessing-primary-co-operative-limited-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRO-SERVE CONSULTING provides building and construction services in Cornwall Hill Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-serve-consulting-cornwall-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PROFESSIONAL GROUP OF COMPANIES offers engineering and surveying services in Blue Valley Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'professional-group-of-companies-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An automotive and repairs business serving Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'proff-business-solutions-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction company operating in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'proma-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PROSEC CITR is a PSIRA-registered security company offering professional guarding, armed response and technology-driven surveillance, serving clients across the greater Pretoria area.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.proseccitr.co.za/", "https://www.comparesecurity.co.za/companies/prosec-citr"]'
WHERE slug = 'prosec-citr-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prostone Granite Marble & Quartz is a Hennopspark-based supplier of building materials, specializing in natural stone products including granite, marble and quartz.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.prostone.co.za/", "https://www.yellosa.co.za/company/834207/prostone-granite-marble-quartz"]'
WHERE slug = 'prostone-granite-marble-quartz-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PROearth is a construction company based in Lyttelton, Centurion, specializing in fast-track earthworks and civil works carried out by an experienced team.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pro-earth.co.za/", "https://www.yellowpages.net.za/phone,27-126441734,Construction-Company,Centurion,ZA115264.html"]'
WHERE slug = 'proearth-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PRSS is a Centurion-based security services group operating out of Lyttelton, providing armed response, guarding, CCTV and alarm monitoring, risk assessments, investigations and close protection services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.profrisk.co.za/", "https://fire-and-security.co.za/companies/prss/"]'
WHERE slug = 'prss-operations-office-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An industrial supplier and manufacturing service provider based in Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'prvw-plant-services-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PS Branded is a bespoke manufacturer of outdoor branding solutions founded in 1989, known for its collapsible canopies and custom-branded flags used at events, expos, storefronts and activations.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.portable-shade.com/", "https://www.findglocal.com/ZA/Pretoria/214695341880750/PS-Branded"]'
WHERE slug = 'ps-branded-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PS Bushings manufactures polyurethane suspension bushings and has supplied the South African aftermarket for over 20 years, backing its products with a lifetime warranty.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://psbushings.co.za/", "https://psbushings.co.za/"]'
WHERE slug = 'ps-bushings-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PS23 Manufacturing & Distribution is based in Derdepoort, Pretoria, where it manufactures and distributes lubricants, greases, oil and fuel additives, and industrial cleaners, including its PS23 Metal Treatment product used in automotive, industrial and mining applications.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ps23.co.za/", "https://pretoria.infoisinfo.co.za/card/ps23-manufacturing-distribution/415058"]'
WHERE slug = 'ps23-manufacturing-distribution-pty-ltd-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSA Signs is an ISO 9001:2015 certified manufacturer and supplier of branded corporate signage, founded in 1989 and based in Sunderland Ridge, Centurion. The company handles brand implementation and signage production, with a particularly strong focus on safety, health, environmental and quality management.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.psasigns.co.za/", "https://www.psasigns.co.za/pages/contact-pin"]'
WHERE slug = 'psa-signs-pretoria-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSC - Engineering provides engineering and surveying services to clients in Parktown Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'psc-engineering-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSG Magalies North Annlin is a branch of PSG Financial Services, a South African financial services group that provides personalised advice on insurance, investments and wealth management to individuals, families and businesses across Southern Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.psg.co.za/pretoriaannlindoretheastreetshortterm", "https://www.psg.co.za/branch-office/pretoriaoos"]'
WHERE slug = 'psg-magalies-north-annlin-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSG Silver Lakes Wealth Management & Stockbroking is a financial and fiduciary advisory office in Hazeldean Office Park, Silver Lakes, offering wealth management, stockbroking and estate planning services focused on the private client market as part of the PSG Financial Services group.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://advisers.psg.co.za/branch-office/silver-lakes-wealth-management-and-stockbroking", "https://psgsilverlakes.business.site/"]'
WHERE slug = 'psg-silver-lakes-wealth-management-stockbroking-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSG Wealth and Insure Wolwespruit is a branch of PSG Financial Services located in Erasmuskloof, offering asset and wealth management alongside insurance advice as part of a national financial services group that has operated since 1998.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.psg.co.za/wolwespruit", "https://advisers.psg.co.za/branch-office/wolwespruit"]'
WHERE slug = 'psg-wealth-and-insure-wolwespruit-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSI CRO South Africa is the local office of PSI CRO, a global Clinical Research Organization that conducts clinical trials and research work for pharmaceutical and biotech clients, based out of Highveld Techno Park in Centurion as part of PSI''s international network.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.psi-cro.com/", "https://psi-cro.com/global-reach/south-africa_73/"]'
WHERE slug = 'psi-cro-south-africa-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSM CONSULTING95 offers business and management consulting services in Brooklands Lifestyle Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'psm-consulting95-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PSOL, also known as Prasper Solutions, is an IT company based in Southdowns Ridge Office Park, Centurion, that specialises in client and management solutions with a customer-centric approach.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://praspersolutions.co.za/", "https://praspersolutions.co.za/"]'
WHERE slug = 'psol-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PT Online is a solar and renewable energy provider based in Florauna, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pt-online-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PT Signage Pty Ltd is a full-service sign centre based in Willow Park Manor, Pretoria, producing signage such as vehicle and boat lettering, banners, window lettering, light boxes and architectural signs, alongside broader branding items like business cards and promotional products.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ptsignage.co.za/", "https://pretoria.co.za/listing/pt-signage-pty-ltd/"]'
WHERE slug = 'pt-signage-pty-ltd-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PTA Boedels (Pty) Ltd specializes in the administration of deceased estates in Magalieskruin, Pretoria, with around 30 years of experience in the field. The firm assists with executor appointments, estate finalization, will drafting, and estate planning.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ptaboedels.co.za/", "https://www.ptaboedels.co.za/"]'
WHERE slug = 'pta-boedels-pty-ltd-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PTA Linings and Filtration manufactures custom PVC linings, bladder tanks, and water storage solutions, and specializes in drinking water and biological filtration for domestic, agricultural, and industrial use, based in Derdepoort Smallholdings, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ptalinings.co.za/", "https://www.ptalinings.co.za/"]'
WHERE slug = 'pta-linings-and-filtration-pty-ltd-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PTA Storage is a self-storage facility in Equestria, Pretoria, offering 24-hour access and a range of unit sizes. The facility currently has around 55 units, with further expansion planned.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ptastorage.co.za/"]'
WHERE slug = 'pta-storage-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PTP Building Services provides construction, renovation, and slate roofing services in Derdepoort, Pretoria, covering both residential and commercial projects such as healthcare facilities and warehouses. The company also offers bespoke carpentry and joinery work, including custom kitchens, cabinetry, and wooden doors.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ptpbs.co.za/", "https://www.ptpbs.co.za/"]'
WHERE slug = 'ptp-building-services-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PTW Project Trade Welding provides wedding services in Leeuwfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ptw-project-trade-welding-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pulpits RSA designs and manufactures pulpits, podiums, and lecterns for churches and other institutions, based in Val de Grace, Pretoria. All of its products are locally designed and made rather than imported.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pulpitsrsa.co.za/", "https://www.pulpitsrsa.co.za/"]'
WHERE slug = 'pulpits-rsa-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PVM Attorneys Inc is an attorneys and legal services firm in Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pvm-attorneys-inc-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PVision (Pty) Ltd, based in Kosmosdal, Centurion, specializes in the configuration and distribution of high-performance LED screens, including LED billboards, indoor and outdoor displays, and digital signage solutions. Established in 2003, the company also supplies Brightsign media players and proximity-triggered digital content systems.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pvision.co.za/", "https://pvision.co.za/contact/"]'
WHERE slug = 'pvision-pty-ltd-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PWY Consulting & Engineering, based in The Reeds, Centurion, was incorporated in 2014 and provides business and engineering consulting services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://pwy.co.za/", "https://www.dnb.com/business-directory/company-profiles.pwy_consulting_and_engineering_(pty)_ltd.d429c6acebe2f9258bb4d0368ba64983.html"]'
WHERE slug = 'pwy-consulting-engineering-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PXD Plastics is a plastic manufacturer and supplier of plastic sheeting solutions in Salieshoek, Pretoria, operating from a 4,440 square metre, SABS-W approved factory.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pxdplastics.co.za/"]'
WHERE slug = 'pxd-plastics-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pachas Restaurant is an upmarket steakhouse in Hazelwood that has been part of Pretoria''s dining scene since 1985, blending continental, grill, seafood and South African cuisine.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 12:00-21:00, Fri-Sat 12:00-21:30, Sun 12:00-15:00',
    source_urls = '["https://www.openstreetmap.org/node/290719561", "https://pachas.co.za/"]'
WHERE slug = 'pachas-restaurant-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pacifrica Express is an industrial supplier and manufacturing business based in Hazeldean, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pacifrica-express-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pack n Spice Wonderboom is a wholesale supplier of packaging, spices and baking ingredients, including cake boards, vermicelli, sauces and baking cups, and has grown over the years to manufacture some of its own products.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.packnspicewarehouse.co.za/"]'
WHERE slug = 'pack-n-spice-wonderboom-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pack-All Stationary is a books and stationery retailer in Zwartkop, Centurion.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:15, Fri 07:30-14:45'
WHERE slug = 'pack-all-stationary-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Padbok Thai Restaurant is a large Thai restaurant in Pretoria serving authentic Thai and Japanese dishes, including sushi, and can accommodate between 180 and 250 diners for functions and celebrations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sa-venues.com/things-to-do/gauteng/padbok-thai-restaurant/", "https://www.wininganddining.co.za/gauteng/pretoria/brooklyn/padbok-thai-restaurant"]'
WHERE slug = 'padbok-thai-restaurant-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Padlangs Restaurant & Bar is a restaurant and bar in Derdepark Centre, Derdepoort, serving South African favourites such as skilpadjies and pap & kaiings alongside steaks and chicken strips, with a bar menu of draft beer, wine and gin.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-21:00, Fri-Sat 07:00-23:00, Sun 10:00-16:00',
    source_urls = '["scraped:google-places-no-website", "https://restaurantguru.com/Padlangs-Restaurant-Pretoria"]'
WHERE slug = 'padlangs-restaurant-bar-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Padroni Hosting is a computer and IT services provider based in Boardwalk Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'padroni-hosting-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Padstal Slaghuis is a local butchery in Murrayfield known for its biltong and droewors, offering quality meat at affordable prices with friendly service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing/padstal-slaghuis/"]'
WHERE slug = 'padstal-slaghuis-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Paint Kingdom is a painting contractor with over a decade of experience, offering a comprehensive range of painting services for residential, commercial and new development projects across the Gauteng region.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.paintkingdom.co.za/", "https://paintkingdom.co.za/"]'
WHERE slug = 'paint-kingdom-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Paint@Woodhill is a hardware store serving the Woodhill Golf Estate area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'paint-woodhill-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Painting Company is a building and construction business based in Zwavelpoort.',
    description_enriched_at = datetime('now')
WHERE slug = 'painting-company-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pajero Maintenance Services is a general retail business located in Rooiwal.',
    description_enriched_at = datetime('now')
WHERE slug = 'pajero-maintenance-services-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pakistan Halaal Meat Supply is a butchery located in Claudius.',
    description_enriched_at = datetime('now')
WHERE slug = 'pakistan-halaal-meat-supply-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palisade Factory is a palisade fencing specialist based in Klerksoord that manufactures fencing to customer specifications, including Swallow Tail, 6-spike and 7-spike designs, along with fence panels and DIY kits. The company also delivers and installs the palisade fencing it produces.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://palisadefactory.co.za/", "https://www.palisadefactory.co.za/"]'
WHERE slug = 'palisade-factory-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palladium Hair Co operates from Waterkloof Heights Shopping Centre as part of a high-fashion, progressive hair salon brand founded in 1997 that also has a presence in Cape Town. The salon offers hair, nail and beauty services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresha.com/lvp/palladium-hair-company-club-avenue-pretoria-wr98LA", "https://za.africabz.com/gauteng/palladium-hair-6126"]'
WHERE slug = 'palladium-hair-co-waterkloof-heights' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palladium Hair Company is part of a South African hair and beauty brand founded in 1997, offering hair, beauty and wellness services through its salons in Pretoria and Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.palladiumhair.com/", "https://palladiumhair.com/"]'
WHERE slug = 'palladium-hair-company-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palm Lane Complex is a logistics, courier and transport business located in Andeon.',
    description_enriched_at = datetime('now')
WHERE slug = 'palm-lane-complex-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palms Guest House in Eloffsdal is a 3-star bed and breakfast offering 14 luxury double and single rooms, five family and self-catering units, and a honeymoon suite with a kitchenette and Jacuzzi. It also hosts corporate functions, conferences, weddings and other celebrations.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://palmsguesthouse.mobi/", "http://www.palmsguesthouse.co.za/"]'
WHERE slug = 'palms-guest-house-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pam Golding Properties Centurion is an estate agency office serving the Centurion area, including Centurion Golf Estate, offering property sales and rentals spanning new developments, sectional titles, small holdings and golf estates.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pamgolding.co.za/", "https://www.pamgolding.co.za/real-estate/gauteng/centurion"]'
WHERE slug = 'pam-golding-properties-centurion-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pam Golding Properties Copperleaf lists property for sale in Copperleaf Golf Estate, described as one of Gauteng''s sought-after golf estate communities, including fairway homes and vacant land opportunities.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pamgolding.co.za/property-search/properties-for-sale-copperleaf/6839", "https://www.pamgolding.co.za/property-search/golf-estate-properties-for-sale-copperleaf/6839"]'
WHERE slug = 'pam-golding-properties-copperleaf-copperleaf-golf-estate' AND description_enriched_at IS NULL;

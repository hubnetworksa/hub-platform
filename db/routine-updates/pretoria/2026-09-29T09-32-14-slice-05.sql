-- Description enrichment sweep (job 4) -- parallel slice 05

UPDATE businesses
SET description = 'Rozelle Embroidery and Crafts is a promotional branding and embroidery business in Elardus Park, producing custom embroidery on garments, caps, bags, towels and workwear for corporates, schools, hotel groups and event managers. The company also offers in-house logo digitising and supplies blank apparel ready for branding.',
    description_enriched_at = datetime('now')
WHERE slug = 'rozelle-embroidery-and-crafts-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rozewood is a property management company serving homeowners associations, body corporates and sectional title schemes, offering managing agent, compliance, financial management and maintenance-coordination services. It is registered with the National Association of Managing Agents (NAMA) and the PPRA.',
    description_enriched_at = datetime('now')
WHERE slug = 'rozewood-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ruan Minnaar (Breeder) is an estate agent operating in Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ruan-minnaar-breeder-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rubber It is a waterproofing specialist operating since 2007, providing roof waterproofing, sealing, roof cleaning and rust and corrosion protection for residential, commercial and industrial properties. The company also manufactures its own range of rubber waterproof coatings, including the Multi Guard liquid membrane system.',
    description_enriched_at = datetime('now')
WHERE slug = 'rubber-it-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rubbex Conveyors & Engineering South Africa manufactures conveyor belts and bulk material handling equipment, including rollers, pulleys, belt cleaners, metal detectors and magnetic separators. The company also provides conveyor system engineering, 3D CAD design, installation and EPCM services for the mining, cement, steel and quarrying sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'rubbex-conveyors-engineering-south-africa-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rubbish Removal Pretoria is a waste and rubbish removal service based in La Montagne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rubbish-removal-pretoria-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rubrix Community Living Administrators is a managing agent providing sectional title and community scheme management, including financial administration, legal compliance, maintenance guidance, AGM coordination and trustee support. The company is registered with the PPRA and the National Association of Managing Agents (NAMA).',
    description_enriched_at = datetime('now')
WHERE slug = 'rubrix-community-living-administrators-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ruchan Projects is a construction company based in Die Hoewes, Centurion, offering building and construction services.',
    description_enriched_at = datetime('now')
WHERE slug = 'ruchan-projects-construction-company-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rudado Pty Ltd is a building and construction business based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rudado-pty-ltd-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rudi Kruger Accountants (Pty) Ltd is an accounting and tax practice established in 2010, serving small and medium businesses with annual financial statements, payroll, tax planning, VAT returns and virtual CFO services. The firm is an accredited reseller of Sage, Xero and QuickBooks accounting software and is registered with SAIPA and CIBA.',
    description_enriched_at = datetime('now')
WHERE slug = 'rudi-kruger-accountants-pty-ltd-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rudi Oosthuizen - Insurance Broker is an insurance brokerage based in Leeuwfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rudi-oosthuizen-insurance-broker-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rudolf Botha Attorneys is a law firm based in Lyttelton Manor, Centurion, offering legal services.',
    description_enriched_at = datetime('now')
WHERE slug = 'rudolf-botha-attorneys-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ruiter Gaming & Electronics is a games-console and PC repair specialist in Villieria, servicing PlayStation, Xbox and Nintendo consoles, gaming PCs and laptops, and controllers, alongside selling consoles, PCs and accessories. Established in 2020, the business offers 3-6 month repair warranties and has completed over 7,000 repairs.',
    description_enriched_at = datetime('now')
WHERE slug = 'ruiter-gaming-electronics-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rulela Manufacturing is an industrial manufacturing business based in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rulela-manufacturing-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Run / Walk for Life Rietondale is a branch of the Run/Walk for Life fitness franchise, offering supervised group exercise sessions in Rietondale tailored to individual fitness levels, from beginners to marathon training goals.',
    description_enriched_at = datetime('now')
WHERE slug = 'run-walk-for-life-rietondale-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Runo Logistics provides local and cross-border transport services from Rosslyn, offering vehicle selection and pre-trip planning tailored to cargo and site requirements. Bookings can be made online or via WhatsApp.',
    description_enriched_at = datetime('now')
WHERE slug = 'runo-logistics-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rusbro Engineering Works is an engineering and construction business based in Annlin West, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rusbro-engineering-works-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rush Hour Printing is a printing services business based in Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rush-hour-printing-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RussellStone Foods is a protein and processed-meat business operating four brands: Creekside Farm (bacon, hams, sausages, pastrami and salami), Rica Meats (polony, russians and sliced cold meats), Pretoria Primal Traders (fresh and frozen carcasses) and a trading division supplying protein products domestically and internationally. The company manages its own cold chain from processing through to distribution.',
    description_enriched_at = datetime('now')
WHERE slug = 'russellstone-foods-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Russells is a furniture and appliances retailer offering bedroom, lounge and dining furniture alongside appliances and electronics, trading from Steve Biko Street in Pretoria as part of the Pepkor Lifestyle group.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'russells-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Russells Wonderpark is a furniture and appliances store inside Wonderpark Shopping Centre in Karenpark, part of the Russells retail chain selling bedroom, lounge and dining furniture alongside appliances, electronics and homeware.',
    description_enriched_at = datetime('now')
WHERE slug = 'russells-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rustic-Eco (PTY) Ltd is a custom carpentry and joinery business based in Derdepoort, producing built-in cupboards, custom kitchens, office furniture and commercial shopfitting for retail, restaurant and healthcare clients. The company has completed projects for clients including Woolworths, BP Garages and Life Healthcare.',
    description_enriched_at = datetime('now')
WHERE slug = 'rustic-eco-pty-ltd-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ruvas Curtaining is a curtaining business trading from Heuweloord Shopping Centre in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ruvas-curtaining-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ruvimbo Group (Pty) Ltd is an environmental consulting firm offering environmental management and compliance, specialist impact studies, ecological restoration of land affected by mining or development, and sustainability support for infrastructure projects.',
    description_enriched_at = datetime('now')
WHERE slug = 'ruvimbo-group-pty-ltd-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ryankim Manufacturing is a precision engineering business in Sunderland Ridge established in 2007, specialising in waterjet profiling using Omax equipment, including Tilt-a-Jet precision cutting for thicker materials, alongside light CNC milling, turning, NC bending and TIG welding.',
    description_enriched_at = datetime('now')
WHERE slug = 'ryankim-manufacturing-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ryk''s Electrical Appliances & Spares - ONLINE is an electronics and appliances business based in Valhalla, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ryk-s-electrical-appliances-spares-online-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rylo Industrial Solutions supplies industrial and commercial equipment including compressors, generators, pumps and cleaning machinery, alongside in-house formulated cleaning chemicals. The company also undertakes custom installations such as car wash systems and shade structures, plus equipment servicing and repairs, with nationwide delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'rylo-industrial-solutions-silvertondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rymar Gas & Hardware is a hardware store based in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rymar-gas-hardware-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rynepark Pharmacy is a community pharmacy in Pierre van Ryneveld Park operating under the Alpha Pharmacies group, which provides pharmacy dispensing alongside in-house Alpha Clin clinic services and AlphaDoc online consultations.',
    description_enriched_at = datetime('now')
WHERE slug = 'rynepark-pharmacy-alpha-pharmacies-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rynepark Pharmacy Clinic is a pharmacy-based clinic in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'rynepark-pharmacy-clinic-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S A Business link and auto repair is an automotive workshop in Hermanstad offering mechanical repairs, suspension and steering work, body repairs, spray painting, brake and clutch services and vehicle diagnostics, positioned as a lower-cost alternative to dealership servicing. The business also offers a free local shuttle service for customers while their vehicles are serviced.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:00'
WHERE slug = 's-a-business-link-and-auto-repair-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S C Johnson Rosslyn is a cleaning-products business based in Rosslyn, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 's-c-johnson-rosslyn-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S E Solutions (Pty) Ltd is an environmental consulting firm in Zwartkop offering compliance assurance, environmental impact assessments, air quality management, EIA project management and environmental training for businesses navigating environmental legislation.',
    description_enriched_at = datetime('now')
WHERE slug = 's-e-solutions-pty-ltd-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S F P Townplanning (Pty) Ltd specialises in town planning, land use approvals and strategic property development, including telecommunications infrastructure and renewable energy project planning, across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.sfplan.net/", "https://sfplan.co.za/"]'
WHERE slug = 's-f-p-townplanning-pty-ltd-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S N S Engineering & Construction (Pty) Ltd is a turnkey engineering and construction company established in 1979, serving the motor industry and major corporations with electrical solutions, steel construction, interior renovations and HVAC installation.',
    description_enriched_at = datetime('now')
WHERE slug = 's-n-s-engineering-construction-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S a Legal Services (Pty) Ltd - Clubview is a law firm based in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 's-a-legal-services-pty-ltd-clubview-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S and E Financial Solutions CC is an accounting and financial services business based in Florauna, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 's-and-e-financial-solutions-cc-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S and P Power Units is a renewable-energy and power-supply company with over 30 years of experience, designing, supplying and installing off-grid and grid-tied solar systems and backup power solutions for commercial, residential and agricultural clients. The business also offers battery repacking for cordless appliances and power tools, and stocks solar panels, inverters and batteries from brands including Victron, Varta and Trina Solar.',
    description_enriched_at = datetime('now')
WHERE slug = 's-and-p-power-units-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S and S Bookkeepers Pty Ltd is a bookkeeping and accounting business based in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 's-and-s-bookkeepers-pty-ltd-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S&B Consultants is a printing services business based in Val-De-Grace, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 's-b-consultants-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S&R Enterprises is a proud distributor of Sandvik Rock Processing equipment, supplying new and used mobile and stationary crushers, screens and drill rigs for the quarrying, construction and mining industries, along with parts and field service support.',
    description_enriched_at = datetime('now')
WHERE slug = 's-r-enterprises-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S-Cubed is a software development company based in Centurion, specialising in HR and payroll software for the South African market.',
    description_enriched_at = datetime('now')
WHERE slug = 's-cubed-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S.O.A.T is a private security company offering close-protection and VIP security, site and facility protection, convoy escort, 24/7 surveillance and monitoring, event security and risk assessment services, with more than ten years of experience and over 500 clients protected.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 's-o-a-t-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S.V Mahlangu Attorneys (Inc) is a law firm handling general litigation including Road Accident Fund claims and personal injury cases, family law matters such as divorce and child custody, and insolvency law including sequestrations and company liquidations.',
    description_enriched_at = datetime('now')
WHERE slug = 's-v-mahlangu-attorneys-inc-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S4 Integration Pretoria is the Pretoria branch of an industrial automation and software integration company, delivering production lines, special-purpose machines, warehouse management and ERP software, AGVs/AMRs and material handling systems for automotive, packaging, warehousing and food & beverage clients. The company has operated since 1996 and holds ISO 9001 accreditation.',
    description_enriched_at = datetime('now')
WHERE slug = 's4-integration-pretoria-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Accounting Network - Centurion is a local accounting practice within the SA Accounting Network, offering monthly bookkeeping, annual financial statements, income tax, VAT and PAYE registration and filing, and business advisory services including restructuring and turnaround strategy.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-accounting-network-centurion-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Baking Supplies is a retailer of baking ingredients, cake-decorating items and baking equipment, trading from Lyttelton as one of several branches across South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:15, Sat 08:30-13:00, Sun Closed'
WHERE slug = 'sa-baking-supplies-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Barn Doors manufactures handcrafted sliding barn doors from solid pine and premium hardwoods, including standard, bi-fold and luxury ranges plus rail systems and hardware, with custom sizing and nationwide delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00'
WHERE slug = 'sa-barn-doors-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Blankets is an industrial manufacturing business based in Claudius, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-blankets-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Borehole Pumps is a borehole-pump supply business based in Eco-Park Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-borehole-pumps-eco-park' AND description_enriched_at IS NULL;

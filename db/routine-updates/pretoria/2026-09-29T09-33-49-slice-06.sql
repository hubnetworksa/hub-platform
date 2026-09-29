-- Description enrichment sweep (job 4) -- parallel slice 06

UPDATE businesses
SET description = 'SA Business Tax & Accounting is a business consulting firm based in Monument Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-business-tax-accounting-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Coating is an industrial supplier based in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-coating-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA College Private School is an independent, co-educational, Umalusi-accredited school in central Pretoria near the Union Buildings, teaching through to matric with robotics and coding, extramural sport and excursions as part of its programme.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-college-private-school-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Fire Holdings (SA Fire Group) supplies and services certified fire equipment such as extinguishers, hose reels and hydrants to SANS 1475 standards, along with smoke and heat detection systems, field firefighting equipment, and fire safety and first-aid training, from its premises on Steve Biko Road, Wonderboom.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-fire-holdings-sa-fire-group-wonderboom-south-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Hunt Training operates from the SA Hunters and Game Conservation Association premises in Derdepoort, offering hunter education, firearm-licence guidance and sport-shooting programmes for members.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-hunt-training-pty-ltd-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Integrated ERP Solutions provides accounting services alongside Microsoft Dynamics 365 Finance, Supply Chain Management and Business Central implementations, delivered by Microsoft-certified finance and accounting staff.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-integrated-erp-solutions-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Labour Consulting is an industrial and employment relations consultancy that helps businesses stay compliant with labour legislation and manages workplace matters such as performance issues, misconduct, grievances and collective bargaining.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-labour-consulting-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Plastikor manufactures, imports and distributes water pumps, irrigation systems and reverse-osmosis, nanofiltration and UV water-purification equipment, together with PVC and HDPE pipe, fittings and valves, from its premises in Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-plastikor-pretoria-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Pools is a swimming pool contractor based in Doornpoort, offering pool installation, refurbishment, maintenance and repair services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/sa-pools"]'
WHERE slug = 'sa-pools-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA PrimeLink is a business-support firm offering branding and corporate-gifting solutions, company and vehicle (BRN) registrations, COIDA, CSD and CIDB compliance assistance, business planning, bookkeeping and equipment hire from its Lyttelton office.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'sa-primelink-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA SawBlades supplies cutting tools including saw blades, router bits, drilling equipment, cutter heads, diamond (PCD) routers and planer knives and spares, aimed at boosting production efficiency and reducing running costs for its industrial customers.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-sawblades-pty-ltd-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Scaffold Group manufactures, sells and hires scaffolding, including Quickstage, Quicklock and aluminium systems, plus formwork for concrete casting, supplying qualified erectors and site managers from its Waltloo base and serving mining-sector projects as well as general construction.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-scaffold-group-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Tax Prac handles annual income tax submissions to SARS for individuals, sole traders, companies and NPOs, provisional tax, cloud-based bookkeeping, CIPC company registrations and payroll administration including EMP201, PAYE/UIF and COIDA registrations.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-tax-prac-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Technologies (Pty) Ltd builds VisitMe, a POPIA-compliant visitor-management and access-control platform combining a handheld driver''s-licence and vehicle-disc scanner, an online management portal and a mobile app for visitor pre-booking, gate access, staff time-and-attendance and asset-movement tracking.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-technologies-pty-ltd-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Unique Furniture is a furniture and homeware retailer based in Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-unique-furniture-pretoria-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Website Designer builds custom WordPress websites with domain registration and free first-year hosting, e-commerce sites from R4,900, and monthly SEO campaigns from R1,200, drawing on over 20 years of web design and internet marketing experience, from its base in Menlo Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-website-designer-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA architechtural services is an engineering and surveying firm based in Theresapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-architechtural-services-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA cellular appliances and furniture is an electronics and appliances retailer based in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-cellular-appliances-and-furniture-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SABTEC Consulting provides SAP and SUSE Linux Enterprise training courses, including SUSE Linux Enterprise Server 15 (SLE211) deployment training, from its Lyttelton Manor base.',
    description_enriched_at = datetime('now')
WHERE slug = 'sabtec-consulting-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SACPCMP, the South African Council for the Project and Construction Management Professions, regulates and promotes the built-environment management professions, maintaining the national register of practitioners in construction health and safety, project and construction management, and building inspection.',
    description_enriched_at = datetime('now')
WHERE slug = 'sacpcmp-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SADC Mining Supplies stocks mining, industrial, agricultural, construction and automotive equipment, including drilling gear, excavators, safety hard hats, bearings, tools, bolts and nuts, for operators in those sectors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-16:00'
WHERE slug = 'sadc-mining-supplies-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SADT Consulting (PTY) LTD offers audit and assurance, accounting and bookkeeping, VAT, PAYE, UIF and SDL and income tax services, CIPC, UIF, COIDA and CIDB registration advisory, trust management and weekly, bi-weekly or monthly payroll processing for clients from start-ups to large corporates.',
    description_enriched_at = datetime('now')
WHERE slug = 'sadt-consulting-pty-ltd-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safety and Overall Warehouse supplies PPE and workwear, including high-visibility clothing, hard hats, safety footwear, gloves, and eye, hearing and respiratory protection, plus custom branding services such as screen printing, embroidery, heat transfer and vehicle graphics.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30, Sat-Sun Closed'
WHERE slug = 'safety-and-overall-warehouse-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sagario Branding supplies branded promotional products across gifting, display, hampers, clothing, headwear and workwear categories, with in-house branding capability to help businesses build brand visibility.',
    description_enriched_at = datetime('now')
WHERE slug = 'sagario-branding-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salon Hannah is a hair and beauty salon based in Valhalla, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'salon-hannah-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SALT Beauty Bar, based in Rockfields Village, offers nail treatments including acrylic overlays, gel toes and nail art, brow waxing and tinting, rejuvenating facials and dermaplaning, teeth whitening, massage, permanent makeup, and manicures and pedicures.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-15:00'
WHERE slug = 'salt-beauty-bar-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SANI SIXT Car Rental - Hatfield is a car rental business based in Hatfield, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sani-sixt-car-rental-hatfield-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SAPFIN Solutions offers accounting, auditing, business consultancy, forensic and tax advisory services, alongside CIPC, SARS and labour registration assistance, for clients across sectors including wholesale and retail, hospitality, property, water management, healthcare, technology and manufacturing.',
    description_enriched_at = datetime('now')
WHERE slug = 'sapfin-solutions-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SAR Electronic SA (Pty) Ltd is an automation engineering firm covering industrial process control and factory automation, environmental technology including photovoltaic plant maintenance, and building automation, offering hardware and software design, installation and ongoing system service and maintenance.',
    description_enriched_at = datetime('now')
WHERE slug = 'sar-electronic-sa-pty-ltd-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SAUB (Screamer Automated Utility Billing) provides automated water and electricity billing, smart-metering support with meter-reading workflows and consumption tracking, and billing process mapping and reporting, for clients on Samrand Business Park and beyond.',
    description_enriched_at = datetime('now')
WHERE slug = 'saub-screamer-automated-utility-billing-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SAVETCON is an events management company offering an end-to-end conference, congress and webinar service, organising major annual scientific and veterinary congresses and continuing professional development (CPD) events, including online learning through platforms such as Livestorm.',
    description_enriched_at = datetime('now')
WHERE slug = 'savetcon-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SAVSA is a car dealership based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'savsa-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SB Chem (Pty) Ltd is an industrial supplier based in Heatherdale, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'sb-chem-pty-ltd-heatherdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SB Packaging Pty Ltd is an industrial supplier of packaging products based in the Gateway Industrial Park, Rooihuiskraal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sb-packaging-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SBA Specialised Business Activity is a business consulting firm based in Alphen Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sba-specialised-business-activity-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SBP ceiling and drywall is a building and construction contractor specialising in ceiling and drywalling installation, based in Koedoespoort Industrial, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sbp-ceiling-and-drywall-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SCAPECOM IT Solution is an IT services company based in Amberfield Glen, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'scapecom-it-solution-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SCHARBORT M S C Physiotherapy is a physiotherapy practice based on Berea Street, Lukasrand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scharbort-m-s-c-physiotherapy-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SCK CONSULTING & DISTRIBUTORS is a legal consulting business based in Clubview, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sck-consulting-distributors-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SCMOD (PTY) LTD is an IT services company based in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scmod-pty-ltd-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SCPD is a building and construction contractor based in Silvertondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scpd-silvertondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SCPD (Pty) Ltd is a hardware store based in Silvertondale X1, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scpd-pty-ltd-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SDE Telecomms (previously Linkworld), trading as System Design Experts, supplies cellular signal boosters and repeaters, indoor and outdoor antennas and installation accessories, including vehicle booster kits and commercial systems for farms, lodges, mines and large buildings, compatible with MTN, Vodacom, Telkom and Cell C networks.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://linkworld.co.za/", "https://sdexperts.co.za/"]'
WHERE slug = 'sde-telecomms-previously-linkworld-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SDL Vehicle Road Worthy Centre R55 is a vehicle roadworthy-testing and repair centre based in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sdl-vehicle-road-worthy-centre-r55-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SDM Consulting offers enterprise asset management, inventory management, independent asset valuations, CFO advisory support, document management and skills transfer, alongside asset-tracking systems and technology such as IoT, RFID and drone surveillance, for public and private sector clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'sdm-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sebenzela Security Solutions (Pty) Ltd installs intrusion systems, CCTV, intercoms and biometric or RFID access control, alongside solar panel, inverter and smart-home automation systems, from its base in Moregloed.',
    description_enriched_at = datetime('now')
WHERE slug = 'sebenzela-security-solutions-pty-ltd-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SEBS Communications is an industrial supplier based in Moregloed, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sebs-communications-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SECE is a business consulting firm handling employment equity compliance, skills WSP/ATR submissions for SDL levy reimbursement, training and learnerships, labour relations support, POPI/PAIA compliance, and COIDA and UIF registration and compliance assistance, from its base in Silverton.',
    description_enriched_at = datetime('now')
WHERE slug = 'sece-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SECTOR5 is a business consulting firm based in Eldoraigne, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sector5-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SEESA (Pty) Ltd is a labour-law and compliance firm advising on employment contracts and terminations, disciplinary procedures and CCMA support, skills training and employment equity, occupational health and safety, BEE consulting, and payroll, UIF and Compensation Fund administration through its Connect platform.',
    description_enriched_at = datetime('now')
WHERE slug = 'seesa-pty-ltd-brummeria' AND description_enriched_at IS NULL;

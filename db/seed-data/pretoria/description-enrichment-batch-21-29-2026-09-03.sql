-- Description enrichment, batches 21-29 combined (interactive session,
-- "lean" mode -- agents write SQL straight to a file and report only a
-- short summary, instead of returning full SQL in chat, to cut
-- context/token overhead; applied and committed as one batch per owner
-- request instead of per-10 commits). Continues the alphabetical backlog
-- (description_enriched_at IS NULL). "researched" entries cite what was
-- actually found and append new source_urls; "reworded" entries use only
-- already-verified fields when no additional real information turned up.
-- Guarded by description_enriched_at IS NULL so this is safe to re-run.

UPDATE businesses SET
  description = 'Biltong Factory is a catering and biltong business based in Glen Lauriston, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'biltong-factory-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Biltong@ZA (Pty) Ltd, part of the Fleisherei Group, produces traditional South African biltong and dry wors, with this Louwlardia address serving as the group''s Centurion factory and head office.',
  source_urls = '["http://www.biltong.co.za/", "https://www.brabys.com/business/5967284/south-africa/gauteng/centurion/jacaranda-st/biltong-retailers/biltongza-centurion-factory"]',
  description_enriched_at = datetime('now')
WHERE slug = 'biltong-za-pty-ltd-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Binary Bit Technologies is a 100% Black-owned ICT company in Karenpark offering web development, mobile apps, cloud, cybersecurity and AI services, with a focus on serving informal traders, SMEs, stokvels and government institutions.',
  description_enriched_at = datetime('now')
WHERE slug = 'binary-bit-technologies-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BinCareTakers SA, founded in 2025 and based in Lotus Gardens, offers residential, school and business bin-cleaning packages using eco-friendly chemicals, with monthly and once-off cleaning plans starting from R30 per bin.',
  hours = 'Mon-Sat 08:00-17:00',
  description_enriched_at = datetime('now')
WHERE slug = 'bincaretakers-sa-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bind-X (Pty) Ltd, based at Samrand Business Park, develops the Terrabind biological dust-control product for mining haul roads to reduce water usage and airborne dust, with facilities in South Africa, Australia and Europe.',
  source_urls = '["http://www.bind-x.com/", "https://bind-x.com.au/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bind-x-pty-ltd-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bindworx (Pty) Ltd is a young, fast-growing digital printing and finishing company in Pretoria North offering perfect and coil/wire binding, saddle stitching, graphic design and CD/DVD printing and duplication.',
  hours = 'Mon-Fri 08:00-17:00',
  description_enriched_at = datetime('now')
WHERE slug = 'bindworx-pty-ltd-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bingo''s Barber Shop, at Ninapark Square in Akasia, offers barbering and hair styling services including beard trims, men''s shaves, haircuts and head shaves.',
  hours = 'Mon-Fri 08:00-18:00, Sat-Sun 08:00-15:00',
  source_urls = '["scraped:google-places-no-website", "https://www.fresha.com/lvp/bingos-barber-shop-akasia-D7LnlW"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bingo-s-barber-shop-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bio Engineering Africa Consulting and Training Academy, opened in 2016, is a specialist civil engineering, environmental and skills-development consultancy based in Waterkloof Glen, working on stormwater management, bridge and road rehabilitation, dam safety assessments and SMME mentoring for clients including Sasol, the City of Tshwane and SANRAL.',
  description_enriched_at = datetime('now')
WHERE slug = 'bio-engineering-africa-consulting-and-training-academy-pty-ltd-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Biochem South-East Africa is an industrial supplier and manufacturer based in Koedoespoort Industrial, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'biochem-south-east-africa-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Biomedical Emporium''s head office in Die Wilgers is a biotechnology company specialising in cosmeceutical skincare products, including its Maternology, Bio-Baby, Helix Series and Rx ranges, treating hyperpigmentation, acne and signs of ageing.',
  hours = 'Mon-Thu 08:00-17:00, Fri 08:00-15:00, Sat 08:00-15:30, Sun Closed',
  description_enriched_at = datetime('now')
WHERE slug = 'biomedical-emporium-head-office-de-wilgers' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'BioPark@Gauteng is a business consulting firm based in Derdepoort, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'biopark-gauteng-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Biotac specialises in dust-suppression solutions such as its Bio-Fusion product, along with fire, animal-feed and fuel innovations, serving the agriculture, mining and forestry industries.',
  description_enriched_at = datetime('now')
WHERE slug = 'biotac-pty-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Biotherapeutics is an industrial supplier and manufacturer based in Irene, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'biotherapeutics-irene' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bioworx (Pty) Ltd, based at the CSIR campus in Brummeria, formulates and markets nutritional supplements and probiotics for both humans and animals, including its INTESTICOL and UMKHONTO gut-health and immunity products.',
  source_urls = '["http://www.bioworx.co.za/", "https://www.bioworx-health.com/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bioworx-pty-ltd-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bird & Co Groenkloof is a branch of the Bird & Co chicken restaurant chain, located in Groenkloof Plaza.',
  hours = 'Mon-Sat 10:00-21:00, Sun 10:00-20:00',
  description_enriched_at = datetime('now')
WHERE slug = 'bird-co-groenkloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Biscoplus (Pty) Ltd, established in 1992 as a family business, manufactures Henro-brand biscuits, including My Scotties, Choc-Chip, Marie, Ginger and Super Cream varieties, distributed throughout Africa from its Silverton facility.',
  description_enriched_at = datetime('now')
WHERE slug = 'biscoplus-pty-ltd-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bishop Mathibedi Trading and Projects is a books and stationery business based in Daspoort, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'bishop-mathibedi-trading-and-projects-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bismillah Restaurant in Laudium serves Indian, Pakistani, Chinese and English cuisine.',
  hours = 'Mon-Sun 10:00-22:00',
  description_enriched_at = datetime('now')
WHERE slug = 'bismillah-restaurant-laudium-laudium' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bisschops Staalwerke is a steel fabricator in the Silverton industrial area, manufacturing basic iron and steel products.',
  source_urls = '["scraped:google-places-no-website", "https://firmania.co.za/pretoria/bisschops-staalwerke-177104"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bisschops-staalwerke-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bissett & Partners Attorneys is a law firm based in Val de Grace, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'bissett-partners-attorneys-val-de-grace' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'Bitchin Kitchen is a catering business based in Annlin, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'bitchin-kitchen-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bite Pharma (Pty) Ltd, established in 2019 by pharmacist Denver Wicomb, is a pharmaceutical consultancy in Kosmosdal offering regulatory affairs, medicine registration, branding and marketing services to pharmaceutical companies.',
  hours = 'Mon-Fri 08:30-17:00',
  description_enriched_at = datetime('now')
WHERE slug = 'bite-pharma-pty-ltd-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bitline SA Security, established in 2001 and based in Mayville, develops customised training programmes for the security industry, including PSIRA, SASSETA and firearms training.',
  hours = 'Mon-Thu 08:00-16:00, Fri 08:00-13:00',
  source_urls = '["http://www.bitlinesasecurity.co.za/", "https://www.bitlinesaonline.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bitline-sa-security-mayville' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Biz Evolution is an accounting and tax firm in Shere offering bookkeeping, payroll, VAT and company registrations, and SARS dispute support, staffed by SAIPA-registered and SAIT- and CIBA-affiliated professionals with over 35 years of combined experience.',
  description_enriched_at = datetime('now')
WHERE slug = 'biz-evolution-shere' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bizbot Systems, based in Villieria, builds tailor-made back-office automation tools including CRM systems and process and management modules to help businesses run with consistent, error-free workflows.',
  hours = 'Mon-Fri 08:00-16:00',
  description_enriched_at = datetime('now')
WHERE slug = 'bizbot-systems-villieria' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bizco Consulting, established in 2001, offers consulting, mentoring and coaching in operational efficiency, financial management, risk compliance, IT support, HR and marketing across South Africa and the SADC region.',
  description_enriched_at = datetime('now')
WHERE slug = 'bizco-consulting-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BizConSA operates an online marketplace connecting South Africans with professional service providers such as mechanics, electricians, plumbers, tutors and lawyers, letting professionals list services, sell products and take bookings.',
  description_enriched_at = datetime('now')
WHERE slug = 'bizconsa-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bjoko Security & Training Services offers security installations, alarm systems and security-industry training from its premises on Paul Kruger Street in Les Marais.',
  source_urls = '["scraped:google-places-no-website", "https://pretoria.infoisinfo.co.za/card/bjoko-security/576787"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bjoko-security-training-services-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Black and Orange Creative, with over 10 years in business, is a full in-house signage and branding company in The Willows offering signage design and installation, vehicle branding and wrapping, print media and digital advertising.',
  description_enriched_at = datetime('now')
WHERE slug = 'black-and-orange-creative-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Black House Realty is an estate agency based in Brooklands Lifestyle Estate handling residential sales and rentals plus commercial office space across Gauteng suburbs including Centurion, Midrand and Sandton.',
  description_enriched_at = datetime('now')
WHERE slug = 'black-house-realty-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'Black Ink Secretarial Services is a business consulting and secretarial services firm based in Brooklands Lifestyle Estate, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'black-ink-secretarial-services-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Black Mahogany Construction, established in 2009 and based in Waterkloof Glen, provides civil engineering and capital-project services including foundations, road and drainage infrastructure rehabilitation, drone surveys and high-voltage switchgear delivery.',
  description_enriched_at = datetime('now')
WHERE slug = 'black-mahogany-construction-best-civil-engineering-concrete-pumping-earthworks-g-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Black Ox Holdings is a Black-owned investment holding company at Eco Park with a portfolio of technology, renewable-energy, communications and education businesses including OneConnect Solutions, OneConnect Communications and OneConnect Academy.',
  description_enriched_at = datetime('now')
WHERE slug = 'black-ox-holdings-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blackbeard Attorneys Inc, incorporated in 2013 and based in Wierdapark, practises corporate law, debt collection, property law, labour law and litigation in the High and Lower courts.',
  description_enriched_at = datetime('now')
WHERE slug = 'blackbeard-attorneys-inc-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blackboard Business Intelligence is a data analytics firm serving the mining, retail, oil & gas, insurance, utilities and banking sectors, and is a global partner of Hitachi Energy and Mincom for BI solutions on platforms including SAP, Microsoft Power BI, Oracle and Tibco Jaspersoft.',
  description_enriched_at = datetime('now')
WHERE slug = 'blackboard-business-intelligence-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blackdot Energy, operating since 2014, delivers solar and renewable energy solutions including engineering consultation, EPC compliance certification and training, having completed over 30 major solar installations generating more than 10 million kWh of clean energy.',
  description_enriched_at = datetime('now')
WHERE slug = 'blackdot-energy-florauna' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blackpool Enterprise Solutions is an engineering and surveying business based in Kosmosdal, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'blackpool-enterprise-solutions-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blackworx is a software development business based in Amandasig, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'blackworx-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blacq Dot, established in 2016 and based in Clubview, provides IT support, network solutions, hardware sales and digital marketing services, including 24/7 helpdesk support.',
  description_enriched_at = datetime('now')
WHERE slug = 'blacq-dot-clubview' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bladkon (Pty) Ltd, established in 1982, specialises in concrete construction of suspended floor and roof slabs for residential projects, providing in-house structural engineering design and reinforcement cutting and bending, alongside partner companies Eastern Readymix and ERM Pumping Services.',
  description_enriched_at = datetime('now')
WHERE slug = 'bladkon-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'Blanc Virtual Assistants provides virtual assistant support for businesses from its base in Wingate Park, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'blanc-virtual-assistants-wingate-park' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'Blaq Designz is a marketing and advertising agency based in Ninapark, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'blaq-designz-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blast-it Vapour Blasting uses a water-and-abrasive vapour blasting technique to clean, strip rust from, and restore metal surfaces such as engine parts, tools, and automotive components, positioning itself as an eco-friendly alternative to replacing damaged parts.',
  description_enriched_at = datetime('now')
WHERE slug = 'blast-it-vapour-blasting-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bleddie Nice Gifts is a gift shop in Moregloed selling beads and jewellery, decor, and print and signage items.',
  source_urls = '["https://www.facebook.com/bleddienicegifts", "https://bleddie-nice.business.site/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bleddie-nice-gifts-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blendwell Chemicals (Pty) Ltd is an industrial cleaning chemicals manufacturer formed in 1990, producing food-safe and eco-friendly cleaning products as well as paper goods such as toilet rolls, garage rolls, and folded paper towels from its facility near the Old Mint in Centurion.',
  source_urls = '["http://www.blendwell.co.za/", "https://www.blendwell.co.za/about-us/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'blendwell-chemicals-pty-ltd-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bliga Design Consultants is a Pretoria-based web design firm providing website design and development, logo design, video and card invitations, and domain hosting for businesses and individuals in South Africa and abroad.',
  description_enriched_at = datetime('now')
WHERE slug = 'bliga-design-consultants-pty-ltd-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blignaut BlueStar is a Sanlam-authorised financial advisory practice in Eldoraigne offering financial planning, retirement and estate planning, investments, short-term insurance, and tax services, led by founder Andre Blignaut, recognised as Sanlam''s Top Adviser for 18 years.',
  source_urls = '["https://www.sanlam.co.za/bluestar/blignaut/", "https://www.sanlamadvice.co.za/bluestar/blignaut/about-us"]',
  description_enriched_at = datetime('now')
WHERE slug = 'blignaut-bluestar-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blinex Plastics, based in Silverton, manufactures synthetic rubber products including discs, sheets, and rods, as well as air filtration products.',
  source_urls = '["scraped:google-places-no-website", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/blinex-plastics"]',
  description_enriched_at = datetime('now')
WHERE slug = 'blinex-plastics-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Block Projects is an NHBRC-registered builder and Master Builders Association member based in Garsfontein, specialising in luxury home building, kitchen and bathroom renovations, waterproofing, shopfitting, and corporate construction projects across Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'block-projects-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bloom Essentials is a supplier in the industrial and manufacturing sector, based in Shere.',
  description_enriched_at = datetime('now')
WHERE slug = 'bloom-essentials-shere' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blossom Events and Decor is an event styling and decor company in Monument Park offering floral design, decor and furniture hire, and full event planning for weddings, corporate functions, and milestone celebrations.',
  description_enriched_at = datetime('now')
WHERE slug = 'blossom-events-and-decor-monument-park' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'Blou Bul Electrical Contractors is an electrical contracting business based in Daspoort, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'blou-bul-electrical-contractors-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BluBark is a business consulting firm based in Constantia Park, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'blubark-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Bridge Construction has provided custom home, townhouse, and commercial building services in Gauteng for over a decade, managing projects such as luxury chalet developments at Sondela Nature Reserve.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-bridge-construction-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Connect Technology is an e-commerce technology retailer in Amberfield Valley selling gaming computers, notebooks, networking equipment, 3D printers, and solar and power-backup solutions, with local warranty and nationwide delivery.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-connect-technology-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Core Logistics, established in January 2007 to provide container and customs inspection services, now offers supply chain, air freight, sea freight, transportation, and value-added logistics solutions from Magalieskruin.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-core-logistics-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Crane Media is a Rietvalleirand-based digital marketing and multi-media agency with over 10 years of experience, offering SEO, social media marketing, branding, video production, app and web development, and even VR/AR and NFT services on a subscription points-based system rather than hourly billing.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-crane-media-digital-marketing-multi-media-agency-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Crane Restaurant, next to the Austin Roberts Bird Sanctuary in Nieuw Muckleneuk, serves sushi, seafood, and steaks across settings including a tea garden for breakfast and afternoon tea, a Top Deck with African Mask Bar overlooking the sanctuary''s lakes, and a boma with bonfire seating, and hosts weddings and corporate functions.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-crane-restaurant-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Crane Storage is a self-storage business based in Koedoespoort Industrial, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-crane-storage-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Knight Estates is a boutique estate agency that has served the Pretoria Moot and surrounding areas since 2004, handling property sales, rentals, rental management, and free valuations.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-knight-estates-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Label Technology Solutions, based in Highveld, Centurion, provides cybersecurity services such as threat hunting and penetration testing alongside IT asset management and multi-cloud governance and compliance tools for South African organisations.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-label-technology-solutions-blue-valley-golf-estate' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'Blue Nile Consulting in Lyttelton offers cloud services including managed hosting, disaster recovery, and network security, alongside IT consultancy, business advisory, and systems integration services.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-nile-consulting-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Pea Marketing in Wingate Park offers graphic design, WordPress web design, SEO, content and email/WhatsApp marketing, and paid Google and social media advertising, with bundled service packages for clients on minimum three-month commitments.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-pea-marketing-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Point Technologies, operating since 2016 with a team drawing on over 25 years of combined engineering experience, provides electronic design and development, custom software, precision instrumentation, and turnkey automation and energy solutions.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-point-technologies-waverley' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Sands Projects is an estate agency operating in Hennopspark, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-sands-projects-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Sky Projects, based in La Montagne, builds new houses and factories and installs boundary walls, roofing, steel gates and burglar bars, CCTV, intercoms, electrical work, paving, tiling, palisade fencing, and gate motors.',
  source_urls = '["scraped:google-places-no-website", "https://www.pretoriaeast.co.za/business-directory/building-and-decor/603-blue-sky-projects"]',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-sky-projects-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Sky Solar Services, founded by Evert Botha, provides commercial, residential, retail, and industrial solar panel cleaning along with inspection and maintenance services, offered on once-off or retainer arrangements.',
  hours = 'Mon-Fri 08:00-17:00',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-sky-solar-services-clubview' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Stallion Holdings is an IT services company based in Meyerspark, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-stallion-holdings-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Valley Grocers is a supermarket serving the Blue Valley Golf Estate community in Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-valley-grocers-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Blue Web Technologies, based in Constantia Park with over 15 years in the IT industry, supports more than 330 active clients through IT outsourcing, networking, Microsoft Exchange email, cloud backup, web hosting, PBX/VoIP, and CCTV installation.',
  hours = 'Mon-Fri 08:00-17:00',
  description_enriched_at = datetime('now')
WHERE slug = 'blue-web-technologies-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bluebell Hospitality Services provides guesthouse and lodge management support, including a central reservations office, online listings management on platforms such as Booking.com and Expedia, and direct and social media marketing, delivered on a monthly retainer basis.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluebell-hospitality-services-blue-valley-golf-estate' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'BlueBird Holdings in Wierdapark offers PC upgrades and repairs, remote and onsite IT support, networking, VoIP, CCTV and security installations, home automation, graphic design, and solar installation services.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluebird-holdings-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BlueBirdSA is the retail arm of Bluebird Holdings, operating from the same Wierdapark premises to sell IT, telecommunications, and solar products directly to customers.',
  source_urls = '["scraped:google-places-no-website", "http://www.bluebirdholdings.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bluebirdsa-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bluecrystal Properties, based in Eldoraigne with 17 years of experience, sells and rents property primarily across Centurion and Pretoria, offering bond calculators and free valuations to clients as far afield as the coast.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluecrystal-properties-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bluehorn Quality and Management Systems is a business consulting firm based in Pierre van Ryneveld Park, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluehorn-quality-and-management-systems-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BlueICT (Pty) Ltd, with more than two decades of experience, provides voice, data, cloud, and networking solutions from Wonderboom, including VoIP and IP PBX telephony, enterprise networking, hosted cloud platforms, and network security, partnering with vendors such as Cisco, Microsoft, and VMware.',
  description_enriched_at = datetime('now')
WHERE slug = 'blueict-pty-ltd-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bluepepper24 is a printing services business based in Wingate Park, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluepepper24-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BluePrint Laundry Services'' Waverley branch is part of a South African laundry group offering personal, hotel, hospital, industrial, and bulk laundry services across nine branches nationwide.',
  description_enriched_at = datetime('now')
WHERE slug = 'blueprint-laundry-services-waverley-waverley' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BlueTech Security is a security services provider based in Thatchfield, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluetech-security-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bluline Chartered Business Accountants, established in 2021 and based in Boardwalk Office Park, Faerie Glen, provides accounting, tax, secretarial, and financial statement services with remote delivery to clients including doctors, lawyers, and mining and transport companies.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluline-chartered-business-accountants-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BluSwirl Recycling, founded in 2010 by Anton Bailey in Sunderland Ridge, provides eco-friendly waste management including garden refuse removal, on- and off-site sorting of paper, glass, plastic, and cans, e-waste disposal, and branded wheelie bins for commercial and private clients.',
  description_enriched_at = datetime('now')
WHERE slug = 'bluswirl-recycling-centurion-sunderland-ridge' AND description_enriched_at IS NULL;
UPDATE businesses SET
  description = 'BlyNet is a South African accommodation booking platform listing guest houses, lodges, and holiday homes, with customer support available daily.',
  hours = 'Daily 08:00-17:00',
  description_enriched_at = datetime('now')
WHERE slug = 'blynet-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bo Fire Maintenance Services, part of the Centa Group and started in 2011, is a SAQCC- and SABS-registered fire safety provider in Riviera supplying, installing, and maintaining fire equipment and evacuation signage, and conducting fire risk assessments.',
  hours = 'Mon-Thu 08:00-15:00, Fri 08:00-14:00',
  source_urls = '["http://bofiremaintenanceservices.co.za/", "https://www.yep.co.za/biz/store/bo-fire-maintenance-services-cc/656893"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bo-fire-maintenance-services-riviera' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Boardmans in Menlyn Park Shopping Centre is part of South Africa''s long-running homeware chain of over 25 stores, selling bed and bath, kitchen, entertaining, and lifestyle products.',
  source_urls = '["https://www.openstreetmap.org/node/288565623", "https://www.boardmans.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'boardmans-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Boardwalk Lakeside is a retail park within the Boardwalk precinct in Pretoria East, offering customisable retail spaces from 120 sqm alongside restaurants overlooking a dam, a Virgin Active gym, and landscaped common areas.',
  description_enriched_at = datetime('now')
WHERE slug = 'boardwalk-lakeside-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Boardwalk Manor Security Estate in Faerie Glen is one of the Boardwalk Estates built along the Tweefontein Spruit, featuring access control, electrified perimeter security, a tennis court, squash court, pool, and children''s play area, and adjoining the Boardwalk Bird Sanctuary.',
  source_urls = '["http://www.mtresidential.co.za/residential/view/estate/26", "https://www.privateproperty.co.za/advice/lifestyle/articles/a-guide-to-the-boardwalk-estates-pretoria/5988"]',
  description_enriched_at = datetime('now')
WHERE slug = 'boardwalk-manor-security-estate-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Boaz Creative Solutions is a business consulting firm based in Akasia, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'boaz-creative-solutions-akasia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'BoB Cloud Inventory, based in Olympus, provides an affordable cloud-hosted barcoding and warehouse inventory control system with standard integrations for Sage 200 Evolution, Sage Intacct, Sage One, and WooCommerce.',
  source_urls = '["http://cloudinventory.co.za/", "https://www.strategico.co.za/bob-cloud-inventory/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'bob-cloud-inventory-olympus' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bocasize (Pty) Ltd trades as Boxfresh Technologies, providing fibre and wireless internet, VoIP and hosted PBX telecom systems, CCTV and biometric access control, and office printer and copier solutions.',
  description_enriched_at = datetime('now')
WHERE slug = 'bocasize-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bodibe Ba Thaba is an investment and consulting company in Philip Nel Park focused on food franchising, fashion retail, property development, and business consulting, offering capital raising, strategic planning, and entrepreneurial development support.',
  hours = 'Mon-Sat 10:00-19:30',
  description_enriched_at = datetime('now')
WHERE slug = 'bodibe-ba-thaba-philip-nel-park' AND description_enriched_at IS NULL;

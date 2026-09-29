-- Slice 39 description-enrichment sweep (job 4)
-- Businesses: vaporiz-vapelounge-wierdapark .. villarani-govender-attorneys-inc-heuwelsig-estate

UPDATE businesses
SET description = 'Vaporiz - Vapelounge is a vape shop and lounge in Wierda 2 Shopping Centre, Wierdapark, stocking a range of local e-liquid flavours and vaping hardware, with a lounge area offering free wifi for customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://vapestores.co.za/za/gauteng/centurion/vaporiz-vape-lounge-wierdapark-centurion-gauteng", "https://www.vaporiz-vapelounge.com/contact-us/", "https://pretoria.co.za/listing/vaporiz-vape-lounge/"]'
WHERE slug = 'vaporiz-vapelounge-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Variable is an IT services and managed-technology company offering web hosting, cloud backup, managed IT services, web application development, SEO and social media services, positioning itself as a long-term technology partner for its clients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00'
WHERE slug = 'variable-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VariableWatch develops process-automation software for cold chain management in pharmaceutical and food distribution, as well as mine ventilation monitoring, with products including Temp Watch, Enviro Watch and Vent Sentry.',
    description_enriched_at = datetime('now')
WHERE slug = 'variablewatch-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vassco Distributors is a wholesale supplier to the hospitality industry in Gauteng, distributing spirits, wines, beers and soft drinks, frozen and grocery food products, and kitchenware, tableware and packaging supplies to restaurants and caterers, with deliveries Monday to Saturday.',
    description_enriched_at = datetime('now')
WHERE slug = 'vassco-distributors-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vavro Plastics is a Rosslyn manufacturer of custom PVC and polypropylene products established in 1960, producing ring binders, folders, document holders, travel wallets and packaging that can be branded with silkscreen printing, embossing or encapsulation for the promotional, printing and stationery industries.',
    description_enriched_at = datetime('now')
WHERE slug = 'vavro-plastics-cc-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vayetze Accountants is a Villieria accounting firm offering bookkeeping, business start-up assistance, financial management, taxation and human resources services to individuals and businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.vayetze.co.za/"]'
WHERE slug = 'vayetze-accountants-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vectorox is an IT services provider in Pierre van Ryneveld Park offering business connectivity, telecoms, managed IT support, security systems, networking, hardware sales, print and document management, backup power and audio-visual solutions as a single-provider technology partner, founded in 2011 and serving over 500 businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'vectorox-pty-ltd-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vectra Business Technologies, based at Fintech Campus in Die Wilgers, provides bespoke eCommerce and retail technology solutions, from strategy through to execution.',
    description_enriched_at = datetime('now')
WHERE slug = 'vectra-business-technologies-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Velocity Accounting Pretoria is a Waterkloof Glen accounting firm offering accounting, tax and automation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'velocity-accounting-pretoria-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Velomah (Pty) Ltd is a software development company operating from Riverwalk in Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'velomah-pty-ltd-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Velvopoint is a business management consultancy operating from Rooiwal Street in Wonderboom, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "http://velvopoint.co.za/"]'
WHERE slug = 'velvopoint-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venaquila is a business consulting firm operating in Glen Lauriston, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'venaquila-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VennCap Business Solutions is a business consulting and funding platform based in Olympus, Pretoria, connecting entrepreneurs at various stages of the business lifecycle, from early-stage to exit, with investors through funding programmes and an investor services portal.',
    description_enriched_at = datetime('now')
WHERE slug = 'venncap-business-solutions-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venter & Hagerman Inc is an Alphen Park law firm and firm of conveyancers specialising in RAF and medical negligence claims, personal injury, deceased estates and law of contract, also assisting with wills, trusts, property transfers and divorce proceedings.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.brabys.com/za/gauteng/pretoria/alphen-park/conveyancers/venter-hagerman-inc"]'
WHERE slug = 'venter-hagerman-inc-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venter Architecture is an architecture and design business operating in Dorandia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'venter-architecture-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venter Consulting Engineers is a precision-engineering firm in Lyttelton Manor, Centurion, working across turbo machinery, gear technology, general heavy-industrial engineering and precision CNC manufacturing, with services including structural and vibration analysis, computational fluid dynamics and 3D dimensional inspection for the power generation, mining, aerospace and petrochemical industries.',
    description_enriched_at = datetime('now')
WHERE slug = 'venter-consulting-engineers-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venter IT Services is a Moregloed-based IT support provider for home users and small businesses, offering managed IT services covering remote monitoring, endpoint protection, cloud backup and priority support, plus standalone ESET security, Backblaze cloud backup and website design and maintenance.',
    description_enriched_at = datetime('now')
WHERE slug = 'venter-it-services-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venter and Geldenhuys Inc. is an Erasmusrand law firm specialising in commercial law and business litigation, also practising family law, criminal law, business rescue, personal injury, labour law and insolvency law across the High Court and Magistrates'' Court.',
    description_enriched_at = datetime('now')
WHERE slug = 'venter-and-geldenhuys-inc-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venter en Kie Ouditeure is a Waverley accounting and auditing firm founded in the early 1980s, now associated with The Core Group network of independent accounting practices.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing/venter-en-kie-ouditeure/"]'
WHERE slug = 'venter-en-kie-ouditeure-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ventuos (Pty) Ltd. is a business consulting firm based in Grootfontein Country Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ventuos-pty-ltd-grootfontein-country-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venture Graphix is a Zwavelpoort-based vehicle-branding specialist operating since 1991, producing custom vinyl wraps and truck, van and fleet branding in-house, including digital printing, lamination and vinyl-cutting, followed by on-site installation at client premises.',
    description_enriched_at = datetime('now')
WHERE slug = 'venture-graphix-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venue Nouveau is a wedding and events venue in Zwavelpoort set against the Bronberg mountains, offering a modern bohemian-chic, eco-conscious setting with indoor and outdoor ceremony and reception spaces, on-site guest accommodation, and a pet-friendly policy welcoming dogs at weddings.',
    description_enriched_at = datetime('now')
WHERE slug = 'venue-nouveau-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VerdanTech is a Die Wilgers-based digital marketing agency offering brand development, social media and paid advertising, website and e-commerce development, lead generation, graphic design and video production, plus AI-driven marketing automation, for both B2B and B2C clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'verdantech-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vergeet My Nie Verhurings is an Eldoraigne event-hire business with over 30 years of experience, supplying decor, furniture, table settings and backdrops for weddings, birthdays and year-end functions, and offering custom laser-cut signage and table numbers.',
    description_enriched_at = datetime('now')
WHERE slug = 'vergeet-my-nie-verhurings-bk-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VerifyID is a business consulting business in Midfields Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'verifyid-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Verimark Wonderpark is a branch of the Verimark retail chain in Wonderpark Shopping Centre, selling vacuums, mops and brooms, kitchen appliances and cookware, fitness equipment, beauty devices, and DIY, outdoor and toy products under the brand''s "Quality innovations, guaranteed" promise.',
    description_enriched_at = datetime('now')
WHERE slug = 'verimark-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Verita Brand is a custom set design and building company in Weavind Park, Pretoria, specialising in set building and installation for film, television, theatre and events, alongside audio-visual work and renovation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'verita-brand-set-building-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Veritas Rekenmeesters is a Doringkloof accounting firm serving small and medium businesses, companies, close corporations, trusts, sole proprietors and individuals with income tax compliance, bookkeeping, and corporate secretarial services such as company registration updates.',
    description_enriched_at = datetime('now')
WHERE slug = 'veritas-rekenmeesters-accountants-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vermaak Attorneys is a multi-city South African law firm with a Centurion office in Kloofsig, practising municipal law, property law, commercial law, criminal law, insolvency law, civil litigation, labour law and alternative dispute resolution, with over 22 years of combined experience.',
    description_enriched_at = datetime('now')
WHERE slug = 'vermaak-attorneys-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Versochron is an engineering and surveying business based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'versochron-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vertex Automation is a Weavind Park industrial-automation integrator that designs, fabricates and installs custom conveyor systems, Fanuc robotics for pick-and-place and palletising, and complete automated production lines with PLC, HMI and control-system integration for manufacturing, automotive, food and beverage, packaging and pharmaceutical clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'vertex-automation-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vetceuticals Veterinary Wholesaler distributes veterinary pharmaceuticals and animal-health products from Roodeplaat for small-scale livestock farmers, stocking small animal, equine, cattle, sheep, pig and poultry lines from brands including Zoetis, Virbac, MSD Animal Health, Bayer, Boehringer Ingelheim and Elanco.',
    description_enriched_at = datetime('now')
WHERE slug = 'vetceuticals-veterinary-wholesaler-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Veterinary Business Services is a business in the vets and animal care category, based in Wierdapark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'veterinary-business-services-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vetkoek Maleis - Zambezi is a takeaway restaurant in Club Gables Shopping Centre, Annlin, known for its chicken dishes and offering brunch, lunch and dinner for eat-in and takeaway.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mrdfood.com/food-delivery/restaurant/vetkoek-maleis-zambezi-annlin/25733", "https://www.brabys.com/business/5989019/south-africa/gauteng/pretoria/montana/restaurants-takeaways/vetkoek-maleis-zambezi", "https://pretoria.co.za/listing/vetkoek-maleis-zambezi/"]'
WHERE slug = 'vetkoek-maleis-zambezi-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VetsMart Lynnwood Bridge is a branch of the VetsMart national pet-retail chain, founded in 2004 by two veterinarians, stocking premium and super-premium pet food, toys, treats, grooming products, pharmacy items and accessories at Lynnwood Bridge Retail Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'vetsmart-lynnwood-bridge-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vetz Direct is a pet shop in Sinoville Corner Shopping Centre selling pet food, medication, toys and accessories, with staff who provide personal care and advice for each pet.',
    description_enriched_at = datetime('now')
WHERE slug = 'vetz-direct-sinoville-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vharanani Boitshoko JV site Camp is a construction site camp in Annlin West for a joint-venture project linked to the Vharanani Group, a black-owned South African holding company operating in construction, civil engineering and architecture.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://za.africabz.com/gauteng/vharanani-boitshoko-jv-site-camp-152743"]'
WHERE slug = 'vharanani-boitshoko-jv-site-camp-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vhathu Marketing and Communication is a marketing and advertising business based in Amandasig, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'vhathu-marketing-and-communication-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vianto Property Management is a family-run property business in Dorandia, Pretoria North, with more than 17 years in the industry, offering property sales, rentals, letting management, and maintenance and rent-collection services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://doornpoort.co.za/vianto-property-management/"]'
WHERE slug = 'vianto-property-management-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vibro Bricks and Paving PTA East has manufactured and supplied concrete bricks, kerbs and paving for 24 years, offering cobble, bevel and interlocking pavers, blocks and retaining wall systems for domestic, industrial and decorative construction projects from its Zwavelpoort plant.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.vibro.co.za/about-us/"]'
WHERE slug = 'vibro-bricks-and-paving-pta-east-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vicicon Property Development (Pty) Ltd is a commercial property and office-space business based in Kameeldrift, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vicicon-property-development-pty-ltd-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Victor Mabe Incorporated Attorneys is an independent Eloffsdal law firm practising family law, estate planning, civil, criminal and commercial litigation, labour law, personal injury, medical negligence and debt collection.',
    description_enriched_at = datetime('now')
WHERE slug = 'victor-mabe-incorporated-attorneys-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Victoria Hotel is Pretoria''s oldest operating hotel, established in 1894 on Scheiding Street in the CBD, with individually named heritage rooms, a banquet hall, a conference hall, and a dining room serving breakfast and lunch buffets alongside a small pub.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/6585742760", "https://en.planetofhotels.com/south-africa/pretoria/victoria-hotel"]'
WHERE slug = 'victoria-hotel-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vida Health & Wellness Centre in Roseville offers complementary and alternative healthcare with individually tailored physical and emotional health treatments, along with wellness training programmes and an online shop.',
    description_enriched_at = datetime('now')
WHERE slug = 'vida-health-wellness-centre-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VideoView is a Rooihuiskraal video-production and performance-marketing agency, producing on-site video shoots for corporate events, product launches and festivals and running Facebook, Instagram and Google video-ad campaigns for clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'videoview-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'View World Studios is a Meyerspark photography and videography studio offering wedding photography and cinematic videography across Gauteng, Limpopo, North West and Mpumalanga, along with engagement shoots, kids'' birthday photography, maternity sessions, matric dance and graduation portraits, and corporate event coverage.',
    description_enriched_at = datetime('now')
WHERE slug = 'view-world-studios-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vilbert IT is a software development and IT services business based in Villieria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vilbert-it-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Villa Veroz Spa (also known as Verozki Spa) is a day spa in Florauna offering massage and spa treatments by appointment, part of the Veroz Boutique Hotel brand, with bookings essential.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Thu 09:00-19:00, Fri-Sat 09:00-20:00, Sun 09:00-16:00, Mon Closed',
    source_urls = '["https://www.facebook.com/spaverozki/", "https://www.thespaguide.co.za/listing/pretoria/spa/verozki-hair-spa/", "https://www.beautynailhairsalons.com/ZA/Pretoria/146189328844993/Verozki-Spa-Page"]'
WHERE slug = 'villa-veroz-spa-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Village Flavour is a Sunnyside restaurant and takeaway serving authentic African cuisine and organic home-made food, including fish, steaks and chicken, with space for parties and private events and free on-site parking.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1482557142683648/village-flavour/pretoria/foods", "https://www.mrdfood.com/food-delivery/restaurant/village-flavour-sunnyside-sunnyside/20603", "https://pretoria.co.za/place/village-flavour"]'
WHERE slug = 'village-flavour-sunnyside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Villarani Govender Attorneys Inc is a Centurion law firm at Heuwelsig Office Park specialising in personal injury litigation, including road accident, municipal negligence and medical negligence claims, insurance subrogation recoveries, and mediation, with experience serving as a Contract Adjudicator for the National Financial Ombud Scheme.',
    description_enriched_at = datetime('now')
WHERE slug = 'villarani-govender-attorneys-inc-heuwelsig-estate' AND description_enriched_at IS NULL;

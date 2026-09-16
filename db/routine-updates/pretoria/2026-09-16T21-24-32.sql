UPDATE businesses
SET
    description = 'Fumo is a classic Italian restaurant in Groenkloof known for its pizza and pasta, offering breakfast through dinner with a curated selection of wine and cocktails, plus dine-in, takeaway and delivery options.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 11:00-21:00',
    source_urls = '["https://fumo.co.za/contact/", "https://www.eatout.co.za/venue/fumo-restaurant/", "https://evendo.com/locations/south-africa/pretoria/restaurant/fumo", "https://www.tripadvisor.com/ShowUserReviews-g312583-d2262136-r202947246-Fumo-Pretoria_Gauteng.html"]'
WHERE slug = 'fumo-groenkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Groenkloof Slaghuis is a butchery specialising in traditional South African favourites like wors and biltong alongside specialty cuts, with in-store pickup and card payments accepted.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/10106066_2", "https://southafricafirm.com/gauteng/groenkloof-slaghuis-butchery-17096", "https://pretoria.co.za/place/groenkloof-slaghuis-butchery"]'
WHERE slug = 'groenkloof-slaghuis-groenkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Juniper Green Health is a natural health centre offering alternative therapies such as acupressure massage, herbalism and Electro Resonance Therapy delivered via transducer lamps, positioned as a complement to conventional medicine.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://vymaps.com/ZA/Juniper-Green-Health-Sanctuary-118886515178170/", "https://sahealthguide.co.za/juniper-green-health", "https://za.top10place.com/juniper-green-health-sanctuary-1457897118.html"]'
WHERE slug = 'juniper-green-health-grootfontein-country-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lungile Solutions Ltd is a marketing and advertising company based in Heatherview, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lungile-solutions-ltd-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lungisa P. Consultancy (Pty) Ltd. is a business consulting firm based in Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lungisa-p-consultancy-pty-ltd-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lunigraph Studio is a marketing and advertising studio based in Villieria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lunigraph-studio-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lunise Engineering (Pty) Ltd is an industrial supplier and manufacturer based in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lunise-engineering-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luova Business Consulting is a business consulting firm based in Lynnwood Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'luova-business-consulting-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lupus Consulting is a business consulting firm based in Claudius, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lupus-consulting-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luron Technology is an electronics and appliances retailer based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'luron-technology-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luruma Events, a division of Luruma Group, is an events and function-venue business based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'luruma-events-a-division-of-luruma-group-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luruma Property Management handles commercial property and office space in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'luruma-property-management-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lush Champagne Wall Hire offers luxury champagne wall rentals for events, with stands available in 58-glass and 100-glass configurations to suit different event sizes.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://take.app/lushchampagnewallhire"]'
WHERE slug = 'lush-champagne-wall-hire-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lutsala Group Of Companies (Pty) Ltd is an industrial supplier and manufacturer based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lutsala-group-of-companies-pty-ltd-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luv A Cup is an upmarket coffee shop with a relaxed, therapeutic atmosphere, serving freshly prepared food and freshly brewed coffee; it also showcases handmade crafts from around the country and can be booked out after hours for private events and catering.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312583-d10322300-Reviews-Luv_A_Cup-Pretoria_Gauteng.html", "https://best-hotels-near.com/hotel-details/luv-a-cup-rossouwstreet-374-rubida-park-shopping-center-shop-number-5-rossouwstreet-374-murrayfield-pretoria-0184-south-africa", "https://www.eatout.co.za/venue/luv-a-cup/", "https://www.sluurpy.co.za/pretoria/restaurant/5038804/luv-a-cup-coffee-shop"]'
WHERE slug = 'luv-a-cup-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luvarre is a furniture studio in Koedoespoort known for unorthodox, experimental furniture design.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/luvarre/"]'
WHERE slug = 'luvarre-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'LuxLiv Property Group is an estate agency specialising in golf-estate properties across Centurion, including Centurion Golf Estate, Blue Valley Golf Estate and Copperleaf Golf & Country Estate, handling sales, rentals and market valuations.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.luxlivproperty.com/", "https://www.luxlivproperty.com/properties-in-centurion"]'
WHERE slug = 'luxliv-property-group-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luxman Upholstery restores and reupholsters furniture and vehicle interiors, handling everything from antique furniture restoration to modern furnishings and auto upholstery, and serves customers across Pretoria East, Centurion and surrounding suburbs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.luxmanupholstery.co.za/", "https://magicpin.com/south-africa/Eersterust/Eersterust/Other/Luxman-Upholstery/store/2885696"]'
WHERE slug = 'luxman-upholstery-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luxurious Wendy Houses & Log Cabins-Pretoria builds bespoke wendy houses and log cabins using high-quality materials, offering custom designs to suit each customer''s garden space.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://wendyhouses.co.za/places/luxurious-wendy-houses-log-cabins-pretoria/"]'
WHERE slug = 'luxurious-wendy-houses-log-cabins-pretoria-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Luxury Time is a watch retailer known for quick, professional service, with customers reporting satisfaction with their watch purchases.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://luxurytime.co.za/", "https://za.africabz.com/gauteng/luxury-time-349608"]'
WHERE slug = 'luxury-time-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'LvA Consulting Services provides tax and accounting support for individuals, companies and close corporations, including provisional tax and VAT submissions, tax clearance applications and SARS liaison, alongside monthly accounting and payroll services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://lvaconsulting.co.za/", "https://www.lvaconsulting.co.za/index.html", "https://www.publicads.co.za/services/lva-consulting-services"]'
WHERE slug = 'lva-consulting-services-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A marketing and advertising business based in Hazeldean, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lwandzi-investments-pty-ltd-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'An industrial supplier based in Route 21 Corporate Park, Irene Extension 30, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'lymae-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lynne''s Wedding Services offers non-denominational marriage-officer and pastoral services for weddings of all sizes, including legal ceremonies, christenings and bilingual (Afrikaans/English) ceremonies at venues across South Africa. Previously trading as ''Weddings with a Difference,'' the business was a Gold Winner at the 2010 SABIA Vow Awards in the Marriage Celebrants category.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.saweddings.co.za/event-planning-17/marriage-officers-33/lynnes-wedding-services", "https://showme.co.za/pretoria/lifestyle/lynnes-wedding-service/", "https://www.myidoz.co.za/profile/lynne-s-wedding-services", "https://pretoria.co.za/place/lynnes-wedding-services"]'
WHERE slug = 'lynne-s-wedding-services-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lynnridge Timbers, established in 2001, is a family-owned wholesaler and retailer of timber products including gum poles, thatching laths, structural and rough-sawn pine, fencing material, decking and timber treatment products, marketing itself as ''Gauteng''s Timber Source.''',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat mornings',
    source_urls = '["http://www.lynnridgetimbers.co.za/", "https://www.brabys.com/za/gauteng/pretoria/zwavelpoort/timber-merchants/lynnridge-timbers", "https://sabusinesslistings.co.za/listings/lynnridge-timbers/"]'
WHERE slug = 'lynnridge-timbers-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lynnwood Law Offices provides fully furnished serviced office space for practising attorneys in Lynnwood, including boardrooms, a legal library, Docex facilities, reception services and secure parking, letting tenant lawyers focus on legal work rather than office administration.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://lawoffices.co.za/", "https://lawoffices.co.za/lynnwood-law-offices/", "https://lawoffices.co.za/contact-lynnwood-law-offices/"]'
WHERE slug = 'lynnwood-law-offices-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lynx Accounting offers accounting, taxation, business advisory and payroll services, with a particular specialisation in international tax matters affecting non-domiciled, dual-resident and expatriate taxpayers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.lynxaccounting.co.za/", "https://www.procompare.co.za/providers/lynx-accounting"]'
WHERE slug = 'lynx-accounting-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lynx Real Estate is a property development company founded in 2016, drawing on around 50 years of combined joint-venture experience to source and execute property development projects, with a core focus on convenience retail centres anchored by strong national tenants.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.lynx-re.co.za/lynx-real-estate-contact", "https://www.lynx-re.co.za/buildings/lynnwood-lane", "https://www.lynx-re.co.za/lynx-real-estate-property-management"]'
WHERE slug = 'lynx-real-estate-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttelton Autobody is a SAMBRA-approved panel-beating and spray-painting workshop in Lyttelton Manor, fully equipped for auto and commercial body repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://panelbeatersdirectory.co.za/listing.php?listings_id=1697", "https://www.thinklocal.co.za/biz/lyttelton-auto-body-centurion"]'
WHERE slug = 'lyttelton-autobody-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttelton Electronic Development is an electronics store in Lyttelton Manor offering gadgets, accessories and home entertainment systems, with staff on hand to advise on smartphones, laptops and other tech needs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00',
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/lyttelton-electronic-development"]'
WHERE slug = 'lyttelton-electronic-development-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttelton Engravers has operated for more than 10 years, offering laser engraving and precision-crafted trophies, medals, plaques and corporate gifts, as well as custom name tags, Perspex displays and rubber stamps.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.lyttelengravers.co.za/", "https://lytteltonengravers.co.za/"]'
WHERE slug = 'lyttelton-engravers-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttelton Firearm Training Centre is an SAPS-accredited training provider offering the proficiency courses required to apply for a SAPS competency certificate, covering handguns, shotguns and rifles for both personal and business licensing purposes.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.lftc.co.za/", "https://www.guncommunity.co.za/listing/lyttelton-firearm-training-centre/"]'
WHERE slug = 'lyttelton-firearm-training-centre-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttelton Fresh Produce Housewives Market has been trading fresh fruit and vegetables in Lyttelton Manor since 1965, also stocking daily essentials and deli items with delivery available seven days a week.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 07:30-18:30, Sun 07:30-14:00',
    source_urls = '["scraped:google-places-no-website", "https://opening-hours.co.za/02178680/Lyttelton_Fresh_Produce_Housewives_Market", "https://www.facebook.com/LytteltonFreshProduce/"]'
WHERE slug = 'lyttelton-fresh-produce-housewives-market-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttelton Furniture & Pawn Shop is a family-owned business in Lyttelton Manor that buys and sells new and second-hand furniture, with delivery and packaging available.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.pawnshopmap.com/en/l/lyttelton-furniture-pawn-shop-82779c4f"]'
WHERE slug = 'lyttelton-furniture-pawn-shop-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttelton Furniture & Pawn Shop is a family-owned business in Lyttelton Manor that buys and sells new and second-hand furniture, with delivery and packaging available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cylex.net.za/company/lyttelton-furniture---pawn-shop-23738720.html", "https://www.thinklocal.co.za/biz/lyttelton-pawn-shop-centurion", "https://www.brabys.com/za/gauteng/centurion/lyttelton/pawnbrokers/lyttelton-pawn-shop", "https://www.pawnshopmap.com/en/l/lyttelton-furniture-pawn-shop-82779c4f"]'
WHERE slug = 'lyttelton-furniture-pawn-shop-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Lyttleton Mining Supplies CC designs and supplies engineering solutions in material handling and power transmission to mines and industry, offering engineering consultation and holding a Level 1 BBBEE rating.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["http://lytteltonminingsupplies.co.za/contact.asp", "https://www.brabys.com/za/gauteng/centurion/zwartkop/mining-equipment-supplies/lyttelton-mining-supplies-cc", "https://m2north.com/companies/lytteltonmining/headoffice"]'
WHERE slug = 'lyttleton-mining-supplies-c-c-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'An estate agency based in Wapadrand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'l-tter-realty-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A tree felling and construction business based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-l-tree-felling-construction-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'An engineering and surveying business based in Heritage Hill Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-and-t-cut-and-seal-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MCB Design, trading as Breazy, specialises in large-format digital printing on PVC, vinyl, polyester cloth and paper, producing exhibition and advertising materials plus branded gazebos, flags and rollup banners with quick turnaround.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.mcbdesign.co.za/about-us/", "https://www.mcbdesign.co.za/branded-gazebos-landing-page/"]'
WHERE slug = 'm-c-b-design-breazy-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M C R Manufacturing Co (Pty) Ltd is a mechanical engineering business based in Rosslyn, an industrial suburb of Pretoria known for its vehicle manufacturing plants.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mcrmanufacturing.co.za/", "https://www.brabys.com/za/gauteng/pretoria/rosslyn/engineers-mechanical/m-c-r-manufacturing-co-pty-ltd"]'
WHERE slug = 'm-c-r-manufacturing-co-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A marketing and advertising business based in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-dm-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'An insurance business based in Villieria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-n-h-management-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M P S ceiling drywall and painting is a painting and drywall contractor serving Eloffsdal, offering interior and exterior house painting, roof painting and ceiling and drywall installation.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/m-p-s-ceiling-drywall-and-painting"]'
WHERE slug = 'm-p-s-ceiling-drywall-and-painting-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M Productions is an event technical production company operating out of Lyttelton, Centurion, providing sound, lighting design and overall technical setup for events.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mproductions.co.za/", "https://pretoria.co.za/place/m-productions", "https://pretoria.co.za/listing/m-productions/"]'
WHERE slug = 'm-productions-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A logistics, courier and transport company based in Clydesdale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-s-c-logistics-pty-ltd-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A signage business specialising in neon signs, based in Hesteapark, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'm-t-a-neon-signs-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M TECH Training Consultants is a SETA-accredited training provider in Wapadrand with over nine years in the industry, offering courses in First Aid, Firefighting, Occupational Health & Safety, safety representative training, evacuation training and forklift training.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mtechtraining.co.za/", "https://www.mtechtraining.co.za/about-us/", "https://www.hotfrog.co.za/company/1099860812980224/m-tech-training-consultants/pretoria/consultants"]'
WHERE slug = 'm-tech-training-consultants-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M V Makelaars CC is a small insurance brokerage that has operated from Woodhill Golf Estate since 1997, offering personalised broking services to clients in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://za.linkedin.com/company/mv-makelaars-brokers"]'
WHERE slug = 'm-v-makelaars-cc-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M and N Acoustic Services is a SANAS-accredited calibration laboratory in Pierre van Ryneveld Park specialising in acoustics, vibration and human-vibration testing, including calibration of equipment used for vibration analysis on aircraft engines, with clients across South Africa and neighbouring African countries.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellowpages.co.za/business/15987027_4", "https://www.hotfrog.co.za/company/60d19d1929f36b5917430cf5ac547b4e/m-n-acoustic-service-pty-ltd/pierre-van-ryneveld/manufacturing"]'
WHERE slug = 'm-and-n-acoustic-services-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A logistics, courier and transport company operating from Thatchfield Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-m-logistics-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M&M Projects is a building and construction business based in Waterkloof Glen, Pretoria, focusing on roof structures and design, gate automation and bathroom refurbishments.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://m-m-projects.co.za/", "https://www.facebook.com/people/MM-Projects/100084245044458/"]'
WHERE slug = 'm-m-projects-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'An automotive repair business based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-r-automotive-services-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A security services business specialising in electrical gate installation, based in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-r-electrical-gates-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A business consulting firm based in Queenswood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'm-sworld-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M2 Design and Manufacturing is a signage and branding company that has operated from Silverton for 25 years, producing graphic design, sign writing, billboards, flags and banners, corporate identity design and vehicle branding for clients across South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://m2design.co.za/", "https://www.pretoriaeast.co.za/business-directory/advertising-and-branding/444-m2-design-manufacturing"]'
WHERE slug = 'm2-design-and-manufacturing-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M2TD Consulting is a Centurion-based IT firm, founded in 2009, specialising in end-to-end data centre solutions including backup and recovery, data storage, and network and information security services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.ampliz.com/company/m2td-consulting/82815461", "https://craft.co/m2td-consulting"]'
WHERE slug = 'm2td-consulting-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M3LST Manufacturing and Engineering is a Rosslyn-based turnkey manufacturing and engineering firm whose team brings a combined more than 40 years of industry experience to projects for customers in the manufacturing sector.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/m3lst-manufacturing-engineering"]'
WHERE slug = 'm3lst-manufacturing-and-engineering-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'M88 Agency is a web design company based in Eldorette, Pretoria, focused on helping clients grow their online presence.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/m88agency/"]'
WHERE slug = 'm88-agency-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'A property valuation and consulting business based in Erasmia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mac-valuations-consultants-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAD IT TECH offers home office and business IT setup, general IT support, process design and mapping, website development and management, and e-commerce solutions to clients in Rietvalleirand and the wider Pretoria area.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://madittech.solutions/", "https://www.facebook.com/MadITTechSolutions/"]'
WHERE slug = 'mad-it-tech-pty-ltd-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MADEMBE ICT is an electrician serving the Brooklands Lifestyle Estate area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'madembe-ict-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAHKZ is an accounting firm based in Erasmia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mahkz-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Mahuma Group is a multidisciplinary media and communications company that has operated since 2005, offering theatre, video, multimedia, printing, corporate clothing and gifts, and events management services, with an additional office in Polokwane, Limpopo.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mahuma.co.za/", "https://www.mahuma.co.za/about-us/"]'
WHERE slug = 'mahuma-group-pty-ltd-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAJOCE SHOPFITTERS is an industrial supplier and shopfitting business based in Klerksoord, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'majoce-shopfitters-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAKZURA is an industrial supplies business based in Thatchfield Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'makzura-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAN is a car dealership serving the Bronberrik area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'man-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MANASE INVESTEMENTS is a building and construction contractor based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'manase-investements-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MANCOSA Pretoria is a higher-education institution offering management studies from its campus in the Bronberrik area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mancosa-pretoria-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MANZI Water Pretoria is a water supply business offering water refills and dispensers in Elardus Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'manzi-water-pretoria-elardus-park-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAPO is a software development company based in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mapo-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAREE INCORPORATED is an accounting firm based in Zwartkop, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'maree-incorporated-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Mario Motors and Spare Parts opened in 2021 at its Mayville address, specializing in stripping vehicles for parts as well as buying and selling used cars, batteries and spares, with the aim of bringing affordable, personal-touch automotive service to Pretoria motorists.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:20, Sat 08:30-14:00',
    source_urls = '["https://mariomotorspares.co.za/", "https://www.instagram.com/mariomotorsandspares/"]'
WHERE slug = 'mario-motors-and-spare-parts-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MASHABAALLDONE PTY LTD is a commercial property and office space provider based in Olievenhoutbosch, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mashabaalldone-pty-ltd-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MASHEGO MV ATTORNEYS is an attorney and legal services firm based in Willow Park Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mashego-mv-attorneys-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MASHIANE''S DRY CLEAN is a dry cleaning service based in Leeuwfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mashiane-s-dry-clean-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MATEAC is a BBBEE Level 1, 100% Black-owned engineering and training consultancy in Wonderboom South, specializing in electrical, automation and mining expertise, with a focus on employing and upskilling local community members.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mateac.co.za/", "https://electrician.org.za/electricians/gauteng/wonderboom/mateac-pty-ltd/"]'
WHERE slug = 'mateac-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MATHEBULA MF ATTORNEYS INC, founded by a young admitted attorney of the High Court of South Africa, offers services spanning labour, corporate, commercial and immigration law as well as conveyancing, family law and divorce matters from its Thatch Hill Estate office in Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mfminc.co.za/", "https://www.procompare.co.za/providers/mf-mathebula-attorneys-inc"]'
WHERE slug = 'mathebula-mf-attorneys-inc-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'Matla Construction serves the greater Pretoria area, planning and constructing turnkey residential and commercial property developments from its base in Die Wilgers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://matlaconstruction.org/", "https://www.matlaconstruction.org/"]'
WHERE slug = 'matla-construction-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MATSEKE ATTORNEYS is an attorney and legal services firm based in Les Marais, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'matseke-attorneys-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MATSHOGA SECURITY SERVICES & VIP PROTECTION is a Pretoria-based security firm offering armed response along with industrial, residential and retail guarding, tailoring protection strategies to each client''s specific needs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.matshogasecurityservices.com/", "https://www.facebook.com/matshogasecure/"]'
WHERE slug = 'matshoga-security-services-vip-protection-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAX REMOVAL 247 PTY LTD offers cleaning services to homes and businesses in Leeuwfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'max-removal-247-pty-ltd-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAX WENDY HOMES provides building and construction services in Wolmer, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'max-wendy-homes-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MAZANA is a business consulting firm based in Tijger Valley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mazana-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MB Agency is a marketing and advertising agency based in Heatherdale, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'mb-agency-heatherdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MB Floors provides flooring and building-related construction services in Thatchfield Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mb-floors-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MB Mechanical offers automotive repair services in Derdepoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mb-mechanical-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MBG Media is a full-service digital agency operating from the Silverton/Derdepoort area of Pretoria, offering responsive web design, graphic design and branding services, and has built over 150 websites for its clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mbgmedia.co.za/", "https://mbgmedia.co.za/", "https://www.cylex.net.za/company/mbg-media-23751866.html"]'
WHERE slug = 'mbg-media-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MBSS is a marketing and advertising business based in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mbss-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MBT Alphen Park is a filling station at the corner of Selati Street in Alphen Park, incorporated in January 2017, offering diesel fuel along with a wheelchair-accessible entrance and toilet facilities.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/mbtalphenpark", "https://www.fueldirectory.co.za/listing.php?listings_id=4612", "https://b2bhint.com/en/company/za/mbt-alphen-park--K2017018727"]'
WHERE slug = 'mbt-alphen-park-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MBT Derdepoort is a 24-hour fuel station in East Lynne offering ULP93 and ULP95 petrol as well as 50ppm and 10ppm diesel, with an on-site Buzzcafe convenience store.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["http://www.mbtpetroleum.co.za/", "https://www.facebook.com/mbtderdepoort/"]'
WHERE slug = 'mbt-derdepoort-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MBits is a business consulting firm based in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mbits-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC Business Services is an accounting firm serving clients in Midfields Estate, Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'mc-business-services-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC Design & Contracting is an industrial engineering company established in 1990, specializing in industrial facilities, piping systems and electrical automation for the automotive, chemical, food and beverage, and pharmaceutical industries, with a branch office in Rosslyn, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mcdesign.co.za/", "https://www.zoominfo.com/c/mc-design--contracting/372885122", "https://za.linkedin.com/company/mc-design-&-contracting"]'
WHERE slug = 'mc-design-contracting-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC HYGIENE SERVICES provides cleaning and hygiene services to homes and businesses in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mc-hygiene-services-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC Home Improvements is an award-winning building company operating since 2009, offering home renovations, new builds, kitchen and bathroom renovations, painting and roof painting, and building maintenance across a roughly 40km radius of central Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mchomeimprovements.co.za/", "https://www.procompare.co.za/providers/mc-home-improvements-pretoria-south-africa", "https://www.facebook.com/MCHomeIM/"]'
WHERE slug = 'mc-home-improvements-pretoria-south-africa-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC Office & Home Furniture is a furniture retailer offering office and home furniture in Klerksoord, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mc-office-home-furniture-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC Pharma (Pty) Ltd is an industrial supplier and manufacturer based in Blue Valley Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mc-pharma-pty-ltd-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC van der Berg Attorneys Inc is a property law firm specializing in conveyancing, bond registration, property transfers, wills and testaments, deceased estate administration, and sectional title registration, having grown from a small practice founded in Sunnyside in 1999 into offices across Centurion, Pretoria East and Midstream.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mcvdberg.co.za/", "https://ccbc.co.za/business-directory-2/property-infrastructure/professional-services/legal-services/m-c-van-der-berg-attorneys", "https://www.property24.com/attorneys/mc-van-der-berg-inc/172"]'
WHERE slug = 'mc-van-der-berg-attorneys-inc-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET
    description = 'MC2 Solar Systems (Pty) Ltd. is a solar and renewable energy provider based in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mc2-solar-systems-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Doppio Zero Hazelwood is a Mediterranean-inspired restaurant and bakery in Village Walk, Hazelwood, known for its wood-fired oven and fresh baked goods, dishes such as avocado toast and eggs benedict, and a cosy space with a fireplace and pet-friendly outdoor seating.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Mon 07:00-21:00, Tue-Thu 07:00-22:00, Fri-Sat 07:00-22:30',
    source_urls = '["https://doppio.co.za/restaurant/hazelwood/", "https://www.tripadvisor.in/Restaurant_Review-g312583-d34256500-Reviews-Doppio_Zero_Hazelwood-Pretoria_Gauteng.html"]'
WHERE slug = 'doppio-zero-hazelwood-hazelwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Firwood Lodge is a TGCSA 4-star graded guesthouse in Hazelwood offering en-suite rooms with flat-screen TVs and eco-friendly air-conditioning, along with an outdoor pool, bar and fitness room, and has been welcoming guests in the area for over a decade.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://firwoodlodge.com/", "https://www.sa-venues.com/visit/firwoodlodge/"]'
WHERE slug = 'firwood-lodge-hazelwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Heatherdale Veterinary Clinic in Heatherdale, Akasia has offered holistic animal care since 2004, combining conventional veterinary treatment with homeopathy, acupuncture and herbal remedies, with consultations available by appointment only.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-11:00 & 16:00-18:15, Sat 10:00-13:00',
    source_urls = '["https://savet.co.za/vet/heatherdale-veterinary-clinic", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=237206", "https://vethomeopathic.wixsite.com/heatherdalevet"]'
WHERE slug = 'heatherdale-veterinary-clinic-heatherdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matara Afrikah is a business and management consulting firm serving clients from Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'matara-afrikah-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matayo Biofuels (Pty) Ltd is a green energy company based in Klerksoord, Dorandia, producing biodiesel and supplying turn-key decentralised biodiesel processing equipment to help businesses decarbonise their transport and machinery.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.matayobiofuels.co.za/"]'
WHERE slug = 'matayo-biofuels-pty-ltd-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mathabi Power Solutions is a 100% black-owned electrical engineering business in Proclamation Hill offering services covering voltage switchgear, transformers, street lighting, substation and mini-substation maintenance, wiring and generators.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mathabi.co.za/"]'
WHERE slug = 'mathabi-power-solutions-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mathibele Mahlaela Attorneys Inc. is a law firm in Thatchfield Hills, Centurion specialising in labour, commercial and corporate law, estate planning, alternative dispute resolution, property law and Road Accident Fund claims.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mathibelem.co.za/"]'
WHERE slug = 'mathibele-mahlaela-attorneys-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mathison & Hollidge (Pty) Ltd is a financial and investment services firm operating from the Kosmosdal Commercial & Industrial Park in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mathison-hollidge-pty-ltd-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mathys Krog Attorneys is a Rietondale-based law firm offering corporate, family, labour and divorce law services, along with commercial law, immigration law and conveyancing work.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/mathys-krog-attorneys"]'
WHERE slug = 'mathys-krog-attorneys-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matla Consultants (Pty) Ltd is a civil engineering and construction contractor in Zwartkop, Centurion, providing civil engineering contracting work alongside building construction and house renovation services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun Closed',
    source_urls = '["http://matlasa.com/"]'
WHERE slug = 'matla-consultants-pty-ltd-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matla Quantity Surveyors is a professional quantity surveying practice in Lynnwood Glen registered with the Council of South African Quantity Surveyors, tracing its roots to a firm founded in 1981 and covering projects from inception and design through construction administration to final account.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.matlaqs.co.za/"]'
WHERE slug = 'matla-quantity-surveyors-pty-ltd-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matlhanya Legal Practitioners is a firm of attorneys based in Mayville, Pretoria, offering legal services to individuals and businesses in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'matlhanya-legal-practitioners-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matloga Attorneys is a law firm based in Mayville, Pretoria, providing legal representation and advice to clients in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'matloga-attorneys-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matoetsie is a software development business based in Salieshoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'matoetsie-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matrix Design Africa is a Wapadrand-based software company with over 40 years in business, developing solutions including the DeltaERP business management platform, the ppe2go personal protective equipment management system, and safety technologies such as the IntelliZone proximity detection system and OmniPro Vision AI monitoring platform.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.matrixteam.africa/"]'
WHERE slug = 'matrix-design-africa-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matsheni Glass and Aluminium / Skills Centre supplies and installs glass and aluminium products from its premises in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'matsheni-glass-and-aluminium-skills-centre-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Mattress Company''s Silver Lakes branch, based in the Stocks Centre, supplies beds, mattresses and sleep accessories to homeowners, interior decorators and guest house owners across Pretoria East, and is known for straightforward pricing and service.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.the-mattress-company.co.za/"]'
WHERE slug = 'mattress-company-pretoria-silver-lakes-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matys Brands is a Centurion-based print and branding studio in Erasmia offering signage and vinyl solutions such as vehicle wrapping, along with 3D printing, laser cutting, graphic design, logo design and branded stationery like business cards and letterheads.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://matysbrands.co.za/"]'
WHERE slug = 'matys-brands-and-markerting-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matzbo Advisory Services, headquartered in Leeuwfontein Estate, Roodeplaat, is a licensed financial services provider offering business registrations, bookkeeping, financial advice and SARS and UIF compliance support for startups and established businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://matzboadvisory.org/"]'
WHERE slug = 'matzbo-advisory-services-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maugene Engineering Services (Pty) Ltd is one of Pretoria''s oldest privately owned engineering facilities, operating in Silvertondale since 1964 and specialising in fabrication, steelwork, gear cutting, laser cutting and CNC milling and turning for the steel manufacturing, agriculture, mining, automotive, chemical and foundry industries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-16:00',
    source_urls = '["http://www.maugene.co.za/"]'
WHERE slug = 'maugene-engineering-services-pty-ltd-silvertondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maverick Business Solutions provides business and management consulting services to clients in Bronberrik, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'maverick-business-solutions-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maverick Generators has manufactured and supplied diesel generators from its Pumulani, Pretoria plant since 2007, offering generator manufacture, sales, installation, service and repairs alongside custom-built automatic mains failure and synchronization control panels.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00, Fri 07:30-15:00',
    source_urls = '["http://www.maverickgenerators.co.za/", "https://www.openhours-southafrica.com/en/pretoria/maverick-generators"]'
WHERE slug = 'maverick-generators-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mavitec SIA provides engineering and surveying services to businesses in Florauna, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mavitec-sia-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Max Online Advertisement Services offers marketing and advertising services to businesses in Amberfield Glen, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'max-online-advertisement-services-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MaxCool Cooling Solutions has operated as part of the Airtrax Group since 1995, designing, supplying and installing industrial cooling and ventilation equipment such as mobile evaporative coolers and HVLS fans, with maintenance, servicing and short- and long-term cooler rentals also available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.maxcool.co.za/", "https://tenderbulletins.co.za/listing/maxcool-cooling-solutions-pty-ltd/"]'
WHERE slug = 'maxcool-cooling-solutions-pty-ltd-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxcons Outdoor and Camping manufactures and markets its own range of camping and outdoor gear from Celtisdal, including the world-first Max-Peg storm-resistant tent peg along with tent pegs, pole steady pins, guy ropes and other accessories designed to solve common camping problems.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://maxcons.co.za/"]'
WHERE slug = 'maxcons-outdoor-and-camping-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxi Factory has manufactured bricks at its Klerksoord plant north of Pretoria since 2004, growing into a leading maxi brick and cement stock producer with an output of around 160,000 cement stocks and 80,000 maxi bricks per day, all made to SANS 1215 and SANS 1058 specifications.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://maxifactory.co.za/", "https://www.maxifactory.co.za/home"]'
WHERE slug = 'maxi-factory-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxi Security''s Riviera office has served the Pretoria area since the company was established in 1991, offering armed response, CCTV, alarm systems, access control and gate automation to corporate, retail, industrial and other clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.maxisecurity.co.za/", "https://www.maxisecurity.co.za/services/"]'
WHERE slug = 'maxi-security-pretoria-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxi Skips offers mini skip hire for domestic and commercial waste removal from its Parktown Estate base, with 1 to 3 day, 7 day, 30 day and wait-and-load hire options plus optional labour to help fill the skip; its mini skips hold 2.5 tons / 2 cubic metres, suited to sites with limited space.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://maxiskips.co.za/contact", "https://www.facebook.com/Maxiskiphire/", "https://www.maxiskips.co.za/products"]'
WHERE slug = 'maxi-skips-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maximum Profit Recovery (Pty) Ltd provides financial and investment services to clients in Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'maximum-profit-recovery-pty-ltd-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maximum Security Services provides CCTV installation, alarm systems and armed response to Dorandia and surrounding parts of Pretoria, with a focus on system setup and maintenance and 24-hour monitoring and response.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.maximumsecurity.co.za/"]'
WHERE slug = 'maximum-security-services-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maximus Automation Solutions (Pty) Ltd is an electrical contractor serving Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'maximus-automation-solutions-pty-ltd-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxine Projects offers building and construction services to clients in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'maxine-projects-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxitech Consulting provides business and management consulting services to clients in Doringkloof, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'maxitech-consulting-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxmo Campers builds camper vans in Waltloo across full-size, multi-purpose and mini camper segments, built on bases including Fiat and Mercedes-Benz with a choice of short or long wheelbase and 2x4, 4x4 or 4-motion drivetrains; factory visits are by appointment only.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.maxmo.life/"]'
WHERE slug = 'maxmo-campers-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maybery Attorneys Inc. is a commercial and property law firm based in Faerie Glen specialising in business law, commercial contracts, corporate matters, debt collections, evictions, partnership agreements and trusts, among other areas.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mayberyinc.co.za/"]'
WHERE slug = 'maybery-attorneys-inc-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maybery Tech is a software development business based in Doornpoort, Pretoria, that has been operating since 2021.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://b2bhint.com/en/company/za/maybery-technologies--K2021551709"]'
WHERE slug = 'maybery-tech-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maymed Pharmacy in Meyerspark offers prescription dispensing, chronic medication management, blood pressure and glucose monitoring, vitamins and supplements, first aid supplies, and flu shots and immunisations, along with delivery and in-store pickup.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://showme.co.za/pretoria/lifestyle/maymed-pharmacy-meyerspark/", "https://www.thinklocal.co.za/biz/meyerspark-maymed-pharmacy-pretoria"]'
WHERE slug = 'maymed-pharmacy-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mayville Motor Spares supplies new car parts and accessories for all vehicle makes and models from its Mayville premises, and also stocks truck and tractor spares.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 07:30-16:00, Sun Closed',
    source_urls = '["scraped:google-places-no-website", "https://www.brabys.com/za/gauteng/pretoria/mayville/motor-vehicle-spares-accessories/mayville-spares"]'
WHERE slug = 'mayville-motor-spares-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mayville Pets, based at Mayville Mall, stocks a wide range of pet products from tropical fish to dog food, with in-store shopping, pickup and delivery options available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/mayville-pets-35465", "https://www.brabys.com/za/gauteng/pretoria/mayville/pet-shops-pet-requisites/mayville-pets", "http://www.mayvillepets.co.za/"]'
WHERE slug = 'mayville-pets-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mazda is a car dealership in Newlands, Pretoria, offering new and used vehicle sales, servicing and parts.',
    description_enriched_at = datetime('now')
WHERE slug = 'mazda-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maze Digital Marketing Agency, based in Doringkloof, provides SEO, Google Ads and social media marketing alongside web development, helping Centurion-area businesses build and promote their online presence.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mazedigital.co.za/", "https://www.procompare.co.za/providers/maze-digital-marketing-agency-1"]'
WHERE slug = 'maze-digital-marketing-agency-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mbatha Africa Holdings offers a broad range of building services in Olievenhoutbosch, including new construction, renovations and remodelling, plumbing and electrical work, interior and exterior painting, waterproofing and damp-proofing, carpentry and engineering services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mbathaafricaholdings.co.za/", "https://www.bark.com/en/za/company/mbatha-africa-holdings/36pw2/"]'
WHERE slug = 'mbatha-africa-holdings-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mbeu Property Group is a 100% Black-owned firm offering property, engineering, construction, civil works, fuel supply and branding services, and holds SAFCEC registration across multiple CIDB grades as well as registration with the National Bargaining Council for the Electrical Industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mbeuproperties.co.za/", "https://mbeuproperties.co.za/"]'
WHERE slug = 'mbeu-property-group-pty-ltd-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mbozisi Construction & Architect provides end-to-end building and design services, from residential and commercial construction and renovations to architectural design and municipal plan submissions, geotechnical soil testing and foundation design, civil site work, plant hire and building material supply, serving Pretoria, Centurion, Midrand, Johannesburg and surrounding areas.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mbozisiconstruction.co.za/", "https://rsa.worldorgs.com/catalog/pretoria/construction-company/mbozisi-construction-pty-ltd", "https://www.facebook.com/p/Mbozisi-Construction-Pty-Ltd-100029060576293/"]'
WHERE slug = 'mbozisi-construction-philip-nel-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mc Amari Holdings is an events and function venue business based in Amandasig, Akasia, catering to functions and gatherings in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'mc-amari-holdings-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McCabe Attorneys is a law firm based in Wapadrand, Pretoria, providing attorneys and legal services to clients in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'mccabe-attorneys-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McCater Catering Supplies has been supplying the hospitality industry since 1999, stocking commercial kitchen equipment, tableware, cleaning supplies and kitchen staff clothing from its Equestria premises, which include a fully equipped demo kitchen where customers can see equipment in action. The company offers free delivery on orders over R500 within Pretoria and Johannesburg.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mccater.co.za/", "https://mccater.co.za/"]'
WHERE slug = 'mccater-catering-supplies-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McCormick Property Development is a retail property developer specialising in shopping malls and centres across South Africa and further into Sub-Saharan Africa, focusing on retail centres in under-serviced regional and community areas that serve as local economic hubs.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mccormickproperty.co.za/", "https://pretoria.co.za/place/mccormick-property-development"]'
WHERE slug = 'mccormick-property-development-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDoman Chemicals is one of South Africa''s leading manufacturers of cleaning chemicals, specialising in office and home care, floor care, car care and food industry cleaning products, and also supplies cleaning equipment, consumables and paper products to the hospitality and hygiene sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mcdomangroup.co.za/", "https://mcdomangroup.co.za/"]'
WHERE slug = 'mcdoman-chemicals-gezina-shop-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s on Pretorius Street is a fast-food restaurant in Pretoria Central offering the chain''s usual burger, fries and coffee menu for dine-in and takeaway.',
    description_enriched_at = datetime('now')
WHERE slug = 'mcdonald-s-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This McDonald''s outlet in Jubilee Mall, Hammanskraal serves classic burgers, fries and coffee with dine-in, outdoor seating, quick takeout, drive-thru and delivery options.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 06:30-21:30',
    source_urls = '["https://www.mcdonalds.co.za/location/mcdonalds-hammanskraal-jubilee-mall", "https://za.africabz.com/gauteng/mcdonalds-jubilee-mall-210515"]'
WHERE slug = 'mcdonalds-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This McDonald''s branch in Nkomo Village Shopping Centre serves a full breakfast menu including McMuffins and hash browns until 10:30am, alongside signature items like Big Macs and crispy chicken burgers, plus a McCafe corner for coffee and pastries in its spacious, air-conditioned dining area.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 06:00-23:00',
    source_urls = '["https://www.mcdonalds.co.za/location/mcdonalds-atteridgeville", "https://www.tripadvisor.com/Restaurant_Review-g312583-d19241619-Reviews-McDonald_s_Attridgeville-Pretoria_Gauteng.html"]'
WHERE slug = 'mcdonalds-atteridgeville-atteridgeville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Mamelodi Mall, inside Mams Mall, offers quick-service meals with in-restaurant seating and food delivery for shoppers and diners in the area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mcdonalds.co.za/location/mcdonalds-mamelodi-mall", "https://restaurantguru.com/McDonalds-Mams-Mall-Pretoria"]'
WHERE slug = 'mcdonalds-mamelodi-mall-mamelodi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Wonderpark, in Karenpark Crossing Shopping Centre, features a drive-thru and PlayPlace facilities for children alongside its breakfast menu and a McCafe corner serving coffee and baked treats.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mcdonalds.co.za/", "https://www.mcdonalds.co.za/location/mcdonalds-wonderpark"]'
WHERE slug = 'mcdonald-s-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s on Paul Kruger Street is a fast-food restaurant in Pretoria Central serving the chain''s standard burger, fries and coffee menu.',
    description_enriched_at = datetime('now')
WHERE slug = 'mcdonalds-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mci IT is a software development business based in Copperleaf Golf Estate, Centurion, providing IT and software services to clients in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'mci-it-copperleaf-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mdotc Solutions is a cleaning company operating in line with the Occupational Health and Safety Act, National Contract Cleaners Association standards and Construction Industry Development Board requirements, with health and safety protocols in place for staff and clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mdotc.co.za/", "https://mdotc.co.za/"]'
WHERE slug = 'mdotc-solutions-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Me-R-We Consulting (Pty) Ltd is a business and management consulting firm based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'me-r-we-consulting-pty-ltd-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meal Options CC operates as a distributor of frozen food products, supplying frozen foods to businesses in the greater Centurion area.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.brabys.com/za/gauteng/centurion/hennopspark-ext-715/distribution-of-frozen-foods/meal-options-cc"]'
WHERE slug = 'meal-options-cc-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mean Technologies (Pty) LTD T/A EBS is a software development company based in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mean-technologies-pty-ltd-t-a-ebs-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meat 2 Oceans Market is a butchery and fish market in Marabastad; the family-run business was founded in 2009 by two brothers-in-law with over twenty years of industry experience, offering a wide selection of fresh and frozen fish alongside butchery products for chefs, small business owners and the public.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/7502740818", "https://www.meat2oceans.com/"]'
WHERE slug = 'meat-2-oceans-market-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meat Ark is a butchery in Raslouw that was established in 1999, originally trading as EEZI Meats before adopting its current name, offering freshly prepared meat along with a wide range of cold meats and processed meat products.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://rsa.worldorgs.com/catalog/centurion/meat-products/meat-ark"]'
WHERE slug = 'meat-ark-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meat Market is a butchery serving the Meyerspark community in Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'meat-market-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meat Republiq operates as a meat wholesaler out of La Montagne, supplying vendors, caterers, restaurants, butchers and households.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://meatrepubliq.co.za/", "https://www.instagram.com/meat_republiq/"]'
WHERE slug = 'meat-republiq-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meat World in Elardus Park stocks fresh, frozen and processed beef, pork and chicken, with a pre-packed section offering ready-cut meat plus cheeses, dairy products, spices and sauces, and can also arrange bulk wholesale buying and delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://meatworld.co.za/", "https://meatworld.co.za/stores/elardus-park/"]'
WHERE slug = 'meat-world-elardus-park-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meat World Gateway in Rooihuiskraal offers freshly prepared A-class lamb, beef, pork and chicken alongside pre-packed and processed meat products.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://meatworld.co.za/stores/centurion/"]'
WHERE slug = 'meat-world-gateway-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meat World Wonderboom supplies fresh A-class lamb, beef, pork and chicken along with pre-packed and processed meat products to the Annlin West area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-16:00, Sun 08:30-13:00',
    source_urls = '["http://meatworld.co.za/", "https://meatworld.co.za/stores/wonderboom/"]'
WHERE slug = 'meat-world-wonderboom-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meaty Bones Cash & Carry is an industrial supplier based near Sable Hills Waterfront Estate in Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'meaty-bones-cash-carry-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mebu Office Furniture is a family owned and operated office furniture retailer in Eloffsdal that has traded since 1998, supplying new and used desks, ergonomic chairs and storage solutions with its own delivery and assembly team.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mebuofficefurniture.co.za/", "https://www.mebuofficefurniture.co.za/"]'
WHERE slug = 'mebu-office-furniture-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mechatronic South Africa Pretoria provides engineering and surveying services in the Andeon area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mechatronic-south-africa-pretoria-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Med-Step Clinic is a sub-acute rehabilitation clinic in Eloffsdal, founded in 2005, offering 24 single rooms and 3 double rooms fitted with DSTV, air conditioning, wall oxygen and suction, and providing neurological, orthopaedic, cardiovascular, respiratory, restorative and palliative rehabilitation care for patients transitioning from hospital to home.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.medstep.co.za/", "https://medstep.co.za/"]'
WHERE slug = 'med-step-clinic-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Media Muse is a marketing and advertising agency based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'media-muse-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Media24-7 Classified Advertising is a marketing and advertising business operating out of Amberfield Glen, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'media24-7-classified-advertising-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Median Asset Management is a business and management consulting firm based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'median-asset-management-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medical Distribution Network Pty Ltd is an industrial supplier operating from the Sunderland Ridge industrial node in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'medical-distribution-network-pty-ltd-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medical Resources Group is a healthcare management consultancy established in 2013, offering locum placements, permanent recruitment, practice sale marketing, practice management and malpractice insurance to medical practices, and is a Level 4 BBBEE contributor and member of AHASA and APSO.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://medicalresources.co.za/", "https://ahasa.org/medicalresourcesgroup/"]'
WHERE slug = 'medical-resources-group-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medicare Pharmacy Waverley is a community pharmacy in Waverley Plaza that, besides dispensing medicine, also offers vaccinations and other healthcare consultations.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://medicarehealth.co.za/", "https://za.africabz.com/gauteng/medicare-pharmacy-waverley-125498"]'
WHERE slug = 'medicare-pharmacy-waverley-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mediclinic Kloof is a multidisciplinary private hospital in Erasmuskloof offering a broad spectrum of professional medical services, including a 24-hour Emergency Centre, and serves private and medical aid patients in Pretoria East close to the N1.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/mediclinic-kloof-6677", "https://www.mediclinic.co.za/en/kloof/contact.html", "https://www.mediclinic.co.za/en/kloof/home.html"]'
WHERE slug = 'mediclinic-kloof-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medilase is a laser and light-based technology provider on the CSIR campus in Brummeria, offering pain-free laser hair removal, vascular and pigmentation treatments and surgical laser procedures, and distributing ELLEX vision-care laser and ultrasound ophthalmology systems.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://www.medilase.co.za/", "https://medilase.co.za/contact-us/"]'
WHERE slug = 'medilase-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medirite Mayville is part of the Medirite pharmacy chain, which operates within the Shoprite Checkers group, offering a wide range of pharmaceuticals and medication at competitive prices with pharmacists registered with the South African Pharmacy Council on hand to assist.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za/company/691457/medirite-mayville", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=226480", "https://www.goafricaonline.com/za/1222745-medirite-mayville"]'
WHERE slug = 'medirite-mayville-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mediro ICT, based in Kosmosdal, is an enterprise technology partner specialising in application performance monitoring, enterprise service management, digital employee experience and automated software testing, alongside business intelligence, infrastructure and unified security services for banks, financial services firms and other organisations across South Africa and the wider Sub-Saharan region.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mediro-ict.co.za/", "https://www.mediro-ict.co.za/about-mediro-ict/", "https://www.mediro-ict.co.za/solutions/"]'
WHERE slug = 'mediro-ict-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medo Novia is a commercial property and office space provider based in Valhalla, serving businesses in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'medo-novia-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meet the Minis runs regular hands-on interactions with a herd of miniature horses on a farm off the R513, where visitors can brush and dress up the minis, cuddle foals, walk with the horses, use a putt-putt course and splash pool, and meet resident goats and bunnies, with bookings essential.',
    description_enriched_at = datetime('now'),
    hours = 'Sat-Sun & Public Holidays 09:00-17:00, other days by appointment',
    source_urls = '["https://meettheminis.co.za/"]'
WHERE slug = 'meet-the-minis-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meeting Planners International, established in 2013 and based near Boardwalk Manor, is a Professional Conference Organiser and venue-finding company that coordinates conferences, team builds, banquets and other events for public, corporate, academic and association clients across the SADC region.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.organisers.co.za/", "https://www.organisers.co.za/about/"]'
WHERE slug = 'meeting-planners-international-pty-ltd-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MeetingPal is an events and function venue business operating from Misty Garden in Rietvalleirand, serving clients in Pretoria''s eastern suburbs.',
    description_enriched_at = datetime('now')
WHERE slug = 'meetingpal-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mega Books, in Faeriedale Shopping Centre in Faerie Glen, is one of South Africa''s largest second-hand bookstores, stocking over 2km of shelving and importing around 40,000 books every third month from Canada, the United States and England, while donating roughly half of its stock to charities, schools and churches.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun & Holidays 09:00-12:00',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/16969803_2", "https://za.africabz.com/gauteng/mega-books-97906", "https://doornpoort.co.za/mega-books/", "https://www.pretoria-south.co.za/mega-books/"]'
WHERE slug = 'mega-books-faerie-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mega Catering and Decor Hire provides catering and event decor hire services for occasions of all sizes in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mega-catering-and-decor-hire-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mega Choice Consulting is a software development business operating out of Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mega-choice-consulting-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mega Paints & Hardware in Mayville stocks a wide range of premium paints alongside brushes, primers, waterproofing products, skimming compounds, solvents, varnish and cleaning supplies, covering roof, wall, floor and ceiling paint needs plus the hardware to complete the job.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.megapaints.co.za/"]'
WHERE slug = 'mega-paints-hardware-mayville-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mega Storage''s Montana Park facility is a basement self-storage site with around 60 units ranging from 18 to 72 square metres, including standard brick-walled and office-style options, protected by 24-hour guards and offering customers 12-hour daily access every day including weekends and public holidays.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.megastorage.co.za/", "https://www.megastorage.co.za/storage-units-for-people-living-in-montana/"]'
WHERE slug = 'mega-storage-montana-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Megaphase Electrical Wholesalers has operated from its Waltloo warehouse since 2013, acting as a one-stop electrical and mechanical wholesaler supplying engineers and contractors working on industrial, commercial and domestic projects.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:45, Sat 08:00-11:00, Sun Closed',
    source_urls = '["http://www.megaphase.co.za/", "https://megaphase.co.za/about-us/"]'
WHERE slug = 'megaphase-electrical-wholesalers-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Megavolt TV & Video has operated in Waverley since 2001, specialising in the sale, installation and repair of DSTV decoders and accessories and the restoration of TVs, VCRs, hi-fis and microwave ovens, and has more recently expanded into power inverter repairs, positioning itself as a hub for DSTV HD, XtraView and PVR systems in the Moot area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:45',
    source_urls = '["http://www.megavolttv.co.za/", "https://megavolttv.co.za/about/"]'
WHERE slug = 'megavolt-tv-video-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Eldoraigne office is a branch of MegChem, a multi-disciplinary engineering consultancy providing process, mechanical, piping, metallurgical, forensic and civil and infrastructure engineering services to clients in the oil, gas, power generation and petrochemical industries.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://megchem.com/", "https://megchem.com/"]'
WHERE slug = 'megchem-centurion-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Rietondale practice specialises as a breast prosthetist and bra-fitting service, consulting, measuring and fitting patients following mastectomy, lumpectomy and reconstruction surgery, and is staffed by a registered lymphoedema therapist accredited with the Lymphoedema Association of South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://msmop.co.za/", "https://www.medpages.info/sf/index.php?page=person&personcode=240210"]'
WHERE slug = 'meghess-swart-medical-orthotist-and-prosthetist-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Megtron Holdings operates from Koedoespoort Industrial, offering commercial property and office space in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'megtron-holdings-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Melamed Construction, established in 2002, builds new houses and facilities as well as renovations and additions, running its own building, plastering, electrical and painting teams alongside an engineer for concrete slab and structural work.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://melamedconstruction.co.za/", "https://www.melamedconstruction.co.za/"]'
WHERE slug = 'melamed-construction-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Centurion practice was established in 2010 as Irene Village Mall Optometrists before adopting its current name five years later, offering eye tests, frames and contact lenses with equipment including a fundus camera and topographer, and specialised fittings for scleral lenses, keratoconus, multifocal correction and sports vision.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ireneoptom.co.za/"]'
WHERE slug = 'melanie-peyper-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Melitha Consultants, founded in 2011 in Eloffsdal, provides a full range of accounting services beyond basic bookkeeping, structuring finances for clients spanning engineering and manufacturing firms, retail and property-letting companies, medical and dental practices, and individuals both locally and abroad.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-15:00, Fri 07:00-13:00',
    source_urls = '["http://melitha.co.za/", "https://www.snupit.co.za/pretoria/eloffsdal/melitha-consultants/442386"]'
WHERE slug = 'melitha-consultants-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meltscloud is a software development business based in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'meltscloud-heuweloord' AND description_enriched_at IS NULL;

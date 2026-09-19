UPDATE businesses
SET description = 'DSV Logistics'' Kosmosdal branch in Centurion is part of DSV, a Danish multinational transport and logistics company that also handles road, air and sea freight forwarding as well as contract logistics. This branch operates Monday to Friday from 08:00 to 17:00.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'dsv-logistics-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dela Plast is a family-owned plastic injection moulding company established in 2002, manufacturing products for the food packaging, agricultural, security, warehousing and engineering industries from its factory in Koedoespoort. The company is FSSC 22000 certified for food packaging manufacturing.', description_enriched_at = datetime('now')
WHERE slug = 'dela-plast-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ergo Designer Kitchens & Cabinetry is a Pretoria-based, women-owned studio that designs, manufactures and installs kitchens, built-in cupboards, vanities and home offices from its own factory in Koedoespoort. With more than a decade in the cabinetry industry, the company has won design awards at the Homemakers Expo Pretoria.', description_enriched_at = datetime('now'), source_urls = '["https://www.ksa.co.za/members/detail/ergo-designer-kitchens", "https://www.tuugo.co.za/Companies/ergo-designer-kitchens/0260003600189", "https://www.homify.co.za/professionals/951758/ergo-designer-kitchens"]'
WHERE slug = 'ergo-designer-kitchens-cabinetry-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Montagne Day Spa & Beauty Salon in La Montagne offers half and full day spa packages including massages, facials, aromatherapy and hair and nail treatments. Its venue also hosts events such as corporate team-building days, pamper parties and kitchen teas.', description_enriched_at = datetime('now'), source_urls = '["https://www.cvent.com/venues/pretoria/special-event-venue/la-montagne-day-spa-beauty-salon/venue-99fe8bb9-e4f6-4dcb-b1b7-678d08bd7bb5", "https://www.spadirectory.co.za/spa/pretoria/la-montagne-day-spa/", "https://www.facebook.com/Lamontagnedayspaandhairsalon/"]'
WHERE slug = 'la-montagne-day-spa-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lesira Manufacturing, trading as Lesira-Teq, is an OEM that designs, manufactures and supplies smart water meters from an ISO 9001:2015 and ISO 45001 certified facility in Koedoespoort that also houses a SANAS-accredited testing laboratory. With more than 20 years in water meter technology, the company has delivered over a million meters worldwide.', description_enriched_at = datetime('now')
WHERE slug = 'lesira-manufacturing-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Platinum Clothing and Promotions supplies uniform, corporate and promotional clothing to the Pretoria market, including footwear, safety wear, hospitality wear, custom-made garments and promotional gifting.', description_enriched_at = datetime('now')
WHERE slug = 'platinum-clothing-and-promotions-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Platinum Iris Rhenosterfontein Depot is a depot of Platinum Iris, a petroleum industry company founded in 2014, operating from Rhenosterfontein Road in Donkerhoek. It trades Monday to Friday from 07:00 to 17:00 and Saturday from 07:00 to 14:00.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 07:00-17:00, Sat 07:00-14:00', source_urls = '["http://www.platinumiris.co.za/", "https://www.facebook.com/platinumiris/"]'
WHERE slug = 'platinum-iris-rhenosterfontein-depot-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PlattForm Digital is a software development company based in Boardwalk Manor, Pretoria, providing custom software and digital solutions to local businesses.', description_enriched_at = datetime('now')
WHERE slug = 'plattform-digital-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Garsfontein branch is part of Platō Coffee, a coffeehouse chain founded in Pretoria in 2019 that has grown into one of South Africa''s largest, with around 150 locations across Southern Africa and the UK. The Garsfontein café offers free parking and serves coffee, iced lattes and moccachinos for eating in or takeout.', description_enriched_at = datetime('now'), source_urls = '["https://plato.coffee/", "https://restaurantguru.com/Plato-Coffee-Garsfontein-Pretoria"]'
WHERE slug = 'plat-coffee-garsfontein-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Play Town is an indoor pretend-play and party venue in Hennopspark featuring ten themed playrooms linked by a decorated roadway track for bike riding, a pirate-ship-shaped jungle gym with slides and an obstacle course, a rock-climbing wall, and around 250 square metres of trampolines split by age group.', description_enriched_at = datetime('now'), source_urls = '["https://joburg.co.za/article/playtown-centurion-a-fun-filled-venue-for-parties-and-school-outings", "https://www.jozikids.co.za/listing/play-town/", "https://www.facebook.com/PlayTownza/"]'
WHERE slug = 'play-town-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plexirenovations & Construction is a Pretoria-based renovation and construction company operating out of Garsfontein, handling residential and commercial projects such as bathroom and kitchen renovations, home extensions, waterproofing and painting. The business takes on jobs of any size, from full home renovations to smaller structural upgrades, serving clients across the wider Pretoria area.', description_enriched_at = datetime('now'), source_urls = '["http://www.plexirenovations.co.za/", "https://plexirenovations.co.za/about/"]'
WHERE slug = 'plexirenovations-construction-pretoria-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plug & Play Energy is a solar and renewable energy company operating from Lyttelton Manor, Centurion, designing and installing electricity solutions for single homes, multi-tenant industrial complexes, retail environments, agricultural operations and solar farms. The company keeps a close eye on new solar technology to keep its installations current and its pricing competitive.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 07:00-16:00'
WHERE slug = 'plug-play-energy-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plug & Play Solutions is a security and surveillance company based in Lyttelton Manor, Centurion, offering CCTV installation, integrated access control, remote monitoring and AI-driven surveillance systems. Its custom-built security infrastructure, including biometric access systems, serves clients in sectors such as retail, finance, mining, aviation and government.', description_enriched_at = datetime('now')
WHERE slug = 'plug-play-solutions-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumb-Avid is a plumbing company operating from Raslouw, Centurion, offering residential and commercial services including drain inspection and unblocking, geyser work and 24/7 emergency call-outs. The business has built a strong local reputation, holding a near-perfect customer rating on Google.', description_enriched_at = datetime('now')
WHERE slug = 'plumb-avid-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumblink Karenpark is a branch of the plumbing and hardware supplies retailer Plumblink, stocking plumbing fittings and kitchenware from its store at Karen Park Crossing in Karenpark, Akasia. Customers can reach this branch directly for stock and product enquiries.', description_enriched_at = datetime('now'), source_urls = '["https://www.plumblink.co.za/", "https://www.plumblink.co.za/store/plumblink-karenpark"]'
WHERE slug = 'plumblink-karenpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumbou Loodgieters is a plumbing business operating from Roodeplaat, Pretoria, that has been trading since 1973. It offers services including blocked drain clearing, water leak detection, and geyser installation and repair.', description_enriched_at = datetime('now'), source_urls = '["scraped:google-places-no-website", "https://www.cylex.net.za/p?id=17189430&f=plumbou-loodgieters---plumbers"]'
WHERE slug = 'plumbou-loodgieters-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumbrings Projects and Services Pty Ltd Company is a building and construction business operating out of Zwavelpoort, Pretoria, serving clients across the eastern side of the city.', description_enriched_at = datetime('now')
WHERE slug = 'plumbrings-projects-and-services-pty-ltd-company-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pmplus Projects Strategy Consultants is a multi-discipline built environment consulting firm operating from Cambridge Office Park in Centurion, offering cost engineering, quantity surveying, project management, and civil and structural engineering services across the planning, design and construction-supervision phases of a project.', description_enriched_at = datetime('now'), source_urls = '["scraped:google-places-no-website", "https://pmplus.co.za/"]'
WHERE slug = 'pmplus-projects-strategy-consultants-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pobana Group is a marketing and advertising business based in Meyerspark, Pretoria, providing promotional and advertising services to clients in the area.', description_enriched_at = datetime('now')
WHERE slug = 'pobana-group-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pocket Business is a business consulting and digital marketing company headquartered in Centurion, helping small and medium enterprise owners grow their revenue through services such as social media management, SEO, website development and online store integration.', description_enriched_at = datetime('now'), source_urls = '["https://pocket-business.app/home-page", "https://za.linkedin.com/company/pocketbusiness"]'
WHERE slug = 'pocket-business-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pocket Business ORM is a business consulting firm operating in Midstream Estate, Centurion.', description_enriched_at = datetime('now')
WHERE slug = 'pocket-business-orm-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Podium at Menlyn is a five-storey, 4-star Green Star-rated office building at the entrance to Pretoria''s Menlyn business node, directly opposite Menlyn Park Shopping Centre, offering tenants premium office space with backup power, ample parking and round-the-clock security.', description_enriched_at = datetime('now'), source_urls = '["http://www.solidgreen.co.za/podium-at-menlyn/", "https://www.broll.com/to-let/office/pretoria/menlyn/podium-at-menlyn"]'
WHERE slug = 'podium-at-menlyn-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pointsure Services is a software development company based in Kosmosdal, Centurion.', description_enriched_at = datetime('now')
WHERE slug = 'pointsure-services-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polaris TS is a computer and IT services provider based in Boardwalk Manor, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'polaris-ts-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polecat Tamper Proof Gate Motors makes a tamper-proof, lightning-proof gate motor that is built directly into the gate''s own pole and sealed under a thick steel cover with a double-lock system, based in Zwavelpoort.', description_enriched_at = datetime('now'), source_urls = '["https://polecatgatemotors.co.za/", "https://www.facebook.com/p/Polecat-Tamper-proof-gatemotor-61557907442766/"]'
WHERE slug = 'polecat-tamper-proof-gate-motors-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pollogen Ltd is an industrial supplier and manufacturing business based in Clubview, Centurion.', description_enriched_at = datetime('now')
WHERE slug = 'pollogen-ltd-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Poly DMS is an industrial supplier and manufacturing business based in Kameeldrift, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'poly-dms-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polyfood Film is a South African manufacturer and distributor of food-grade PVC cling film and packaging, also offering pre-packed cutlery and custom-branded film boxes and printed bags, based in Hermanstad.', description_enriched_at = datetime('now'), source_urls = '["scraped:google-places-no-website", "https://www.yellosa.co.za/company/933390/poly-food-film-cc"]'
WHERE slug = 'polyfood-film-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polygon Software Development has built affordable, modular software solutions since 1997, including library and textbook administration systems and a moveable-asset stock management system for furniture, equipment, computers and consumables, from its base in Elardus Park.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:00', source_urls = '["http://www.polygonsoftware.co.za/", "https://www.brabys.com/za/gauteng/pretoria/elardus-park/software-developers/polygon-software-development"]'
WHERE slug = 'polygon-software-development-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polymath Solar (Pty) LTD is a solar and renewable energy company based in Derdepoort Smallholdings, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'polymath-solar-pty-ltd-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pool Solutions Epoxy Coatings has been supplying and applying epoxy pool paint since 1998, using a four-layer coating system to refurbish and waterproof swimming pools from its base in Die Wilgers, Pretoria.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:30-17:00', source_urls = '["https://www.poolsolutions.co.za/", "https://www.poolsolutions.co.za/dealers.htm"]'
WHERE slug = 'pool-solutions-epoxy-coatings-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pools & Renovators is a building and construction business based in Derdepoort Smallholdings, Pretoria. It offers construction and renovation services to the local community.', description_enriched_at = datetime('now')
WHERE slug = 'pools-renovators-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Poor Guys Fast Food is a casual takeaway and dine-in restaurant at Highveld Shopping Centre in Centurion, serving burgers, ribs, chicken and steak alongside daily specials, with outdoor seating available.', description_enriched_at = datetime('now'), hours = 'Mon-Sat 10:00-20:00, Sun Closed', source_urls = '["https://www.facebook.com/PoorGuysFastFoodCenturion/", "https://za.africabz.com/gauteng/poor-guys-fast-food-12257", "https://restaurantguru.com/Poor-Guys-Fast-Food-Pretoria"]'
WHERE slug = 'poorguys-fast-food-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Porsche Centre Pretoria is an authorised Porsche dealership in Die Wilgers selling new and pre-owned Porsche vehicles alongside Porsche Tequipment accessories and dealer merchandise, and also serves customers as far afield as Mbombela, Middelburg, Witbank, Secunda, Polokwane and Rustenburg.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:00, Sat 08:30-13:00, Sun Closed'
WHERE slug = 'porsche-centre-pretoria-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Porsche Centre Pretoria, on Botterklapper Street in Die Wilgers, is an authorised Porsche dealer offering new and pre-owned vehicle sales, Porsche Tequipment accessories and merchandise, and also supports customers from as far as Mbombela, Middelburg, Witbank, Secunda, Polokwane and Rustenburg.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:00, Sat 08:30-13:00, Sun Closed', source_urls = '["https://www.waze.com/live-map/directions/porsche-centre-pretoria-botterklapper-st-452-die-wilgers,-pretoria", "https://www.cylex.net.za/company/porsche-centre-pretoria-23739512.html", "https://dealer.porsche.com/za/pretoria/en-GB"]'
WHERE slug = 'porsche-centre-pretoria-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portable Spaces is an engineering and surveying business based in Sunderland Ridge, Centurion. It provides engineering-related services to clients in the area.', description_enriched_at = datetime('now')
WHERE slug = 'portable-spaces-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Porter and Connections (Pty) Ltd, trading as PConnect Management Systems, is a Pretoria consultancy founded in 2019 that helps organisations develop, implement and maintain ISO management systems, as well as occupational health and safety, food safety and other compliance programmes.', description_enriched_at = datetime('now'), source_urls = '["http://porterconnect.com/", "http://porterconnect.com/About-Us/"]'
WHERE slug = 'porter-and-connections-pty-ltd-trading-as-pconnect-management-systems-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portuguese Hall, run by the Association of the Portuguese Community of Pretoria in Proclamation Hill, is a multi-purpose venue with a large function hall seating around 1,000 people plus an indoor and outdoor soccer field, and its restaurant serves traditional Portuguese and continental dishes for lunch, dinner and catering.', description_enriched_at = datetime('now'), source_urls = '["http://www.acpp.co.za/", "https://doornpoort.co.za/acpp-function-venue/"]'
WHERE slug = 'portuguese-hall-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostLink Sunderland Ridge is a courier and postal services outlet based in Sunderland Ridge, Centurion. It offers local businesses courier, mailing and related services.', description_enriched_at = datetime('now')
WHERE slug = 'postlink-sunderland-ridge-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Blaauw Village is a courier and printing outlet inside Blaauw Village shopping centre in Pretoria North, offering courier services, copy and print, digital printing, stationery and private mailboxes.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:00, Sun Closed', source_urls = '["https://postnet.co.za/stores/blaauwvillage", "https://www.ivote.co.za/view/south-africa/postnet-blaauw-village-in-pretoria", "https://www.postnet.co.za/stores/blaauw-village"]'
WHERE slug = 'postnet-blaauw-village-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Castle Walk operates from Castle Walk Shopping Centre in Erasmuskloof, offering courier and postal services alongside copying, digital printing and related business support for the surrounding Pretoria East area.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:30, Sat 08:30-14:00, Sun Closed', source_urls = '["http://castlewalk.postnet.co.za/", "https://www.postnet.co.za/stores/castlewalk", "https://all-opening-hours.co.za/02010423/PostNet_Castle_Walk"]'
WHERE slug = 'postnet-castle-walk-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Centurion Lifestyle Centre is the on-site courier and printing outlet inside Centurion Lifestyle Centre in Brakfontein, providing postal, copy and print services to shoppers and businesses at the centre.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-centurion-lifestyle-centre-brakfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Cornwall View is a courier, copy and print outlet based at Cornwall View Shopping Centre in Elardus Park, serving local residents and businesses in Pretoria East.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-cornwall-view-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Derdepark is a print and courier services outlet located at Derdepark Sentrum in Derdepoort, offering document printing, copying and parcel courier services to the surrounding community.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-derdepark-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Doringkloof operates from Doringkloof Mall in Centurion, providing courier and copy-and-print services, including domestic and international parcel sending, for the local community.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:30, Sat 09:00-13:00, Sun Closed', source_urls = '["http://doringkloof.postnet.co.za/", "https://www.postnet.co.za/stores/doringkloof"]'
WHERE slug = 'postnet-doringkloof-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet East Lynne is a courier and printing services outlet based at Eastpark Centre in East Lynne, offering parcel courier and document copy-and-print services to the local Pretoria community.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-east-lynne-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Eastwood Village, an independently owned PostNet franchise at Eastwood Village Shopping Centre in Arcadia, offers courier and copy-and-print services along with ID photos and internet cafe facilities for local residents and businesses.', description_enriched_at = datetime('now'), source_urls = '["https://www.postnet.co.za/stores/eastwoodvillage/5c69210d55c8c661d10be978", "https://za.africabz.com/gauteng/postnet-eastwood-village-61517", "https://pretoria.co.za/listing/postnet-eastwood-village/", "https://pretoria.co.za/place/postnet-eastwood-village"]'
WHERE slug = 'postnet-eastwood-village-arcadia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet EcoPark, established in February 2023 at Eco Boulevard Shopping Centre in Centurion, offers printing, copying and courier shipping services from a wheelchair-accessible store.', description_enriched_at = datetime('now'), source_urls = '["https://www.postnet.co.za/stores/ecopark", "https://www.postnet.co.za/stores/ecopark/63d8d60d57e33c3e84ab3d75"]'
WHERE slug = 'postnet-ecopark-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Elarduspark, based on Barnard Street in Elardus Park, offers copy and print services alongside ID and passport photos, vehicle licence renewal and criminal record check facilities for the local community.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 07:00-18:00, Sat 08:00-14:00, Sun Closed', source_urls = '["https://www.postnet.co.za/stores/elarduspark", "https://all-opening-hours.co.za/02200490/PostNet_Elarduspark"]'
WHERE slug = 'postnet-elarduspark-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Eldo Square operates from Eldo Square Shopping Centre on Willem Botha Drive in Centurion, offering printing, copying, stationery, mailing and courier services to the surrounding Eldo Lakes Estate area.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:30-16:00, Sat 09:00-15:00, Sun Closed', source_urls = '["http://eldosquare.postnet.co.za/", "https://www.postnet.co.za/stores/eldosquare"]'
WHERE slug = 'postnet-eldo-square-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Eldoraigne is a courier and business-services outlet in Eldoraigne, Centurion, offering domestic and international courier services, black & white, full colour and wide-format copying and printing, stationery and digital business solutions. It trades six days a week, closing on Sundays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed', source_urls = '["http://eldoraigne.postnet.co.za/", "https://www.postnet.co.za/stores/eldoraigne"]'
WHERE slug = 'postnet-eldoraigne-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Equestria, in Equestria Shopping Centre, offers courier, copying and printing (including litho print-on-demand up to A0 size), stationery and digital business solutions under one roof. The franchise entity has been registered since 2008.', description_enriched_at = datetime('now'), source_urls = '["http://equestria.postnet.co.za/", "https://b2bhint.com/en/company/za/postnet-equestria--B2008051880"]'
WHERE slug = 'postnet-equestria-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Erasmia, in Erasmia Crossing on Main Road, offers courier, copying and printing, stationery and digital business services, with extended weekday trading hours that run into the evening.', description_enriched_at = datetime('now'), hours = 'Mon-Thu 08:00-19:00, Fri 08:00-12:30 & 14:00-19:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'postnet-erasmia-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Garsfontein, at Garsfontein Corner in Faerie Glen, offers courier, copying and printing, stationery and digital business services, and trades until 18:00 on weekdays as well as over weekends.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00', source_urls = '["https://www.postnet.co.za/stores/garsfontein", "https://destinali.com/pretoria/logistics-courier/postnet-garsfontein-pretoria"]'
WHERE slug = 'postnet-garsfontein-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Gezina Galleries, inside the Gezina Galleries centre on Frederika Street, provides courier, copying and printing, stationery and digital business services, and opens on Sundays and public holidays as well as during the week.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:30, Sat 08:00-14:00, Sun 09:00-13:00', source_urls = '["https://www.africabizinfo.com/ZA/postnet-gezina-012-335-9377", "https://za.africabz.com/gauteng/postnet-gezina-204334", "https://www.postnet.co.za/stores/gezina"]'
WHERE slug = 'postnet-gezina-gezina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Groenkloof, in Groenkloof Plaza on the corner of George Storrar Drive and Bronkhorst Street, operates as a one-stop business centre offering copying and printing, domestic and international courier services, stationery, digital business solutions and professional mailbox services.', description_enriched_at = datetime('now'), source_urls = '["https://mysouthafrica.co.za/16957061166946461812/", "https://www.postnet.co.za/stores/groenkloof", "https://www.postnet.co.za/stores/groenkloof/5c69211055c8c661d10be9aa"]'
WHERE slug = 'postnet-groenkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Hammanskraal, in the Renbro Shopping Centre on Old Warmbaths Road, offers courier, copying and printing, stationery and digital business services, trading through the week and on Saturday mornings.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:30, Sat 08:30-13:00, Sun Closed'
WHERE slug = 'postnet-hammanskraal-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Hennopspark, in the Silver Creek Centre on Hendrik Verwoerd Drive, offers courier, copying and printing, stationery and digital business services, opening especially early on weekdays from 07:15.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 07:15-17:00, Sat 08:00-13:00, Sun Closed', source_urls = '["https://www.postnet.co.za/stores/hennopspark", "https://www.postnet.co.za/stores/hennopspark/5c69211055c8c661d10be9b5"]'
WHERE slug = 'postnet-hennopspark-centurion-open-07h15-on-weekdays-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Laudium, in the Jhina Centre on 6th Avenue, offers courier, copying and printing, stationery and digital business services, and also operates as a DHL Service Point for local and international shipping.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:45, Sat 09:00-14:30, Sun Closed', source_urls = '["https://laudium.postnet.co.za/", "https://www.postnet.co.za/stores/laudium"]'
WHERE slug = 'postnet-laudium-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Lyttelton, inside The Highlands Shopping Centre at the corner of Rabie and Glover Streets, offers copying and printing, domestic and international courier services, stationery, digital business solutions and professional mailbox services.', description_enriched_at = datetime('now'), source_urls = '["http://lyttelton.postnet.co.za/", "https://www.postnet.co.za/stores/lyttelton"]'
WHERE slug = 'postnet-lyttelton-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Mayville is a courier and logistics services outlet located inside Checkers Hyper at the corner of Van Rensburg Street and Mortimer Avenue in Mayville, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-mayville-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Menlyn is a courier and logistics services branch located in the Waterglen Shopping Centre in Waterkloof Glen, Pretoria, at the corner of January Masilela Drive and Garstfontein Road.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-menlyn-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Midstream (Centurion) is a courier, copy and print outlet based at the Square@Midstream centre in Midstream Estate, trading on weekdays from 08:00 to 18:00 and on Saturday mornings.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 09:00-14:00, Sun Closed', source_urls = '["http://midstream.postnet.co.za/", "https://www.openhours-southafrica.com/en/centurion/postnet-midstream"]'
WHERE slug = 'postnet-midstream-centurion-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Monument Park is a courier, copy and print branch in the Monument Park Shopping Centre, open on weekdays and Saturday mornings but closed on Sundays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:25, Sat 08:00-13:25, Sun Closed', source_urls = '["https://monumentpark.postnet.co.za/", "https://monumentparkshoppingcenter.co.za/postnet-monument-park/"]'
WHERE slug = 'postnet-monument-park-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Pretoria CBD, based in Bothongo Plaza West on Francis Baard Street, handles courier and document services and is also known for assisting with Police Clearance Certificates, embassy deliveries and document apostille/authentication given its location near Pretoria''s many embassies and government offices. It trades weekdays from 08:00 to 17:00 and Saturday mornings, closed Sundays and public holidays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:00, Sat 09:00-12:00, Sun Closed', source_urls = '["http://pretoriacbd.postnet.co.za/", "https://www.postnet.co.za/stores/pretoriacbd"]'
WHERE slug = 'postnet-pretoria-cbd-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Pretoria North (NinaPark) operates from the Northdale Shopping Centre on Grafenheim Street in Ninapark, offering courier, copy and print services on weekdays from 8:00 to 18:00 and Saturday mornings, closed Sundays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:00, Sun Closed', source_urls = '["http://postnet.co.za/", "https://www.cybo.com/ZA-biz/postnet-pretoria-north-ninapark"]'
WHERE slug = 'postnet-pretoria-north-ninapark-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Pretoria North (Ninapark), located in the Northdale Shopping Centre on Grafenheim Street, offers courier, copy and print services on weekdays from 8:00 to 18:00 and Saturday mornings, closed Sundays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:00, Sun Closed', source_urls = '["https://www.cybo.com/ZA-biz/postnet-pretoria-north-ninapark", "https://za.polomap.com/pretoria/52605", "https://openhours-southafrica.com/en/pretoria-north/postnet-pretoria-north"]'
WHERE slug = 'postnet-pretoria-north-ninapark-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Raslouw has operated from the Raslouw Lifestyle Centre, on the corner of Rooihuiskraal and Hendrik Verwoerd Road, since 2011, offering courier, copy and print services to the Centurion area.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat-Sun 09:00-13:00', source_urls = '["http://postnet.co.za/stores/raslouw", "https://pretoria.co.za/place/postnet-raslouw"]'
WHERE slug = 'postnet-raslouw-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Silver Lakes is a courier and logistics services branch located in the Hazeldean Square Shopping Centre at the corner of Silver Lakes and Graham Roads, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-silver-lakes-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Silverton is a courier and logistics services outlet operating from the Silver Mall Shopping Centre in Silverton, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-silverton-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Sinoville is a courier and printing outlet at Sinoville Corner offering colour and wide-format copying and printing alongside domestic and international courier services, and it also serves as a DHL Service Point for parcel collection. It trades Monday to Friday 08:00-17:30 and Saturday 08:00-13:00, closed Sundays and public holidays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:30, Sat 08:00-13:00, Sun Closed', source_urls = '["http://sinoville.postnet.co.za/", "https://www.postnet.co.za/stores/sinoville"]'
WHERE slug = 'postnet-sinoville-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Southdowns is a one-stop business services outlet in Southdowns Shopping Centre, Irene, offering courier, copy & print, digital printing and mailbox rental services for the Centurion area.', description_enriched_at = datetime('now'), source_urls = '["http://southdowns.postnet.co.za/", "https://pretoria.co.za/listing/postnet-southdowns/"]'
WHERE slug = 'postnet-southdowns-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Station Square is a business services outlet in Pretoria Central''s Station Square Shopping Centre, offering copy & print, courier, stationery and digital business solutions from a wheelchair-accessible store.', description_enriched_at = datetime('now')
WHERE slug = 'postnet-station-square-trevenna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Thatchfield is a business services outlet in Thatchfield Retail Centre, Centurion, offering copy & print, digital printing, stationery, certified document services and domestic and international courier options. It trades Monday to Friday 08:00-18:00 and Saturdays 08:00-13:00, closed Sundays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:00, Sun Closed', source_urls = '["https://www.postnet.co.za/stores/thatchfield", "https://www.thebusinessdirectory.co.za/listings/postnet-thatchfield/"]'
WHERE slug = 'postnet-thatchfield-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Waverley is a business services outlet in Waverley Plaza, Villieria, offering courier, copy & print, digital, stationery and mailbox rental services. It trades Monday to Friday 08:00-18:00 and Saturdays 08:00-16:00, closed Sundays.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 08:00-16:00, Sun Closed', source_urls = '["http://waverley.postnet.co.za/", "https://www.postnet.co.za/stores/waverley"]'
WHERE slug = 'postnet-waverley-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Wonderboom Junction is a business services outlet in the Wonderboom Junction centre, Annlin, offering printing, copying, binding and courier services. It trades Monday to Friday 08:00-18:00, Saturdays 08:00-17:00 and Sundays 09:00-15:00.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00', source_urls = '["http://wonderboomjunction.postnet.co.za/", "https://www.postnet.co.za/stores/wonderboomjunction"]'
WHERE slug = 'postnet-wonderboom-junction-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Wonderpark is a business services outlet in Wonderpark Shopping Centre, Karenpark, offering courier, copy & print, computer and stationery facilities, plus binding, laminating and criminal record check services.', description_enriched_at = datetime('now'), source_urls = '["https://www.postnet.co.za/stores/wonderpark", "https://www.wonderparkcentre.co.za/storedetail-postnet"]'
WHERE slug = 'postnet-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Woodhill is a business services outlet in Parkview Shopping Centre, Moreleta Park, offering copy & print, domestic and international courier, stationery and digital business solutions.', description_enriched_at = datetime('now'), source_urls = '["http://woodhill.postnet.co.za/", "https://www.sayellow.com/view/south-africa/postnet-woodhill-in-pretoria"]'
WHERE slug = 'postnet-woodhill-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostWeb Murrayfield is a local printing services provider based in Murrayfield, Pretoria, serving the surrounding eastern suburbs of the city.', description_enriched_at = datetime('now')
WHERE slug = 'postweb-murrayfield-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Poster Worx cc is a screen printing and digital large-format printing business in Zwavelpoort, Pretoria, producing Correx boards, PVC banners and vehicle graphics for nationwide delivery.', description_enriched_at = datetime('now')
WHERE slug = 'poster-worx-cc-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink Celtis Ridge is a printing and courier outlet in Celtis Ridge Shopping Centre, Heuwelsig Estate, offering photocopying, binding, laminating, business cards and passport photos alongside domestic and international courier services.', description_enriched_at = datetime('now'), source_urls = '["https://postlinkceltis.co.za/", "https://za.africabz.com/gauteng/postlink-celtis-ridge-227726", "https://pathfinda.com/en/centurion/heuwelsig-estate/shops-services/celtis-ridge-post-office"]'
WHERE slug = 'postlink-celtis-ridge-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink Glen Village is a commercial property and office space business based in Glen Village South, Olympus.', description_enriched_at = datetime('now')
WHERE slug = 'postlink-glen-village-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink Karenpark is a courier and logistics outlet in Karenpark Crossing, Karenpark, handling printing, copying and parcel courier services for the local community.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-18:00, Sat-Sun 09:00-15:00', source_urls = '["scraped:google-places-no-website", "https://heycafes.co.za/02881470/PostLink_Karenpark"]'
WHERE slug = 'postlink-karenpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink Montana is a commercial property and office space business located in Montana Gardens, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'postlink-montana-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink Sinoville is a printing services business serving the Sinoville area of Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'postlink-sinoville-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink The Orchards is a printing services business based in The Orchards, Akasia.', description_enriched_at = datetime('now')
WHERE slug = 'postlink-the-orchards-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink Wingtip is a printing and courier outlet in Doornpoort offering business cards, flyers, banners and signage alongside vehicle licence-disc renewals, graphic design, packaging and domestic and international courier services.', description_enriched_at = datetime('now'), hours = 'Mon-Sun 08:00-18:00'
WHERE slug = 'postlink-wingtip-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postlink@Mall55 is an industrial suppliers and manufacturing business located in Monavoni, Centurion.', description_enriched_at = datetime('now')
WHERE slug = 'postlink-mall55-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pote Fourie Brokers is an insurance business serving clients in Florauna, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'pote-fourie-brokers-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pots And Plants is a plant nursery in Eloffsdal offering a wide range of plants, pots, stones and garden decor, along with landscaping services and knowledgeable staff to help customers choose plants for their homes and gardens.', description_enriched_at = datetime('now'), source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/potsandplantseloffsdal/", "https://pretoria.co.za/place/pots-and-plants"]'
WHERE slug = 'pots-and-plants-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Povinox (Pty) Ltd is a Centurion-based technology company that has offered software and app development, audio-visual solutions, and IT management services since 2013, operating out of Southdowns Ridge Office Park.', description_enriched_at = datetime('now')
WHERE slug = 'povinox-pty-ltd-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Power Core Energy (Pty) Ltd is a hardware supplier based in Eldo Glen, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'power-core-energy-pty-ltd-eldoglen-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Power Group is an engineering and surveying firm based in Eco-Park Estate, Centurion.', description_enriched_at = datetime('now')
WHERE slug = 'power-group-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Power Plant Electrical Technologies (Pty) Ltd is an electrical engineering company operating since 1998, providing general electrical and instrumentation engineering and installation work from its Silverton branch, with specialties including load flow studies, electrical protection grading, earthing system design, and low- and medium-voltage switchgear work.', description_enriched_at = datetime('now'), source_urls = '["http://www.ppetech.co.za/", "http://www.engineeringgauteng.co.za/engineering/show-engineering/573/power-plant-electrical-technologies/silverton-pretoria/electrical-engineer/"]'
WHERE slug = 'power-plant-electrical-technologies-pty-ltd-gauteng-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Power of Co is a commercial property and office space provider based in Rooihuiskraal North, Centurion.', description_enriched_at = datetime('now')
WHERE slug = 'power-of-co-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Power2SA is a solar electric power generation company headquartered in Louwlardia, Centurion, that has operated since 2012, supplying solar products and support to installers and resellers across South Africa.', description_enriched_at = datetime('now'), source_urls = '["https://power2sa.com/", "https://rocketreach.co/power2sa-profile_b709657dc4c22026", "https://www.enfsolar.com/power2sa"]'
WHERE slug = 'power2sa-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Powered By. is a marketing and advertising agency based in Rooiwal, Pretoria.', description_enriched_at = datetime('now')
WHERE slug = 'powered-by-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pracsol Land Surveyors is a land surveying and engineering firm based in Celtisdal, Centurion.', description_enriched_at = datetime('now')
WHERE slug = 'pracsol-land-surveyors-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Practice Perfect Medical Software (Pty) Ltd develops electronic health record and practice management software for South African medical professionals, including general practitioners and surgeons, covering patient self-registration, appointment scheduling, and secure patient data management.', description_enriched_at = datetime('now')
WHERE slug = 'practice-perfect-medical-software-pty-ltd-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Practicut (Cut To Size Boards Rosslyn) supplies and processes cut-to-size boards for built-in units, kitchens, and vanities, and manufactures custom flatpack furniture cut to customers'' exact measurements, pre-drilled and supplied with hardware, from its Rosslyn premises.', description_enriched_at = datetime('now'), source_urls = '["http://practicut.co.za/", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/cut-to-size-boards-rosslyn"]'
WHERE slug = 'practicut-cut-to-size-boards-rosslyn-rosslyn' AND description_enriched_at IS NULL;

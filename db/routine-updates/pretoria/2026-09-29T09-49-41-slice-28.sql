-- Description enrichment sweep (job 4) -- slice 28
-- 50 businesses: 31 researched, 19 reworded, 13 with hours found, 0 skipped.

UPDATE businesses
SET description = 'The Courier Guy Clubview Corner Locker is a self-service parcel locker point for courier collections and drop-offs, located outside the Mica store in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-clubview-corner-locker-clubview-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Copperleaf Golf Estate Locker is a self-service parcel locker point for courier collections and drop-offs, located outside The Els Club at Copperleaf Golf and Country Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-copperleaf-golf-estate-locker-copperleaf-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Engen Raslouw Locker is a self-service parcel locker point for courier collections and drop-offs, at the main entrance on Lochner Road in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-engen-raslouw-locker-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Erasmia Crossing Locker is a self-service parcel locker point for courier collections and drop-offs, located by the entrance of the OK Foods store in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-erasmia-crossing-locker-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Hennopspark is a courier and logistics branch operating out of Diamond Park on Jakaranda Street in Hennopspark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-hennopspark-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Montana is a courier and logistics branch at Shop 10 in Montana Piazza, Montana, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-montana-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Perfect Hydration Clubview Point is a self-service parcel locker point for courier collections and drop-offs, hosted at the Perfect Hydration store on Riverview Road, Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-perfect-hydration-clubview-point-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Postlink Lyttelton Point is a self-service parcel locker point for courier collections and drop-offs, located at Lyttelton Point on Cantonments Road, Lyttelton Manor, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-postlink-lyttelton-point-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Shell Clubview Garage is a self-service parcel locker point for courier collections and drop-offs, located at the Shell garage on Old Johannesburg Road, Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-shell-clubview-garage-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy Vinstra Centre Valhalla Locker is a self-service parcel locker point for courier collections and drop-offs, by the main entrance on Vinstra Road, Valhalla, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-courier-guy-vinstra-centre-valhalla-locker-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store is a variety retailer stocking homeware, gifts, toys, stationery and everyday essentials, at the Waterkloof Corner Shopping Centre on the corner of Crown and Main Avenue, Waterkloof, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/11352016508", "https://www.crazystore.co.za/"]'
WHERE slug = 'the-crazy-store-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Blu Valley Mall is a variety retailer stocking toys, kitchenware, toiletries, stationery, gifts, household goods and garden and pet supplies, in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-blu-valley-mall-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Queenswood Quarter is a variety retailer selling toys, gifts, home goods and party supplies at budget-friendly prices, on the corner of Stead Avenue and Fontana Road, Queenswood, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-18:00'
WHERE slug = 'the-crazy-store-queenswood-quarter-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Hazeldean Square is a variety retailer stocking books, DIY and hardware, electrical items, fashion and personal care, household goods, outdoor and camping gear, party supplies, pet products, stationery, arts and crafts, and toys and games, on Silverlakes Road, Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-hazeldean-square-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Northdale Shopping Centre is a variety retailer selling value-priced gifts, toys, home decor, crafts, stationery, baby items and pet essentials, on Grafenheim Street, Ninapark, Akasia.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-14:00'
WHERE slug = 'the-crazy-store-northdale-shopping-centre-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Watermeyer Park Shopping Centre is a variety retailer selling discounted home goods, party supplies, toys, stationery, crafts and gifts, in Val-de-Grace, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-18:00'
WHERE slug = 'the-crazy-store-watermeyer-park-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Croc Meat Company is a wholesale butchery established in 2020 specialising in crocodile meat cuts and sausages, also stocking venison and other game meats, all processed at registered abattoirs, with delivery across Gauteng and bulk delivery to Durban and Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:00-16:00'
WHERE slug = 'the-croc-meat-company-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The DJ Company provides DJ and entertainment services for functions and events, operating from Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-dj-company-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Daily Coffee Café Castle Walk is a branch of the independent South African coffee café franchise The Daily Coffee Café, serving coffee and light refreshments at Castle Walk Shopping Centre in Erasmuskloof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 08:00-14:00, Sun 09:00-14:00'
WHERE slug = 'the-daily-coffee-cafe-castle-walk-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Daily Coffee Café in Elardus Park Shopping Centre offers specialty coffee in a distinctive "New York-meets-Karoo" styled space, serving as a neighbourhood spot for socialising, business meetings and quiet moments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:30, Fri 07:00-18:00, Sat 07:30-16:00, Sun 08:00-14:00'
WHERE slug = 'the-daily-coffee-cafe-elardus-park-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Decisionsmiths is a decision-intelligence consulting firm combining data analytics and behavioural science to help organisations across sectors such as mining, engineering, insurance and retail improve strategic decision-making, offering diagnostic assessments, data intelligence platforms and AI-assisted decision tools.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-decisionsmiths-lydiana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This office operates as a Built Environment Capacity Building partnership between the Association of Construction Project Managers and the Department of Public Works and Infrastructure, delivering training and professional development to build technical capacity in the built environment professions, based in the Menlyn Maine Precinct, Waterkloof Glen.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-department-of-public-works-and-infrastructure-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Devs is a software development business operating from Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-devs-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Digital Colab is a digital marketing consultancy helping small businesses build and optimise their digital presence through strategic marketing, branding and design, drawing on behavioural-economics and customer-experience principles, based near Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-digital-colab-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Duncan Executive Compliance is an attorneys and legal-services business based in Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-duncan-executive-compliance-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The EDC Solution is an everyday-carry gear retailer in Hennopspark, Centurion, stocking knives, multi-tools, flashlights, medical equipment, outdoor gear and tactical accessories curated into lifestyle-based solutions for different needs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-16:00, Fri 09:00-15:00, Sat-Sun Closed'
WHERE slug = 'the-edc-solution-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Echelon Group is an advisory and consultancy firm founded in 2012, providing strategic consulting, business development and investment services including project planning, feasibility studies, market intelligence and institutional reviews for corporates, governments and development organisations across Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-echelon-group-pty-ltd-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Elegant Lodge is an accommodation establishment on 23rd Street in Hazelwood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-elegant-lodge-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Energy Gurus is an engineering firm designing and installing customised commercial, industrial and agricultural energy solutions, including solar PV and battery energy storage systems, headquartered in Centurion with branches in Bloemfontein, Nelspruit and George, serving all nine South African provinces.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'the-energy-gurus-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Espresso Bean is an industrial supplier and manufacturing business based in Moregloed, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-espresso-bean-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Event Architect Pty Ltd is an events and function-venue business based in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-event-architect-pty-ltd-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Fabric Warehouse is a fabric and haberdashery retailer operating since 1994, stocking fleece, dress fabrics, suiting, upholstery materials, curtaining and sewing supplies for bridal wear, evening wear and home décor projects, with nationwide delivery from Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-17:00, Sun Closed',
    source_urls = '["https://www.yellosa.co.za/company/756199/the-fabric-warehouse", "https://za.africabz.com/gauteng/the-fabric-warehouse-12583", "https://www.thefabricwarehouse.co.za/"]'
WHERE slug = 'the-fabric-warehouse-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Facilitators is a service provider that facilitates NHBRC registrations, renewals and enrolments between home builders, developers and the NHBRC, also offering insurance solutions such as professional indemnity, contractors'' all-risk and performance guarantees, based in Lyttelton Manor, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.the-facilitators.com/", "https://pretoria.co.za/listing/the-facilitators-one-stop-between-you-and-the-nhbrc/"]'
WHERE slug = 'the-facilitators-one-stop-between-you-and-the-nhbrc-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Factory Shop is a general retail store in Elardus Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-factory-shop-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Family Dentist is a full-service dental practice in Faerie Glen offering general dentistry, dental emergencies, paediatric dentistry and tooth reconstructions, with online booking, free short-distance Uber rides for patients and secured on-site parking.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-20:00, Fri 09:00-15:00, Sat 08:00-13:00'
WHERE slug = 'the-family-dentist-faerie-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Femalexx Kitchen is a bespoke catering business in East Lynne offering tailored menus for private and corporate events, alongside cakes, platters, cheese boards and its own organic condiment line, Umnotho Organics.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00'
WHERE slug = 'the-femalexx-kitchen-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Fish Shop SA is a seafood restaurant and fresh-fish retailer at Ryneveld Lifestyle Centre, serving fish, prawns, calamari and seafood burgers for dine-in, alongside fresh fish for customers to prepare at home.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-20:00, Fri-Sat 11:00-21:00, Sun Closed'
WHERE slug = 'the-fish-shop-sa-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Food Works Hennopspark is a family-owned business established in 2019 manufacturing and selling restaurant-quality frozen meals, including chicken dishes, rice-based meals, pies, desserts and pre-cooked vegetables, with delivery across Centurion and Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-food-works-hennopspark-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Francis Brokerage is a real estate agency in Centurion specialising in property sales and rentals, offering property listings, email alerts for new listings and bond-calculator tools to help buyers and sellers through transactions.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-francis-brokerage-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The GAS Company is an LPG gas supplier offering gas refills, installations, exchanges and delivery, including its GasOnTapp telemetry service, operating from Hennopspark, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thegascompany.co.za/", "https://www.thegascompany.co.za/contact-us/"]'
WHERE slug = 'the-gas-company-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Gas Company is an LPG gas supplier offering gas refills, installations, exchanges, telemetry systems and its GasOnTapp service, with collection and delivery options, based in Hennopspark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-gas-company-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Geekest is a printing-services business in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-geekest-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The General Store at Six Fountains Lifestyle & Decor Centre is a homeware retailer stocking décor, kitchen essentials, tools, gadgets, toys, clocks, makeup and LED lighting, in the Six Fountains Residential Estate.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:30-17:30'
WHERE slug = 'the-general-store-six-fountains-six-fountains-residential-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The George Group Pty Ltd is a nursery and garden centre based in Murrayfield, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-george-group-pty-ltd-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Giving Green Store is a family-run online plant and plant-gift retailer established in 2022, selling houseplants nationwide with careful packaging and personal service, and offering collection visits by appointment from its Wingate Park base.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-giving-green-store-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Golden Thread Life Coaching offers midlife coaching aimed at helping clients rediscover their passions and purpose, with sessions bookable online and free discovery calls, based in Wonderboom South.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-golden-thread-life-coaching-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Golf Lab is a golf retailer and custom club-fitting service in Woodhill offering fittings by appointment alongside new and pre-owned equipment from brands including TaylorMade, Titleist, Callaway and Ping, plus trade-ins and a membership programme.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-golf-lab-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The GolfCart Company is a Centurion-based business specialising in golf cart maintenance, repair, customisation and trading, with an in-house engineering shop that fabricates parts and builds bespoke carts to customer specifications.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-golfcart-company-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Golfers Club is a golf equipment, clothing and accessories store at Byls Bridge Promenade in Highveld, Centurion, offering in-store pickup, delivery and same-day delivery options.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.golfersclub.co.za/", "https://pretoria.co.za/place/the-golfers-club-centurion-1"]'
WHERE slug = 'the-golfers-club-centurion-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Good Co is a custom cabinetry and joinery manufacturer designing, building and installing precision cabinetry for architects, commercial spaces and high-end residential projects across Gauteng, from initial 3D design through manufacturing at its Derdepoort workshop to on-site installation.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-good-co-derdepoort' AND description_enriched_at IS NULL;

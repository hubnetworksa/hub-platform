-- Description enrichment sweep (job 4) - slice 44
-- 50 businesses, werner-and-associates-pty-ltd-tijger-valley .. willow-park-self-storage-the-willows

UPDATE businesses
SET description = 'Werner and Associates (Pty) Ltd is a business consulting firm based in Tygerberg, Tshwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'werner-and-associates-pty-ltd-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Kennett Corporation is a Rosslyn-based manufacturer of resistance welding equipment, producing welding machines, transformers and accessories with an in-house design office, CNC machining capability and a full repair centre for reconditioning equipment.',
    description_enriched_at = datetime('now')
WHERE slug = 'west-kennett-corporation-c-c-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Marketing is a marketing and advertising business in Amberfield Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'west-marketing-amberfield-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Pack Express Lynnwood Lane is a home goods and packaging retailer in Equestria, stocking storage solutions, party supplies, packaging materials, kids'' toys, school accessories and home accessories, with in-store shopping, pickup and delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/gauteng/west-pack-express-lynnwood-lane-33906", "https://za.africabz.com/gauteng/west-pack-express-lynnwood-lane-249988", "https://pretoria.co.za/listing/west-pack-express-lynnwood-lane-2/"]'
WHERE slug = 'west-pack-express-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Pack Lifestyle Kolonnade is a homeware and lifestyle goods store in Kolonnade Retail Park, Montana Park, part of the West Pack Lifestyle retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-17:00, Sun 07:00-15:00',
    source_urls = '["http://www.westpacklifestyle.co.za/", "https://www.westpacklifestyle.co.za/store-locator/west-pack-lifestyle-kolonnade?sId=23"]'
WHERE slug = 'west-pack-lifestyle-kolonnade-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Pack Lifestyle Ryneveld is a homeware and furniture store in Pierre van Ryneveld, Centurion, part of the West Pack Lifestyle retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:30-15:00',
    source_urls = '["https://www.africabizinfo.com/ZA/west-pack-lifestyle-pierre-van-ryneveld-010-003-5505", "https://pretoria.co.za/place/west-pack-lifestyle-ryneveld", "https://za.africabz.com/gauteng/west-pack-lifestyle-pierre-van-ryneveld-296599", "https://my-catalogue.co.za/stores/centurion/west-pack-lifestyle/75-van-ryneveld-st-pierre-van-ryneveld"]'
WHERE slug = 'west-pack-lifestyle-ryneveld-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'West Rand Box is a corrugated box manufacturer in Kirkney, Pretoria, with over 30 years'' experience producing RSC boxes, die-cut boxes, telescoping boxes and custom corrugated packaging with flexographic printing for agriculture, industrial, retail and transport uses.',
    description_enriched_at = datetime('now')
WHERE slug = 'west-rand-box-pty-ltd-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westend Office Park is an A-grade office park in Die Hoewes, Centurion, offering flexible office suites with backup generators, 48-hour emergency water supply, fibre connectivity, an on-site restaurant, boardroom facilities and a Gautrain shuttle service.',
    description_enriched_at = datetime('now')
WHERE slug = 'westend-office-park-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Western Connection Services is a business consulting company in Sunnyside, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'western-connection-services-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Western National Insurance is a niche commercial insurer offering business, agricultural, sectional title, engineering and specialist liability cover, with an office in Montana Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'western-national-insurance-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Western Printers is a digital design and printing company established in 2002, offering marketing material design, training manuals, large format printing and finishing services from its Monument Park premises.',
    description_enriched_at = datetime('now')
WHERE slug = 'western-printers-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westholts is a Centurion-based IT services provider offering remote and on-site computer, phone and network support, technology consulting, and custom web development and hosting.',
    description_enriched_at = datetime('now')
WHERE slug = 'westholts-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westhouse and Garden is an interior and landscape design business in Ashlea Gardens, Pretoria, creating indoor and outdoor living spaces.',
    description_enriched_at = datetime('now')
WHERE slug = 'westhouse-and-garden-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westside Trading 448 is a turnkey property development and home construction company in Midstream Estate, Centurion, managing projects from consultation and design through to construction and finishes, and has built over 100 homes.',
    description_enriched_at = datetime('now')
WHERE slug = 'westside-trading-448-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wethu Intellect is a technology company in Thatchfield Ridge Estate, Centurion, offering digital solutions powered by automation and AI.',
    description_enriched_at = datetime('now')
WHERE slug = 'wethu-intellect-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weyer and Weyer Attorneys is a specialist conveyancing firm in Lyttelton, Centurion, handling property transfers, bond registrations and cancellations, sectional title extensions, and deceased estate administration, and sits on the conveyancing panels of major South African banks.',
    description_enriched_at = datetime('now')
WHERE slug = 'weyer-weyer-attorneys-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wheel Assemblers is a Rosslyn manufacturer providing automated, integrated wheel and tyre assembly solutions for OEM production, including supply chain management, quality traceability and logistics services.',
    description_enriched_at = datetime('now')
WHERE slug = 'wheel-assemblers-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Whisk Cafe is a breakfast and bakery cafe in Monument Park Shopping Centre, serving all-day breakfast, brunch, coffee, pizza, platters and a takeaway pantry of cakes, pastries and home-cooked meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 07:00-21:30, Wed-Sat 07:00-22:30, Sun 08:00-16:30'
WHERE slug = 'whisk-cafe-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Whisk Wine Bar is a wine bar and restaurant in Cornwall Hill Estate, Centurion, offering a food and wine menu with dine-in and function bookings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-23:00, Fri 07:00-00:00, Sat 08:00-00:00, Sun 08:00-17:00'
WHERE slug = 'whisk-wine-bar-cornwall-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Whispering Tree Tops is a garden event venue in Hennopspark, Centurion, known for its outdoor chapel and fairy-lit forest setting beside the Hennops River, hosting weddings, conferences and birthday celebrations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/6924493459", "https://www.facebook.com/WhisperingTreeTopsGardenVenue/"]'
WHERE slug = 'whispering-tree-tops-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wholesale Fencing SA is a fencing and steel products supplier in Hennopspark, Centurion, serving the construction, agriculture and mining sectors with panel fencing, galvanized wire and clear view fencing.',
    description_enriched_at = datetime('now')
WHERE slug = 'wholesale-fencing-sa-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wholesale stepping stones Eddie''s is a stepping stone and paving supplier in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wholesale-stepping-stones-eddie-s-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wholesaler is a wholesale supplier of industrial goods in Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wholesaler-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wholter is a software development company in Southdowns, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'wholter-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Whoosh is a Centurion-based payment gateway provider offering an online PayPage for card payments, shareable payment links, e-commerce plugins for platforms such as WooCommerce and Shopify, a RESTful API, and real-time reporting with fraud protection.',
    description_enriched_at = datetime('now')
WHERE slug = 'whoosh-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wierda Park Butchery is a butchery in Wierda Park, Centurion, supplying beef, lamb, pork, chicken, boerewors, cold meats, bacon, dry-aged steaks, game meat and spit braai rentals, made from Class A meat with no added fillers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 07:30-16:00, Sun 08:00-13:00'
WHERE slug = 'wierda-park-butchery-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wierda Park Pets is a pet shop in Wierda Park, Centurion, stocking premium pet food and accessories for dogs, cats, birds, fish, reptiles and small animals, with advice from knowledgeable staff.',
    description_enriched_at = datetime('now')
WHERE slug = 'wierda-park-pets-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wierdapark City Cleaning services & Maid Services is a home and business cleaning company in Wierda Park, Centurion, offering deep cleaning and disinfecting, canopy and extractor hood cleaning, fat trap cleaning and computer cleaning.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://cleaningcompanies.co.za/organisations/wierdapark-city-cleaning-services-maid-services/"]'
WHERE slug = 'wierdapark-city-cleaning-services-maid-services-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wierdapark Traders is a family-run furniture shop in Wierda Park, Centurion, buying and selling new and used furniture.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.cylex.net.za/company/wierdapark-traders-23826323.html"]'
WHERE slug = 'wierdapark-traders-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wierie Woekerland is a nursery school and aftercare centre in Wierda Park, Centurion, catering to babies through preschool-age children with kleuterskool and naskool programmes.',
    description_enriched_at = datetime('now')
WHERE slug = 'wierie-woekerland-kleuterskool-en-naskool-in-wierdapark-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wikus Strydom Attorneys Inc. is a conveyancing and property law firm in Midstream Estate, handling property transfers, antenuptial contracts, deceased estate administration, wills, sectional title registrations, subdivisions and servitudes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30'
WHERE slug = 'wikus-strydom-law-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wild Cinderella''s is an online retailer of outdoor, survival and adventure gear, including camping, sports and outdoor equipment and accessories, with worldwide shipping.',
    description_enriched_at = datetime('now')
WHERE slug = 'wild-cinderella-s-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wild Pepper Apps is a software development company in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wild-pepper-apps-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wild Route Cafe is a nature-themed coffee shop in Zwavelpoort, Pretoria, offering breakfast, pizza, daily cake and cappuccino specials, vegetarian options, outdoor seating and on-site nursery produce.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/wild-route-cafe"]'
WHERE slug = 'wild-route-caf-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wild Route Nursery is an indigenous tree nursery in Zwavelpoort, Pretoria, stocking close to 10,000 indigenous trees.',
    description_enriched_at = datetime('now')
WHERE slug = 'wild-route-nursery-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wild Side Creative is a marketing and creative agency in Shere, Pretoria, offering website design and development, social media marketing, branding and logo design, graphic and print design, and email marketing.',
    description_enriched_at = datetime('now')
WHERE slug = 'wild-side-creative-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wildebeest Air is an HVAC and ventilation company in Ninapark, Pretoria, providing air conditioning and ventilation system design, installation and preventative maintenance for hospitals, shopping centres, hotels, factories and offices.',
    description_enriched_at = datetime('now')
WHERE slug = 'wildebeest-air-pty-ltd-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wildfire Biltong Factory is a butchery specialising in biltong, in Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wildfire-biltong-factory-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wildman Montana is a hunting and outdoor equipment retailer in Montana Value Centre, Montana Park, offering hunting and outdoor gear at competitive prices with a nationwide loyalty rewards card.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'wildman-montana-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wildwood is a nursery and garden centre in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wildwood-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wilgers Hospital is a 360-bed private hospital in Die Wilgers, Pretoria, one of the largest in the Life Healthcare Group, with an accident and emergency unit and helicopter landing pad, a 46-bed intensive care unit, a 16-bed neonatal ICU and 22 medical and surgical disciplines including cardiology, neurosurgery, orthopaedics, obstetrics and oncology.',
    description_enriched_at = datetime('now')
WHERE slug = 'wilgers-hospital-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wilgers MRI Department is a diagnostic imaging centre in Die Wilgers, Pretoria, part of the Capital Radiology network, providing MRI scanning services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://za.africabz.com/gauteng/wilgers-mri-department-243928"]'
WHERE slug = 'wilgers-mri-department-magnetic-resonance-imaging-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Will Consulting is an engineering and digital transformation consultancy in Die Hoewes, Centurion, advising on strategy implementation, enterprise architecture, enterprise service management, project management and ICT solutions such as workflow automation and business intelligence.',
    description_enriched_at = datetime('now')
WHERE slug = 'will-consulting-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willards Foods is a snack food manufacturer in Rosslyn, producing Cheese Curls and Flings, Big Korn Bites, Crinkle Cut and Flanagan''s Irish Kettle fried chips and Cheasnaks for the South African market.',
    description_enriched_at = datetime('now')
WHERE slug = 'willards-foods-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willchris Joinery is a joinery and woodworking supplier in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'willchris-joinery-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willem Steyn Properties is an estate agency in Pierre van Ryneveld Park, Centurion, handling property sales and rentals of houses and townhouses in Centurion and Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'willem-steyn-properties-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'William Tintinger Attorneys is a litigation and divorce law firm in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'william-tintinger-attorneys-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willow Integrated Business Solutions is a marketing and advertising business in Moreleta Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'willow-integrated-business-solutions-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willow Park Animal Hospital is a veterinary hospital in Willow Glen, Pretoria, offering vaccinations, parasite control, dermatology, acupuncture, dentistry, surgery, chemotherapy, diagnostics including x-ray and ultrasound, and a retail vet shop, with consultations by appointment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-15:00, Sat 08:30-10:30, Sun Closed'
WHERE slug = 'willow-park-animal-hospital-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willow Park Self Storage is a self storage facility in Willow Park Manor, Pretoria, offering a range of unit sizes for household and commercial storage with security cameras, beams, a perimeter wall and 24-hour surveillance.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 06:00-18:00'
WHERE slug = 'willow-park-self-storage-the-willows' AND description_enriched_at IS NULL;

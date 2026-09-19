-- Job 4 description enrichment batch, generated progressively.

UPDATE businesses
SET description = 'Praxis Projectscc is a building and construction business in Donkerhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'praxis-projectscc-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pre-Vue Accounting Services and IT provides accounting and IT support services from its office in Die Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pre-vue-accounting-services-and-it-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Precious Gold Properties is a women-owned estate agency based in Blu Valley Mall, The Reeds, offering property sales, rentals and management across Centurion, Rooihuiskraal, Midrand, Thatchfield and Midstream.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.preciousgoldproperties.co.za/", "https://www.property24.com/estate-agents/precious-gold-properties/34391"]'
WHERE slug = 'precious-gold-properties-centurion-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Precise Pools is a swimming pool construction and maintenance business in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'precise-pools-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Precision Medical Solutions is a medical practice administration company, established in 2008, offering tailored practice management, paperless-practice solutions and POPI-compliance support to medical specialists from its Persequor office.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-16:00, Fri 07:00-15:30'
WHERE slug = 'precision-medical-solutions-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prefernet is a solar, gas, technology and outdoor-equipment supplier in Erasmia, helping customers switch to solar and gas to cut their electricity costs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://prefernet.co.za/"]'
WHERE slug = 'prefernet-solar-and-gas-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premier FMCG - Pretoria Wheat Mill is one of Premier FMCG''s wheat mills, part of a food-manufacturing group whose history dates back to 1824 and includes the Snowflake and Blue Ribbon flour brands, operating from Waltloo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat-Sun Closed',
    source_urls = '["http://www.premierfmcg.com/", "https://pretoria.co.za/listing/premier-fmcg-pretoria-wheat-mill/"]'
WHERE slug = 'premier-fmcg-pretoria-wheat-mill-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premier Mats and Accessories (Pty) Ltd manufactures rubber mats and accessories from its facility in Derdepoort''s Kirimanzi Business Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.premiermats.co.za/", "https://pretoria.co.za/listing/premier-mats-and-accessories-pty-ltd/"]'
WHERE slug = 'premier-mats-and-accessories-pty-ltd-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premier Paper Manufacturers is a paper-manufacturing business based in Westhills Business Park, Sunderland Ridge, employing around 61 people.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://premierpaper.co.za/", "https://www.zoominfo.com/pic/proximo-101-investments-pty-ltd-ta-premier-paper-manufacturers/546997589"]'
WHERE slug = 'premier-paper-manufacturers-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premier Plastics (Pty) Ltd manufactures flexible plastic packaging for the retail industry, running extrusion, printing, bag-making and recycling equipment with a capacity of over 9,000 tonnes a year from its Waltloo facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://premierplastics.co.za/", "https://premierplastics.co.za/about-us.html"]'
WHERE slug = 'premier-plastics-pty-ltd-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premier Self Storage and Parking has provided secure storage units and covered parking bays for homes, offices and businesses from its site in Olympus since 2008.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Sat 07:00-18:00',
    source_urls = '["http://premierstorage.co.za/", "http://premierstorage.co.za/about-us.html"]'
WHERE slug = 'premier-self-storage-and-parking-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premier Sports is a sports-equipment retailer trading from Miracle Retail Park in Rooihuiskraal North, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'premier-sports-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premiere Etoile Shuttle Service is a 100% Black-owned shuttle operator based in Centurion, offering airport transfers, scholar and corporate transport, contract-based staff transport and private shuttle services across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://premiereetoile.co.za/", "https://www.shuttlescout.co.za/operator/premiere-etoile-shuttle-services"]'
WHERE slug = 'premiere-etoile-shuttle-service-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premiserv Pty (Ltd) is a building and construction business based in Zwavelpoort.',
    description_enriched_at = datetime('now')
WHERE slug = 'premiserv-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premium Group SA is a plumbing and maintenance business offering general plumbing, burst-geyser repairs, drain jetting and drain-camera inspections, plus electrical maintenance, to homes, complexes, shops, offices, hotels and business parks across Gauteng from its Montana Park base.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.premiumgroupsa.co.za/", "https://www.procompare.co.za/providers/premium-group-sa"]'
WHERE slug = 'premium-group-sa-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premium Ideas is a commercial property services business operating from Samrand Business Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'premium-ideas-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premium Trading Company is a building and construction business in Karenpark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'premium-trading-company-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PremiumPrint SA is a small printing, graphic-design and marketing-solutions business with over a decade of experience in visual communication, based in Erasmuskloof.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.premiumprint.co.za/", "https://rocketreach.co/premiumprint-sa-profile_b6ee7021c6f1fd67"]'
WHERE slug = 'premiumprint-sa-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pressed In Time, Eco Boulevard is a branch of Pressed In Time, South Africa''s largest laundry and dry-cleaning network (operating since 2003 with over 80 franchises), offering dry cleaning, laundry, carpet and sneaker cleaning from its shop in Eco Boulevard, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pressedintime.co.za/", "https://www.instagram.com/pressedintime_ecoboulevard/"]'
WHERE slug = 'pressed-in-time-eco-boulevard-centurion-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pressure Works SA offers pressure-washing services for driveways, pavements, fences, decking, patios and vehicles, from its base in Clubview, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://cleaningequipment.co.za/firms/pressure-works-sa/"]'
WHERE slug = 'pressure-works-sa-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prestige Airconditioning Contractors (Pty) Ltd is an HVAC contractor in Klerksoord offering air-conditioning installation, servicing, repairs and portable-unit supply.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.procompare.co.za/providers/prestige-airconditioning-contractors-pty-ltd-1"]'
WHERE slug = 'prestige-airconditioning-contractors-pty-ltd-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prestige Properties Moot is a real estate agency, part of the Quotum Real Estate group alongside XpressSale Auctioneers, servicing property owners across Rietondale, Riviera, Villieria, Gezina, Queenswood, Kilner Park, Wonderboom South and the wider Moot area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.prestigeprop.co.za/agent-marchell-le-roux", "https://pretoria.co.za/listing/prestige-properties-moot/"]'
WHERE slug = 'prestige-properties-moot-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretor Group is a property management company with 50 years in business, providing residential letting, property management and sectional-title administration across Pretoria North, Pretoria East, Pretoria Central, Centurion and Midrand from its Doringkloof office.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pretor.co.za/", "https://www.property24.com/estate-agents/pretor-property-management-(pty)-ltd/25356"]'
WHERE slug = 'pretor-group-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Aggregates & Plant Hire supplies TLB and tipper-truck hire, sand, stone, maxi bricks, red bricks and paving bricks, plus rubble removal and site-clearance services, from its Dorandia base.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pretoriaplanthire.co.za/", "https://www.facebook.com/p/Pretoria-Aggregates-and-Plant-Hire-100065217561902/"]'
WHERE slug = 'pretoria-aggregates-plant-hire-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Arms is a firearms and outdoor-gear retailer at Montana Boulevard Lifestyle Centre in Magalieskruin, in operation since 1974 and originally a gunsmithing operation specialising in competition-pistol accurizing; it now stocks firearms, ammunition and optics, runs an underground 25m/50m/100m shooting range, and offers firearm competency training.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-arms-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Battery is a general retailer in Nieuw Muckleneuk, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-battery-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Blommemark is a florist near Marabastad''s flower market on President Burgers Street, supplying flowers and decor for weddings, parties and other occasions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/pretoria-blommemark/166060", "https://za.africabz.com/gauteng/pretoria-blommemark-124439", "https://www.sayellow.com/view/south-africa/pretoria-blommemark-in-pretoria"]'
WHERE slug = 'pretoria-blommemark-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Boekbinders (Edms) BPK is a printing and bookbinding business in Mountain View, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-boekbinders-edms-bpk-tileba' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Box Manufacturer, established in 1956, makes corrugated cartons and packaging materials tailored to clients'' needs from its factory in Hermanstad.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30',
    source_urls = '["http://www.ptabox.co.za/", "https://pretoria.co.za/place/pretoria-box-manufacturer"]'
WHERE slug = 'pretoria-box-manufacturer-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Bumper and Scratch Repair is an automotive repair business in Villieria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-bumper-and-scratch-repair-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Ceilings and Drywalling Contractors (Pty) Ltd is a women-owned business in Garsfontein offering drywall installations and ceiling supplies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretoria.co.za/listing/pretoria-ceilings-and-drywalling-contractors-pty-ltd/"]'
WHERE slug = 'pretoria-ceilings-and-drywalling-contractors-pty-ltd-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Coal Company is a coal supplier based in Pretoria West.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-coal-company-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria East Electrical Services offers 24/7 emergency electrical call-outs from its Olympus base, covering Moreleta Park, Faerie Glen, Garsfontein, Silver Lakes, Lynnwood, Elardus Park, Equestria and Menlyn.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-east-electrical-services-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria East Electrician is a 24/7 electrical services provider based in Faerie Glen, advertised as charging no call-out fee.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretoriaeastelectricians.com/", "https://www.mrhandy.co.za/listing/pretoria-east-electricians-0716260952-no-call-out-fee/"]'
WHERE slug = 'pretoria-east-electrician-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria East Electricians & Plumbers is an electrical and plumbing services provider in Boardwalk Manor, Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-east-electricians-plumbers-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria East Plumber Pretoria offers emergency repairs, routine maintenance and full plumbing installations with licensed plumbers available 24/7, from its base in Ashlea Gardens.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretoriaeastplumbers.one/", "https://www.hotfrog.co.za/company/678a2455e88639bdfbb33a2d72332070/pretoria-east-plumber-pretoria/pretoria/plumbing-water"]'
WHERE slug = 'pretoria-east-plumber-pretoria-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria East Property Valuation is a PPRA-registered property valuation service in La Montagne, Pretoria East, operating since 2011 through a SACPVP Candidate Valuer holding an MSc in Property Studies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://cjvh.co.za/pretoria-east-property-valuation/", "https://cjvh.co.za/chrisjan-van-heerden-property-valuation-in-pretoria-east/"]'
WHERE slug = 'pretoria-east-property-valuation-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria East Testing Station, established in 2001, is a privately owned A-Grade vehicle testing station licensed under the National Road Traffic Act, offering roadworthy testing for light and heavy-duty vehicles, motorcycles, trailers, caravans, ambulances and cash-in-transit vehicles from Jan Niemand Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat-Sun Closed',
    source_urls = '["https://pretoriaeasttesting.co.za/"]'
WHERE slug = 'pretoria-east-testing-station-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Engineers C C is a car dealership in Hermanstad, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-engineers-c-c-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Food Club is a non-profit food club, part of the Food Club Hub network affiliated with RegenAg SA, building decentralised food networks in Waverley to promote cruelty-free and sustainable farming through consumer spending.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pretoria.foodhub.org.za/", "https://www.foodhub.org.za/"]'
WHERE slug = 'pretoria-food-club-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Gates, established in 2021, manufactures custom gates and carports and installs clearview and palisade fencing, electric fences and gate motors, with over 7 years of expertise in access-control and security automation, from its East Lynne base.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pretoriagates.co.za/", "https://pretoriagates.co.za/about-us/"]'
WHERE slug = 'pretoria-gates-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Gates & Fences manufactures and installs custom gates, fences, carports and steel structures across Pretoria, including electric fences, gate motors and intercoms, with same-day repairs offered from its East Lynne base.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pretoriagatesandfences.co.za/", "https://pretoriagatesandfences.co.za/services"]'
WHERE slug = 'pretoria-gates-fences-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Heavy Duty Gearbox Centre CC is a gearbox repair and exchange specialist in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-heavy-duty-gearbox-centre-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Pretoria Hotel is a 3-star hotel in Arcadia offering air-conditioned rooms, conference facilities and rooftop views of the Union Buildings, along with a restaurant serving international cuisine with vegetarian and halal options, and billiards and darts.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/6898767782", "https://www.yep.co.za/biz/store/pretoria-hotel/330741", "https://thepretoriahotel.com/contact-us/"]'
WHERE slug = 'pretoria-hotel-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Hydraulic & Seal Centre (Pty) Ltd supplies hydraulic equipment, seals and couplings from its base in Hermanstad.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-hydraulic-seal-centre-pty-ltd-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Internet Printing is a printing services business in Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-internet-printing-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Main Bus Depot is a bus depot in Salvokop, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-main-bus-depot-salvokop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Mansion Boutique Hotel is a boutique hotel in Waterkloof Heights with 13 guestrooms, a swimming pool, spa services and private check-in, serving continental or full English/Irish breakfast daily, close to the Pretoria Country Club, Voortrekker Monument and Union Buildings.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pretoriamansion.co.za/contact/", "https://magicpin.com/south-africa/Pretoria/Waterkloof-Heights/Hotel/Pretoria-Mansion-Boutique-Hotel/store/232a812", "https://www.facebook.com/PretoriaMansion/"]'
WHERE slug = 'pretoria-mansion-boutique-hotel-waterkloof-heights' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Movers, previously trading as Olifants Rentals and with over 10 years of industry experience, is a furniture removal and logistics company handling home, office and corporate moves, local relocations and national and contract deliveries from its Clubview base.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed',
    source_urls = '["http://www.pretoriamovers.co.za/", "https://www.pretoriamovers.co.za/about-us"]'
WHERE slug = 'pretoria-movers-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Noord Vleismark is a butchery in Wolmer offering premium beef, pork and chicken cuts and cooking advice from its team, plus delivery and in-store pickup options.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretorianoordvleismark.co.za/", "https://pretoria.co.za/place/pretoria-noord-vleismark"]'
WHERE slug = 'pretoria-noord-vleismark-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria North Alkaline Designer Water is a Designer Water franchise supplying premium pH10+ alkaline bottled water in Pretoria North, with curbside pickup and delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretoria.co.za/listing/designer-water-t-a-pretoria-north-alkaline-water-waterpreneur/", "https://designerwater.co.za/"]'
WHERE slug = 'pretoria-north-alkaline-designer-water-tileba' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria North Wool Centre is a yarn shop stocking knitting-wool brands including Mirage, Fiesta, Elle, Pingouin and Industrial, along with knitting accessories, patterns, needles and ribbon.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:30-13:00 & 14:00-16:35, Tue 10:30-13:00 & 14:00-16:35, Wed-Thu 09:30-13:00 & 14:00-16:35, Fri 09:30-12:00 & 14:00-16:35, Sat 09:30-13:00, Sun Closed',
    source_urls = '["https://www.pretorianorthwoolcentre.com/", "https://pretoria.co.za/listing/pretoria-north-wool-centre/"]'
WHERE slug = 'pretoria-north-wool-centre-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Pest Control provides residential and commercial pest-control services from its base in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-pest-control-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Rubble Removal is a building and construction business based in Wapadrand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-rubble-removal-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Self Storage (PTASS), established in the early 2000s, offers a safe, secure and affordable self-storage facility in Pretoria West.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-self-storage-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Service Centre is an automotive repair business based in N4 Gateway Industrial Park, Willow Park Manor.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-service-centre-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Sheet Metal Works is a sheet-metal fabrication contractor in Claremont, offering fabrication, finishing and custom metalwork with quick turnaround for builders and contractors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cylex.net.za/company/pretoria-sheet-metal-works-17462963.html", "https://pretoria.co.za/place/pretoria-sheet-metal-works"]'
WHERE slug = 'pretoria-sheet-metal-works-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Station is the city''s central railway station on Scheiding Street, housed in a 1910 building designed by Herbert Baker, and also serves as an Intercape bus office.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.intercape.co.za/", "https://en.wikipedia.org/wiki/Pretoria_railway_station"]'
WHERE slug = 'pretoria-station-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Tree Felling Experts is a tree-felling and garden-services business based in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-tree-felling-experts-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Vervoerkonsultante, started in 1982, is a family-owned heavy-transport consultancy specialising in abnormal-load and cross-border transport exemptions and abnormal-vehicle registrations, based in Koedoespoort.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://pretoriavervoerkonsultante.co.za/", "https://pretoriavervoerkonsultante.co.za/about-us-37-years-experience"]'
WHERE slug = 'pretoria-vervoerkonsultante-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria WISP is an independent wireless internet service provider based in Garsfontein, offering uncapped Wi-Fi and fibre-like connectivity to homes, businesses, estates and complexes, with direct support instead of a call centre.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretoria-wisp.co.za/", "https://pretoria.co.za/place/pretoria-wisp"]'
WHERE slug = 'pretoria-wisp-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria brake and clutch is an automotive repair business specialising in brakes and clutches, based in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-brake-and-clutch-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria buses to Zimbabwe Bosman station operates cross-border coach services between Pretoria and Zimbabwe, including Harare, from the Bosman Station bus terminus in Salvokop.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.busbud.com/en/bus-pretoria-harare/r/kekjd2-ksy465"]'
WHERE slug = 'pretoria-buses-to-zimbabwe-bosman-station-salvokop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria Company Registrations offers fast, affordable company-registration services from Bryntirion, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-company-registrations-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria small business networking is a business-consulting service based in Eldo Lakes Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pretoria-small-business-networking-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretoria.East Taxshop offers monthly bookkeeping, payroll, business registration, financial-statement preparation and tax services from Alphen Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.procompare.co.za/providers/bp-professional-services-ta-pretoriaeast-taxshop"]'
WHERE slug = 'pretoria-east-taxshop-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pretorius Park Clinic is a public clinic offering immunisations, family planning, antenatal and postnatal care, sick-baby care, chronic-care management, STI treatment and outpatient acute and emergency services, in Pretorius Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=101543", "https://pretoria.co.za/listing/pretorius-park-clinic/", "https://www.yep.co.za/biz/store/iyp/17055378_2"]'
WHERE slug = 'pretorius-park-clinic-pretorius-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Preventix (Pty) Ltd is an engineering and surveying business based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'preventix-pty-ltd-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Preweld (Pty) Ltd - Rosslyn is an authorised distributor of industrial and hospitality gases, LPG gas refills, and welding equipment including MIG, TIG and ARC welding machines, plasma cutters, safety gear and welding consumables.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.preweld.co.za/", "https://www.yep.co.za/biz/store/preweld/420585"]'
WHERE slug = 'preweld-pty-ltd-rosslyn-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Priban Pressings is an industrial manufacturing business based in Kameeldrift East, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'priban-pressings-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pride Milling (Head Office) manufactures, markets and distributes white and yellow GMO and GMO-free maize products for commercial and industrial use, certified to recognised food-safety and quality-management standards, from Highveld Techno Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pridemilling.co.za/", "https://pridemillingco.co.za/contact-pride-milling/"]'
WHERE slug = 'pride-milling-head-office-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prifactor Creative is part of the Prifactor Group, founded in 2016, which provides audio-visual and staging solutions, digital marketing tools and event-management services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://prifactor.com/"]'
WHERE slug = 'prifactor-creative-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prime Africa Consult, established in 2004, is an independent resource-economics consultancy specialising in economic valuation, economic and environmental modelling, economic baseline studies and market intelligence, based in Jan Niemand Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.primeafrica.net/", "https://www.dnb.com/business-directory/company-profiles/prime-africa-consult-(pty)-ltd.9ec7f9fa6c1f78d30f558f9896131f2c"]'
WHERE slug = 'prime-africa-consult-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prime Auto Glass offers windscreen repair and replacement in Pretoria North, with a repair-first, safety-focused approach and over 13 years of hands-on auto-glass experience.',
    description_enriched_at = datetime('now')
WHERE slug = 'prime-auto-glass-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prime Connect is a computer and IT services business based in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'prime-connect-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prince''s Park College is an independent private school on Paul Kruger Street in Pretoria Central.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolguide.co.za/schools/private-schools/princess-park-college.html", "https://www.school-register.co.za/school/princess-park-secondary-school-and-college/", "https://showme.co.za/pretoria/lifestyle/princess-park-college-2/"]'
WHERE slug = 'prince-s-park-college-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prinmor Construction CC, established in 1997, is a low-cost housing contractor that has built around 35,000 housing units across Gauteng, North West and Mpumalanga, registered with the NHBRC and holding a CIDB grading of 5GB and 1CE.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://prinmor.co.za/about-us/"]'
WHERE slug = 'prinmor-construction-c-c-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prinsloo Inc Tax and Accountants is an accounting and tax practice in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'prinsloo-inc-tax-and-accountants-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prinsloo Wright Incorporated Attorneys is a multi-disciplinary law firm established in 2006, based at Boardwalk Office Park in Faerie Glen.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://prinsloowrightinc.co.za/", "https://www.facebook.com/prinsloowright/"]'
WHERE slug = 'prinsloo-wright-incorporated-attorneys-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prinsloos Attorneys is a niche law firm specialising in insurance and liability law -- including insurance litigation, road-engineering liability, municipal liability, agricultural liability, retail liability and medical negligence -- based in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'prinsloos-attorneys-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Print Copy Sign produces business cards, flyers and banners at competitive prices from Hercules, with same-day delivery available for off-site orders.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.print3000.co.za/", "https://pretoria.co.za/place/print-copy-sign"]'
WHERE slug = 'print-copy-sign-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Print Joy offers corporate branding, personalised gifting, garment printing, vehicle branding, signage and banners, promotional and corporate gifts, stickers, labels and business stationery, plus large and small-format printing, from Elardus Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:00, Sat-Sun Closed',
    source_urls = '["https://printjoy.co.za/", "https://pretoria.co.za/place/print-joy"]'
WHERE slug = 'print-joy-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Print Partner offers graphic design, screen printing, business cards, flyers and custom merchandise from Tileba, with on-site support, online appointments and same-day delivery for off-site orders.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretoria.co.za/place/print-partner"]'
WHERE slug = 'print-partner-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Print Partners, established in 2011, is an online printing service in Centurion offering flyers, business cards, books and posters with nationwide delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'print-partners-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Print and Promo Crew specialises in t-shirt supply and silkscreen printing across Gauteng, from its base in Tannery Industrial Park, Silverton.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat-Sun Closed',
    source_urls = '["https://www.ppcrew.co.za/"]'
WHERE slug = 'print-and-promo-crew-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Printaholic is a small-format print shop in Wonderboom South offering business cards, flyers and posters with fast turnaround.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pretoria.co.za/place/printaholic"]'
WHERE slug = 'printaholic-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Printaways@VIDEORAMA is a printing counter, including colour printing, operating inside the Videorama movie and music store in Pierre van Ryneveld Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/videorama-117996"]'
WHERE slug = 'printaways-videorama-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Printer Cartridges is a printer-cartridge and ink supplier based in Wierdapark, Centurion.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-15:00'
WHERE slug = 'printer-cartridges-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Printetc (Pty) Ltd is a marketing and advertising business based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'printetc-pty-ltd-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Printingworx by Cans is a printing services business based in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'printingworx-by-cans-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prints and More is a custom printing service based in Pretoria North.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/p/Prints-and-more-61552573725457/"]'
WHERE slug = 'prints-and-more-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Priso Projects (Pty) Ltd is a building and construction business based in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'priso-projects-pty-ltd-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Private is a logistics and courier business based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'private-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Privately is a software development business based in Midstream Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'privately-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Active Security is a security services business based in Valhalla Centre, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-active-security-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Admin, established in 1989, is a property-management company specialising in Sectional Title and Home Owners Association schemes, managing over 19,000 units nationwide through more than 80 property professionals across four branches, from its Die Hoewes office.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.proadmin.co.za/", "https://pretoria.co.za/listing/pro-admin/"]'
WHERE slug = 'pro-admin-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Arte Alphen Park Performing and Creative Arts High School is a government School of Specialisation in the arts, opened in January 1994 from the amalgamation of Pro Arte (founded 1969) and Alphen Park Commercial High School, offering focus areas in Dance, Art, Music, Drama, Hospitality and Enterprise Management, with an adjoining hostel for boarders.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.proarte.co.za/", "https://proarte.co.za/about-us/", "https://en.wikipedia.org/wiki/Pro_Arte_Alphen_Park"]'
WHERE slug = 'pro-arte-alphen-park-performing-and-creative-arts-high-school-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Auto Rubber Centurion supplies rubber grommets and trim for vehicles from its base on Botha Avenue, Lyttelton Manor.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-auto-rubber-centurion-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Beat Auto Body is an RMI/MIWA-accredited panel-beating and auto-body repair workshop in N4 Gateway Industrial Park, Willow Park Manor, offering car mechanical repairs and roadside assistance.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://probeat.co.za/", "https://za.africabz.com/gauteng/pro-beat-auto-body-295865"]'
WHERE slug = 'pro-beat-auto-body-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Creative Agency SA is an events and function-venue business based in Woodhill Golf Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-creative-agency-sa-woodhill-golf-estate' AND description_enriched_at IS NULL;

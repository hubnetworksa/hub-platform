-- Description enrichment sweep (job 4) — slice 42
-- 50 businesses, alphabetical "Waltloo Bakery" through "Waverley Trailers"

UPDATE businesses
SET description = 'Waltloo Bakery & Confectionery is a bakery in Waltloo, Pretoria, selling fresh bread, cakes and confectionery from its Asm Street premises.',
    description_enriched_at = datetime('now')
WHERE slug = 'waltloo-bakery-confectionery-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waltloo Electronics CC is an electronic and mechanical engineering business in Waltloo, offering product design, 3D printing, electronic assembly, laser cutting and CNC routing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellowpages.co.za/business/3097998_3", "https://www.cylex.net.za/company/waltloo-electronics-cc-17554202.html"]'
WHERE slug = 'waltloo-electronics-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waltloo Meat And Chicken Pretoria (Pty) Ltd is a butchery in Waltloo Shopping Centre, Waltloo, selling meat and poultry products.',
    description_enriched_at = datetime('now')
WHERE slug = 'waltloo-meat-and-chicken-pretoria-pty-ltd-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waltloo Plastics manufactures flexible plastic packaging, including polyethylene bags, tubing and sheeting made from both virgin and recycled material, supplying customers across Gauteng since 1996.',
    description_enriched_at = datetime('now')
WHERE slug = 'waltloo-plastics-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waltloo Plastics manufactures flexible plastic packaging, including polyethylene bags, tubing and sheeting made from both virgin and recycled material, supplying customers across Gauteng since 1996.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waltlooplastics.co.za/wp/contact/", "https://sabusinesslistings.co.za/listings/waltloo-plastics-cc/", "http://www.waltlooplastics.co.za/wp/"]'
WHERE slug = 'waltloo-plastics-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waltloo Wholesalers C C is a wholesale supplier based on Waltloo Road, Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'waltloo-wholesalers-c-c-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wamly is an all-in-one recruitment and hiring platform offering career-page hosting, candidate screening, video interviews, assessments and background checks to employers in over 140 countries, from its Erasmusrand office.',
    description_enriched_at = datetime('now')
WHERE slug = 'wamly-pty-ltd-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wan4u is an ICASA-approved wireless internet service provider offering bespoke wireless and fibre broadband packages, plus a fibre backup service, to clients around Pretoria and Thabazimbi.',
    description_enriched_at = datetime('now')
WHERE slug = 'wan4u-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wannenburg''s Paul Kruger branch sells new and used motor spares for all vehicle makes and models, part of a Pretoria motor-spares chain with over 60 years'' experience dismantling accident-damaged vehicles.',
    description_enriched_at = datetime('now')
WHERE slug = 'wannenburg-paul-kruger-branch-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wannenburg''s Hermanstad branch sells new and used motor spares for all vehicle makes and models, part of a Pretoria-wide chain with over 60 years'' experience dismantling accident-damaged vehicles.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wannenburgs.co.za/hermanstad-contact.html", "https://www.cylex.net.za/company/wannenburg-spares-17711003.html", "https://www.wannenburgs.co.za/"]'
WHERE slug = 'wannenburgs-hermanstad-branch-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wapadrand Care & Sparkle Maids provides domestic and commercial cleaning in Wapadrand, including maid services, steam cleaning, carpet and upholstery cleaning, and pressure washing.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.cylex.net.za/company/wapadrand-care---sparkle-maids-23854246.html"]'
WHERE slug = 'wapadrand-care-sparkle-maids-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wapadrand Cellars is a beer, wine and spirits merchant based in Wapadrand Security Village, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.dnb.com/business-directory/company-profiles.wapadrand_cellars.24e9c01585bbadff1c8be532abaeb594.html"]'
WHERE slug = 'wapadrand-cellars-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wapadrand Medical Centre is a multi-disciplinary healthcare practice established in 1998, offering GP consultations, physiotherapy, psychology, dietetics, aesthetics and other family health services from its Spantou Avenue premises.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-18:00, Fri 08:00-17:00, Sat 08:00-12:00, Sun Closed'
WHERE slug = 'wapadrand-medical-centre-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'War Game Goods is an online retailer of laser-cut bases and terrain pieces for tabletop wargaming, made from MDF and acrylic, based in Rietondale.',
    description_enriched_at = datetime('now')
WHERE slug = 'war-game-goods-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Warp Development is a technology consulting and software development firm offering AI consulting, enterprise software development, IT infrastructure management and staff augmentation, operating from The Willows with clients across South Africa, the US, Europe and Australia.',
    description_enriched_at = datetime('now')
WHERE slug = 'warp-development-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wassenaar Attorneys is a litigation law firm in Wingate Park, Pretoria, representing clients through the courtroom process.',
    description_enriched_at = datetime('now')
WHERE slug = 'wassenaar-attorneys-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WatchMyWatts is a business consulting service based in Alphen Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'watchmywatts-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WatchOut!! Early Warning Systems is a security services provider based in Koedoespoort Industrial, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'watchout-early-warning-systems-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Business College delivers industry-aligned qualifications and short courses for the water sector, including a Water Infrastructure Manager qualification and CPD-accredited programmes, through an online learning platform available 24/7.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-business-college-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Depot supplies pumps, water filtration and purification systems, irrigation equipment, water tanks and rainwater harvesting systems to residential and commercial customers from its Kameeldrift East premises.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'water-depot-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Pump Group supplies and services borehole, booster, solar, centrifugal and slurry pumps, irrigation accessories, diesel engines, water storage tanks and electrical control panels, with a factory in Waltloo and branches across Gauteng and the Western Cape.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-pump-group-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Pumps Online sells swimming pool, booster, borehole and submersible pumps and related equipment to homeowners, farmers, plumbers and businesses, operating from Parktown Estate by appointment or collection only.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-pumps-online-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Water Research Commission is South Africa''s national water knowledge and research body, established in 1971 to fund and coordinate research into water resources management, water and wastewater use, and agricultural water use, from its Lynnwood Bridge office.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-research-commission-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Shop Eco Park Centurion is a retail outlet of the RO Water brand, selling water purification and filtration equipment, including reverse osmosis systems and replacement filters, for home and business use, in Eco Park Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-shop-eco-park-centurion-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Spot Centurion sells water tanks (including JoJo Tanks), irrigation supplies, pumps, pool equipment and water filtration products, with stores serving Centurion and Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-spot-centurion-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Systems Eco Park is a retail outlet of the RO Water brand, selling water purification and filtration equipment, including reverse osmosis systems and replacement filters, for home and business use, in Eco Park Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-systems-eco-park-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water Treatment SA specialises in reverse osmosis water purification systems for household and industrial use, operating from Monument Office Park, Monument Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://watertreatmentsa.co.za/returns-refunds-exchanges/"]'
WHERE slug = 'water-treatment-sa-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water World Gezina is a water equipment supplier trading from the Chrisbro Centre on Booysen Street, Mayville.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-world-gezina-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water pump Master supplies and installs new pumps and repairs and maintains existing pump systems for domestic, industrial, mining and agricultural clients, based in Florauna.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00'
WHERE slug = 'water-pump-master-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Water-Wise is a water purification company established in 2003, specialising in reverse osmosis and ultrafiltration systems, pure water dispensers and mineral pot dispensers, with installation, servicing and repair for domestic and industrial clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'water-wise-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WaterCrete is a building and construction business based in Roodeplaat, Leeuwfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'watercrete-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterfalls Boutique Hotel is a boutique guest house in Waterkloof Park offering standard, luxury, superior king and honeymoon suites for up to 24 guests, with an outdoor pool, hot tub and landscaped gardens featuring koi ponds.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/8662549471", "https://www.waterfallsboutiquehotel.co.za/", "https://www.hotelplanner.com/Hotels/303648/Reservations-Waterfalls-Boutique-Hotel-Pretoria-200-Outeniqua-Ave-Waterkloof-Park-0145"]'
WHERE slug = 'waterfalls-boutique-hotel-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterkloof is a guest house on Albert Street in Waterkloof offering 24 guest rooms furnished in teak and leather, each with air-conditioning and fibre Wi-Fi, plus a heated outdoor pool and garden.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/345367362", "https://www.hotelplanner.com/Hotels/298286/Reservations-Waterkloof-Guest-House-Waterkloof-445-Albert-St-Pretoria-Gauteng-0181"]'
WHERE slug = 'waterkloof-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterkloof Corner Pharmacy is part of the Arrie Nel Pharmacy Group, trading from Waterkloof Corner Shopping Centre on the corner of Crown and Main Street, with in-store and off-site delivery and clinic-backed health advice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-19:00, Sat-Sun 08:00-19:00',
    source_urls = '["https://www.openstreetmap.org/node/396010082", "https://arrienel.co.za/waterkloof-corner-pharmacy/"]'
WHERE slug = 'waterkloof-corner-pharmacy-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterkloof Mansion Boutique Hotel is a 5-star boutique hotel on Victoria Street offering a swimming pool, sun terrace and garden, free WiFi and parking, and a daily continental or full English/Irish breakfast.',
    description_enriched_at = datetime('now')
WHERE slug = 'waterkloof-mansion-boutique-hotel-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterplaas is a water-shop franchise selling water on tap, bottled water, water containers and locally sourced products such as Big B Atchar and Waterplaas Spices, with over 30 outlets across South Africa including this Elarduspark branch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/profile.php?id=61558647307335&mibextid=ZbWKwL", "https://waterplaas.co.za/"]'
WHERE slug = 'waterplaas-elarduspark-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterpump Services has operated for over 40 years providing borehole drilling, custom pump installations, booster sets, pump repairs and solar pump solutions for domestic, commercial and mining clients, from its Moot Street premises in Daspoort.',
    description_enriched_at = datetime('now')
WHERE slug = 'waterpump-services-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterware Centurion supplies and services water pumps, irrigation products, water purification systems and pool and spa equipment, with branches across Centurion, Pretoria and Cape Town plus an online store.',
    description_enriched_at = datetime('now')
WHERE slug = 'waterware-centurion-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waterware Pretoria North supplies and services water pumps, irrigation products, water purification systems and pool and spa equipment, with branches across Centurion, Pretoria and Cape Town plus an online store.',
    description_enriched_at = datetime('now')
WHERE slug = 'waterware-pretoria-north-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Watson Law Incorporated is a full-service law firm in Boardwalk Office Park, Faerie Glen, offering commercial and company law, litigation, family law, employment law, conveyancing, compliance and debt-collection services.',
    description_enriched_at = datetime('now')
WHERE slug = 'watson-law-incorporated-attorneys-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Watson WF Attorneys is a law firm based on Malan Street in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'watson-wf-attorneys-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Watts Digital offers website design, e-learning course development, digital marketing, 3D rendering and logo design services, based on Boschkop Road in Donkerhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'watts-digital-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wattsup is a computer and IT services business based in Amberfield Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'wattsup-amberfield-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wave Craft Group offers media consulting, photo restoration, web design, print services, film production, book publishing and website hosting, based in Pretoria North.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://wavecraftgroup.com/", "https://pretoria.co.za/listing/wave-craft-group/"]'
WHERE slug = 'wave-craft-group-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wave Water is an industrial supplier based on Codonia Avenue, Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wave-water-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waverley Internet Cafe is an internet cafe based in Waverley Centre on Hertzog Street, Waverley.',
    description_enriched_at = datetime('now')
WHERE slug = 'waverley-internet-cafe-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waverley Printers Cc offers litho and digital printing services on Walter Avenue in Waverley.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.thinklocal.co.za/biz/waverley-printers-pretoria"]'
WHERE slug = 'waverley-printers-cc-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waverley Skryfbehoeftes en Dienssentrum is a stationery shop and service centre trading from Waverley Gardens Centre on Codonia Avenue, Waverley.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-13:00',
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing/waverley-skryfbehoeftes-en-dienssentrum/"]'
WHERE slug = 'waverley-skryfbehoeftes-en-dienssentrum-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waverley Slagtery Butchery is a family butchery in Tamreehof on Codonia Avenue, Waverley, selling biltong, droewors, boerewors, halal meat and steaks.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:00-17:30, Tue-Fri 08:00-18:00, Sat 07:00-14:30',
    source_urls = '["scraped:google-places-no-website", "https://www.worldofmeats.co.za/view/waverly-slaghuis"]'
WHERE slug = 'waverley-slagtery-butchery-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waverley Trailers rents out Venter, single-axle, double-axle, flatbed, car and bike/quadbike trailers on flexible daily, weekly or monthly terms, operating from TotalEnergies Waverley.',
    description_enriched_at = datetime('now')
WHERE slug = 'waverley-trailers-waverley' AND description_enriched_at IS NULL;

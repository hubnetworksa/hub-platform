UPDATE businesses
SET description = 'Pexi Business Consultants is a business and management consulting firm based in Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pexi-business-consultants-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phahlo Ya Kgwebo is a level 1 B-BBEE business resources and services provider based in Silverton, offering support to local businesses in the Tshwane area.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/PHAHLOYAKGWEBO/"]'
WHERE slug = 'phahlo-ya-kgwebo-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phakama Digital Marketing is a marketing and advertising agency based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'phakama-digital-marketing-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phala Sanitary Engineers CC is a registered IOPSA plumber in Murrayfield handling blocked drains, water leak detection, and geyser installation and repair, along with broader sanitary work covering sewerage, stormwater, gutters and septic tanks.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/phala-sanitary-engineers-cc"]'
WHERE slug = 'phala-sanitary-engineers-cc-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phantom Byte Tech is a computer and IT services provider based in Amberfield Valley, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'phantom-byte-tech-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharm4Game is a specialist supplier in Queenswood offering medicines and health products for wildlife as well as small and large domestic animals, positioning itself as a one-stop shop for animal healthcare needs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00',
    source_urls = '["scraped:google-places-no-website", "http://www.pharm4game.co.za/"]'
WHERE slug = 'pharm4game-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharma Valu Sunnyside is a branch of the Pharma Valu pharmacy group offering wheelchair-accessible facilities, card payments and same-day delivery, plus in-store photo-lab services for printing photos from cameras, memory sticks, CDs or cellphones.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/gauteng/pharma-valu-sunnyside-4527", "https://za.africabz.com/gauteng/pharma-valu-9214", "https://pretoria.co.za/listing/pharma-valu-sunnyside/"]'
WHERE slug = 'pharma-valu-sunnyside-sunnyside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharmachem Laboratories develops, manufactures and supplies healthcare products, operating from its Barolong Street facility in Centurion''s Icon Industrial Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-16:30',
    source_urls = '["https://pharmachemlabs.co.za/", "https://pharmachemlabs.co.za/about-us/"]'
WHERE slug = 'pharmachem-laboratories-pretoria-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharmacy at SPAR Kloofsig is a pharmacy located within the SPAR store in Kloofsig, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pharmacy-at-spar-kloofsig-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharmacy at SPAR Ninapark is a pharmacy in Ninapark, Pretoria, operating as part of the Arrie Nel Pharmacy Group''s network of in-store SPAR pharmacies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.spar.co.za/Store-Finder", "https://www.facebook.com/people/Pharmacy-at-SPAR-Ninapark-61575250859231/"]'
WHERE slug = 'pharmacy-at-spar-ninapark-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharmafen (Pty) Ltd is a Pretoria-based pharmaceutical and wellness company, founded in 2020, that manufactures and supplies health and wellness products including a first aid range.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pharmafen.co.za/", "https://pharmafen.co.za/about-us/"]'
WHERE slug = 'pharmafen-pty-ltd-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phasecon has been part of South Africa''s industrial electronics sector since 1980, designing and manufacturing single- and three-phase thyristor trigger control cards, thyristor-controlled power stacks, and integrated panel systems for furnace control, motor drives, rectifiers and power supplies from its Sunderland Ridge facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.phasecon.co.za/", "https://www.phasecon.co.za/about/"]'
WHERE slug = 'phasecon-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phepishi Business Consulting is a business and management consulting firm based in Copperleaf Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'phepishi-business-consulting-copperleaf-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Philafrica Foods runs a corporate office in Centurion covering finance, treasury, legal, HR and IT functions for the wider group, which owns food-processing plants across South Africa and other African countries spanning oil & protein, animal feeds, grain milling, and bread and snack manufacturing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://www.afgri.co.za/", "https://www.africaoutlookmag.com/company-profiles/895-philafrica-foods-pty-ltd"]'
WHERE slug = 'philafrica-foods-pty-ltd-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Philness is an accounting firm operating from Centurion Mall in Centurion Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'philness-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Philton Leather has operated in Waltloo for over 30 years, supplying a curated range of high-quality Italian leather hides imported directly from Italy alongside precision laser and blade cutting services for leather and textiles. The business also produces automotive upholstery kits, with each kit cut, stitched and finished to order.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://philtonleather.co.za/", "https://philtonleather.co.za/automotive-kits/"]'
WHERE slug = 'philton-leather-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phoenix is a business and management consulting firm based in Brakfontein, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'phoenix-brakfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phoenix BEE is a business and management consulting firm based in Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'phoenix-bee-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phoenix Bonds Pretoria is a branch of the Phoenix Bonds mortgage brokerage, providing bond origination services from its Rietondale office as part of a wider network of branches across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.phoenixbonds.finance/", "https://www.facebook.com/people/Phoenix-Bonds-Pretoria/61572727895089/"]'
WHERE slug = 'phoenix-bonds-pretoria-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phoenix Industrial & Safety Suppliers has operated in Gezina, Pretoria since 1993, starting out supplying cleaning rags to Gauteng industries and growing into an ISO-accredited manufacturer of cleaning rags, safety footwear, hard hats and a full range of industrial safety products for the engineering, construction, petrochemical, security and mining sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.phoenixindustrial.co.za/", "https://phoenixindustrial.co.za/welcome-to-phoenix-industrial-and-safety-suppliers/"]'
WHERE slug = 'phoenix-industrial-safety-suppliers-pretoria-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phoenix Waterproofing and Projects is a Weavind Park-based contractor offering waterproofing (liquid membrane, torch-on and epoxy systems), roof repairs, gutter work and interior/exterior painting, backed by a 5-year waterproofing warranty.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:30, Sat 07:00-15:00',
    source_urls = '["https://phoenixwp.co.za/", "https://phoenixwp.co.za/about.html"]'
WHERE slug = 'phoenix-waterproofing-and-projects-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phogole welding works, a building & construction business in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'phogole-welding-works-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pholo Human Capital is a Black women-owned training and development company based in Woodhill Golf Estate, established in 2006 to provide learner support and skills development services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://pholo.co.za/", "https://www.zoominfo.com/c/pholo-human-capital/446069971"]'
WHERE slug = 'pholo-human-capital-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phologo Pharmacy is a community pharmacy on Francis Baard Street in Pretoria Central, near Louis Pasteur Private Hospital, serving the Trevenna area with dispensing and everyday health services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:30, Sun 09:00-13:30',
    source_urls = '["https://www.openstreetmap.org/node/5833335018", "https://pretoria.co.za/listing/phologo-pharmacy/"]'
WHERE slug = 'phologo-pharmacy-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phosa Loots Attorneys Inc is a boutique commercial law firm at Boardwalk Office Park in Faerie Glen, offering corporate, commercial, civil litigation, family law and property law services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:30',
    source_urls = '["http://phosalootsatt.co.za/", "https://pretoria.co.za/listing/phosa-loots-attorneys-inc/"]'
WHERE slug = 'phosa-loots-attorneys-inc-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PiLog is a global master data management and data governance group founded in 1996, providing data quality, MDM and AI-driven analytical solutions from its Centurion Gate head office and eight other offices worldwide.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/pilog-100033", "https://www.piloggroup.com/contact/"]'
WHERE slug = 'pilog-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Picardi Rebel in Eco Park Estate is part of a liquor retail franchise with over 35 years in the trade, stocking an extensive range of local and imported wines and spirits and hosting in-store wine tasting tables over weekends.',
    description_enriched_at = datetime('now')
WHERE slug = 'picardi-rebel-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Picasso Paints Waterkloof at Waterkloof Corner stocks decorative paint, wallpaper and waterproofing products, and offers free electronic moisture testing along with technical and colour advice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://picassopaints.co.za/contact/", "https://www.cylex.net.za/company/picasso-paints-waterkloof-19638584.html", "https://business-service-directory.com/za/listing/picasso-paints-2516782", "http://www.mapknows.co.za/pretoria/picasso-paints-waterkloof-22075/"]'
WHERE slug = 'picasso-paints-waterkloof-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Piccola Italia is an Italian restaurant at Monument Park Shopping Centre known for wood-fired pizzas and pasta, with outdoor pavement seating and dine-in or curbside pickup; reservations are recommended on Friday and Saturday evenings or for groups larger than six.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.piccolaitalia.co.za/", "https://monumentparkshoppingcenter.co.za/piccola-italia-italian-restaurant/", "https://www.eatout.co.za/venue/piccola-italia/"]'
WHERE slug = 'piccola-italia-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay, a supermarket and grocery store in Brooklyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pick n Pay anchors Blu Valley Mall in The Reeds, stocking a full grocery range and known locally for its in-store bakery selling freshly made magwinya.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pnpreeds.co.za/", "https://dir.alltrack.org/view/354127-7-pick-n-pay", "https://wanderlog.com/place/details/8404318/pick-n-pay-the-reeds"]'
WHERE slug = 'pick-n-pay-blu-valley-mall-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pick n Pay anchors Byls Bridge Promenade in Highveld, stocking a full range of fresh and frozen food, wine, baby products and household goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-16:00, Sun 09:00-15:00',
    source_urls = '["https://www.yellowpages.net.za/phone-27-126652295-convenience-store-Centurion-ZA115791.html", "https://za.africabz.com/gauteng/pick-n-pay-byls-bridge-26216", "https://openhours-southafrica.com/en/centurion/pick-n-pay-byls-bridge"]'
WHERE slug = 'pick-n-pay-byls-bridge-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Clothing Hazeldean, a fashion and clothing retailer in Hazeldean, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-clothing-hazeldean-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pick n Pay in Willows Crossing Shopping Centre offers fresh food, a bakery and salad bar alongside curbside pickup and same-day delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 07:00-17:00, Mon-Fri 07:00-20:00',
    source_urls = '["http://www.picknpay.co.za/", "https://www.willowscrossing.co.za/directory/pick-n-pay-equestria/"]'
WHERE slug = 'pick-n-pay-equestria-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Express, a convenience store in Pretorius Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-express-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Express, a convenience store in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-express-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Express, a convenience store in Hennopspark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-express-centurion-2' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pick n Pay anchors Hazeldean Square in Pretoria East alongside Woolworths Food and Dis-Chem, offering fresh produce, organic items and ready-to-eat meals with in-store pickup and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-19:00, Fri 08:00-20:00, Sat 08:00-18:00, Sun 09:00-17:00',
    source_urls = '["http://www.picknpay.co.za/", "https://pretoria.co.za/place/pick-n-pay-hazeldean-square"]'
WHERE slug = 'pick-n-pay-hazeldean-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pick n Pay Hypermarket anchors Wonderpark Shopping Centre in Karenpark, offering a full one-stop grocery and general merchandise range with online ordering and home delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pnp.co.za/", "https://wonderparkcentre.co.za/storedetail-picknpay-hypermarket"]'
WHERE slug = 'pick-n-pay-hypermarket-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pick n Pay is the anchor grocery store at Irene Village Mall, offering fresh produce, a bakery and a range of meats with in-store pickup and same-day delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-21:00',
    source_urls = '["https://www.facebook.com/irenevillagemall/posts/trading-stores-at-irene-village-mall-pick-n-pay-012-662-4006-mon-friday-8am-5pm-/3142958929067897/", "https://pretoria.co.za/listing/pick-n-pay-irene-mall/", "https://wanderlog.com/place/details/11636200/pick-n-pay-irene-mall"]'
WHERE slug = 'pick-n-pay-irene-village-mall-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Philip Nel Park is a supermarket serving the Philip Nel Park community in Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-philip-nel-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Soshanguve Crossing is a supermarket located within the Soshanguve Crossing shopping centre in Soshanguve, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-soshanguve-crossing-soshanguve' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Waterkloof Rand is a supermarket located in the Waterkloof Rand Centre, Erasmusrand, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 08:00-16:00'
WHERE slug = 'pick-n-pay-waterkloof-rand-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Picksmart is a software development company founded in 2012 and based in Faerie Glen, Pretoria, building custom ERP and CRM systems, Android and iOS apps, and business intelligence and system integration solutions for South African businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.picksmart.co.za/", "https://www.picksmart.co.za/about"]'
WHERE slug = 'picksmart-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Pie City branch operates from the Bloed Street Shopping Centre in Pretoria''s CBD, serving fresh pies, pizzas, and fruit juices made with real meat, chicken, and cheese.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/307692857", "https://bloedstreetmall.co.za/shops/pie-city/"]'
WHERE slug = 'pie-city-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pie City Rossly Factory, also known as Simon Pies (Pty) Ltd, bakes its pies fresh on site in Rosslyn every day using 100% real meat, chicken, and cheese.',
    description_enriched_at = datetime('now')
WHERE slug = 'pie-city-rossly-factory-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pienaar Bros has been trading for more than 50 years and is one of the largest distributors of personal protective equipment in Southern Africa, serving around 3,000 customers from its Hennopspark, Centurion base.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pienaarbros.co.za/", "https://showme.co.za/pretoria/industry/pienaar-bros/"]'
WHERE slug = 'pienaar-bros-pretoria-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pieter Coetzee Attorneys is a legal services firm based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pieter-coetzee-attorneys-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pii Digital is a full-service digital marketing agency originally based in Pretoria, offering digital development, creative, media, and marketing services, with additional offices in Johannesburg, the Western Cape, and KwaZulu-Natal.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://piidigital.co.za/", "https://pretoria.co.za/place/pii-digital"]'
WHERE slug = 'pii-digital-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pillay Inc is a law firm in Proclamation Hill offering a multi-faceted legal practice covering attorney, notary, and conveyancing services for individual and corporate clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://pillayinc.com/", "https://www.yep.co.za/biz/store/iyp/17273544_1"]'
WHERE slug = 'pillay-inc-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pindyn is an engineering and surveying services firm based in Boardwalk Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pindyn-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pineapple Cosmetics is a beauty and skincare brand based in Eloffsdal, Pretoria, offering makeup and skincare products formulated with bromelain, a pineapple-derived enzyme, and positioned as halal-certified, paraben-free, and cruelty-free.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pineapplecosmetics.co.za/", "https://pineapplecosmetics.co.za/about-us/"]'
WHERE slug = 'pineapple-cosmetics-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pinedek Group (Pvt) Ltd is a logistics, courier, and transport company based in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pinedek-group-pvt-ltd-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pinnacle College Copperleaf is a co-ed private day school offering Grade 00-12 education, situated within the Copperleaf Golf & Country Estate in Centurion near the Ernie Els Golf Course, and is a member of the Independent Schools Association of Southern Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.pinnaclecolleges.co.za/copperleaf", "https://saprivateschools.co.za/listing/pinnacle-primary-school-copperleaf/"]'
WHERE slug = 'pinnacle-college-copperleaf-copperleaf-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pioneer Biltong operates as a meat wholesaler with a shop in Wonderpark Shopping Mall, Karenpark, offering a wide range of biltong sourced from trusted suppliers.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing/pioneer-biltong/"]'
WHERE slug = 'pioneer-biltong-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pioneer IT group is a software development company based in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pioneer-it-group-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pioneer Plastics (Pty) Ltd has manufactured industrial plastic products since 1982, producing stacking and nesting bins, pallet bins, drums, and tanks ranging from 25 to 5000 litres from its Rosslyn base, and has won the ARMSA product of the year award for eight consecutive years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-13:30, Sat-Sun Closed',
    source_urls = '["http://www.pioneerplastics.co.za/", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/pioneer-plastics"]'
WHERE slug = 'pioneer-plastics-pty-ltd-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pionier Open-air Museum is a living history museum set on a restored 3-hectare Victorian settler farmstead in Silverton, operated by Ditsong Museums of South Africa, with guides in period dress demonstrating bread baking, candle making, milking, and coffee roasting as 19th-century pioneers would have done.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-17:00',
    source_urls = '["https://ditsong.org.za/en/pioneer-museum/", "https://www.sa-venues.com/attractionsga/pioneer-museum-silverton.htm", "https://en.wikipedia.org/wiki/Pionier_Museum"]'
WHERE slug = 'pionier-open-air-museum-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pious and Lloyd Engineering is an environmental consultancy based in the Tijger Vallei Office Park, offering services including environmental impact assessments, atmospheric emission licence applications, environmental audits, and water use licence applications for private and public sector clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.piousandlloyd.co.za/", "https://pretoria.infoisinfo.co.za/card/pious-and-lloyd-environmental-consultants-ptyltd/374782"]'
WHERE slug = 'pious-and-lloyd-engineering-pty-ltd-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pirtek Pretoria is a hydraulic hose and fitting centre in Montana providing emergency repairs, preventive maintenance, and on-site hose replacement, along with hose assemblies, fittings, and fluid transfer components for the mining, agriculture, construction, forestry, and transport industries.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pirtek.co.za/", "https://pirtek.co.za/centres/south-africa/gauteng/pretoria"]'
WHERE slug = 'pirtek-pretoria-pty-ltd-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pistorius Scheepers Attorneys is a Pretoria law firm founded in 2019, specializing in commercial and corporate law, family law, general litigation and dispute resolution, debt collection, and deceased estates.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://ps-law.co.za/", "https://ps-law.co.za/about-us/"]'
WHERE slug = 'pistorius-scheepers-attorneys-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pivot2Connect is a digital agency in Constantia Park offering website design, local SEO and Google Business Profile management for small businesses, with a monthly partnership model starting from R1,850 and no upfront design fee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 09:00-12:00'
WHERE slug = 'pivot2connect-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pivotal Creative Solutions is an industrial supplier and manufacturing business based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pivotal-creative-solutions-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PixelCraft is a marketing and advertising business based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pixelcraft-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PixelPro Media is a Pretoria-based marketing and AI training studio in De Wilgers offering branding, social media management and practical AI training that helps South African businesses build their online presence.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.pixelpro.co.za/", "https://www.pixelpro.co.za/about"]'
WHERE slug = 'pixelpro-media-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pixelgrid is a software development company based in Salieshoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pixelgrid-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Piza e Vino in Lynn Ridge Mall serves wood-fired Italian pizzas in a space finished with vintage-inspired subway tiles, polished concrete floors, light oak dining tables and reclaimed timber cladding.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Mon 11:00-21:30, Tue-Thu 11:00-22:00, Fri-Sat 11:00-23:00',
    source_urls = '["https://pizaevino.co.za/lynnridge", "https://www.eatout.co.za/venue/piza-e-vino-lynnridge/", "https://www.tripadvisor.com/Restaurant_Review-g312583-d12072644-Reviews-or30-Piza_E_Vino-Pretoria_Gauteng.html", "https://inhouse.ws/piza-e-vino/"]'
WHERE slug = 'piza-e-vino-lynnridge-lynnwood-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Piza-e-Vino in Waterkloof Centre serves Italian-inspired pizza, pasta and burgers alongside a well-stocked wine and bar selection, with live music including flamenco performances.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/piza-e-vino-waterkloof/", "https://www.dining-out.co.za/md/Piza-e-Vino-Waterkloof/5043", "https://foursquare.com/v/piza-%C3%A8-vino--brooklyn-waterkloof/4eea365b722edd1072af886d"]'
WHERE slug = 'piza-e-vino-brooklyn-waterkloof-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Hut Hazeldean at Hazeldean Retail Square offers dine-in, takeaway and delivery, serving pizza, wings, pasta, sides and desserts, with wheelchair-accessible seating.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 10:00-20:45, Fri-Sat 10:00-21:45',
    source_urls = '["https://www.hotfrog.co.za/company/a7847b79b93a22c0fea0fdd105899b10/pizza-hut-hazeldean/pretoria/restaurants", "https://www.tellows.co.za/num/0100600602", "https://www.tripadvisor.com/Restaurant_Review-g312583-d23778705-Reviews-Pizza_Hut_Hazeldean-Pretoria_Gauteng.html"]'
WHERE slug = 'pizza-hut-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Hut Lynnridge Mall is a pizza restaurant and takeaway located in Lynn Ridge Mall, Lynnwood Ridge, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'pizza-hut-lynnridge-mall-lynnwood-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Perfect at Blu Valley Mall serves thin-crust pizzas cooked to order in a traditional wood-burning oven, with dine-in, takeaway, drive-through and delivery options available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pizzaperfect.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312613-d25088550-Reviews-Pizza_Perfect_Blu_Valley-Centurion_Gauteng.html"]'
WHERE slug = 'pizza-perfect-blu-valley-mall-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Perfect Magalieskruin, in Magalieskruin Shopping Centre, serves wood-fired thin-crust pizzas alongside pasta, gluten-free pizza options, subs and chicken wings, with free delivery available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pizzaperfect.co.za/contact/", "https://www.facebook.com/pizzachickenperfectmagalieskruin/", "https://doornpoort.co.za/pizza-perfect-magalieskruin/"]'
WHERE slug = 'pizza-perfect-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Vera in Erasmia is a family-owned pizzeria serving traditional wood-fired Italian pizza made with quality ingredients, in a neighbourhood dining setting at Shezan Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Thu 10:30-21:00, Fri-Sat 10:30-22:00, Sun 10:30-21:00',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/16997680_2", "https://www.thinklocal.co.za/biz/pizza-vera-centurion", "https://www.laudiumonline.co.za/directory-listing/pizza-vera/"]'
WHERE slug = 'pizza-vera-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plaas Media is an agricultural media company that opened its doors in 2010 with five staff members, two magazine titles and a radio programme, and has since grown to around 30 staff producing publications, radio, YouTube content and video production for the agricultural sector.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.plaasmedia.com/", "https://plaasmedia.com/about-plaas-media/"]'
WHERE slug = 'plaas-media-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Placecol Watermeyer Park is a skin care clinic in Watermeyer Park Shopping Centre offering facials, waxing, tinting, manicures, pedicures and artificial nails, including soft-laser facial treatments using Placecol skincare products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://showme.co.za/pretoria/lifestyle/placecol-watermeyer-park/", "https://heyspa.co.za/0355544/Placecol_Skin_Care_Clinic_Watermeyer_Park", "https://www.snupit.co.za/pretoria/val_de_grace/placecol-skin-care-clinic/195271"]'
WHERE slug = 'placecol-watermeyer-park-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plaka in Menlyn Park is an award-winning Greek and Mediterranean restaurant known for traditional Greek dishes, a premier wine selection and Mediterranean decor featuring whitewashed walls and Mykonos-blue accents.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/plaka-menlyn-2/", "https://www.visittshwane.co.za/plaka-menlyn/", "https://www.tripadvisor.co.za/Restaurant_Review-g312583-d12691859-Reviews-Plaka_Restaurant_Menlyn-Pretoria_Gauteng.html"]'
WHERE slug = 'plaka-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plan B Bistro in Menlo Park serves bistro fare, burgers and light meals for breakfast, lunch and dinner, with a selection of cocktails and wines, and is both pet-friendly and family-friendly with free Wi-Fi and wheelchair access.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/plan-b-bistro-menlo-park/", "https://greenlyn.co.za/plan-b-bistro/", "https://pretoria.co.za/place/plan-b-bistro"]'
WHERE slug = 'plan-b-bistro-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Planet Fitness is a fitness and gym facility in Ashley Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'planet-fitness-menlyn-2' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Planet Fitness Heuweloord is a gym in Centurion offering cardio and weights equipment, group fitness classes and personal training, with membership plans starting from R299 per month.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.planetfitness.co.za/gyms/centurion-heuweloord/"]'
WHERE slug = 'planet-fitness-heuweloord-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Planet Fitness MegaClub in The Gate Shopping Centre, Centurion, is a large-format gym with a heated swimming pool, indoor running track, indoor cycling studio, reformer pilates, functional training area and a juice bar.',
    description_enriched_at = datetime('now')
WHERE slug = 'planet-fitness-megaclub-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Lynnwood Bridge branch of Planet Fitness offers a full range of gym facilities, including a cardio deck, functional training area, free weights section, indoor cycling and group exercise studios, an InBody machine, and a steam room.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat-Sun 07:00-16:00'
WHERE slug = 'planet-fitness-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A beauty and hair salon in Waverley offering nail and beauty treatments.',
    description_enriched_at = datetime('now')
WHERE slug = 'planet-nails-waverley-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Planetron Distributors is an electronics and automotive accessories distributor based in Doringkloof, supplying brands such as Smart Multimedia, Chipbox and Ghost South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-12:30',
    source_urls = '["http://www.planetron.co.za/", "https://www.planetron.co.za/about/"]'
WHERE slug = 'planetron-distributors-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plant Farm is a wholesale plant nursery in Shere that grows its own stock, offering a wide range of succulents, groundcovers, shrubs, trees, aloes, fruit-bearing plants and palms to nurseries, landscapers and the public. Visits are by appointment, with delivery available for larger orders.',
    description_enriched_at = datetime('now')
WHERE slug = 'plant-farm-nursery-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plant Ranch is a family-owned garden centre in Lyttelton that has served the Centurion area since 1988, stocking indoor and outdoor plants, indigenous varieties, trees, shrubs and garden supplies alongside a children''s play area and tea garden.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:30, Sun 09:00-17:00',
    source_urls = '["https://plantranch.co.za/get-in-touch/", "https://nearfinderza.com/business/gauteng/centurion/nurseries/plant-ranch_133005+4.html", "https://plantranch.co.za/about-us/"]'
WHERE slug = 'plant-ranch-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plant Traders is a Shere-based nursery specialising in tropical palms, cycads, indigenous trees, aloes, shrubs, grasses, conifers and topiaries.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://nearbyza.com/place/plant-traders"]'
WHERE slug = 'plant-traders-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plantforum is a wholesale seedling nursery in Leeuwfontein supplying vegetable, flower, herb and tobacco seedlings, cuttings and ornamentals to commercial growers, with small orders available to the public on Fridays and Saturdays.',
    description_enriched_at = datetime('now')
WHERE slug = 'plantforum-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A nursery and garden centre in Erasmia, Centurion, offering plants and gardening supplies.',
    description_enriched_at = datetime('now')
WHERE slug = 'plantking-nursery-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plantland Cornwall Hill is a family-run garden centre in Irene offering a wide selection of plants from seedlings to trees, herbs and vegetables, along with pots and garden statues, a coffee shop and a children''s play area.',
    description_enriched_at = datetime('now'),
    hours = 'Summer: Mon-Sat 08:00-17:30, Sun 09:00-17:30; Winter: Mon-Sat 08:00-17:00, Sun 09:30-17:00',
    source_urls = '["scraped:google-places-no-website", "https://plantland.co.za/contact-us/"]'
WHERE slug = 'plantland-cornwall-hill-garden-centre-cornwall-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plasmet Trading is a Pretoria North-based company involved in plastic recycling and extrusion, buying, collecting and selling materials such as LDPE, PP, HDPE, ABS and PET in bales or granulated form.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/PlasmetTrading/"]'
WHERE slug = 'plasmet-trading-pty-ltd-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plastic Droppers manufactures plastic fencing droppers from its Klerksoord premises, with products SABS-tested for break strength and valued for fire-retardant, acid-resistant properties that make them suitable for electrical fencing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://plasticdroppers.co.za/", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/plastic-droppers"]'
WHERE slug = 'plastic-droppers-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plastic Welding Solutions by Plasmus specialises in welding pure plastics such as HDPE, PVC, PP, PS, PC, ABS and PA for fabrication work and repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/plasmuswelding/"]'
WHERE slug = 'plastic-welding-solutions-by-plasmus-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plastica Film Extrusions, based in Silverton, supplies polythene and plastic sheeting for construction and industrial projects, including poly film and custom fabrication.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.plastica.co.za/", "https://pretoria.co.za/place/plastica-film-extrusions"]'
WHERE slug = 'plastica-film-extrusions-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plastics R US has traded in Annlin West since 2011, stocking a wide range of plastic and glassware products including bakeware, storage containers, garden and cleaning supplies, and party accessories, with delivery and in-store pickup available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 08:30-16:00, Sun 08:30-13:00',
    source_urls = '["http://plasticsrus.co.za/", "https://pretoria.co.za/place/plastics-r-us"]'
WHERE slug = 'plastics-r-us-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Rietfontein branch of Plastilon Packaging is a one-stop packaging supplier stocking over 3,000 items, backed by more than 40 years of experience in the packaging trade.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-13:30, Sun Closed',
    source_urls = '["https://www.plastilon.co.za/", "https://pretoria.co.za/listing/plastilon-packaging-gezina/"]'
WHERE slug = 'plastilon-packaging-gezina-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Rooihuiskraal North branch of Plastilon Packaging, trading from Miracle Retail Park, is part of a packaging business founded in 1973, stocking cartons, wrapping materials, protective packaging and storage products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://plastilon.co.za/", "https://pretoria.co.za/place/plastilon-packaging-hennopspark"]'
WHERE slug = 'plastilon-packaging-hennopspark-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Plastilon Packaging branch in the Six Fountains Lifestyle Centre has traded for over 41 years, offering a diversified range of commercial and industrial packaging alongside gift-wrapping, party supplies, kitchenware and stationery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'plastilon-packaging-silver-lakes-six-fountains-residential-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plastique World is a Rietfontein-based packaging supplier offering plastic bags, polystyrene trays, foil products, cups and tubs, food film, plastic cutlery and other disposable packaging items.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/plastique-world"]'
WHERE slug = 'plastique-world-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An industrial supplier and manufacturer based in Theresapark, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'plastixx-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plastopack is a Waltloo-based supplier of low-density polyethylene (LDPE) plastic products with more than 25 years in business, also offering plastic recycling services as part of its zero-waste production process.',
    description_enriched_at = datetime('now')
WHERE slug = 'plastopack-waltloo' AND description_enriched_at IS NULL;

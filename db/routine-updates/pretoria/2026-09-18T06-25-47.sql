UPDATE businesses
SET description = 'OSMC (Pty) Ltd is a business and management consulting firm based in Centurion Central, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'osmc-pty-ltd-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OSREK CC is an engineering and surveying services firm based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'osrek-cc-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OTB Advisory is a business and management consulting firm based in Die Hoewes, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'otb-advisory-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OTT Technologies has designed, developed and manufactured armoured and mine-protected vehicles from its Mooiplaats site since 1980, and also refurbishes military vehicles and supplies original spares, holding ISO 9001 certification for its engineering work.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ott.co.za/", "https://ott.co.za/"]'
WHERE slug = 'ott-technologies-mooiplaats' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OTT Technologies Industrial Park is a manufacturing facility of OTT Technologies, the Pretoria-area defence manufacturer that has produced and refurbished armoured and mine-protected military vehicles since 1980.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ott.co.za/", "https://heycompanies.co.za/02307319/OTT_Technologies_Donkerhoek"]'
WHERE slug = 'ott-technologies-industrial-park-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OTTO Solutions is an industrial suppliers and manufacturing business based in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'otto-solutions-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OUTsurance Centurion is an insurance provider serving clients from Blue Valley Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'outsurance-centurion-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OVERHAULIN MOTORS is an automotive repair and servicing business based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'overhaulin-motors-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Overkruin Uitrusters has specialised in school uniforms, sportswear and workwear since 1980, and this Emily Hobhouse Avenue store is one of three branches the retailer operates across the greater Pretoria North area.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://overkruinuitrusters.co.za/"]'
WHERE slug = 'overkruin-uitrusters-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Overland Groups Industrial Cleaning Services provides industrial cleaning services in Andeon, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'overland-groups-industrial-cleaning-services-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business and management consulting firm based in Claudius, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ow-would-you-describe-your-business-in-one-sentence-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oakley Group has operated as a transport and freight-brokering company since 1995, moving goods along major routes across South Africa for national and regional clients from its base in Klerksoord, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oakleygroup.co.za/", "https://oakleygroup.co.za/"]'
WHERE slug = 'oakley-group-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oasis Restaurant operates inside the Southern Sun Pretoria hotel, serving breakfast, lunch and dinner that blend traditional South African flavours with international dishes made from fresh, locally sourced ingredients, with both indoor and outdoor seating.',
    description_enriched_at = datetime('now'),
    hours = 'Breakfast Mon-Fri 06:30-10:30 & Sat-Sun 07:00-11:00, Lunch daily 12:30-14:30, Dinner daily 18:30-22:00',
    source_urls = '["https://www.southernsun.com/southern-sun-pretoria/dining", "https://www.eatout.co.za/venue/oasis-restaurant-southern-sun-pretoria/"]'
WHERE slug = 'oasis-restaurant-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Oasis Water outlet supplies reverse-osmosis purified, oxygenated drinking water as part of a franchise network of more than 400 stores across South Africa, Botswana, Namibia and Eswatini.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/oasis-water-centurion-highveld-178385", "https://www.hotfrog.co.za/company/1099863651524608/oasis-water-irene/highveld-x13/water"]'
WHERE slug = 'oasis-water-centurion-highveld-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Oasis Water outlet, at Shop 9 in the Celtis Ridge Shopping Centre on the corner of Ruimte and Seedcracker Streets, purifies and ozonates its drinking water on site as part of a franchise network spanning more than 150 stores.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oasiswater.co.za/", "https://za.africabz.com/gauteng/oasis-water-centurion-celtis-ridge-13090"]'
WHERE slug = 'oasis-water-centurion-celtis-ridge-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An Oasis Water outlet supplying purified drinking water in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'oasis-water-centurion-erasmia-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Oasis Water outlet in the Highland Shopping Centre supplies reverse-osmosis purified drinking water as part of a franchise network of more than 400 stores across Southern Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oasiswater.co.za/", "https://www.yoys.co.za/phone,27-126602773,bottled-water-supplier,Centurion,ZA112042.html"]'
WHERE slug = 'oasis-water-centurion-lyttelton-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An Oasis Water outlet in the Bougainville Shopping Centre supplying purified drinking water in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'oasis-water-daspoort-bougainville-shopping-centre-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An Oasis Water outlet supplying purified drinking water in Eldoraigne, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'oasis-water-eldoraigne-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This is the Oasis Water franchise administrative office, based at Boardwalk Office Park in Faerie Glen, serving the Oasis Water network of more than 400 outlets across South Africa, Botswana, Namibia, Eswatini and Lesotho.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00'
WHERE slug = 'oasis-water-franchise-office-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Oasis Water branch, based in Greenlyn Village Centre in Menlo Park, supplies bottled ozonated still and sparkling water to the public and to businesses for resale, and also produces custom labels for special occasions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-13:00',
    source_urls = '["https://greenlyn.co.za/oasis-water/", "https://za.africabz.com/gauteng/oasis-water-menlopark-74070"]'
WHERE slug = 'oasis-water-menlopark-menlo-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Meyerspark branch of Oasis Water sells purified drinking water that goes through a 6-step purification process reducing total dissolved solids to under 20, well below the 150-plus TDS typical of municipal tap water, alongside bottled water, refills and dispenser rental.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oasiswater.co.za/"]'
WHERE slug = 'oasis-water-meyerspark-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Oasis Water Express outlet in East Lynne is part of a purified-water franchise that opened its first store in 2003 and has since grown to more than 400 outlets across South Africa, Botswana, Namibia, Eswatini and Lesotho.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.oasiswater.co.za/"]'
WHERE slug = 'oasis-water-pretoria-express-at-plastix-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oasis Water''s Annlin branch, in Club Gables Shopping Centre, sells purified water refills and bottled water produced through a 6-step purification process that removes contaminants such as hormones and heavy metals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["http://www.oasiswater.co.za/", "https://brabys.com/za/gauteng/pretoria/annlin/water-purification-equipment-service-suppliers/oasis-water"]'
WHERE slug = 'oasis-water-pretoria-annlin-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Oasis Water outlet operates as an express, on-the-go kiosk within the Castle Gate Lifestyle Precinct in Pierre van Ryneveld Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oasiswater.co.za/", "https://www.facebook.com/castlegateprecinct/posts/welcome-oasis-water-to-castle-gate-our-on-the-go-modern-day-lifestyles-demand-a-/340803824418862/"]'
WHERE slug = 'oasis-water-pretoria-castle-gate-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oasis Water''s Doornpoort branch, in Doornpark Shopping Centre, sells purified drinking water produced through a multi-step filtration and ozonation process, serving the surrounding Doornpoort area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun Closed',
    source_urls = '["http://www.oasiswater.co.za/", "https://www.africabizinfo.com/ZA/oasis-water-pretoria-%7C-doornpoort-076-649-1658"]'
WHERE slug = 'oasis-water-pretoria-doornpoort-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oasis Water''s Karenpark branch, at Karenpark Crossing on the corner of Daffodil and Heinrich Avenue, sells reverse-osmosis purified water refills and bottled water alongside juices, plain and flavoured sparkling water, and ice.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oasiswater.co.za/"]'
WHERE slug = 'oasis-water-pretoria-karenpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Oasis Water Express kiosk operates inside the SuperSpar in Kilner Park, offering the company''s refill water service, which has remained its top-selling product for more than 20 years as part of an initiative to keep plastic bottles out of landfill.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oasiswater.co.za/"]'
WHERE slug = 'oasis-water-pretoria-kilner-park-express-at-superspar-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oasis Water''s Montana branch on Braam Pretorius Street purifies water to a Total Dissolved Solids count of under 20, well below the 150-plus TDS typical of municipal tap water in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://www.oasiswater.co.za/", "https://zaubee.com/biz/oasis-water-pretoria-montana-q87denxm"]'
WHERE slug = 'oasis-water-pretoria-montana-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oasis Water''s Olympus branch opened in January 2017 inside the Dis-Chem centre at the corner of Solomon Mahlangu Drive and Haymeadow Crescent.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oasiswater.co.za/", "https://www.globuya.com/ZA/Pretoria/1084230264943114/Oasis-Silver-Lakes-and-Olympus"]'
WHERE slug = 'oasis-water-pretoria-olympus-olympus-gardens-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trading as Oasis Water Oos-Moot, this Villieria branch opened its doors on 1 May 2010 and supplies bottled ozonated still and sparkling water to the public and to other businesses for resale, plus custom labels for special occasions, with delivery available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["http://www.oasiswater.co.za/", "https://www.cavaonline.org/listing/oasis-water-pretoria-villieria-2/"]'
WHERE slug = 'oasis-water-pretoria-villieria-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Obanzi Intervention and Development Solutions is a business & management consulting firm based in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'obanzi-intervention-and-development-solutions-pty-ltd-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Obie Accounting Services is a SAIPA-registered accounting practice in Wonderboom South offering tax compliance, independent reviews and payroll services, mainly to small and medium-sized businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://obieaccounting.com/", "https://www.hotfrog.co.za/company/29870b2c661d305fb450d920750a5116", "https://obieaccounting.com/about-us/"]'
WHERE slug = 'obie-accounting-services-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Obirits Consulting is a business & management consulting firm in Kilner Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'obirits-consulting-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Obsideo Consulting, based at Irene Corporate Corner in Irene Farm Villages, is part of the wider Obsideo Group, whose related businesses span construction, technical services and property estates.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00',
    source_urls = '["http://obsideo-consulting.com/", "https://www.thinklocal.co.za/biz/obsideo-consulting-centurion"]'
WHERE slug = 'obsideo-consulting-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Ocean Basket branch in Centurion Mall serves Mediterranean-style seafood, including fish and chips, grilled prawns and sushi, and offers click-and-collect online ordering.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://oceanbasket.co.za/our-restaurants/ocean-basket-centurion-mall/", "https://centurionmall.co.za/stores/store-list/ocean-basket/"]'
WHERE slug = 'ocean-basket-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean Basket is a seafood-focused restaurant and takeaway in Menlyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-basket-menlyn-2' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean Basket Irene Village, in Irene Village Mall, has a setting overlooking the square with a children''s play area and occasionally hosts live music, making it a popular choice for family dining and celebrations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/ocean-basket-irene-village-mall-in-centurion", "https://oceanbasket.co.za/our-restaurants/ocean-basket-irene/"]'
WHERE slug = 'ocean-basket-irene-village-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Newlands Plaza branch of Ocean Basket is part of a seafood chain founded in 1995 that has grown into the largest fish retailer in Southern Africa, serving seafood platters, sushi, maki and sashimi alongside its classic fish and chips.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/ocean-basket-newlands-plaza/", "https://www.tripadvisor.co.za/Restaurant_Review-g312583-d10489979-Reviews-Ocean_Basket_Newlands_Plaza-Pretoria_Gauteng.html"]'
WHERE slug = 'ocean-basket-newlands-plaza-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean Basket Nina Park is a lively, contemporary seafood eatery in Ninapark known for its sharing platters, sushi and classic fish and chips.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-21:00, Fri 11:00-22:00, Sat 11:00-21:00, Sun 11:00-20:00',
    source_urls = '["https://oceanbasket.co.za/our-restaurants/ocean-basket-nina-park/", "https://www.tripadvisor.co.za/Restaurant_Review-g312583-d12117928-Reviews-Ocean_Basket_Nina_Park-Pretoria_Gauteng.html"]'
WHERE slug = 'ocean-basket-nina-park-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ockert Bladesmith & Machining is an industrial supply and manufacturing workshop serving Kameeldrift East, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ockert-bladesmith-machining-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Odyssey Pretoria develops point-of-sale software, providing POS systems to supermarkets, restaurants, bottle stores, butcheries and other retail businesses across the region.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://point-of-sale.co.za/", "http://odysseypta.co.za/"]'
WHERE slug = 'odyssey-pretoria-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Off the Hook Promotions is a marketing and advertising business based in Weavind Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'off-the-hook-promotions-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Office Co. - Brooklyn provides commercial office space and property solutions in Muckleneuk, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'office-co-brooklyn-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Office Co. - Menlyn, based in Ashlea Gardens Office Park at the junction of Garsfontein Road and the N1, offers fully furnished office suites, co-working space and virtual offices, with meeting facilities, cleaning and unlimited WiFi included.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.officeco.co.za/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=10515718106639260185", "https://www.officeco.co.za/menlyn-pretoria"]'
WHERE slug = 'office-co-menlyn-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Office Group is an office furniture showroom in Bronberrik, Centurion, supplying desks, chairs and filing cabinets to executive offices, call centres, hospitals and home offices, with delivery and assembly available and nationwide distribution from head offices in Johannesburg and a distribution centre in Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.officegroup.co.za/", "https://officegroup.co.za/contact/"]'
WHERE slug = 'office-group-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Office to Rent Centurion is an estate agency covering office listings in Blue Valley Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'office-to-rent-centurion-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OfficePlace launched in 2015 and specialises in commercial property across Johannesburg, Pretoria and Cape Town, including office, retail and industrial listings, operating from its base in Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.officeplace.co.za/"]'
WHERE slug = 'officeplace-pretoria-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Offtek cc is a stationery shop in Valhalla stocking a wide range of office supplies including toner and printer cartridges, known for affordable prices and friendly, helpful staff.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://rbe.co.za/places/offtek/"]'
WHERE slug = 'offtek-cc-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oh So Tech is a Doornpoort-based IT support provider offering computer troubleshooting, system optimisation and tech services for homes, small businesses and SMEs across Pretoria, with 24-hour assistance.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ohsotech.com/", "https://pretoria.co.za/place/oh-so-tech"]'
WHERE slug = 'oh-so-tech-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oh my designs is a marketing and advertising studio in Weavind Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'oh-my-designs-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oi! Active Clothing (Oi! Active Living) has been setting trends in gym, dance and swim activewear since 2002, and is the official South African distributor of Bro Fitwear, a Brazilian activewear brand known for bold prints and premium fabrics.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://oi-active-living.shopstar.co.za/contact/", "https://oiactiveliving.com/"]'
WHERE slug = 'oi-active-clothing-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oikonomos is a chartered accounting firm in Koedoespoort Industrial whose name, meaning a trusted steward of household or public finances, reflects its focus on financial stewardship for clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.oksa.co.za/"]'
WHERE slug = 'oikonomos-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oil Shoppe Gauteng is an official Shell Lubricants distributor in Montana Park, stocking engine oils, gear oils, greases, ATF and food-grade oils for motorcycles, cars, commercial vehicles and agricultural and industrial machinery, with expert advice on product selection.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-16:30',
    source_urls = '["http://www.oilshoppe.co.za/", "https://oilshoppe.co.za/contact/"]'
WHERE slug = 'oil-shoppe-gauteng-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Okulvitro is an industrial supplier and manufacturer based in Murrayfield, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'okulvitro-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olam Poultry is a butchery serving Andeon, Pretoria West.',
    description_enriched_at = datetime('now')
WHERE slug = 'olam-poultry-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Old Khaki Wonderpark is a fashion and clothing retailer serving Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'old-khaki-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Old Mutual Personal Finance Montana provides financial and investment services in Montana Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'old-mutual-personal-finance-montana-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olibecca Consulting, based in Akasia, offers strategy and business consulting alongside governance, risk management and compliance services, plus IT solutions and multimedia production.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.olibecca.co.za/"]'
WHERE slug = 'olibecca-consulting-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olieve Multi Serv is a computer and IT services provider in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'olieve-multi-serv-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olive Designs & Web is a Centurion-based digital marketing and web design company offering website design, graphic design, social media management, Google Ads management, e-commerce solutions, printing and domain & hosting services, describing itself as a South African company with an international approach.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://olive.net.za/", "https://olivedesigns.co.za/"]'
WHERE slug = 'olive-designs-web-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olorun is a software development company based in Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'olorun-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olu-K Properties is a Waverley-based estate agency led by a buy-to-let specialist, property coach and advisor, offering residential property valuations, lease agreement reviews and renewals, and incoming, interim and outgoing rental inspections.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.propertytalkwitholu-k.co.za/", "https://www.olu-kproperties.co.za/"]'
WHERE slug = 'olu-k-properties-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olympus Boulevard is an A-grade commercial office park offering office space with 24-hour security and access control, backed-up generators, fibre connectivity and landscaped gardens with water features, with glass-finished buildings designed for abundant natural light.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/pretoria-east/olympus-boulevard-residential-estate-and-office-park-olympus-faerie-glen-pretoria-9718"]'
WHERE slug = 'olympus-boulevard-residential-estate-and-office-park-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Omalyxn is a registered investment firm, Omalyxn Investments, based in Tileba near Ninapark, offering financial and investment services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://b2bhint.com/en/company/za/omalyxn-investments--K2023155668"]'
WHERE slug = 'omalyxn-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Omega IT Solutions is a Centurion IT consulting and outsourcing company founded in 2003, providing hardware and software sales, cloud drive solutions, desktop and server support, total IT infrastructure management, website design and hosting, and Microsoft Exchange solutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.omegaits.co.za/", "https://omegaits.co.za/"]'
WHERE slug = 'omega-it-solutions-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Omega Risk Solutions is a pan-African security firm with a branch in Rosslyn, offering manned guarding, fire risk management, monitoring and response, security training, VIP protection and safe transport services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.omegasol.com/"]'
WHERE slug = 'omega-risk-solutions-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Omnia Engineering provides mechanical engineering services covering everything from the prototype stage through to commissioning.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.omnia-eng.co.za/", "https://www.omnia-eng.co.za/"]'
WHERE slug = 'omnia-engineering-pty-ltd-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Omnigo is an electronic contract manufacturer based in Waltloo, founded in 1999 and now part of the Reunert Group''s Reutech, running a roughly 4500m2 ISO-accredited facility with around 200 employees. It specialises in wire harness manufacturing, surface-mount technology and mechanical integration mainly for the military market.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.omnigo.co.za/", "https://www.ebg.co.za/supplier.aspx?acc=838"]'
WHERE slug = 'omnigo-pty-ltd-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Omnigo (Pty) Ltd is a Waltloo-based electronic contract manufacturer founded in 1999, now part of Reutech within the Reunert Group, running a 4500m2 ISO-accredited facility with about 200 employees serving mainly the military market. Its capabilities include wire harness manufacturing, surface-mount technology and mechanical integration.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://omnigo.co.za/contact-us/", "https://www.yep.co.za/biz/store/iyp/10014980_2", "https://www.ebg.co.za/supplier.aspx?acc=838"]'
WHERE slug = 'omnigo-pty-ltd-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Omniserve Facility Management, founded in 2010, has grown from a group of specialised companies into a comprehensive facility management provider serving homeowners, estates and businesses across Pretoria and Johannesburg, with services spanning building maintenance and repairs, cleaning, landscaping and gardening, and weekly pool maintenance.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.omniservices.co.za/"]'
WHERE slug = 'omniserve-facility-management-pretoria-east-garden-and-pool-services-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ompetha Power Projects is a Raslouw-based electrical construction company founded in 2007, CIDB Grade 8EP certified and B-BBEE Level 1, approved by Eskom, Ekurhuleni and City Power. It delivers turnkey MV/LV/HV infrastructure projects from 11kV up to 765kV, including distribution substations, power lines, overhead and underground reticulation, minisubs, transformers and fibre installations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ompethapower.com/", "https://ompetha.com/"]'
WHERE slug = 'ompetha-power-projects-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'On Guard Consulting is a business & management consulting firm offering business registration and design services in Blue Valley Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'on-guard-consulting-business-registrations-design-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'On Q Accounting and Tax Services has provided customised taxation, payroll and corporate governance services for over 15 years, with a team offering bookkeeping, tax accounting and tax consulting for businesses in the Pretoria area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.onqacc.co.za/", "https://www.onqacc.co.za/about/"]'
WHERE slug = 'on-q-accounting-and-tax-services-pty-ltd-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'On Target Business Solutions works alongside its sister company, On Target Financial Solutions, with a team of experienced staff addressing corporate and personal financial needs from its offices on Rooiberg Street in The Willows, Pretoria East.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://otfsolutions.co.za/"]'
WHERE slug = 'on-target-business-solutions-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Onderstepoort Biological Products (OBP) is a state-owned animal vaccine manufacturer whose mandate is to prevent and control animal diseases affecting food security, human health and livelihoods, producing veterinary vaccines for bovine, ovine, equine and caprine livestock against bacterial and viral diseases.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.obpvaccines.co.za/", "https://www.obpvaccines.co.za/"]'
WHERE slug = 'onderstepoort-biological-products-obp-the-home-of-onderstepoort-vaccines-onderstepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One 85 in Vinko is a self-catering flatlet with a separate entrance on the owner''s Sinoville property, close to the Sefako Makgatho highway, Montana Hospital and schools including Overkruin, Northridge and Stephanus Roos Primary. It sleeps two guests in an open-plan unit with a kitchenette, free WiFi and DStv.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.lekkeslaap.co.za/accommodation/one85-in-vinko"]'
WHERE slug = 'one-85-in-vinko-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One Click Holidays is a travel agency based in Woodhill Golf Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'one-click-holidays-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One G Services is a specialist property and infrastructure development consultancy established in 2010, based at Lombardy Business Park, with a team covering project management, financial management, engineering and town planning.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.onegservices.com/", "https://onegservices.co.za/contact-us/"]'
WHERE slug = 'one-g-services-pty-ltd-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One Highveld Centre is a commercial property and office space development in Blue Valley Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'one-highveld-centre-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One IT provides computer and IT support services to businesses in the Hennopspark area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'one-it-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One More Liquors Montana is a liquor store located in the Montana Boulevard Lifestyle Centre in Magalieskruin.',
    description_enriched_at = datetime('now')
WHERE slug = 'one-more-liquors-montana-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One Percent SA (PTY) Ltd. is an accounting and bookkeeping firm in Waterkloof Glen offering financial statement preparation, tax planning and consulting, and business administration support, with both onsite and online appointments available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.onepercentaccounting.co.za/", "https://pretoria.co.za/place/one-percent-sa-pty-ltd"]'
WHERE slug = 'one-percent-sa-pty-ltd-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One Stop Animal Rescue in Heatherdale rescues, rehabilitates and finds forever homes for animals in need, while offering additional support and resources to pets and their owners.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://southafricafirm.com/gauteng/one-stop-animal-rescue-r-84272", "https://rsa.worldorgs.com/catalog/pretoria/animal-rescue-service/one-stop-animal-rescue-r"]'
WHERE slug = 'one-stop-animal-rescue-heatherdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One Stop Solution and Trading is a building and construction business based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'one-stop-solution-and-trading-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'One call steelworx is a building and construction business specialising in steelworks, based in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'one-call-steelworx-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OnePiq is a computer & IT services business based in Weavind Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'onepiq-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oneness Pest and Cleaning Solutions offers pest control and cleaning services in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'oneness-pest-and-cleaning-solutions-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Online Intelligence, formed in 2003, is a software and services company whose head office in The Willows provides end-to-end enterprise risk, security management, incident and investigative case management, and event/alarm monitoring solutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.onlineintelligence.co.za/"]'
WHERE slug = 'online-intelligence-head-office-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OnlineWise is a marketing consultancy and website design business based in Elardus Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'onlinewise-marketing-consultant-and-website-designer-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Only Accounting is an accounting practice in Daspoort, also known on social media as Think Only Accounting SA, with the tagline "crunching numbers so you don''t have to."',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/ThinkOnlyAccountingSA"]'
WHERE slug = 'only-accounting-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Only Africa Group is a pan-African business group whose Medi-Africa unit, based in Montana Park, Pretoria, is one of the leading administrators of Injuries on Duty (IOD) claims, liaising directly with South Africa''s Compensation Fund.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.onlyafrica.co.za/", "https://www.mediafrica.co.za/about-us"]'
WHERE slug = 'only-africa-group-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ons Winkel Sinoville is a charity thrift store run by Solidarity Helping Hand, selling donated second-hand goods such as furniture, kitchenware, linen and clothing, with proceeds funding social assistance, job creation and student bursaries.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.onswinkel.co.za/", "https://helpendehand.co.za/ons_winkel/sinoville-pretoria/"]'
WHERE slug = 'ons-winkel-sinoville-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Onshape is part of the productONE group and operates from Irene, Centurion, with a team of more than 30 people supporting clients as its primary location.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://onshape.co.za/", "https://onshape.co.za/who-we-are/"]'
WHERE slug = 'onshape-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Onsiteworx is a business & management consulting firm based in Die Hoewes, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'onsiteworx-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ontime Readymix Concrete''s Centurion plant in Lyttelton Manor is one of several branches the minority-owned company runs across Gauteng, supplying quality-guaranteed ready-mix concrete at competitive rates; the company was established around 20 years ago.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ontimermc.com/", "https://www.ontimermc.com/about"]'
WHERE slug = 'ontime-readymix-concrete-centurion-plant-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oogappel Optometry is a boutique optometry practice in Garsfontein offering personalised eye tests, premium frames and contact lenses, alongside comprehensive eye-health assessments using modern diagnostic technology to examine the cornea, macula, optic nerve and retina.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.oogappeloptom.co.za/"]'
WHERE slug = 'oogappel-optometry-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OohDee Luxury is a retail business in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'oohdee-luxury-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oosland Butchery in Elardus Park specialises in game meat processing, including packaging and detailed labelling of all game meat products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00',
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/ooslandbutchery/"]'
WHERE slug = 'oosland-butchery-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OpenSky Solar Energy Solutions is an ECSA-accredited solar company in Eldoraigne, Centurion, designing and installing domestic and commercial PV systems including grid-tied solar, hybrid inverters and battery backup, plus solar water heating and system maintenance and repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openskysolar.co.za/", "https://openskysolar.co.za/solar-company-centurion"]'
WHERE slug = 'opensky-solar-energy-solutions-eldoraigne' AND description_enriched_at IS NULL;

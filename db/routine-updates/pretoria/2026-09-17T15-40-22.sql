UPDATE businesses
SET description = 'Absa Bank Hennopspark, located in Centurion Lifestyle Centre, offers everyday personal banking services including home loans and investment options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:30, Sat 08:30-11:00, Sun Closed',
    source_urls = '["https://buzdy.com/viewBranch/absa-bank-absa-branch-hennopspark-shop-36-centurion-lifestyle-centre-cnr-lenchen-and-old-johannesburg-road-hennops-park-industrial-centurion-centurion-17631", "http://za.near-place.com/absa-branch-hennopspark-shop-36-centurion-lifestyle-centre-cnr-lenchen-and-old-johannesburg-road-hennops-park-industrial-centurion", "https://centurionlifestylecentre.co.za/stores/store-list/absa-bank/"]'
WHERE slug = 'absa-bank-hennopspark-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Advance Cash & Carry Hermanstad is a large wholesale grocery store in Roseville Park, Hermanstad, with a trading area of around 17,000 square metres, positioning itself among the largest FMCG wholesalers in Gauteng.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-13:00'
WHERE slug = 'advance-cash-carry-hermanstad-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CorruPack, based in Hennopspark, Centurion, supplies packaging solutions to industry and the public, including corrugated boxes, bubble wrap, moving boxes, pallet wrap, strapping and custom-printed packaging, acting as an intermediary between manufacturers and end-users to offer small-quantity orders at competitive prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.corrupack.co.za/contact.html", "https://za.africabz.com/gauteng/corrupack-47319", "https://www.corrupack.co.za/about.html"]'
WHERE slug = 'corrupack-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cream Star Ice Cream (Pty) Ltd is an ice cream manufacturer in Hermanstad, Pretoria, producing and supplying ice cream, ice pops, milk pops, soft serve, syrups and yoghurt pops at retail and wholesale, including for restaurants and caterers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 07:30-17:00, Tue-Fri 09:00-17:00, Sat 10:00-14:00, Sun 10:00-14:00',
    source_urls = '["https://www.yellosa.co.za/company/478020/cream-star-ice-cream", "https://rsa.worldorgs.com/catalog/pretoria/ice-cream-shop/cream-star-ice-cream-pty-ltd", "https://pretoria.co.za/place/cream-star-ice-cream-pty-ltd"]'
WHERE slug = 'cream-star-ice-cream-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dezi''s Pets is a pet shop in Hermanstad, Pretoria, on Van Der Hoff Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-13:00, Sun 09:00-13:00',
    source_urls = '["https://aconopet.com/shop/listing/dezis-petshop-pet-shop-in-pretoria-south-africa/", "https://za.polomap.com/pretoria/43130", "http://www.pretoria-south-africa.com/dezis-pets-supplies.html"]'
WHERE slug = 'dezis-pets-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hennopspark Auto Repair Shop is an all-in-one vehicle repair, maintenance and servicing shop in Centurion, also offering auto electrical work, panel beating and spray painting, serving customers across Pretoria, Johannesburg, Sandton, Midrand, Fourways, Hartbeespoort and Kempton Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hennops-auto-repair.co.za/contact-us", "https://www.facebook.com/CayHennops/", "http://hennops-auto-repairs.com/"]'
WHERE slug = 'hennopspark-auto-repair-shop-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Minuteman Press Centurion CBD is a printing and graphic design shop in Die Hoewes offering full-colour printing, copying, large-format printing and promotional products, including brochures, business cards, flyers and letterheads.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-12:00, Sun Closed',
    source_urls = '["http://www.cent.minutemanpress.com/", "https://minuteman.com/za/locations/gauteng/centurion-cbd/"]'
WHERE slug = 'minuteman-press-centurion-cbd-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Minuteman Press Lynnwood, trading from St. Georges Court since it opened in September 1999, offers graphic design, digital and offset printing, wide-format printing, signage, mailing and promotional products and apparel.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
    source_urls = '["https://za.africabz.com/gauteng/minuteman-press-lynnwood-43713", "https://www.yellosa.co.za/company/142126/minuteman-press-lynnwood", "https://minuteman.com/za/locations/gauteng/lynnwood/"]'
WHERE slug = 'minuteman-press-lynnwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Minuteman Press Montana, in Palms Centre, Magalieskruin, offers full-colour printing, copying, graphic design and finishing services, including brochures, business cards, flyers and letterheads.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
    source_urls = '["https://za260.minuteman.com/", "https://minuteman.com/za/locations/gauteng/magalieskruin/"]'
WHERE slug = 'minuteman-press-montana-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Minuteman Press Rosslyn, established in 2020 at Rosslyn Corner Shopping Centre, offers digital design and print services including business cards, flyers, brochures, banners and signage, with a delivery service and a Xerox Versant 180 press for expanded production capacity.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://rosslyn.minutemanpress.co.za/", "https://minutemanpressfranchise.com/news/2020/12/03/new-minuteman-press-franchise-in-rosslyn-pretoria-south-africa-invests-in-xerox-versant-180/"]'
WHERE slug = 'minuteman-press-rosslyn-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Minuteman Press Silverton relocated to Six Fountains Adventure Centre in Silverlakes in December 2018, reopening in January 2019, and offers printing services including business cards, custom stamps, flyers, menus, postcards and promotional products.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.silverton.minutemanpress.co.za/", "https://minuteman.com/za/locations/gauteng/silverton/news/minuteman-press-silverton-has-moved-visit-our-new-shop-in-silver-lakes-13381"]'
WHERE slug = 'minuteman-press-silverton-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miqnah Consultation, operating since 2017 in Rietfontein, Pretoria, provides fire safety, architectural, civil and mechanical engineering, and HVAC consulting services, including rational fire plan design.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.miqnah.co.za/", "https://www.miqnah.co.za/about"]'
WHERE slug = 'miqnah-consultation-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mirua Solar & Technology, based in Waverley, Pretoria, supplies solar products to installers and electricians and also offers photovoltaic and solar panel installation services, with more than five years in the industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mirua.co.za/", "https://www.procompare.co.za/providers/mirua-solar-technology"]'
WHERE slug = 'mirua-solar-technology-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miss Cake Bakery, in Waterkloof Centre, Brooklyn, specialises in celebration and birthday cakes, cupcakes, brookies and tarts, catering for weddings and last-minute orders.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:00, Sun 09:00-13:00',
    source_urls = '["https://www.waze.com/live-map/directions/za/gp/pretoria/miss-cake-bakery?to=place.ChIJ6fM3_TdhlR4R9qFJUhSfqqo", "https://pretoria.co.za/place/miss-cake-bakery", "https://misscake.co.za/contact/"]'
WHERE slug = 'miss-cake-bakery-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mitcham Holdings Services is a commercial property and office space business based in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'mitcham-holdings-services-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CMH Mitsubishi Menlyn is a new and pre-owned Mitsubishi dealership in Menlyn, part of the Combined Motor Holdings group, and has won the Dealer of the Year award in the Service After Sales category at the Mitsubishi Motors South Africa Annual Awards.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'mitsubishi-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mkhonto and Ngwenya Inc is a 100% black-owned law firm in Lyttelton Manor, Centurion, established in 2018, offering employment and labour law, civil and general litigation, corporate and commercial law, and estate administration services, with more than 30 years of combined legal experience among its team.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mkhontongwenyainc.co.za/", "https://www.procompare.co.za/providers/mkhonto-and-ngwenya-inc"]'
WHERE slug = 'mkhonto-and-ngwenya-inc-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mkumbe Trading cc is an industrial supplies business based in Klerksoord, Akasia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mkumbe-trading-cc-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mlt Innovations (Pty) Ltd is a business consulting firm based in Philip Nel Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mlt-innovations-pty-ltd-philip-nel-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mmabatho pty company is an events and function venue based in Montana Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mmabatho-pty-company-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mmakobo Administrators Pty Ltd is a business consulting firm based in The Orchards, Akasia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mmakobo-administrators-pty-ltd-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mmkm Information Technology is part of the MMKM Holdings group, based in Woodhill Golf Estate, Pretoria, alongside sister divisions including MMKM Security, MMKM Agriculture and MMKM Petroleum.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mmkmtechnology.com/", "https://mmkmholdings.com/contact.html"]'
WHERE slug = 'mmkm-information-technology-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mmopelele Enterprise and Logistics is a logistics and courier transport business based in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mmopelele-enterprise-and-logistics-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mobile Infrastructure Solutions (MiS), an IT services company registered in 2012, operates from Boardwalk Office Park in Faerie Glen, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://m-i-s.co.za/", "https://b2bhint.com/en/company/za/mis-mobile-infrastructure-solutions--K2012007917"]'
WHERE slug = 'mobile-infrastructure-solutions-mis-boardwalk-meander' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mobile freezers and cold rooms is a mobile freezer and cold-room supply business based in Rooiwal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mobile-freezers-and-cold-rooms-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mobility VCards is a business consulting service based in Lynnwood Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mobility-vcards-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mobizone the GADGET is a tech and gadget shop in Rooihuiskraal, Centurion, selling phones, accessories, gaming gear and drones, and offering device repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://mobizone.africa/"]'
WHERE slug = 'mobizone-the-gadget-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modern Office, based in Sunderland Ridge, Centurion, is an office furniture supplier with more than 20 years of experience, part of the Esaaks Office Furniture family, offering ergonomic chairs, executive desks, boardroom and training room furniture and storage solutions, both locally manufactured and imported, with delivery and installation across Gauteng.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.modernoffice.co.za/", "https://www.sadecor.co.za/supplier/modern-office/"]'
WHERE slug = 'modern-office-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modern Tarps Supply is an industrial supplier based in Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'modern-tarps-supply-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modhomco (Pty) Ltd, based in Clubview, Pretoria, supplies and distributes homeopathic and natural health products -- including cortisone- and antibiotic-free animal skin care products -- to pharmacies, health practitioners and health stores across South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat Closed, Sun Closed',
    source_urls = '["https://modhomco.co.za/", "http://www.yellowpages.co.za/business/ZA_15991907_6261684_002162_116"]'
WHERE slug = 'modhomco-pty-ltd-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modiba Du Plessis Attorneys is a law firm in Villieria, Pretoria, offering commercial law, civil litigation, family law and property law services, including mediation, personal injury claims and estates and trusts, for corporate and individual clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mdpa.co.za/", "https://www.procompare.co.za/providers/modiba-du-plessis-attorneys"]'
WHERE slug = 'modiba-du-plessis-attorneys-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modic • Creative Digital Agency, formed in 2022 from the merger of McCrea Media and ModuTech, is based in Centurion and offers digital marketing services including SEO, Google Ads, social media marketing, video and animation, working with clients across South Africa as well as the United States and Ireland.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://modicglobal.com/", "https://modicglobal.com/modic-about/"]'
WHERE slug = 'modic-creative-digital-agency-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modise Family Websites is a software and web development business based in Lyttelton Manor, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'modise-family-websites-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moditi Holdings, based in The Reeds, Centurion, specialises in construction, property development and building services, operating through subsidiaries including Moditi Consulting Engineers and Moditi Properties, with a focus on creating opportunities for young South Africans in infrastructure development.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.moditi.co.za/contact.html", "https://www.crunchbase.com/organization/moditi-holdings"]'
WHERE slug = 'moditi-holdings-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modoro is a logistics and courier transport business based in Olievenhoutbosch, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'modoro-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modscape Architects is an architectural and interior design studio based in Magalieskruin, Pretoria, providing design solutions for residential, commercial, institutional and industrial newbuild and renovation projects across South Africa, including Johannesburg and Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://modscape.co.za/", "https://www.homify.co.za/professionals/7095215/modscape-architects"]'
WHERE slug = 'modscape-architects-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mogold Global (Pvt) Limited is a logistics service provider based in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://mogold-global-pvt-limited.business.site/"]'
WHERE slug = 'mogold-global-pvt-limited-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moi Gud is a print shop in Rietondale, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/moi-gud"]'
WHERE slug = 'moi-gud-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mojalefa Masego is a business consulting service based in Amandasig, Akasia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mojalefa-masego-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mojojuice is an engineering and surveying business based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mojojuice-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mokhine Group (Pty) Ltd, based in Garsfontein, Pretoria East, is a construction and facilities-management turnkey solutions provider that began as a small civil construction contractor in 2007, specialising in retaining walls, road, tunnel and railway construction, and hospital engineering and construction works.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.mokhinegroup.co.za/"]'
WHERE slug = 'mokhine-group-pty-ltd-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mokone Enterprise is a business consulting service based in Montana Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mokone-enterprise-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mol Corp is an industrial supplies business based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mol-corp-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Molati Attorneys Inc is a township-based law firm in Lynnwood Glen, Pretoria, practising since 2017 in conveyancing, litigation, insolvency, debt collection, government regulatory affairs and family law.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://molatiattorneys.co.za/", "https://www.brabys.com/za/gauteng/pretoria/lynnwood-glen/attorneys/molati-attorneys-inc"]'
WHERE slug = 'molati-attorneys-inc-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Molefe Roux Incorporated is a law firm in Sinoville, Pretoria, specialising in conveyancing, notarial services, family law, litigation, administration of estates and commercial law.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mrlaw.co.za/", "https://lawzana.com/lawyer/molefe-roux-incorporated/pretoria"]'
WHERE slug = 'molefe-roux-incorporated-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moleko Printers, established in October 2006 in Sinoville, Pretoria, specialises in wide-format and litho printing and dye sublimation, offering vehicle branding, signboards, banners, vinyl stickers, gazebos, flags and rubber stamps.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://www.mprinters.co.za/", "https://pretoria.co.za/place/moleko-printers"]'
WHERE slug = 'moleko-printers-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Momentum Consult Lyttelton is part of Consult, a financial planning and advisory group established in 2014, offering tailored financial planning solutions through dedicated financial advisers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.momentumconsult.co.za/en/franchise/lyttelton", "https://www.facebook.com/ConsultbyMomentum/"]'
WHERE slug = 'momentum-consult-lyttelton-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Momentum Irene is a Momentum Financial Wellness Practice franchise established in 2018, specialising in medical aid, short- and long-term insurance, investments and pension and provident funds, with more than 25 years of combined industry experience among its advisers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.momentumirene.co.za/", "https://www.momentum.co.za/planner/practice/momentum-financial-wellness-practice-irene"]'
WHERE slug = 'momentum-irene-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mon Sha-Mia Venue is a wedding and events venue in Heatherdale, Akasia, offering catering, function planning, wedding coordination, and birthday and corporate event planning in a garden setting, with wheelchair-accessible facilities.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-18:00',
    source_urls = '["http://www.monsha-mia.co.za/", "https://www.procompare.co.za/providers/mon-sha-mia-venue"]'
WHERE slug = 'mon-sha-mia-venue-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monavoni Nursery in Centurion specialises in indigenous trees, landscaping and irrigation, selling wholesale to landscapers as well as to the public.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-16:00, Sun 09:00-15:00',
    source_urls = '["scraped:google-places-no-website", "https://www.thinklocal.co.za/biz/monavoni-nursery-centurion"]'
WHERE slug = 'monavoni-nursery-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mondanette Butchery, in Monument Park Centre, is a Pretoria butchery with a 40-year legacy since 1983, offering fresh cuts, specialty sausages and delicacies, with a dedicated game meat processing department and delivery across Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mondanettebutchery.co.za/", "https://pretoria.co.za/listing/mondanette-butchery-monument-park/"]'
WHERE slug = 'mondanette-butchery-monument-park-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monitor Net: Security Company, based in Hennopspark, Centurion, has operated since 1995 as a 24/7 monitoring centre, offering alarm monitoring, armed response, CCTV monitoring and home and business security support across Centurion, Brits and Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.monitornet.co.za/?utm_source=gmb&utm_medium=profile", "https://www.procompare.co.za/providers/monitor-net"]'
WHERE slug = 'monitor-net-security-company-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monlu Signs, established in 1990 in Meyerspark, Pretoria, supplies a wide range of signage including vehicle signage, digital printing, roll-up banners, car magnetics, aluminium and steel letters and logos, construction boards and window signage.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://monlusigns.co.za/", "https://monlusigns.co.za/"]'
WHERE slug = 'monlu-signs-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montagu Trading Company, at Raslouw Lifestyle Centre, Centurion, is a franchise of Montagu Dried Fruit & Nuts, one of South Africa''s foremost dried fruit, nuts and seed importers and suppliers, part of a national network of over 130 stores.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.montagudriedfruit.co.za/", "https://whichfranchise.co.za/franchise/montagu-dried-fruit-and-nuts-franchise-for-sale/"]'
WHERE slug = 'montagu-trading-company-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana: Doornpoort Plumbers is a plumbing service in Doornpoort, Pretoria, offering geyser installation and repair, blocked drain cleaning, leak detection and water heater repairs across Montana, Doornpoort and Sinoville.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/montanaplumbers/"]'
WHERE slug = 'montana-doornpoort-plumbers-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Carwash & Valet Specialists, in Montana, Pretoria, offers wash, dry and vacuum services, chassis and engine cleaning, valeting, carpet and upholstery cleaning, and cleaning for boats, caravans and camping equipment, with eight years in the industry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 07:00-16:00, Sun 07:00-16:00',
    source_urls = '["scraped:google-places-no-website", "https://www.pretoriacarwash.co.za/car-wash/montana-carwash-valet-specialists-pty-ltd"]'
WHERE slug = 'montana-carwash-valet-specialists-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Centre is a business centre in Sinoville, Pretoria, offering coworking spaces, meeting rooms and business services for startups and small teams, with an on-site cafe.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/montana-centre"]'
WHERE slug = 'montana-centre-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Gables Office Park is a multi-tenanted A-grade office park on Escallonia Street, Montana Park, Pretoria, with units ranging from around 106 to 124 square metres featuring reception areas, boardrooms and kitchen facilities, near Kolonnade Retail Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.apiproperty.co.za/results/commercial/to-let/pretoria/montana-park/office/42208/block-1-unit-g1b-montana-gables/"]'
WHERE slug = 'montana-gables-office-park-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Granite Tombstones Pretoria, founded in 1984 in Booysens, is a manufacturer and supplier of granite and marble tombstones across Gauteng, offering budget, standard, executive, double and children''s headstones with a patented fastening method, with lettering and installation included in the price.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.montanagranite.co.za/", "https://www.montanagranite.co.za/tombstones-in-south-africa-gravestones-headstones/"]'
WHERE slug = 'montana-granite-tombstones-pretoria-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Lisensies is a vehicle registration and licensing agency in Montana, Pretoria, handling driving licence appointments, motor vehicle registration and licensing, change of ownership, and business or trust registration and address changes.',
    description_enriched_at = datetime('now')
WHERE slug = 'montana-lisensies-montana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Power Tools is a machine workshop in Moregloed, Pretoria, repairing generators, welders, power tools and refrigerators, and stocking second-hand tools and demo models with free quotations.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00',
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing/montana-power-tools/"]'
WHERE slug = 'montana-power-tools-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Realty is a real estate agency in Magalieskruin, Pretoria, listing residential properties for sale across Montana, Montana Tuine, Doornpoort and Magalieskruin.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.montanarealty.co.za/", "https://property.mg.co.za/property-for-sale-by-montana-realty-cc-ag13311"]'
WHERE slug = 'montana-realty-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Bolt & Tool is a hardware store on Lavender Road in Annlin, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/MontanaBoltnTool/"]'
WHERE slug = 'montana-bolt-and-tools-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana Engravers is a custom engraving service based in Sinoville, Pretoria, also trading from Montana Family Market.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.thinklocal.co.za/biz/montana-engravers-pretoria"]'
WHERE slug = 'montana-engravers-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montana repairs & Construction, in Doornpoort, Pretoria, is a household maintenance and construction business with more than 20 years of experience, using SABS-approved materials and its own trained personnel rather than subcontractors, covering construction, ceilings, kitchens, painting and waterproofing.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.corniceexpress.co.za/", "https://pretoria.co.za/place/montana-repairs-amp-construction"]'
WHERE slug = 'montana-repairs-construction-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montani Property Valuers, established in 2012 and serving Annlin, Pretoria, provides professional valuations for residential properties (houses, apartments, townhouses and condominiums) and commercial properties (offices, retail and mixed-use), as well as rental valuations.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://montanipv.co.za/"]'
WHERE slug = 'montani-property-valuers-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Month end Maniac is an accounting service based in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'month-end-maniac-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montigroei Distributors, based at Tannery Industrial Park in Silverton, Pretoria, is certified by the South African National Halaal Authority.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://montigroei.co.za/", "https://sanha.org.za/certified-establishmen/listing/montigroei-distributors/"]'
WHERE slug = 'montigroei-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monument Office Park, on Steenbok Avenue in Monument Park, Pretoria, is a multi-tenant office park offering back-up power, central air-conditioning and fibre connectivity, with direct access to Solomon Mahlangu Drive, Elephant Road, Skilpad Road and the R21 highway.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://monument-park.co.za/", "https://monument-park.co.za/contact/"]'
WHERE slug = 'monument-park-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monument Park Market Gardens is a greengrocer in Monument Park Shopping Centre, Pretoria, selling fresh fruit and vegetables at low prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://monumentparkshoppingcenter.co.za/monument-park-market-gardens/"]'
WHERE slug = 'monument-park-market-gardens-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monumentpark Stationers, in Monument Park Shopping Centre, Pretoria, sells stationery, pens, office and art supplies, including custom-made back-to-school packs based on individual school lists.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mpstationers.com/", "https://pretoria.co.za/place/monumentpark-stationers"]'
WHERE slug = 'monumentpark-stationers-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moo Moo Menlyn is a quirky, meat-focused steakhouse in Menlyn Park Shopping Centre known for its playful branding -- including MooGazine menus and mooing sounds in its ''Outhouse'' toilets -- serving steaks, ribs and burgers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-21:00, Fri-Sat 11:00-22:00, Sun 11:00-20:00',
    source_urls = '["https://southafricafirm.com/gauteng/moo-moo-menlyn-11036", "https://www.menlynpark.co.za/stores/moo-moos/", "https://www.moo-moo.co.za/moo-moo-menlyn"]'
WHERE slug = 'moo-moo-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mooiland Investment Holdings is an industrial supplies business based in Mooiplaats, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mooiland-investment-holdings-mooiplaats' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mooiplaas Iris & Daylily Nursery, in Erasmia, Centurion, is a specialist online grower of irises, daylilies and bulbous plants, delivering nationwide by courier with free shipping on orders above R850; in-person visits are by prior arrangement only.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mooiplaasnursery.co.za/", "https://www.mooiplaasnursery.co.za/landscaping-with-irises-and-daylilies/"]'
WHERE slug = 'mooiplaas-iris-daylily-nursery-erasmia-centurion-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mooiplaats Landfill Disposal Recycling Site, managed by The Waste Group near Knoppieslaagte, Centurion, is an ISO14001-certified landfill that scored 98% in recent waste-management compliance audits, with an adjacent 166-hectare expansion planned to extend its operating life by roughly 55 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.wastegroup.co.za/", "https://www.wastegroup.co.za/landfill-sites/"]'
WHERE slug = 'mooiplaats-landfill-disposal-recycling-site-pretoria-johannesburg-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mooiwater Pompe-Pumps/Mia Bros, in East Lynne, Pretoria, supplies and installs borehole pumps, pressure pumps and petrol-powered water pumps, along with booster pumps, water tanks and pipe fittings, and also trades as a second-hand general dealer.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.brabys.com/za/gauteng/pretoria/east-lynne/boreholes/mooiwater-pompe-pumps"]'
WHERE slug = 'mooiwater-pompe-pumps-mia-bros-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mookodi Enterprise is an energy consultancy based in Kosmosdal, Centurion, focused on helping organisations and communities across Africa navigate the energy landscape.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://mookodienterprise.co.za/", "https://www.zoominfo.com/pic/mookodi-ls-enterprise-pty-ltd/430166940"]'
WHERE slug = 'mookodi-enterprise-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moolman Group, based in Lynnwood Ridge, Pretoria, is a property investment, development and management company founded in 1967 in Polokwane, managing more than 750,000 square metres of retail, commercial and industrial space -- including regional shopping centres, CBD buildings and warehouses -- with developments in seven of South Africa''s nine provinces.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.moolmangroup.co.za/", "https://moolmangroup.co.za/about/"]'
WHERE slug = 'moolman-group-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moolow Traders is a business consulting service based in Willow Park Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'moolow-traders-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moonfull Crystals, in Irene Village Mall, Centurion, is a metaphysical supply store selling rough and polished crystals and gemstones, semi-precious stone beads, and jewellery and accessories, with a wheelchair-accessible store.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-17:00',
    source_urls = '["http://www.moonfullcrystals.co.za/", "https://moonfullcrystals.co.za/"]'
WHERE slug = 'moonfull-crystals-irene-village-mall-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moonlighter Group (Pty) Ltd, based in Doornpoort, Pretoria, is a technology consultancy offering adaptive, rapid application development approaches to help organisations use technology to augment their business processes.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://moonlightergroup.co.za/", "https://moonlightergroup.co.za/contact.html"]'
WHERE slug = 'moonlighter-group-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moonstone Business School of Excellence, based in Brooklyn, Pretoria, is a FAIS-accredited education and training provider established in 2015, offering wealth management, insurance and financial management, compliance officer and cybersecurity courses, accredited by DHET, SAQA, CHE, INSETA, FPI and FSCA, with flexible distance learning options.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.mbse.ac.za/", "https://www.mbse.ac.za/about-us/"]'
WHERE slug = 'moonstone-business-school-of-excellence-brooklyn-forum-building-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moore Pretoria, established in 1984 and based in Lynnwood, Pretoria, is an accounting, audit and tax consulting firm with around 50 staff serving clients across Pretoria and Johannesburg, and is the local member of the Moore Global network of more than 30,000 staff in 112 countries.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.moore-southafrica.com/locations/moore-pretoria-partnership", "https://www.moore-global.com/locations/africa/south-africa/moore-pretoria-partnership/"]'
WHERE slug = 'moore-pretoria-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moot Bargains is a marketing agency in East Lynne, Pretoria, offering branding, digital campaigns, strategic design and campaign management, with data-driven strategy across social, search and content marketing.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/moot-bargains"]'
WHERE slug = 'moot-bargains-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moot Bolts & Nuts, established in 2000 in Hermanstad, Pretoria, is a hardware store offering a wide range of products with a focus on customer service and stock availability.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 07:40-17:00, Thu 07:30-17:00, Fri 07:40-16:30',
    source_urls = '["http://www.mootbolt.co.za/", "https://pretoria.co.za/listing/moot-bolts-nuts/"]'
WHERE slug = 'moot-bolts-nuts-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moot Properties is a real estate agency based in Villieria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'moot-properties-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moot Renovating cc is an engineering and renovation business based in Moregloed, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'moot-renovating-cc-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moot Security Shop, in Villieria, Pretoria, is a security system supplier offering CCTV cameras, alarm systems, access control, gate automation, armed response and armed guarding services, related to the wider Security Shop Group with branches in Menlo Park and Benoni.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://secshopgroup.com/", "https://www.procompare.co.za/providers/moot-security-shop"]'
WHERE slug = 'moot-security-shop-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mopani Pharmacy Monument Park is an independent community pharmacy in Monument Park Shopping Centre offering basic clinic services, immunisations and Discovery Vitality tests alongside prescriptions and over-the-counter medication.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://mopanipharmacy.co.za/", "https://monumentparkshoppingcenter.co.za/mopani-pharmacy/"]'
WHERE slug = 'mopani-pharmacy-monument-park-pretoria-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morale Corp, based in Faerie Glen, Pretoria, provides outsourced HR services including recruitment support, performance management, training and culture audits, with South African labour-law compliance expertise and predictable monthly subscription pricing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.moralecorp.com/", "https://www.moralecorp.com/outsource-hr-consulting-pretoria-johannesburg"]'
WHERE slug = 'morale-corp-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This business manufactures and repairs custom mobile trailers -- including mobile kitchen and food trailers, VIP toilets, mobile freezers and cold rooms, and mobile bars and stages -- serving customers across Gauteng, Durban, North West and Mpumalanga.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://kabasomumba.my.canva.site/nduna-tiyosi-royal-trailers", "https://tiyosi.co.za/"]'
WHERE slug = 'mobile-kitchen-trailers-for-sale-food-trailers-pretoria-mpumalanga-gauteng-limpo-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moratwa Holdings Pty Ltd is a building and construction contractor based in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'moratwa-holdings-pty-ltd-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MoreSa Properties Pretoria, based in Garsfontein, is a real estate agency offering property sales and rental services across Gauteng, part of a network with additional offices in Vanderbijlpark, Delmas, Grahamstown and Brits.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.moresa.co.za/", "https://www.moresa.co.za/template/AboutUs.vm"]'
WHERE slug = 'moresa-properties-pretoria-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morell Industries is an industrial supplier and manufacturer based in Montana Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'morell-industries-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morgan Advanced Materials, with a satellite office in Amberfield Glen, Centurion, is a global manufacturer of specialist products using carbon, advanced ceramics and composites, founded in 1856 and operating 57 sites worldwide.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.morganadvancedmaterials.com/", "https://en.wikipedia.org/wiki/Morgan_Advanced_Materials"]'
WHERE slug = 'morgan-advanced-materials-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morgan Holdings, based in Brummeria, Pretoria, is a diversified group whose interests include Morgan Beef, a leading meat supplier, processor and exporter in Sub-Saharan Africa, red wine production, and the related Morgan Cargo logistics business offering sea and air freight forwarding and contract logistics from branches across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.morganholdings.co.za/", "https://www.morgancargo.com/contact/"]'
WHERE slug = 'morgan-holdings-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morgans business consultants, based in Clubview, Centurion, provides accounting and tax consulting services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://za.top10place.com/morgans-business-consultants-2033381331.html"]'
WHERE slug = 'morgans-business-consultants-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moropane Projects, based in Karenpark, Akasia, offers property management and electrical installation services, including tenant coordination, maintenance and safety upgrades.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/moropane-projects"]'
WHERE slug = 'moropane-projects-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mosaic is a business consulting service based in Olympus, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mosaic-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mosaic Property Solutions is a commercial property and office space business based in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'mosaic-property-solutions-brummeria' AND description_enriched_at IS NULL;

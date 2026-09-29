-- Slice 47 description-enrichment sweep (job 4)
-- Businesses: xenia-pharmaceutical-pty-ltd-rooihuiskraal .. your-childs-future-moregloed

UPDATE businesses
SET description = 'Xenia Pharmaceutical is an ISO 9001:2015-certified contract manufacturer in Rooihuiskraal, producing stock remedies and farm feeds along with pharmaceutical and nutraceutical liquids, ointments, aerosols, powders and gels, including third-party filling and packing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'xenia-pharmaceutical-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xfinity Civil is a business consulting firm based in Brakfontein, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'xfinity-civil-brakfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xiluka Electrical Services is an electrical contractor serving Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'xiluka-electrical-services-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xinergy Consulting Solutions is a business consulting firm based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'xinergy-consulting-solutions-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xinexa is a software development company based in Rooiwal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'xinexa-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xiphoss Technology, established in 2007, is an electronic design and manufacturing company in Highveld, Centurion, specialising in intrinsic-safe circuitry for the mining sector and offering cradle-to-grave product development from concept through manufacturing and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'xiphoss-technology-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xisana Consulting (Pty) Ltd is a business consulting firm based in Rooihuiskraal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'xisana-consulting-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xneelo, based in Samrand Business Park, Kosmosdal, is a South African web hosting provider founded in 1999 (formerly Hetzner SA), offering domain registration, shared and dedicated hosting, managed and cloud servers, and colocation services with 24/7 support.',
    description_enriched_at = datetime('now')
WHERE slug = 'xneelo-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xnext is a prepaid internet service provider in Meyerspark offering contract-free fibre and wireless/LTE connectivity, web hosting and business connectivity packages, with no debit orders or credit checks required.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun 09:00-13:00 (WhatsApp only)'
WHERE slug = 'xnext-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xpanda Pro Pretoria has supplied and installed security gates, burglar bars, roller shutter doors, garage doors and access barriers for homes and businesses since 1974, offering ISO 9001-certified, locally manufactured products with on-site security assessments.',
    description_enriched_at = datetime('now')
WHERE slug = 'xpanda-pro-pretoria-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xpress Batteries Clubview is part of the Xpress Batteries retail chain, offering car, commercial, motorcycle, leisure and golf-cart batteries from brands including Willard, SABAT and VARTA, with free battery testing and while-you-wait fitting.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://willardbatteryxpress.co.za/", "https://xpressbatteries.co.za/"]'
WHERE slug = 'xpress-batteries-clubview-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xpress Batteries Wierda Park is part of the Xpress Batteries retail chain, offering car, commercial, motorcycle, leisure and golf-cart batteries from brands including Willard, SABAT and VARTA, with free battery testing and while-you-wait fitting.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://sabatbatteryxpress.co.za/", "https://xpressbatteries.co.za/"]'
WHERE slug = 'xpress-batteries-wierda-park-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xpress Batteries Wolmer is part of the Xpress Batteries retail chain, offering car, commercial, motorcycle, leisure and golf-cart batteries from brands including Willard, SABAT and VARTA, with free battery testing and while-you-wait fitting.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://willardbatteryxpress.co.za/", "https://xpressbatteries.co.za/"]'
WHERE slug = 'xpress-batteries-wolmer-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'XpressSale Auctioneers is a property auction company in Rietondale with more than 25 years of combined industry experience, handling residential and commercial property sales through auction rather than traditional listings.',
    description_enriched_at = datetime('now')
WHERE slug = 'xpresssale-auctioneers-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xquisite Graphics is a printing and graphic design business in Daspoort offering litho and digital printing, logo and corporate identity design, signboards, banners, vehicle branding and affordable web design.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.xgraphics.co.za/", "http://www.xgraphics.co.za/aboutus.html", "https://www.snupit.co.za/pretoria/daspoort/xquisite-graphics/376737"]'
WHERE slug = 'xquisite-graphics-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xtreme is a computer and IT services provider based in Erasmia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'xtreme-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xtreme Events (Xtreme Promotions Sound and Lighting) has provided event production services since 1986, supplying DJs, sound, lighting, staging, screens and camera crews for events from birthday parties to large conferences across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'xtreme-events-xtreme-promotions-sound-and-iighting-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xtreme Trailers is an industrial supplier based in Waltloo, Pretoria, dealing in trailers and canopies.',
    description_enriched_at = datetime('now')
WHERE slug = 'xtreme-trailers-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xwi Towing (Angel of the Road) provides towing and roadside assistance from Leeuwfontein, including flatbed and heavy-duty towing and vehicle recovery for both manual and automatic vehicles.',
    description_enriched_at = datetime('now')
WHERE slug = 'xwi-towing-angel-of-the-road-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xymech (Pty) Ltd is an engineering and contracting firm based in the Sunderland Ridge industrial area, providing engineering services to industrial and manufacturing clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.brabys.com/za/gauteng/centurion/sunderland-ridge-ind/engineers-contractors/xymech-pty-ltd"]'
WHERE slug = 'xymech-pty-ltd-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xyrax is an internet service provider based in Thatchfield Estate, Centurion, established in 2018, offering fibre and fixed wireless connectivity plus business services such as VoIP, managed firewalls, VPN and surveillance systems with 24/7 remote technical support.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://xyrax.co.za/contact/", "https://xyrax.co.za/"]'
WHERE slug = 'xyrax-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Y2K Print and Design has operated in Sinoville since 2000, offering digital and large-format printing, business cards, banners, vehicle branding, embroidery and personalised novelty items with in-house graphic design.',
    description_enriched_at = datetime('now')
WHERE slug = 'y2k-print-and-design-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'YAD Global Advisors Ltd. is a financial and investment services firm based in Ashley Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yad-global-advisors-ltd-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yssel Auditors Incorporated is a chartered accountancy and auditing firm in Sinoville, offering accounting, payroll, external auditing, business valuations, taxation and court-appointed curatorship services.',
    description_enriched_at = datetime('now')
WHERE slug = 'yssel-auditors-incorporated-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'YT Systems is an electrical contractor serving De Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yt-systems-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yabeng Investment Holding Company Limited is a financial and investment holding company based in Muckleneuk, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yabeng-investment-holding-company-limited-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yachties4Yachties, based in Shere, Pretoria, specialises in visa applications and yachting career training for aspiring superyacht crew, including offshore training, seafarer documentation and maritime certifications, and has over 10 years of industry experience.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-17:00'
WHERE slug = 'yachties4yachties-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yama is a marketing and advertising business based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yama-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yaneka Khapaty is a business consulting service based in De Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yaneka-khapaty-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Rosslyn plant of Yanfeng Automotive Interiors is part of a global automotive supplier with more than 90 years in the industry, producing vehicle interiors, seating, safety systems, exterior modules and cockpit electronics.',
    description_enriched_at = datetime('now')
WHERE slug = 'yanfeng-automotive-interiors-rosslyn-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yanga Environmental Services, established in 2018 and 100% Black-owned, offers waste management, environmental management, civil works, geohydrology and occupational health and safety services from its Pretoria office, including approved asbestos contracting and a 24-hour emergency spill response line.',
    description_enriched_at = datetime('now')
WHERE slug = 'yanga-environmental-services-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yapcore Edge is a computer and IT services provider based in Amberfield Glen, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'yapcore-edge-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yasah and Bara Properties is a commercial property and office space business based in Clydesdale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yasah-and-bara-properties-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yatsar Centre is a furniture and homeware business based in Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yatsar-centre-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yebo Windows & Doors CC manufactures steel windows, doors and prison doors to custom specifications from its premises in The Willows, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yebo-windows-doors-cc-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yeet Marketing is a full-service digital marketing agency based in Lynnwood Glen offering influencer marketing, media buying, performance marketing across Meta, Google and TikTok, above-the-line placements and content production for South African brands.',
    description_enriched_at = datetime('now')
WHERE slug = 'yeet-marketing-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yellohost.co.za is a web hosting provider based in Erasmia offering shared hosting plans with a free website builder, SSD storage, free SSL certificates, free email and cPanel, aimed at individuals, small businesses and corporate clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://yellohost.co.za/", "https://yellohost.co.za/yellohost-home/"]'
WHERE slug = 'yellohost-co-za-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yellow Fat Biltong, in Magalieskruin Centre, sells biltong with customisable dryness and fat content along with dried sausage and a range of braai meat cuts.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.yellowfatbiltong.co.za/", "https://pretoria.co.za/listing/yellow-fat-biltong/"]'
WHERE slug = 'yellow-fat-biltong-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yellow Lemon Media, based in Highveld, Pretoria, is a visual communications agency with more than 10 years of experience offering video production, live streaming, photography, graphic design, brand development and social media management, including real estate photography packages.',
    description_enriched_at = datetime('now')
WHERE slug = 'yellow-lemon-media-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yellow Pocket (Pty) Ltd, based in Hazeldean, is a creative digital agency offering web design and development, graphic design and branding, video and animation production, and web hosting, with a portfolio of more than 130 websites.',
    description_enriched_at = datetime('now')
WHERE slug = 'yellow-pocket-pty-ltd-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yellow Professional Services SA, based in Irene Corporate Corner, is a Microsoft Dynamics 365 and Power Platform consultancy implementing and supporting business applications for clients across banking, insurance, manufacturing, retail, logistics and healthcare sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'yellow-professional-services-sa-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yes We Will is a building and construction business based in Les Marais, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yes-we-will-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yibaa Holdings is an industrial supplier and manufacturing business based in Amandasig, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yibaa-holdings-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yobuningi Trading (Pty) Ltd operates the YoConnect business networking and marketing platform from Centurion and is a Level 1 B-BBEE contributor.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/yobuningi"]'
WHERE slug = 'yobuningi-trading-pty-ltd-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yoli is a business consulting service based in Elardus Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'yoli-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yoliswa Ventures (Pty) Ltd, based in Lydiana, Pretoria, is the registered entity operating the Borderless Self platform, supporting its development, compliance, partnerships and commercial activities.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yoliswa.co.za/", "https://borderlessself.com/legal/"]'
WHERE slug = 'yoliswa-ventures-lydiana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'YouMatter is a logistics, courier and transport business based in Rooiwal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'youmatter-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'YoungByte, based in Theresapark, is a technology consultancy with more than 14 years in operation, offering systems modernisation consulting, a skills academy, software platforms for school management, savings groups and church administration, and digital presence services including web design and social media management.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://youngbyte.com/"]'
WHERE slug = 'youngbyte-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Your Maintenance Agent Pty Ltd, based in Doornpoort, offers handyman, construction and property maintenance services along with property management and real estate services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 09:30-16:00, Wed-Thu Closed, Fri-Sun 09:30-16:00',
    source_urls = '["scraped:google-places-no-website", "https://rsa.worldorgs.com/catalog/pretoria/handyman/your-maintenace-agent"]'
WHERE slug = 'your-maintenance-agent-pty-ltd-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Your childs future is a marketing and advertising business based in Moregloed, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'your-childs-future-moregloed' AND description_enriched_at IS NULL;

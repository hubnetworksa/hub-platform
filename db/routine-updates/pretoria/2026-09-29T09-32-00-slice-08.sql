-- Description enrichment sweep (job 4) -- slice 08
-- 23 researched, 27 reworded, 7 with hours found

UPDATE businesses
SET description = 'SMEC South Africa is the Pretoria office of a global engineering, project management and development consultancy with around 70 years of history, providing services across transport, water, energy and the built environment as part of the Surbana Jurong Group''s international network.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.smec.com/au/locations/pretoria/", "https://www.sayellow.com/view/south-africa/smec-sa-pretoria-in-pretoria", "https://www.smec.com/locations/pretoria/"]'
WHERE slug = 'smec-south-africa-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SMEC South Africa''s Pretoria office, on Albertus Street in La Montagne, is part of a global engineering, project management and development consultancy with around 70 years of history, delivering transport, water, energy and built-environment projects as part of the Surbana Jurong Group''s international network.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.smec.com/", "https://www.smec.com/locations/pretoria/"]'
WHERE slug = 'smec-south-africa-pretoria-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SMI Africa is an outdoor and sporting goods company based in Kilner Park, supplying equipment for outdoor and adventure activities.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.smiafrica.net.za/where-to-buy", "https://www.facebook.com/smi.africa.sa"]'
WHERE slug = 'smi-africa-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SMK Projects Pools & Renovations is a Pretoria-based construction and renovation contractor specialising in swimming pool construction and renovation, along with paving, tiling, plumbing, painting and plastering projects across Gauteng.',
    description_enriched_at = datetime('now')
WHERE slug = 'smk-projects-pools-renovations-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SMS Gateway is a Centurion-based digital marketing agency offering website campaigns, social media management, SEO and PPC advertising for local businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://finestcreative.co.za/", "https://pretoria.co.za/place/sms-gateway"]'
WHERE slug = 'sms-gateway-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SMTech is an industrial supplier based in Miracle Retail Park in Rooihuiskraal, serving businesses in the Centurion area.',
    description_enriched_at = datetime('now')
WHERE slug = 'smtech-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SMW Consultants is a Sinoville-based legal practice of attorneys and advocates specialising in debt-related matters, having handled thousands of cases for clients across South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-16:00, Fri 07:00-13:00'
WHERE slug = 'smw-consultants-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SN Innovations is a business consulting firm based in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sn-innovations-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SNA Civil and Structural Engineers has provided civil and structural consulting engineering services since 1955, specialising in roads engineering, bridges and other infrastructure, and operates a materials testing laboratory from its La Montagne head office.',
    description_enriched_at = datetime('now')
WHERE slug = 'sna-civil-and-structural-engineers-pty-ltd-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOAR Centre is a Raslouw-based consultancy that works with leaders and teams on well-being, encouragement and leadership development, drawing on more than three decades of experience across industries including mining, finance, healthcare and government.',
    description_enriched_at = datetime('now')
WHERE slug = 'soar-centre-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOAR Solutions is a Pretoria-based organisation that coordinates joint ventures and specialist partners on sustainable development programmes across Africa, spanning food security, water access, climate action and natural capital restoration.',
    description_enriched_at = datetime('now')
WHERE slug = 'soar-solutions-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sogeplast is a plastic packaging manufacturer operating from Sunderland Ridge, producing a wide range of bottle and container products and supplying clients across Africa, including Nigeria, the DRC, Zambia and Malawi.',
    description_enriched_at = datetime('now')
WHERE slug = 'sogeplast-pty-ltd-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Sun Master is a solar and renewable energy provider serving customers in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-sun-master-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOLZ SOLUTIONS is an accounting firm serving clients in The Orchards, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solz-solutions-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOM Survey Instruments is an engineering and surveying supplier based in Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'som-survey-instruments-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOQ Solutions (Pty) Ltd is a business consulting firm operating from Route 21 Corporate Park in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'soq-solutions-pty-ltd-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOQ Solutions (Pty) Ltd is a business consulting firm based in Wierdapark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'soq-solutions-pty-ltd-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOS Advertising SA is a Pretoria-based advertising and promotions company with more than 15 years in the industry, offering website development, marketing campaigns, audio/video production and lead generation, with agents also covering Johannesburg, Durban, Cape Town and the Vaal Triangle.',
    description_enriched_at = datetime('now')
WHERE slug = 'sos-advertising-sa-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SOSPromo is a marketing and advertising business based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sospromo-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South Pole Civil Engineers is a civil engineering consultancy operating from Zwartkop, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'south-pole-civil-engineers-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southern African Development Initiative 4 U is a software development business based in Rietfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'southern-african-development-initiative-4-u-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spaceweb Technologies, founded in 2014, is a Pretoria consultancy that streamlines business operations, provides business analysis, and builds POPIA-compliant websites for SMEs and eCommerce businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'spaceweb-technologies-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Barclay Square is a supermarket trading inside Barclay Square Shopping Centre in Sunnyside, Pretoria, open seven days a week except Christmas Day, New Year''s Day and Boxing Day.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-21:00'
WHERE slug = 'spar-barclay-square-barclay-square' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Celtis Ridge is a supermarket serving the Heuwelsig Estate area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-celtis-ridge-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Clubview is a supermarket trading inside the Corner Centre in Clubview, Centurion, open daily except Christmas Day.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-20:00'
WHERE slug = 'spar-clubview-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Doornpoort is a supermarket trading from the Village Square shopping centre in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-doornpoort-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR East Lynne is a supermarket serving the East Lynne area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-east-lynne-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR East Lynne is a supermarket based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-east-lynne-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Highveld Shopping Centre is a supermarket trading inside the Highveld Shopping Centre in Highveld, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-highveld-shopping-centre-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Leeuwfontein is a supermarket based in Leeuwfontein, near Roodeplaat, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-leeuwfontein-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Les Marais is a supermarket serving the Les Marais area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-les-marais-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Midstream Ridge is a supermarket trading from a shopping centre on Ridgeway Avenue in Midstream Ridge, Olifantsfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-midstream-ridge-midstream-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Orchards is a supermarket trading from the Orchards Shopping Centre on Garden Road in The Orchards, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-orchards-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Roodeplaat is a supermarket on Moloto Road serving the Roodeplaat and Kameeldrift area of Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-roodeplaat-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Rosslyn is a supermarket on Piet Rautenbach Street in Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-rosslyn-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Valhalla is a supermarket on Shirley Road in Valhalla, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-valhalla-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Woodhill is a supermarket trading inside the Woodhill Park Centre in Garsfontein, Pretoria, open daily from 07:00 to 20:00.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-20:00'
WHERE slug = 'spar-woodhill-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spektra Financial Services is an authorised financial services provider in Magalieskruin offering investment planning, retirement planning, offshore investments, medical aid advice, and individual and group risk cover.',
    description_enriched_at = datetime('now')
WHERE slug = 'spektra-financial-services-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPEKTRUM LOGISTICS is a business consulting service based in Rooiwal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spektrum-logistics-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPM (Pty) Ltd is a Magalieskruin-based property management company handling sectional title schemes and homeowners associations across Gauteng, managing around 3,500 sectional title units and 500 full title properties.',
    description_enriched_at = datetime('now')
WHERE slug = 'spm-pty-ltd-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPM Solutions Construction is a construction company based in Pretoria North, trading Monday to Friday.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'spm-solutions-construction-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPROUT is an enterprise development company in Irene offering business coaching and access-to-finance support, including loans, grants and equity investment options, with a focus on the manufacturing and export sectors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'sprout-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPSI Information Technologies is a software development business based in Die Hoewes, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spsi-information-technologies-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SR Solutions is a female-owned, BEE-accredited company founded in 2010, providing waste management, industrial cleaning, pest control and fumigation services, along with accredited training, to private and public sector clients from Erasmuskloof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sun Closed'
WHERE slug = 'sr-solutions-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SR71 Consult is a business consulting firm based in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sr71-consult-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SSC Group is a diversified company established in 2005, operating across mining, mining rehabilitation and exploration, drilling, advisory and human capital services, renewable energy, SMME development and digital agency work, and holds B-BBEE Level 1 status as a majority black-women owned enterprise.',
    description_enriched_at = datetime('now')
WHERE slug = 'ssc-group-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SSG Consulting is a management consulting firm specialising in organisational performance improvement, working to optimise client performance through the transformation of people.',
    description_enriched_at = datetime('now')
WHERE slug = 'ssg-consulting-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SSS Steel Structures & Construction is a family-owned Pretoria North business that fabricates and erects steel structures, including churches, warehouses, worksheds, workshops, factories and aircraft or helicopter hangars, built to South African building regulations.',
    description_enriched_at = datetime('now')
WHERE slug = 'sss-steel-structures-construction-pty-ltd-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SST (Pty) Ltd is an industrial supplier based in Adcock Village, Gezina, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sst-pty-ltd-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SSolutionSS is a business consulting service based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ssolutionss-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

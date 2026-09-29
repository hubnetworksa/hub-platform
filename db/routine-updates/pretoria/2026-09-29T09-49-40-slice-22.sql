-- Slice 22 description enrichment (job 4)
-- 31 researched, 19 reworded, 10 with hours found

UPDATE businesses
SET description = 'Super Business - Social Media Marketing is a social media marketing agency in Amandasig offering brand strategy, short-form video and content production, paid social advertising across platforms like Meta, TikTok, LinkedIn and YouTube, and ongoing community management for clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'super-business-social-media-marketing-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Super Rafts is a Pretoria-based construction firm, established in 2003, that specialises in raft foundation design and construction, including layout plans, reinforcement detailing, NHBRC documentation, council approvals and engineer inspections, and has built more than a million square metres of raft foundations across Gauteng and the Western Cape.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00'
WHERE slug = 'super-rafts-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Super Snacks is a Centurion-based manufacturer of puffed corn snack products, established in 1998 and now operating four production plants across South Africa, known for its range of proprietary flavoured maize snacks.',
    description_enriched_at = datetime('now')
WHERE slug = 'super-snacks-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Super-lite Paraffin Distributors is a fuel and lubricant supplier in Pretoria West offering diesel, paraffin and gas cylinder refill and swap services, along with engine oils and lubricants from brands such as Castrol, Engen and Petronas.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://superlitedist.com/", "https://www.sayellow.com/view/south-africa/super-lite-paraffin-distributors-in-pretoria"]'
WHERE slug = 'super-lite-paraffin-distributors-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperLife is an industrial supplies and manufacturing business in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'superlife-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperPump Pretoria is a water pump supplier and installer in Gezina, Pretoria, offering borehole, sewage, submersible, solar and diesel pumps along with irrigation equipment and turnkey water management solutions for residential, agricultural, commercial and industrial clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'superpump-pretoria-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperSpar is a supermarket at Kenny Shopping Centre in Bronkhorstspruit, offering a bakery, butchery, fresh produce and an in-store ATM.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-19:00',
    source_urls = '["https://www.africanadvice.com/1059724/Supermarkets_And_Grocery_Stores/Gauteng/Bronkhorstspruit_Spar/", "https://www.kimbino.co.za/stores/bronkhorstspruit-superspar-kenny-shopping-centre-lanham-street-29/", "https://my-catalogue.co.za/stores/bronkhorstspruit/spar/kenny-shopping-centre-29-lanham-street"]'
WHERE slug = 'superspar-bronkhorstspruit' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperSpar Jubilee is a supermarket at Jubilee Mall in Hammanskraal, featuring a bakery, butchery and fresh produce department.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-19:00, Sun 07:00-16:00'
WHERE slug = 'superspar-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperSpar Moreleta is a supermarket in Moreleta Square, Moreleta Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-19:30, Sun 09:00-19:00',
    source_urls = '["https://za.africabz.com/gauteng/superspar-48579", "https://www.spar.co.za/Home/Store-View/SUPERSPAR-Moreleta-Gauteng", "https://www.cylex.net.za/company/superspar-moreleta-23695230.html"]'
WHERE slug = 'superspar-moreleta-moreleta-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperSpar Renbro is a supermarket at Renbro Shopping Centre in Hammanskraal.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-19:00, Sun 07:00-16:00',
    source_urls = '["https://www.callupcontact.com/b/Supermarkets/Spar_Renbro/40579", "https://www.brabys.com/za/gauteng/hammanskraal/supermarkets/renbro-superspar", "https://my-catalogue.co.za/stores/hammanskraal/spar/12-renbro-shopping-centre-old-warmbaths-road"]'
WHERE slug = 'superspar-renbro-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperSpar Ryneveld is a supermarket at Ryneveld Corner in Pierre van Ryneveld Park, Centurion, offering curbside pickup alongside in-store shopping.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-19:00, Sun 07:00-18:30',
    source_urls = '["https://www.thinklocal.co.za/biz/superspar-ryneveld-pretoria", "https://www.facebook.com/ryneveld.superspar/", "https://za.africabz.com/gauteng/spar-16426", "https://all-opening-hours.co.za/01250262/Superspar_Ryneveld"]'
WHERE slug = 'superspar-ryneveld-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superdecks is an outdoor timber and composite construction specialist in East Lynne, Pretoria, building sun decks, pool and jacuzzi decks, wall cladding and pergolas, with a project portfolio dating back to 2004.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://superdecks.co.za/", "http://www.superdecks.net/"]'
WHERE slug = 'superdecks-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superior Shades is a shade structure manufacturer and installer in Kameeldrift East, Pretoria, with over 18 years'' experience building shade net carports, cantilever shadeports and tension sails for residential, commercial and industrial clients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:30'
WHERE slug = 'superior-shades-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superious Logistics is a commercial property and office space provider based in Koedoespoort Industrial, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'superious-logistics-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superlife South Africa Forerunners is a business consulting firm in Die Hoewes, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'superlife-south-africa-forerunners-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supertec Ceilings and Drywall (Centurion) is the Rooihuiskraal branch of a national ceiling and drywall partitioning manufacturer and distributor, supplying ceiling systems, gypsum drywall partitions and acoustic ceiling solutions, and serving as an exclusive Rockfon distributor with brands including Gyproc and Knauf.',
    description_enriched_at = datetime('now')
WHERE slug = 'supertec-ceilings-drywall-centurion-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superway Construction (Pty) Ltd is a road, civil and building construction company based in Willow Glen, Pretoria, established in 1988 and registered with the CIDB and SAFCEC.',
    description_enriched_at = datetime('now')
WHERE slug = 'superway-construction-pty-ltd-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supply Chain Partner - South Africa is a procurement consultancy in Southdowns, Centurion, specialising in Coupa implementations, spend management and cloud ERP integration, and change management and post-implementation training for organisations adopting procurement systems.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.supplychainpartner.com/", "https://www.scp-worldwide.com/"]'
WHERE slug = 'supply-chain-partner-south-africa-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supply SA Trading is a PPE, workwear, corporate clothing and safety equipment supplier in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'supply-sa-trading-ppe-workwear-corporate-clothing-safety-shoes-gloves-south-afri-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Suppsco Skin and Hair is an online retailer in Zwavelpoort, Pretoria, selling medical-grade skincare, haircare and supplement products from over 30 brands including Bioderma, Obagi and La Roche-Posay, with nationwide delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'suppsco-skin-hair-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SupraTech is a building and construction business in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'supratech-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supreme Boss Detailing - Paint Correction and Ceramic Coatings is an automotive repair and detailing business in Pierre van Ryneveld Park, Pretoria, specialising in paint correction and ceramic coatings.',
    description_enriched_at = datetime('now')
WHERE slug = 'supreme-boss-detailing-paint-correction-ceramic-coatings-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supreme Business Solutions (Pty) Ltd is a computer and IT services business in Amberfield Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'supreme-business-solutions-pty-ltd-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supreme Hygiene is a hygiene equipment and cleaning supplies distributor in Hennopspark, Centurion, offering rental, sales and maintenance of hygiene dispensers, cleaning chemicals and pest control solutions for businesses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-15:00, Sat-Sun Closed'
WHERE slug = 'supreme-hygiene-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supreme worx is a mechanical and electrical engineering design company in Booysens, Pretoria, offering component engineering and product design services including its own Supreme Pontoon and Supreme Tower product lines.',
    description_enriched_at = datetime('now')
WHERE slug = 'supreme-worx-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sure Guard Security Services CC is a Laudium-based security company founded in 1985, offering guarding, armed response and monitoring services including construction, event, mobile patrol and school security, backed by a 24-hour control room.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "http://sureguardcc.co.za/aboutus.html"]'
WHERE slug = 'sure-guard-security-services-cc-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SureSystems is a Meyerspark-based payment technology company offering SUREdebit, a Debicheck and debit order collection platform, along with wireless POS terminals and cashless payout solutions; it is a PASA-registered system operator and PCI DSS compliant.',
    description_enriched_at = datetime('now')
WHERE slug = 'suresystems-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Surefix Electronics PTY LTD is a solar and renewable energy business in Zwavelpoort, Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'surefix-electronics-pty-ltd-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Surplus Warehouse Pty Ltd is a Donkerhoek-based supplier of refurbished vehicles, components and parts, especially ex-military equipment such as Unimog vehicles and SAMIL trucks, established in the late 1980s.',
    description_enriched_at = datetime('now')
WHERE slug = 'surplus-warehouse-pty-ltd-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Surya Energy Technologies-Solar and Backup Systems is a solar and renewable energy business in Amandasig, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'surya-energy-technologies-solar-and-backup-systems-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sustainable Solutions For Africa Group is a business consulting firm in Willow Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sustainable-solutions-for-africa-group-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sutherland Printing Co. is a Pretoria printing company in Boardwalk Manor offering digital and large-format printing, corporate printing, vehicle and window graphics, wall and floor decor, and product labelling and packaging.',
    description_enriched_at = datetime('now')
WHERE slug = 'sutherland-printing-co-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Suz Food Brands is a Kirkney-based wholesale food distributor producing locally-made snack and chip brands, including Snack Haven, Maties, Crispy Cuts, Junior Snacker, Corn Snacker and Crack a Snack, sold through stockists nationwide.',
    description_enriched_at = datetime('now')
WHERE slug = 'suz-food-brands-kirkney' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SvwDesign is a software development business in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'svwdesign-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swanepoel and Partners is an accounting, taxation and review firm in Buffelsdrift, Pretoria, established in 2006 and holding Level 4 BBBEE certification.',
    description_enriched_at = datetime('now')
WHERE slug = 'swanepoel-and-partners-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swartboer Business Enterprises CC is a Silverton-based shuttle, logistics and construction company with over 10 years'' experience, offering courier services, car and mining vehicle fleet rentals, e-hailing and construction project services across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'swartboer-business-enterprises-cc-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swayzon is a software development business in Centurion Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'swayzon-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sweet Celebrations is a Willow Glen-based cake decorating and baking supplies retailer selling fondant, cake premix, gum paste, gel food colouring and cupcake wrappers, with all products certified Halaal by SANHA.',
    description_enriched_at = datetime('now')
WHERE slug = 'sweet-celebrations-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swiegers Inc. is a Meyerspark law firm offering family law, labour law, civil and criminal litigation, contract drafting, property and conveyancing, and notarial services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'swiegers-inc-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swift Geospatial is an engineering and surveying business based at the CSIR in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'swift-geospatial-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swift Prosperity Program is a marketing and advertising business in Amandasig, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'swift-prosperity-program-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swift Solar Instal is a solar and renewable energy business in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'swift-solar-instal-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SwiftshopperZA is an online computer and IT services business serving Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'swiftshopperza-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swordfish Software is a Waterkloof Glen-based debt collection and recovery software company, whose Swordfish platform and Smartfish, Goldfish, Linkfish and Filefish tools serve banks, law firms and collection agencies including FNB, Nedbank and ABSA.',
    description_enriched_at = datetime('now')
WHERE slug = 'swordfish-software-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Syd''s Suspension Parts is a motor spares business in Marabastad, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'syd-s-suspension-parts-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SydSen Automotive Institute is part of the SydSen group, a multidisciplinary consultancy based in Centurion offering training, leadership development, digital, recruitment, consulting and assessment services.',
    description_enriched_at = datetime('now')
WHERE slug = 'sydsen-automotive-institute-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SydSen Group is an Irene, Centurion-based multidisciplinary consultancy operating for over 25 years across divisions spanning training, digital, recruitment, consulting and assessment services, with more than 50 partnered brands.',
    description_enriched_at = datetime('now')
WHERE slug = 'sydsen-group-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sylvax Management Services is a business consulting firm in Ashley Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sylvax-management-services-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SynCo. is a marketing and advertising business in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'synco-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SyncTech Solutions is an Erasmuskloof-based IT support provider offering managed IT support, Microsoft 365 and cloud services, security and backup, hosting and domains, website design and remote assistance for small and medium businesses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'synctech-solutions-erasmuskloof' AND description_enriched_at IS NULL;

-- Slice 04: description enrichment sweep (job 4)
-- Researched: 25, Reworded: 25, Hours found: 9

UPDATE businesses
SET description = 'Rocky Ridge Events is an events and function venue in Kameeldrift, Pretoria, offering four bushveld garden venues near Roodeplaat Dam for weddings, birthdays, corporate functions and other celebrations, with self-catering or fully catered packages, decor and a kids'' play area.',
    description_enriched_at = datetime('now'),
    hours = 'By appointment 7 days a week (phone/WhatsApp 08:00-17:00)'
WHERE slug = 'rocky-ridge-events-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RocoMamas Menlyn is a casual burger restaurant in Menlyn Park Shopping Centre, Pretoria, known for its Smashburgers, Mofo Hot Chicken Wings and Rockin Ribs, with outdoor seating and wheelchair-accessible facilities.',
    description_enriched_at = datetime('now')
WHERE slug = 'rocomamas-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RocoMamas Hazeldean Square is a casual dining restaurant in Hazeldean Square, Pretoria, specialising in smash burgers, Sweet Fire Ribs, Mofo Hot Chicken Wings and waffles, with dine-in, takeout and delivery options.',
    description_enriched_at = datetime('now')
WHERE slug = 'rocomamas-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RocoMamas Irene Village is a burger restaurant set in the open piazza of Irene Village Mall, Centurion, offering Smashburgers, Mofo Hot Chicken Wings, Rockin Ribs and a create-your-own-burger option.',
    description_enriched_at = datetime('now')
WHERE slug = 'rocomamas-irene-village-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rodtek Engineering is a CNC machining and manufacturing company based in Rayton near Donkerhoek, Pretoria, specialising in the manufacture of drilling and mining equipment since 2007, with exports across Southern Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://rodtekengineering.co.za/"]'
WHERE slug = 'rodtek-engineering-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roelf''s Auto Electrical is a vehicle auto-electrician in Rietfontein, Pretoria, specialising in diagnosing and repairing vehicle electrical faults - ignitions, fuel injection, engine management, batteries and charging systems - using computerised diagnostic scanners including G-Scan tools.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["scraped:google-places-no-website", "https://www.autorepairdirectory.co.za/listing.php?listings_id=2055"]'
WHERE slug = 'roelf-s-auto-electrical-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rolec Electrical & Generators Contractors CC is an electrical contracting and generator company in Derdepoort, Pretoria, supplying, installing and renting generators from 15 to 2500KVA alongside industrial electrical work, hazardous-area installations, and solar and UPS system installation, operating since 2009.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30'
WHERE slug = 'rolec-electrical-generators-contractors-cc-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rolfes Agri Distribution Warehouse is the Waltloo, Pretoria distribution site for Rolfes Agri, a manufacturer of crop protection, soil and plant health, and adjuvant products for agriculture, supplying through authorised distributors with in-house research and development and ISO 9001, 14001 and 45001 certification.',
    description_enriched_at = datetime('now')
WHERE slug = 'rolfes-agri-distribution-warehouse-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rollco (Pty) Ltd is a paper products manufacturer in Sunderland Ridge, Centurion, producing thermal till rolls, POS and ATM rolls, labels and other point-of-sale and banking paper products, with custom printing to client specifications.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00'
WHERE slug = 'rollco-pty-ltd-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Romalepe Chartered Accountants Inc is a 100% black-owned, Level 1 BBBEE accounting and audit firm in Heatherdale, Pretoria, offering bookkeeping, financial statement audits, tax services, governance and compliance advisory, and public-sector consulting and training.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00'
WHERE slug = 'romalepe-chartered-accountants-inc-heatherdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza is a pizza and pasta takeaway restaurant on Hamilton Street in Arcadia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'roman-s-pizza-pretoria-central-2' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza is a pizza and pasta takeaway restaurant on Pretorius Street in Pretoria Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'roman-s-pizza-pretoria-central-3' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza is a pizza and pasta takeaway restaurant in Willows Crossing Shopping Centre, The Willows, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'romans-pizza-willows-crossing-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza Atteridgeville is a pizza and pasta takeaway restaurant in Atlyn Shopping Centre, Atteridgeville, offering a full menu of meat, vegetarian and BBQ chicken pizzas, its signature Triple-Decker pizza, pastas and sides, with dine-in, takeaway and delivery via Uber Eats and Mr D Food.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 09:30-21:00, Fri-Sat 09:30-22:00'
WHERE slug = 'romans-pizza-atteridgeville-atteridgeville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rondomark is a commercial property and office space business based in Waterkloofrand Centre, Buffelsdrift, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rondomark-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roodeplaat Abattoir (Beef) is a beef abattoir on the R573 Moloto Road in Roodeplaat, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'roodeplaat-abattoir-roodeplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roodeplaat Dierekliniek is a veterinary clinic on Kameelfontein Road in Leeuwfontein, Roodeplaat, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'roodeplaat-dierekliniek-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roof Repair Pretoria is a roof repair business based in Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'roof-repair-pretoria-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roofsheeting Warehouse is a steel roofing supplier in Akasia, Pretoria, stocking galvanised, Chromadek, IBR, corrugated and polycarbonate roof sheeting along with custom-cut gutters, flashings and downpipes, trading since 2002 with its own in-house rollforming mills.',
    description_enriched_at = datetime('now')
WHERE slug = 'roofsheeting-warehouse-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roogobs is a business consulting firm based at Olive Marie Complex in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'roogobs-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rooted Pedestals Solutions is a multidisciplinary professional consulting firm in Doornpoort, Pretoria, offering business consulting, legal document consulting, corporate governance guidance and leadership development to individuals, businesses, government institutions and nonprofits across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'rooted-pedestals-solutions-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roots Butchery is a butchery in Olievenhout Plaza, Olievenhoutbosch, Centurion, offering a range of meat selections and regular specials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-19:00, Sun 08:00-17:00'
WHERE slug = 'roots-butchery-olievenhout-plaza-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rope Access Africa is a building and construction business based in Monument Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rope-access-africa-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rorisang Cakes And Events is a bakery and events business in Lotus Gardens Plaza, Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rorisang-cakes-and-events-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosco Coach Builders is a vehicle conversion manufacturer in Koedoespoort, Pretoria, established in 2018, building box body and ICU/ILS ambulance conversions and response vehicles for law enforcement, medical, fire and private-sector clients, with local assembly and engineering.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosco-coach-builders-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosebank College Pretoria Campus is a tertiary education campus on Pretorius Street, Pretoria Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosebank-college-pretoria-campus-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roselyn Projects And Services is a recruitment and HR services business in Theresapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'roselyn-projects-and-services-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosema Bricks Head Office is the Monument Park, Pretoria sales office of a clay face-brick manufacturer trading since 1942, producing Terracotta, Buff, Redwood and specialty finishes such as Nala, Protea and Village Antique, with delivery to building sites.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosema-bricks-head-office-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roseville Cafe and Take Away is a cafe and takeaway food outlet on Smook Avenue, Roseville, Pretoria, open daily.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:00-22:00'
WHERE slug = 'roseville-cafe-and-take-away-roseville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ross Graphics is a marketing and graphic design business in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ross-graphics-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rossfurn is a wholesale manufacturer of engineered-wood furniture in Klerksoord, Pretoria, producing bedroom suites, storage units, living-room and kitchen furniture for registered furniture retailers, designers and hospitality trade accounts.',
    description_enriched_at = datetime('now')
WHERE slug = 'rossfurn-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosslyn Enclosures CC is an industrial manufacturer of enclosures based in Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosslyn-enclosures-cc-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosslyn Ice is an ice manufacturer in Rosslyn, Akasia, trading since 1986 and producing around 70 tons of ice a day - including Tube Cubes, Gourmet Cubes and bagged ice - for retail stores, restaurants and events, with delivery seven days a week.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosslyn-ice-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosslyn Improvement Districts (RID) is an area-improvement organisation for the Rosslyn industrial zone, coordinating grass-cutting and road cleaning, 24-hour CCTV surveillance and security response, infrastructure maintenance, and business networking events for the area''s members.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosslyn-improvement-districts-rid-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosslyn Signs & Promotions is a signage and promotional products business in Karenpark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosslyn-signs-promotions-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosslyn Tannery is a leather tanning and manufacturing business in Rosslyn, Akasia, producing wet-blue grain and full-substance hides, drop splits and chrome-free hides to LWG standards for domestic and international markets.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosslyn-tannery-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosslyn Wholesalers is a hardware store at Nedbank Centre, Piet Rautenbach Street, Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rosslyn-wholesalers-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rostec Technical FET College''s Pretoria campus, on Pretorius Street, offers engineering, business, health sciences and National Certificate (Vocational) programmes as part of the wider Rostec college group.',
    description_enriched_at = datetime('now')
WHERE slug = 'rostec-technical-fet-college-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Route 20 One Pack & Pantry is a wholesale food-packaging distributor in Salieshoek, Silverton, Pretoria, supplying biodegradable and eco-friendly packaging, plastic and paper bags, cleaning products, sanitisers and PPE to corporate and small-business customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00 (collections 10:00-13:00 & 14:00-16:00)'
WHERE slug = 'route-20-one-pack-pantry-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Routemed is a pharmacy based in Woodhill Golf Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'routemed-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RouterTech is a precision manufacturing and engineering business in Clubview, Centurion, with over 35 years'' experience offering CAD design, CNC machining, laser cutting and engraving across metal, wood, acrylic and other materials, including aviation-spec manufacturing.',
    description_enriched_at = datetime('now')
WHERE slug = 'routertech-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roux Property Development Africa Cc is a commercial property development business based in Irene Security Estate, Irene Farm Villages, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'roux-property-development-africa-cc-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Designs is a software development business based in Florauna, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'royal-designs-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Development is a building and construction business based in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'royal-development-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Empire is a marketing and advertising business based in Kilner Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'royal-empire-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Greenhouse Tunnels is a greenhouse-tunnel construction business based in Dorandia, Pretoria, also serving Polokwane, the North West and Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'royal-greenhouse-tunnels-polokwane-pretoria-north-west-cape-town-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal King is a computer and IT services business based in Woodhill Golf Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'royal-king-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Kings Forex is a financial and forex investment services business based on Swallow Street, Ninapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'royal-kings-forex-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royaltyonline is an online shopping mall based in Erasmia, Pretoria, selling personal care and beauty products, home and kitchen items, office stationery, and sporting and outdoor gear including the Sniper Africa range, with home delivery, PUDO box delivery and in-store collection by appointment.',
    description_enriched_at = datetime('now')
WHERE slug = 'royaltyonline-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rozariavon Business Solutions (Pty) Ltd is a computer and IT services business based in Boardwalk Manor, Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rozariavon-business-solutions-pty-ltd-boardwalk-manor' AND description_enriched_at IS NULL;

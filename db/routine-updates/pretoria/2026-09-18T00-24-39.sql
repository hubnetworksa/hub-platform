-- PretoriaHub job 4: description enrichment sweep
-- Batch of 100 businesses, description_enriched_at IS NULL guard

UPDATE businesses
SET description = 'The National Energy Regulator of South Africa (NERSA) is the national authority regulating South Africa''s electricity, piped-gas and petroleum pipelines industries, established under the National Energy Regulator Act 40 of 2004.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nersa.org.za/", "https://en.wikipedia.org/wiki/National_Energy_Regulator_of_South_Africa", "https://www.nersa.org.za/", "https://nationalgovernment.co.za/units/view/131/national-energy-regulator-of-south-africa-nersa"]'
WHERE slug = 'national-energy-regulator-of-south-africa-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'National Entertainment Hub (NEH TV) is an online TV and live-streaming entertainment company based in Pretoria West, sharing entertainment content through platforms such as Facebook and YouTube.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/p/NEH-TV-100076155948269/", "https://www.youtube.com/watch?v=rLOEivLTHN8"]'
WHERE slug = 'national-entertainment-hub-neh-tv-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'National Medical Supplies is a medical equipment supplier founded in 2002, specialising in vision healthcare, women''s healthcare, and sterilisation and infection control products, including ophthalmic surgical instruments, for South Africa''s healthcare sector.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30',
    source_urls = '["https://nationalmedical.co.za/", "https://www.omnia-health.com/exhibitor/national-medical-supplies", "https://www.brabys.com/za/gauteng/pretoria/proclamation-hill/medical-supplies/national-medical-supplies", "https://www.thinklocal.co.za/biz/national-medical-supplies-pretoria"]'
WHERE slug = 'national-medical-supplies-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'National Tools & Safety is a workshop supplies retailer stocking tools, safety equipment, abrasives, drill bits, power tool accessories and pneumatics for trade and DIY customers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.nationaltools.co.za/"]'
WHERE slug = 'national-tools-safety-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'National Chicks is South Africa''s largest fully integrated supplier of day-old chicks to independent broiler growers, controlling production from grandparent stock through to parent flocks, with delivery across the region.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.natchix.co.za/", "https://www.nationalchicks.com/contact/", "http://www.natchix.co.za/contact.html"]'
WHERE slug = 'national-chicks-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A general retail business serving Kloofsig, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nativa-pty-ltd-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development company based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'native-core-solutions-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An estate agency serving Lynnwood Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'naviscan-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nceda Business Technologies is an ICT services company established in 2009, offering integrated electronic security (CCTV and access control), mobile fleet management, push-to-talk radio solutions, and website and mobile app development from its Lynnwood Glen offices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nceda-tech.co.za/", "https://www.ccbc.co.za/business-directory-2/i-t/nceda", "https://www.facebook.com/NCEDATECH/"]'
WHERE slug = 'nceda-business-technologies-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ncube-Madisha Attorneys & Notaries is a boutique, black female-owned law firm in Amandasig, Akasia, practising administrative, corporate, commercial, family, employment and dispute resolution law.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ncubemadishaattorneys.co.za/", "https://www.ncubemadishaattorneys.co.za/about-us/", "https://www.procompare.co.za/providers/ncube-madisha-attorneys"]'
WHERE slug = 'ncube-madisha-attorneys-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An events and function venue business based in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ndabaningi-holdings-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ndabase Printing Solutions is a 100% black-owned, Level 1 B-BBEE printing company established in 2007, offering litho, digital and wide-format printing along with finishing services such as lamination, UV varnishing, die cutting, folding and embossing from its Kosmosdal Samrand Business Park facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://ndabaseprinting.co.za/", "https://za.linkedin.com/company/ndabaseprintingsolutions"]'
WHERE slug = 'ndabase-printing-solutions-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ndalamo Resources is a 100% black-owned mid-tier coal producer formed in 2013, holding interests in the New Clysdale Colliery, North Block Complex and Ubuntu Colliery coal assets.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ndalamoresources.co.za/", "https://www.ndalamo.com/", "https://za.linkedin.com/company/ndalamo-resources-pty-ltd"]'
WHERE slug = 'ndalamo-resources-pty-ltd-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ndlovu Lodge is a Bushveld-style guesthouse in Zwavelpoort with luxury suites, premium and family rooms, a swimming pool and gardens, plus an on-site restaurant and bar serving South African cuisine near Rietvlei Nature Reserve.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ndlovulodge.com/contact-us.html", "https://pretoria.co.za/place/ndlovu-lodge", "https://www.booking.com/hotel/za/ndlovu-lodge-pretoria1.html", "https://www.tripadvisor.co.za/Hotel_Review-g312583-d4603587-Reviews-Ndlovu_Lodge-Pretoria_Gauteng.html"]'
WHERE slug = 'ndlovu-lodge-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An IT consulting and software development company serving Midfields Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ndou-it-consulting-services-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A logistics, courier and transport business based in Amberfield Glen, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ndzaba-investment-holdings-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business and management consulting firm serving Rooihuiskraal North, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nectar-consulting-services-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nefuri Attorneys Inc is a wholly black-owned law firm established in 2012, assisting clients in Florauna, Pretoria North with divorce, human rights and labour matters, personal injury claims, and Road Accident Fund claims.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://nefuri-attorneys.co.za/", "https://nefuri-attorneys.co.za/contact/", "https://lawzana.com/lawyer/nefuri-attorneys/pretoria"]'
WHERE slug = 'nefuri-attorneys-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction company based in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'neham-group-pvt-ltd-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An accommodation provider in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'neighbors-business-enterprise-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An engineering and surveying services firm operating from the Hermanstad industrial area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'neil-and-ethan-holdings-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A SAIPA-registered accounting firm and accredited training centre in Pretoria East, offering monthly accounting, tax, payroll, statutory and advisory services for small businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://nelinc.co.za/", "https://nelinc.net/"]'
WHERE slug = 'nel-accountants-inc-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A boutique law firm in Pretoria East specializing in property law, Road Accident Fund and personal injury claims, medical negligence claims, and commercial litigation.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nvsinc.co.za/", "https://nvsinc.co.za/"]'
WHERE slug = 'nel-van-der-merwe-smalman-inc-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A solar and renewable energy solutions provider serving Sinoville and the surrounding Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'nel-sun-solutions-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction company in Hermanstad offering house extensions, kitchen and bathroom renovations, and general building contracting services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/neldon-construction-1"]'
WHERE slug = 'neldon-construction-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A custom framing studio in Rietfontein that also offers laser cutting, engraving and marking of wood, perspex and leather, along with sublimation and 3D printing services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nellwoodframes.co.za/", "https://nellwoodframes.co.za/"]'
WHERE slug = 'nellwood-frames-and-laser-cutting-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A logistics, courier and transport company operating from Andeon in Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nem-logistics-depot-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A logistics, courier and transport company operating from Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nemaorani-logistics-pty-ltd-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A solar and renewable energy solutions provider based in De Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'neo-green-energy-solutions-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A property management company in Ashley Gardens specializing in sectional title and body corporate administration, compliance guidance and insurance assistance, with over 20 years of experience in the Pretoria market.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/6554564500", "https://www.neotrend.co.za/"]'
WHERE slug = 'neo-trend-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A financial and investment services provider operating from Compensation House in Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'neoking-group-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A computer and IT services provider based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'neon-networks-pty-ltd-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A computer and IT services provider based in Sinoville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'neoteric-pty-ltd-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An IT support provider offering onsite computer services for business and residential clients in Menlo Park, including proactive maintenance through a flat-rate support plan.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nerdsonsite.co.za/", "https://www.yep.co.za/biz/store/nerds-on-site-computer-services-south-africa/696672"]'
WHERE slug = 'nerds-on-site-computer-services-south-africa-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An industrial supplies and manufacturing business based in the Sable Hills Waterfront Estate area near Roodeplaat, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nest-box-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A real estate agency in Rietvalleirand offering residential sales, rentals and property search services across Pretoria East.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://nestseekers.co.za/", "https://www.nestseekers.co.za/"]'
WHERE slug = 'nest-seekers-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business and management consulting firm operating from Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'nestup-group-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A manufacturer and supplier of dynamic brake testing equipment for the mining and industrial safety sector, based in Kleinfontein, Donkerhoek, with more than 200 units sold across Southern Africa since 2017.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.netbrake.co.za/", "https://netbrake.co.za/"]'
WHERE slug = 'netbrake-dynamic-brake-testing-equipment-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A 162-bed private hospital in Karen Park, Akasia, offering a 24-hour emergency department with an accredited Level 3 trauma centre, ambulance services, and a radiology unit with MRI and CT scanning, in operation since 1993.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.netcare.co.za/netcare-facilities/netcare-akasia-hospital", "https://south-africa.a-hospital.com/hospital/netcare-akasia-hospital.html"]'
WHERE slug = 'netcare-akasia-hospital-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Netcare Medicross healthcare centre in Silverton offering private primary medical, dental and complementary health services with wheelchair-accessible facilities.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medicross.co.za/Medical-centres/Medicross-Silverton", "https://www.netcare.co.za/netcare-facilities/medicross-silverton"]'
WHERE slug = 'netcare-medicross-silverton-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Netcliq is a computer and IT services provider based in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'netcliq-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Netronome Systems (Pty) Ltd is an industrial supplier and manufacturing business based in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'netronome-systems-pty-ltd-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Netshield South Africa is a Pretoria technology company, established in 1994, that designs IoT and cloud-based monitoring solutions, including intelligent gateways and environmental management systems, for sectors such as IT, finance, medical, mining and automation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://netshieldsa.com/", "https://www.netshieldsa.com/", "https://www.netshieldsa.com/contact.html"]'
WHERE slug = 'netshield-south-africa-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Netshield South Africa, established in 1994, is a Pretoria-based developer and manufacturer of IoT remote monitoring and control devices and fibre connectivity products, with security and access control among its focus areas alongside power backup and communications solutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.netshieldsa.com/contact.html", "https://www.thinklocal.co.za/biz/netshield-pretoria", "https://companies.mybroadband.co.za/netshield/contacts/", "https://www.netshieldsa.com/", "https://netshieldsa.com/contact-us/"]'
WHERE slug = 'netshield-south-africa-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Network Alliance (Pty) Ltd is a managed IT and cloud services provider based in Zwartkop, Centurion, offering network design, implementation and day-to-day infrastructure management alongside managed security services such as advanced content filtering, antivirus and firewall protection.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nwa.co.za/", "https://www.cloudtango.net/providers/10899/network-alliance-pty-ltd"]'
WHERE slug = 'network-alliance-pty-ltd-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Network Engineering Services is a computer and IT services provider based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'network-engineering-services-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Dawn Property Group is an estate agency based in Heuwelsig, Centurion, operating under the Mabe Property Group and offering residential sales and rentals across Pretoria, Gauteng and other South African provinces.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.newdawnpg.co.za/", "https://property.mg.co.za/estate-agency/new-dawn-property-group/32358"]'
WHERE slug = 'new-dawn-property-group-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Frontiers Business Solutions is a business and management consulting firm based in Garsfontein Smallholdings, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'new-frontiers-business-solutions-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Media Design Agency is a design studio in Waterkloof Park, Pretoria, offering graphic design, website design, advertising and packaging solutions with a focus on clean, responsive branding and cohesive campaigns.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.newmediadesign.co.za/", "https://pretoria.co.za/place/new-media-design-agency-1", "https://newmediadesign.co.za/"]'
WHERE slug = 'new-media-design-agency-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Perspective Design is a web design and development studio in Zwartkop, Centurion, with over 10 years in business, offering website design, eCommerce, SEO and content marketing while building custom WooCommerce plugins, headless WordPress sites and CRM integrations in-house.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.newperspectivestudio.co.za/Website-Design-Company-Pretoria-South-Africa/", "https://www.newperspectivestudio.co.za/website-design-company-centurion/"]'
WHERE slug = 'new-perspective-design-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Road Capital (Pty) Ltd is an independent investment management company based in Erasmuskloof, Pretoria, specialising in fund of funds (FoF) investment solutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.newroadcapital.co.za/", "https://www.newroadcapital.co.za/contact-us/"]'
WHERE slug = 'new-road-capital-pty-ltd-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Snack Industries is a snack food manufacturer in Rosslyn, Pretoria, producing brands such as Crack-A-Snack and Snack Haven using globally sourced production equipment and quality-controlled ingredients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://snackindustries.co.za/", "https://halaal.org.za/listings/new-snack-industries-rosslyn-aluminium-road/", "https://ccbc.co.za/business-directory-2/rosslyn-improvement-district/new-snack-industries-supa-bites"]'
WHERE slug = 'new-snack-industries-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Yellow Solar is a renewable energy company based in Willow Park Manor, Pretoria, offering solar system solutions with purchase, rent-to-own and finance-to-own options that include maintenance and repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.newyellowsolar.com/", "https://newyellowsolar.com/pages/contact-us"]'
WHERE slug = 'new-yellow-solar-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NewFit Glass & Aluminium Pty Ltd is a glass and aluminium supplier in Eldorette, Pretoria, installing doors and windows including aluminium sliding doors, pivot doors, folding doors and double glazed windows.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00',
    source_urls = '["https://www.facebook.com/share/16ZFYYJHn8/", "https://www.procompare.co.za/providers/newfit-glass-aluminium-pty-ltd"]'
WHERE slug = 'newfit-glass-aluminium-pty-ltd-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Newlands Nursery is a plant nursery in Kameeldrift, Pretoria, selling trees, large trees, shrubs, soil and compost direct to the public, with delivery available.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://za.africabz.com/gauteng/newlands-nursery-418456"]'
WHERE slug = 'newlands-nursery-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'News Cafe in Menlyn is an upmarket cocktail bar and restaurant at Menlyn Piazza, serving breakfasts, salads, burgers and platters alongside a full cocktail and premium coffee menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:45-late, Sat-Sun 08:00-late',
    source_urls = '["https://www.dining-out.co.za/md/News-Cafe-Menlyn/3904", "https://www.tripadvisor.com/Restaurant_Review-g312583-d2189348-Reviews-News_Cafe-Pretoria_Gauteng.html", "https://nearbyza.com/place/news-cafe-85"]'
WHERE slug = 'news-cafe-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'News Cafe Hatfield is a cafe-bar and cocktail restaurant in Hatfield, Pretoria, the location where the News Cafe chain first opened in South Africa in 1995, serving breakfasts, burgers, platters and cocktails in a vibrant atmosphere.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-23:00, Fri-Sat 07:00-02:00, Sun 08:00-23:00',
    source_urls = '["https://www.eatout.co.za/venue/news-cafe-hatfield/", "https://www.findmy.co.za/food/category-detail/news-caf-hatfield/23574", "https://www.tripadvisor.com/Restaurant_Review-g312583-d2187303-Reviews-News_Cafe_Hatfield-Pretoria_Gauteng.html", "https://en.wikipedia.org/wiki/News_Cafe"]'
WHERE slug = 'news-cafe-hatfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NexGen Sport Surfaces South Africa is a building and construction business based in Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nexgen-sport-surfaces-south-africa-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nexa Online is a marketing agency in Akasia, Pretoria, offering done-for-you LinkedIn management for founders and business owners, including profile optimisation, content creation, engagement and lead generation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nexaonline.co.za/"]'
WHERE slug = 'nexa-online-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Next Level Pro Gaming is a computer and IT services business based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'next-level-pro-gaming-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nexthink I Infinity Computer Store is a computer and IT services provider based in Wierdapark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nexthink-i-infinity-computer-store-where-technology-meets-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nexus Foodservice Concepts specializes in coffee machine sales and servicing, supplying equipment from leading brands along with maintenance and spare parts, and has been active in the South African coffee industry for over 25 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nexusgroup.co.za/", "https://www.brabys.com/za/gauteng/pretoria/brooklyn/coffee-machine-sales-services/nexus-food-service-concepts-pty-ltd"]'
WHERE slug = 'nexus-foodservice-concepts-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nexus It Solutions (PTY) Ltd is a Montana-based IT company providing infrastructure support, network design, cybersecurity and system monitoring services to businesses in the Pretoria area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.nexusitsolutions.co.za/"]'
WHERE slug = 'nexus-it-solutions-pty-ltd-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nexus Management Solutions is a Pretoria North accounting and business consultancy offering bookkeeping, taxation, payroll, business registration and financial management services to small and medium enterprises.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.zoominfo.com/c/nexus-management-solutions/359716829"]'
WHERE slug = 'nexus-management-solutions-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nexx Global Procurement is a business and management consultancy specializing in procurement services, based in Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nexx-global-procurement-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ngidi Business Advisory is a multi-disciplinary professional services firm at Menlyn Maine specializing in accounting, auditing, taxation and forensic consulting.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://ngidi.co.za/", "https://pretoria.co.za/listing/ngidi-business-advisory/", "https://www.ngidi.co.za/about-us/"]'
WHERE slug = 'ngidi-business-advisory-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ngoetjana Attorneys Centurion is a law firm based in Highveld Techno Park offering conveyancing, property law, family law, estate planning and general litigation services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ngoetjanaattorneys.co.za/lawyer-centurion/?utm_source=gbp&utm_medium=organic&utm_campaign=gbp", "https://ngoetjanaattorneys.co.za/lawyer-centurion/", "https://pretoria.co.za/listing/ngoetjana-attorneys-centurion/"]'
WHERE slug = 'ngoetjana-attorneys-centurion-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ngonyezi Projects (Pty) Ltd is a Kilner Park-based business consultancy founded in 2012, with experience developing solar energy projects.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://tracxn.com/d/companies/ngonyezi-projects/__ASwOVTnZmOpUcy_1S8jjc9mfZeH2BtysNs45IDETEYs"]'
WHERE slug = 'ngonyezi-projects-pty-ltd-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nhlengelo Construction (Pty) Ltd is a building and construction company based in Andeon, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nhlengelo-construction-pty-ltd-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NiB Properties is a fast-growing estate agency based in Doornpoort, listing residential properties for sale and to rent across Pretoria and its surrounding suburbs.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://nibproperties.co.za/", "https://www.property24.com/estate-agents/nib-properties/33136"]'
WHERE slug = 'nib-properties-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nice Group South Africa (Pty) Ltd is a security services company serving the Centurion Golf Estate area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nice-group-south-africa-pty-ltd-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nice Nails & Beauty Parlour is a nail and beauty salon in Newlands, Pretoria, offering manicures, pedicures and beauty treatments.',
    description_enriched_at = datetime('now')
WHERE slug = 'nice-nails-beauty-parlour-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nicholas Plumbers offers plumbing repair and installation services to homes and businesses in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nicholas-plumbers-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nichole''s Fine Foods is a grocery and food store serving the Valhalla area of Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nichole-s-fine-foods-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nickon Group, founded in 2015, operates in the property and construction industry from its base in Annlin, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://nickon.co.za/", "https://www.facebook.com/NickonGroup1/"]'
WHERE slug = 'nickon-group-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nico Fourie Creations is a Pretoria-based manufacturer and supplier specializing in custom gates, burglar bars, garage doors, carports, roof structures and braai stands.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.linkedin.com/in/nico-fourie-a8bb96311/"]'
WHERE slug = 'nico-fourie-creations-garage-doors-supplier-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nico''s Outdoor Equipment has been selling, servicing and repairing lawnmowers and other outdoor power equipment since 1994, based at Sulocus Forum in Montana Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-12:00',
    source_urls = '["http://www.nicosoutdoor.com/", "https://nicosoutdoor.com/", "https://www.nicosmowers.com/"]'
WHERE slug = 'nico-s-outdoor-equipment-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nienaber Attorneys is a boutique law firm based in Midstream, Centurion, specializing in property law, estates and fiduciary law, and contractual litigation in real estate and franchising matters.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nienaberattorneys.online/", "https://www.nienaberattorneys.co.za/"]'
WHERE slug = 'nienaber-attorneys-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nigel Mac-Rare offers real estate buying and selling guidance in Villieria, with a curated property portfolio and local market insights for the area.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nigelmacrare.co.za/", "https://pretoria.co.za/place/nigel-mac-rare", "https://www.harcourts.co.za/agents/nigel-mac-rare/11615/"]'
WHERE slug = 'nigel-mac-rare-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nighthill Consult is a business and management consulting firm based in Equestria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nighthill-consult-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nimbus Solutions provides workflow and security solutions for businesses, including visitor management, proof of delivery and workflow optimisation systems, from its offices in Erasmusrand, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nimbus-solutions.co.za/", "https://www.nimbus-solutions.co.za/"]'
WHERE slug = 'nimbus-solutions-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nizami Trader''s is an electronics and appliances retailer on Paul Kruger Street in Les Marais, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nizami-trader-s-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nj van Rensburg Attorneys is a law firm in Murrayfield offering conveyancing, deceased estates administration, tax law, family law and divorce, and insolvency and liquidation services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://njvrattorneys.co.za/about-us/", "https://nj-van-rensburg-attorneys.business.site/"]'
WHERE slug = 'nj-van-rensburg-attorneys-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nkaziumelo is a business and management consulting firm operating in Highveld, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nkaziumelo-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nkoka is a training academy in Wierdapark and the only centre in Africa accredited by the IPC to deliver electronics and broadcast engineering training on its behalf, offering distance-learning National Certificate programmes for full-time employed learners.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nkoka.co.za/t", "http://nkoka.co.za/contact", "https://www.ebg.co.za/supplier.aspx?acc=953"]'
WHERE slug = 'nkoka-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nnovative Automation is an industrial automation and system integration company in Rooihuiskraal that has grown from a garage-based operation since 2014 into a specialist providing automation systems, equipment refurbishment and control system programming for South Africa''s manufacturing and industrial sectors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30',
    source_urls = '["http://www.nnovative.co.za/", "https://nnovative.co.za/", "https://nnovative-automation-pty-ltd.business.site/"]'
WHERE slug = 'nnovative-automation-pty-ltd-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'No Limit Solutions is a computer and IT services provider based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'no-limit-solutions-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'No Limits Sport is a sportswear supplier operating from the N4 Gateway Industrial Park in Willow Park Manor, open on weekdays for trade orders.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00, Fri 07:30-15:00',
    source_urls = '["http://nolimitssport.co.za/NLS/", "https://www.localgymsandfitness.com/ZA/Pretoria/138419159665750/No-Limits"]'
WHERE slug = 'no-limits-sport-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'No Longer in Bussiness is an events and function venue business based in Glen Lauriston, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'no-longer-in-bussiness-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'No Man''s IT is a software development company based in Murrayfield, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'no-man-s-it-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NoWire Technologies is an ICT company in Rietvalleirand that supplies, installs and supports data and internet connectivity equipment, including wireless technologies such as 3G, HSDPA and IBurst.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://za.linkedin.com/company/nowire-technologies-pty-ltd", "https://rocketreach.co/nowire-technologies-pty-ltd-profile_b5c16085f42e08f6"]'
WHERE slug = 'nowire-technologies-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Noakalesse Business Solutions is a firm of Chartered Accountants and tax practitioners in Waterkloof Glen offering business planning, business case evaluations and project and structured finance advisory services, with experience on Auditor-General audits and Treasury Regulations, PFMA and GRAP compliance work.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.noakalesse.co.za/", "https://noakalesse.co.za/", "https://noakalesse.co.za/about/"]'
WHERE slug = 'noakalesse-business-solutions-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A property practitioner affiliated with Realnet Midstream Estates, focusing on residential and sectional title sales in the Midstream Ridge and wider Midstream Estate area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nobantumothibi.carrd.co/", "https://www.thevirtualagent.co.za/agent/nobantu-mothibi/10744/"]'
WHERE slug = 'nobantu-mothibi-midrand-property-practitioner-midstream-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nofor-Mertz Daniel provides payroll processing, bookkeeping, tax accounting and tax consulting services for small businesses in the Centurion area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.africanadvice.com/1393689/Accountants,_Bookkeepers_And_Tax_Consultants/Centurion/Nofor-mertz_Daniel/", "https://www.procompare.co.za/providers/nofor-mertz-daniel", "https://pretoria.co.za/place/nofor-mertz-daniel"]'
WHERE slug = 'nofor-mertz-daniel-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Noise Boys is an exhaust fitment specialist in Pretoria Central, servicing and custom-fitting exhaust systems for motor vehicles.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00',
    source_urls = '["https://www.openstreetmap.org/node/6453954367", "https://www.yellowpages.co.za/business/15389003_2", "https://www.netpages.co.za/Pretoria/Noise+Boys+Pretoria+Central+-80637.html"]'
WHERE slug = 'noise-boys-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nology is a value-added distributor of converged IP solutions, founded in 2001, supplying broadband, wireless, networking and VoIP products to service providers, network operators and resellers across Southern Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nology.co.za/", "https://www.nology.co.za/about-us", "https://www.nology.co.za/"]'
WHERE slug = 'nology-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nols Nolte Inc is a law firm in Sinoville offering family law, divorce, labour law, corporate and commercial law, immigration law and conveyancing services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.southafricanlawyer.co.za/law-firm/nolte-nols-inc/gauteng/", "https://www.procompare.co.za/providers/nols-nolte-inc"]'
WHERE slug = 'nols-nolte-inc-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Noltrix (Pty) Ltd designs and installs solar PV systems and, through its Noltrix Training Academy, offers PV GreenCard-accredited solar installation training and skills development courses.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://noltrix.com/", "https://noltrix.com/Academy"]'
WHERE slug = 'noltrix-pty-ltd-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nomaciko Projects is a construction company in Theresapark offering new builds, renovations and extensions, with a focus on detail-oriented project delivery tailored to each client''s budget and deadlines.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/nomaciko-projects"]'
WHERE slug = 'nomaciko-projects-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nomalanga Events is an event furniture and decor hire company serving Centurion, providing furnishings and styling for private functions such as baby showers, birthdays and graduations.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.nomalangaevents.com/"]'
WHERE slug = 'nomalanga-events-thatchfield-estate' AND description_enriched_at IS NULL;

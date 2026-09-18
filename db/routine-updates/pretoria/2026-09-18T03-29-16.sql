UPDATE businesses
SET description = 'This Bidvest Waltons branch at Byls Bridge Promenade stocks a wide range of office stationery, catering and hygiene supplies, technology and PC accessories, and office furniture including Optiplan filing solutions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:00, Wed 09:00-17:00, Thu-Fri 08:30-17:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://za.africabz.com/gauteng/bidvest-waltons-centurion-236384", "https://www.tiendeo.co.za/stores/centurion/bidvest-waltons-shop-byls-bridge-promenade-bloukrans-road-off-john-voster-drive-highveld/60802", "https://www.yep.co.za/biz/store/iyp/471974_72"]'
WHERE slug = 'bidvest-waltons-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Checkers outlet opened in 2022 as the group''s seventh store in Centurion, based in the newly developed Irene Link Mall in Doringkloof, and offers a bakery, deli, fresh produce, a salad bar and prepared meals alongside everyday groceries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1900682", "https://pretoria.co.za/listing/checkers-irene-link/", "https://www.shopriteholdings.co.za/newsroom/2022/new-checkers-supermarket-opens-in-irene-creating-95-new-jobs.html"]'
WHERE slug = 'checkers-irene-link-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Dis-Chem pharmacy at Irene Link offers a full pharmacy dispensary alongside an in-store clinic, including a baby wellness clinic, plus Click & Collect for online orders.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://za.africabz.com/gauteng/dis-chem-pharmacy-irene-link-549390", "https://firmania.co.za/centurion/dis-chem-pharmacy-irene-link-centurion-71032", "https://www.dischem.co.za/irene-link-centurion", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1889034"]'
WHERE slug = 'dis-chem-pharmacy-irene-link-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This workshop in Highveld Techno Park positions itself as a one-stop solution for vehicle care, covering diagnostics, brakes, suspension and clutch work, oil changes, filters, tyres and both minor and major services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://highveldautoworks.co.za/", "https://www.thebusinessdirectory.co.za/listings/highveld-autoworks-centurion/", "https://www.facebook.com/highveldautoworks/"]'
WHERE slug = 'highveld-autoworks-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Opened in October 2022 inside the Irene Link Centre, this store combines a firearms and ammunition retailer with an outdoor and tactical gear shop, offering accredited firearm training, repairs and custom builds, plus two indoor ranges - including a 200m underground range said to be the only one of its kind in South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/pretoria-arms-277121", "https://irenearms.com/contact", "https://businesstech.co.za/news/property/603770/a-look-at-the-new-shopping-mall-in-centurion-featuring-south-africas-only-underground-shooting-range/", "https://irenearms.com/"]'
WHERE slug = 'irene-arms-outdoor-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This KFC drive-thru branch sits at the corner of Nellmapius Drive and Van Ryneveld Avenue in Irene, offering fried chicken buckets, combos and sides with dine-in, takeaway and drive-thru service.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 06:00-22:00, Fri-Sat 06:00-23:00',
    source_urls = '["https://za.polomap.com/irene/5400", "https://www.waze.com/live-map/directions/kfc-irene-village-mall-(drive-thru)-cnr-nellmapius-rd-(m31)-and-van-ryneveld-ave-(m28)-irene,-centurion", "https://wanderlog.com/place/details/4501426/kfc-irene-village"]'
WHERE slug = 'kfc-irene-village-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This McDonald''s outlet in Irene Village Mall on Mezereon Crescent offers drive-thru, dine-in, takeaway and delivery, with an outdoor seating area within the mall precinct.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mcdonalds.co.za/location/mcdonalds-irene-village-mall", "https://www.findmy.co.za/food/category-detail/mcdonalds-irene-village-mall/24304", "https://wanderlog.com/place/details/3192981/mcdonalds-irene-village-mall"]'
WHERE slug = 'mcdonalds-irene-village-mall-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This 100% black-owned firm provides geological, geophysical exploration and civil engineering consulting, specialising in geotechnical investigations and foundation designs for commercial structures and residential dwellings, plus road centreline investigations and township establishment reports.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "http://nomfundo.co.za/", "https://www.aiyellow.com/_NOMFUNDO_EXPLORATION_AND_CONSULTING_(PTY)_LTD/"]'
WHERE slug = 'nomfundo-exploration-and-consulting-pty-ltd-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A catering and events company based in Murrayfield, providing food and event services for functions and gatherings in the local area.',
    description_enriched_at = datetime('now')
WHERE slug = 'nomfunti-catering-and-events-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development business based in Erasmuskloof, offering custom software and technology solutions to local clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'noobtech-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nora Africa Waste offers cleaning and waste-related services to homes and businesses in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nora-africa-waste-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Doornpoort-based studio builds brands through web design, domain registration and hosting, plus graphic design services spanning logos, flyers, banners, t-shirts and promotional material.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.norsestudios.co.za/", "https://www.norsestudios.co.za/contact/"]'
WHERE slug = 'norse-studios-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A logistics, courier and transport service provider based at Hazeldean Office Park, Pretoria, serving businesses in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'norseguard-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Established in 2011 and now trading as a registered company, this Pretoria business sells and repairs cleaning equipment and chemicals, supplies mopping equipment and brushware, and also hires out cleaning machinery.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://nwcleaning.co.za/", "https://www.facebook.com/NWCLEANINGCHEMICALSYSTEMS/"]'
WHERE slug = 'north-west-cleaning-systems-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Established in 2012 by former members of the Pretoria Bar''s National Forum of Advocates, this professional association supports its full and associate advocate members with resources related to court processes and legal practice.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://northgautengassociationofadvocates.co.za/", "https://www.zoominfo.com/c/north-gauteng-association-of-advocates/1334355178"]'
WHERE slug = 'north-gauteng-association-of-advocates-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Family-run since 1994 and now in its second generation, this Pretoria North workshop sells, supplies spares for and repairs lawnmowers, generators, pumps, brushcutters, trimmers and ride-on mowers, both electric and fuel-powered.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00',
    source_urls = '["https://northlawnmowers.co.za/", "https://www.findmy.co.za/services/business/north-lawnmowers/64124", "https://pretoria.co.za/listing/north-lawnmowers/"]'
WHERE slug = 'north-lawnmowers-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A training centre based in Louwlardia, Centurion, offering educational and skills-development courses to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'north-rand-training-center-randjesfontein-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A steel and metal products supplier in Andeon, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'northen-steel-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Family-owned and trading since 2006, this Pretoria North business wholesales spices, herbs, seasonings, sauces and foodservice machinery under its own brands including Gemini Spice, Express Chef Sauces and Weber Seasonings, supplying caterers, restaurants, hotels and butcheries across Gauteng, Mpumalanga, North West and Limpopo.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://northernfoods.co.za/", "https://northernfoods.co.za/about-us/", "https://www.facebook.com/northernfoodingredients/"]'
WHERE slug = 'northern-food-ingredients-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trading since 1978 as Northern Hardware & Glass, this Koedoespoort business is an established player in South Africa''s glass industry, operating across 12 branches spanning retail, wholesale and manufacturing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00',
    source_urls = '["http://www.nhg.co.za/", "https://www.cybo.com/ZA-biz/northern-glass-group", "https://pretoria.infoisinfo.co.za/card/northern-hardware-glass/440317"]'
WHERE slug = 'northern-glass-group-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction company based in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'northern-sparrows-solutions-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Northern Vinyl Supplies has served the sign-making industry in Pretoria North for over 20 years, stocking a wide range of vinyls in different tack strengths along with cut-to-size plexiglass and sign-printing equipment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["http://www.northernvinyl.co.za/", "https://pretoria.co.za/place/northern-vinyl-supplies"]'
WHERE slug = 'northern-vinyl-supplies-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Established in 2009, this Pretoria and Johannesburg based studio covers a wide range of photography and videography work including weddings, portraits, family shoots, product, commercial and architectural photography, plus sport photography, with a focus on fast turnaround editing.',
    description_enriched_at = datetime('now')
WHERE slug = 'nostalgic-pro-photography-photographer-video-pretoria-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A bakery based in Valhalla, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'not-a-business-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A marketing and advertising agency based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'notice-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nova Craft supplies solar panels, batteries and inverters for homes and businesses in the Centurion area, helping customers set up reliable backup power solutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.nova-craft.co.za/", "https://www.facebook.com/p/Nova-Craft-100063476201620/"]'
WHERE slug = 'nova-craft-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nova Dental Care operates from the first floor of Southlake Centre on Lenchen Avenue North in Centurion, offering general and cosmetic dentistry including veneers, bridges, dental implants, night guards and full smile makeovers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/300385930", "https://www.centuriondentalcare.co.za/"]'
WHERE slug = 'nova-dental-care-southlake-centre-first-floor-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nova Digital Marketing Solutions is a social media and digital marketing agency offering SEO, Google Ads management, online marketing strategy, and content design and creation services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.novadms.co.za/", "https://www.facebook.com/NovaDMS/"]'
WHERE slug = 'nova-digital-marketing-solutions-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nova Property Group owns and manages a portfolio of commercial and residential properties across South Africa, focusing on maintaining and rejuvenating commercial assets and select residential developments in the Pretoria area.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://novapropertygroup.co.za/", "https://novapropertygroup.co.za/"]'
WHERE slug = 'nova-property-group-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development company based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nova-site-pty-ltd-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NovaCloud Africa provides IT support, cloud hosting, VoIP PBX systems, cybersecurity and data backup solutions for businesses across Gauteng, operating with local ZAR billing and POPIA-compliant service from its Centurion base.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.novacloud.africa/", "https://www.facebook.com/novacloudsa/"]'
WHERE slug = 'novacloud-pty-ltd-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A marketing and advertising agency based in Boardwalk Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'novarock-creative-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NovaSolis is a renewable energy solutions provider operating from The Point Business Park in Samrand, Centurion, supplying solar power solutions to homes and businesses in the area.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://novasolis.co.za/", "https://tracxn.com/d/companies/novasolis/__9k4XeNMnhjGmSBWJim6X-81qN0n12yxVPp4pm9RBToI"]'
WHERE slug = 'novasolis-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Novagen Pharma is an independently owned pharmaceutical company, established in 2009, that markets a range of generic antiretroviral and chronic medication products and ranks among the largest private suppliers of ARVs in South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.novagenpharma.co.za/", "https://pharmaboardroom.com/directory/novagen-pharma-south-africa/"]'
WHERE slug = 'novagen-pharma-pty-ltd-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Novascale Systems develops cloud-native applications, custom enterprise systems and API integrations, and also modernises outdated legacy software into scalable, future-ready platforms.',
    description_enriched_at = datetime('now')
WHERE slug = 'novascale-systems-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Novateur is a fire protection and safety company offering fire consulting, detection, sprinkler and gas suppression systems, and extinguisher services to warehouses, shopping centres and other large businesses, operating since 2017.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://novateurza.com/", "https://fire-and-security.co.za/companies/novateur-pty-ltd/"]'
WHERE slug = 'novateur-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Novicus Systems provides computer hardware, software and IT support solutions, including Windows and Linux support, cloud services, VoIP systems, data backup and recovery, and managed IT services for businesses in the Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'novicus-systems-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This site is a warehouse and distribution depot for Novon Retail Company, a privately owned agricultural chemical distributor supplying crop-care products across Gauteng, North West, Mpumalanga and Limpopo through a network of depots and agents.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://novon.co.za/", "https://www.brabys.com/za/gauteng/pretoria/derdepoort/chemicals-suppliers/novon-retail-co-pty-ltd"]'
WHERE slug = 'novon-retail-company-warehouse-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Novu Interiors is an interior design studio offering commercial and residential design services complete with 3D renders, based in Centurion with projects across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.novuinteriors.co.za/", "https://www.instagram.com/novu_interiors/"]'
WHERE slug = 'novu-interiors-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Novus BEE Solutions provides Black Economic Empowerment consulting from its Route 21 Corporate Park offices in Irene, covering strategy development, skills development, supplier and enterprise development, BEE training and related software solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'novus-bee-solutions-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A logistics and truck hire operator based in Eldorette, offering transport and load-hauling services in the greater Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'nrt-truck-hire-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nsimba Financial Services is a Centurion-based firm offering taxation and related business advisory services to individuals and companies in the area.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/NsimbaFS/"]'
WHERE slug = 'nsimba-financial-services-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business consulting firm operating from Thatchfield Estate, Centurion, offering advisory and consulting services to local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'nth-degree-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NthatisiThato Properties is an estate agency serving the northern Pretoria area, including Akasia, Soshanguve and Mabopane, handling property sales, rentals and property management for individual and commercial clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ntproperties.co.za/", "https://www.procompare.co.za/providers/nthatisithato-properties"]'
WHERE slug = 'nthatisithato-properties-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ntloedibe Attorneys Inc is a Mayville-based law firm handling commercial, family and property law matters, including conveyancing, debt collection, divorce, maintenance and civil litigation.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://ntloedibeattorney.co.za/", "https://www.procompare.co.za/providers/ntloedibe-attorneys-inc"]'
WHERE slug = 'ntloedibe-attorneys-inc-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A financial and investment services provider based in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ntombela-holdings-pty-ltd-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ntswaki Investment is a Pretoria-based general and civil construction company operating out of the Hermanstad area.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/ntswakiinvestment/"]'
WHERE slug = 'ntswaki-investment-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction company operating in Brooklands Lifestyle Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'nu-projects-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NuHuman Transformation Gym in Shere Lifestyle Centre is a holistic health and weight-loss transformation gym combining training, nutrition coaching, stress management and scientific health testing, with hundreds of client transformations to date.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 05:00-12:00 & 15:00-19:00, Sat-Sun Closed',
    source_urls = '["http://www.nuhuman.co.za/", "https://www.fresha.com/lvp/nuhuman-transformation-gym-graham-road-shere-eX04We"]'
WHERE slug = 'nuhuman-transformation-gym-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NuNetwork Corporation (NuNet) is a Pretoria-based company that connects service and product providers across the energy, finance and technology sectors, integrating their skills and resources to build tailored solutions for clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://nunet.co.za/", "https://nunet.co.za/home.php"]'
WHERE slug = 'nunetwork-corporation-pty-ltd-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NuSkinnovation Pretoria East is an aesthetic laser clinic in Boardwalk Office Park offering treatments such as tattoo removal, pigmentation and acne-scar reduction, and skin toning, using Ellipse and Fotona laser technology.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.nuskinnovation.co.za/about-nuskinnovation/pretoriaeast/", "https://www.fresha.com/lvp/nuskinnovation-aesthetic-clinic-pretoria-east-pretoria-a2GDG5", "https://www.nuskinnovation.co.za/pretoria-east/"]'
WHERE slug = 'nuskinnovation-pretoria-east-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A printing and graphic design studio in Weavind Park, Pretoria, handling custom print and creative graphic projects for local clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'nubery-creative-graphic-projects-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nubia Restobar is a stylish fusion restaurant and bar in Blue Valley Mall serving African-inspired cuisine, premium steaks and shareable tapas alongside cocktails, in a vibrant, design-led setting.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://aurum-lounge-builder-sdlgddxhnlk0hctl.hostingersite.com/", "https://restaurantguru.com/Nubia-Restobar-Centurion", "https://www.facebook.com/p/Nubia-Restobar-61564998187876/"]'
WHERE slug = 'nubia-restobar-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development company based in Equestria, Pretoria, building custom software solutions for local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'nuclear-africa-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nuclei Lifestyle Design is a Pretoria-based architecture and interior design practice established in 1999, working on residential and commercial projects spanning architecture, interior design, landscape architecture and furniture procurement.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.nuclei.co.za/", "https://nuclei.co.za/about-us-nuclei-architects-pretoria/"]'
WHERE slug = 'nuclei-lifestyle-design-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nulane Technologies is a Queenswood-based software development company with experience in the healthcare sector, currently focused on specialised practice-management software for optometrists.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://nulane.co.za/", "https://www.zoominfo.com/c/nulane-technologies/476005374"]'
WHERE slug = 'nulane-technologies-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An internet cafe in Sable Hills Waterfront Estate offering public internet access and basic computer services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'nurhe-internet-cafe-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nutec Wendy Homes builds custom nutec houses, cottages and wendy houses across Pretoria and Johannesburg, using cement-fibre board over solid timber frames, with options for ceilings, insulation, plumbing and electrical points for full-time living.',
    description_enriched_at = datetime('now')
WHERE slug = 'nutec-wendy-homes-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A nutec and wendy house building company based in Rooiwal, Pretoria, constructing homes using nutec board materials.',
    description_enriched_at = datetime('now')
WHERE slug = 'nutechomes-sa-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nuts About Biltong is a specialist biltong and nuts store trading from Monument Park Shopping Centre, offering a range of dried meat and nut snacks to shoppers in the area.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.geelvetbiltongwaterkloofrif.co.za/", "https://www.facebook.com/mparkshop/videos/nuts-about-biltong076-529-1158/407084145785490/"]'
WHERE slug = 'nuts-about-biltong-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nuvilux designs and manufactures energy-efficient LED lighting solutions in South Africa, supplying customised lighting products, including outdoor lighting, from its Koedoespoort Industrial base in Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://nuvilux.co.za/contact-us/"]'
WHERE slug = 'nuvilux-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'NwaMzamani Properties is a residential real estate agency based in Amandasig, Akasia, helping clients buy, sell and rent homes with a focus on Amandasig and neighbouring areas such as Chantelle and Clarina.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.nwamzamaniproperties.co.za/", "https://www.property24.com/estate-agents/nwa-mzamani-properties/37006"]'
WHERE slug = 'nwamzamani-properties-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nxlevel Consulting is a business consulting firm based in Blue Valley Golf Estate, Centurion, specialising in advisory services for the exhibitions and events management industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'nxlevel-consulting-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nyati Paints manufactures and supplies decorative and industrial paints from its Rosslyn East premises, focusing on a water-based product range alongside solvent-based products for retailers, companies and the public.',
    description_enriched_at = datetime('now')
WHERE slug = 'nyati-paints-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nybsys is a telecommunications solutions provider offering LTE and 5G technology services from its Doringkloof, Centurion base, having grown from its origins in Swaziland in 2011 into operations spanning several countries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://www.nybsys.com/", "https://www.adapt.io/company/nybsys", "https://b2bhint.com/en/company/za/nybsys--K2011127529"]'
WHERE slug = 'nybsys-south-africa-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nyiko Digital is a digital marketing agency in Eldoraigne, Centurion, offering website design, hosting, domain registration, SEO, Google Ads, social media marketing and company registration services to local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'nyiko-digital-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building and construction business based in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'nyore-and-makwara-trading-and-projects-pty-ltd-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nyumba Mobile Homes & Offices manufactures and erects prefabricated and modular buildings, including offices, schools, clinics and accommodation units, built on steel chassis or concrete foundations from its Waterkloof Ridge base.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'nyumba-mobile-homes-offices-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An estate agency based in Centurion Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'o-properties-centurion-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A shoe and bag retailer in Sinoville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'o-brien-shoes-bags-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'O''Galito at Centurion Mall is an upmarket Portuguese restaurant known for its seafood-focused menu and sushi, offering dine-in, takeout and delivery in a wheelchair-accessible setting.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ogalito.com/contact-centurion/", "https://centurionmall.co.za/stores/store-list/o-galito/", "https://www.tripadvisor.com/Restaurant_Review-g312613-d3224532-Reviews-O_Galitos_Centurion_Mall-Centurion_Gauteng.html"]'
WHERE slug = 'ogalito-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'O.Joubert Attorneys is a Pretoria law firm focused on Road Accident Fund claims and medical malpractice litigation, representing clients in disputes against corporate and government institutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ojlaw.co.za/", "https://ojlaw.co.za/practice-areas/", "https://ojlaw.co.za/contact/"]'
WHERE slug = 'o-joubert-attorneys-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A tailoring business specialising in made-to-measure suits, based in Waterkloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'o-s-man-tailor-made-suits-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OAB Chartered Accountants is a Centurion-based firm offering accounting, bookkeeping, payroll and tax services for small and medium businesses, drawing on a team with over 20 years of combined experience.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oabca.co.za/", "https://www.facebook.com/oabcaccountants/"]'
WHERE slug = 'oab-chartered-accountants-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OAK Law is a commercial and corporate law firm in Irene, Centurion, established in 2013, advising on mergers and acquisitions, franchising, corporate restructuring, private equity, mining law and intellectual property matters.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.oaklaw.co.za/?utm_source=google&utm_medium=organic&utm_campaign=gmb", "https://www.southafricanlawyer.co.za/law-firm/oak-law/centurion/"]'
WHERE slug = 'oak-law-commercial-attorneys-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OBARO Online is the e-commerce arm of agricultural supplier OBARO, based in Silver Lakes Golf Estate, Pretoria East, offering farm equipment such as tractors and irrigation systems alongside a wide range of agricultural products for online ordering.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:00, Sun 09:00-13:00',
    source_urls = '["https://shop.obaro.co.za/", "https://obaro.co.za/obaro_branch/obaro-tijgervallei/", "https://pretoria.co.za/listing/obaro-online/"]'
WHERE slug = 'obaro-online-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OBC Chicken and Meat in Karenpark is part of a national franchise established in 1987, specialising in fresh and frozen chicken alongside other meat and grocery essentials.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://obcchicken.co.za/", "https://obc.co.za/about-us/"]'
WHERE slug = 'obc-chicken-and-meat-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OBC GROUP (Pty) Ltd. in Louwlardia, Centurion is the head office of a fast-growing South African retail chain specialising in chicken, red meat, fish, pork and groceries, and also houses its OBC Liquor division.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.obcgroup.co.za/", "https://citionline.co.za/web-directory/obc-group-pty-ltd/"]'
WHERE slug = 'obc-group-pty-ltd-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OCTOLINK is a facilities management company based in Irene, Centurion, providing facility maintenance, energy optimisation, security and environmental sustainability solutions, operated in partnership with Tollink South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://octolinkfmc.co.za/", "https://sites.teracore.co.za/octolink/"]'
WHERE slug = 'octolink-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A marketing and advertising agency based in Sable Hills Waterfront Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ogbase-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Express La Montagne is a convenience store in La Montagne, Pretoria, offering everyday groceries and quick essentials to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-express-la-montagne-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Foods Laudium is a full-service supermarket in Laudium Plaza featuring an in-house butchery, a bakery for fresh bread and pastries, and a fresh produce section, serving as a one-stop grocery shop for the Laudium community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ok-foods-laudium", "https://vymaps.com/ZA/OK-Foods-Laudium-585368/", "https://pretoria.co.za/place/ok-foods-laudium"]'
WHERE slug = 'ok-foods-laudium-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Furniture Gezina is a furniture and appliance showroom in Gezina Galleries, part of the national OK Furniture chain, stocking bedroom and lounge suites, TVs and home appliances alongside a wall-to-wall carpet service and delivery options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-17:00',
    source_urls = '["https://www.okfurniture.co.za/gezina", "https://www.brabys.com/za/gauteng/pretoria/gezina/furniture-dealers/o-k-furniture", "https://my-catalogue.co.za/stores/gezina/ok-furniture/cnr-11th-avenue-friederika-streets"]'
WHERE slug = 'ok-furniture-gezina-gezina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Furniture Silverton is a furniture and appliance retailer in Silver Mall, Silverton, offering home furnishings and appliances to local shoppers.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-furniture-silverton-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Minimark Erasmia is a neighbourhood grocery store in Erasmia, Pretoria, offering everyday groceries and essentials to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-minimark-erasmia-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Supermarket Erasmia is a full supermarket in Erasmia Crossing offering a butchery, bakery and takeaway counter alongside its everyday grocery range for the Erasmia community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.laudiumtoday.co.za/listings/ok-erasmia/", "https://www.facebook.com/Okerasmia/", "https://x.com/OkErasmia"]'
WHERE slug = 'ok-supermarket-erasmia-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OKSA Chartered Accountants is an accounting firm based in Koedoespoort, Pretoria, offering accounting, tax, payroll, business intelligence, auditing and financial planning services to businesses across the region.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.oksa.co.za/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=13636570864029121909", "https://pretoria.co.za/place/oksa-chartered-accountants"]'
WHERE slug = 'oksa-chartered-accountants-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A computer and IT services provider based in Olievenhoutbosch, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'olievenoutbosch-ext27-13751-dikotla-street-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olympic Catering Equipment has been manufacturing and supplying catering and refrigeration equipment since 1971, and its Pretoria West premises include a stainless steel fabrication facility, a refrigeration manufacturing plant, a repairs department, and both new and secondhand equipment showrooms, plus free kitchen design consultations for hospitality clients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:30, Sat 09:00-13:00',
    source_urls = '["http://www.olyquip.com/", "https://www.olympiccatering.co.za/wmenu.php", "https://pretoria.co.za/place/olympic-catering-equipment"]'
WHERE slug = 'olympic-catering-equipment-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'On The Dot is a multichannel media logistics company operating from Hermanstad, Pretoria, distributing newspapers, magazines, books and other print media nationally and offering courier services through its SLiMS division.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.onthedot.co.za/", "https://za.linkedin.com/company/on-the-dot"]'
WHERE slug = 'on-the-dot-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A car dealership based in Andeon, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'onbehalf-pty-ltd-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ONE Insurance Underwriting Managers runs a regional office in Moreleta Park, Pretoria, providing underwriting and risk management across agricultural, commercial, personal, hospitality and transport insurance; founded in 1996, the underwriter is now part of the Old Mutual group.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.one.za.com/", "https://www.cover.co.za/market-place-companies/one-insurance", "https://www.hellopeter.com/one-insurance-underwriting-managers-pty-ltd"]'
WHERE slug = 'one-insurance-underwriting-managers-pretoria-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Only God Business Centre is a computer and IT services centre in East Lynne, Pretoria, providing local residents with computer, printing and related business support services from early morning to late evening, seven days a week.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-20:30, Sat 08:30-19:30, Sun 09:30-18:30',
    source_urls = '["scraped:google-places-no-website", "https://www.waze.com/live-map/directions/za/gp/pretoria/only-god-business-centre"]'
WHERE slug = 'only-god-business-centre-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oosthuizen Brokers is a financial services and insurance brokerage established in 1996, specialising in medical aid, life, pension fund and short-term insurance, including tailored risk cover for the mining sector.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.oosthuizenbrokers.co.za/", "https://www.brabys.com/za/gauteng/pretoria/pretorius-park/insurance-brokers/oosthuizen-brokers"]'
WHERE slug = 'oosthuizen-brokers-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OPD Construction is a building and construction contractor based in The Orchards, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'opd-construction-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Optimus Plumbing has operated in Florauna since 2000, offering plumbing installation and maintenance, solar geyser installations, leak detection, drain cleaning and water meter installation, and holds Kwikot, PIRB and IOPSA accreditation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.optimusplumbing.co.za/", "https://iopsa.org.za/plumbers_list/optimus-plumbing/", "https://www.brabys.com/za/gauteng/pretoria/florauna/plumbers/optimus-plumbing"]'
WHERE slug = 'optimus-plumbing-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ORD Brand is a printing services provider based in Hazeldean Office Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ord-brand-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ORD Holdings operates from Hazeldean Office Park, the same address as ORD Financial Services, a corporate insurance brokerage offering short-term and long-term insurance solutions including life, disability, retirement annuity, income protection and funeral cover.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.ordfs.co.za/", "https://www.ordfs.co.za/About"]'
WHERE slug = 'ord-holdings-pty-ltd-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ORI Professionals is a business advisory and consulting firm based in Eco Park, Centurion, providing tailored advisory solutions to help organisations of various sizes and industries improve, safeguard and transform their operations.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.oripro.co.za/"]'
WHERE slug = 'ori-professionals-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Orinetsh 24/7 Towing is a towing and roadside assistance service based in Proclamation Hill, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'orinetsh-24-7-towing-proclamation-hill' AND description_enriched_at IS NULL;

-- Description enrichment sweep (job 4) — slice 45
-- 50 businesses, willows-country-lodge-the-willows .. woolworths-blu-valley-mall-the-reeds

UPDATE businesses
SET description = 'Willows Country Lodge is a boutique hotel and conference centre set on a two-hectare estate next to the Bronberg Mountain Nature Reserve, with 25 individually decorated guest rooms, a restaurant and bar, swimming pool, spa, conference facilities and airport transfer services.',
    description_enriched_at = datetime('now')
WHERE slug = 'willows-country-lodge-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Willzo Chauffeur Drive is a professional chauffeur and driving service established in 2006, offering flexi-drive, executive shuttle and safari transport services to the travel and tourism industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'willzo-chauffeur-drive-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wilo Backup Power Solutions (Pty) Ltd is an electronics and appliances business in Eloffsdal, Pretoria, providing backup power solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'wilo-backup-power-solutions-pty-ltd-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wim Hofsink Civil Engineering Services (Pty) Ltd is a civil engineering firm specialising in pavement design, forensic investigations into pavement failures, and road and airstrip rehabilitation, with over 35 years of experience across Southern Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'wim-hofsink-civil-engineering-services-pty-ltd-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Hallmark is a family restaurant in the Hallmark Building in Pretoria Central, serving all-day breakfasts, burgers, toasted sandwiches and milkshakes with takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.openstreetmap.org/node/296945059", "https://locations.wimpy.co.za/restaurants-HallmarkBuilding-WimpyHallmark"]'
WHERE slug = 'wimpy-pretoria-central-3' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Pretorius Street is a family-style fast food restaurant in the heart of Pretoria Central, known for its flame-grilled burgers and all-day breakfast menu, with call-and-collect and contactless payment options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:15-19:00, Sat 08:00-17:00, Sun 08:00-15:00',
    source_urls = '["https://www.openstreetmap.org/node/9971665787", "https://location.wimpy.co.za/pretorius-street-pretoria"]'
WHERE slug = 'wimpy-pretoria-central-5' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Forest Hill City is a restaurant and takeaway outlet inside Forest Hill City mall in Centurion, offering Wimpy''s classic breakfast menu alongside its usual burger and milkshake line-up.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-19:00, Fri 06:30-20:00, Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'wimpy-forest-hill-city-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Gezina Galleries is a family restaurant located in Gezina Galleries shopping centre, serving Wimpy''s usual breakfast, burger and milkshake menu to the Gezina area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat-Sun 07:30-14:00'
WHERE slug = 'wimpy-gezina-galleries-gezina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Nina Park is a family restaurant located in the Nina Park Centre in Ninapark, Akasia, serving Wimpy''s breakfast, burger and milkshake menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-19:00, Sat 07:00-18:00, Sun 07:00-15:00'
WHERE slug = 'wimpy-nina-park-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WinMax Business Support Services (Pty) Ltd is a business consulting and digital marketing company that helps small businesses with affordable website development, marketing strategy and Google/SEO visibility.',
    description_enriched_at = datetime('now')
WHERE slug = 'winmax-business-support-services-pty-ltd-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Windows Cleaning Projects is a window cleaning company serving residential and commercial clients, using both the reach-and-wash pole technique and traditional squeegee methods, with free on-site quotes and maintenance programmes.',
    description_enriched_at = datetime('now')
WHERE slug = 'windows-cleaning-projects-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WingFan Africa manufactures and supplies custom industrial axial fans, impellers and cooling equipment for HVAC, cooling towers, livestock ventilation and heavy earth-moving and generator applications, with rapid local manufacture of OEM replacement impellers to cut equipment downtime.',
    description_enriched_at = datetime('now')
WHERE slug = 'wingfan-africa-custom-industrial-fan-solutions-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Winner Webs is a software development company based in Sable Hills Waterfront Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'winner-webs-sable-hills-waterfront-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Winsen International Trading is a procurement and logistics company serving the exports, construction and mining industries across South Africa, Botswana and Namibia, handling sourcing, supplier management and onsite delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'winsen-international-trading-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Winthrop Pharmaceuticals is an industrial supplier and manufacturing business based in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'winthrop-pharmaceuticals-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wipe-It (Pty) Ltd manufactures and supplies tissue and hygiene paper products, including toilet paper, rolled and folded hand towels, and industrial garage rolls, for commercial and industrial dispenser systems.',
    description_enriched_at = datetime('now')
WHERE slug = 'wipe-it-pty-ltd-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wire Worx Manufacturers has made wire and mesh display products since 1997, starting with wire toy cars and growing into a full range of wire and mesh displays supplied to stationery, arts and craft, and hardware retailers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.wireworx.co.za/", "https://www.yellowpages.co.za/business/6531264_3"]'
WHERE slug = 'wire-worx-manufacturers-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wired @ Wonderpark is an internet cafe next to Wonderpark Mini Market offering computer repairs, document printing, laminating and high-speed internet access.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-14:00, Sun Closed',
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/listing/wired-wonderpark/"]'
WHERE slug = 'wired-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wirelex Connekt is a wireless networking solutions company founded in 2018, providing home and business customers with uninterrupted, high-speed wireless connectivity using equipment from leading manufacturers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wirelexconnekt.co.za/", "https://wirelexconnekt.co.za/about-us/"]'
WHERE slug = 'wirelex-connekt-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wirelexx is a South African internet service provider supplying high-speed fibre and wireless connectivity packages to homes and businesses, with local installation and technical support and transparent, uncapped pricing.',
    description_enriched_at = datetime('now')
WHERE slug = 'wirelexx-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wires And Wifi is an IT services company, founded in 2016, offering wired and WiFi network setups, CCTV installation, computer sales and repair, printer sales and repair, and web development and hosting for homes and small businesses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 10:00-14:00, Sun Closed'
WHERE slug = 'wires-and-wifi-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wishy Washy is a cleaning services business based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wishy-washy-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wizcom Technologies is a telecommunications services provider specialising in radio and microwave network planning, design and optimisation for GSM, UMTS, LTE and related mobile networks, supporting major telecommunications operators.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://wizcom.co.za/", "http://wizcom.co.za/about-us.html"]'
WHERE slug = 'wizcom-technologies-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wohler Manufacturing is a steel fabrication company specialising in CNC tube bending and welding for custom tubular chassis products, working with carbon steel, aluminium, stainless steel, brass and copper.',
    description_enriched_at = datetime('now')
WHERE slug = 'wohler-manufacturing-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wolck (Pty) Ltd is a computer and IT services provider based in Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wolck-pty-ltd-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wolf Cloud Website Designer builds affordable, mobile-friendly websites, providing search engine optimisation, domain registration, web hosting and ongoing website management for small businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'wolf-cloud-website-designer-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wolff Logistics is a transport company trading since 1997, with a logistics division launched in 2010, offering truck rentals from 1 to 8 tons, commercial vehicle sales, and a workshop for truck repairs and maintenance across a fleet of over 300 trucks.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.wcv.co.za/", "https://wolfflogistics.co.za/"]'
WHERE slug = 'wolff-logistics-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wollies Animal Shelter is a non-profit, pro-life animal shelter founded in 2003 that rescues and rehomes abandoned, neglected and abused cats and dogs, and offers sterilisation and castration bookings, without any government funding.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 09:00-16:00, Wed Closed, Thu-Sat 09:00-16:00, Sun 09:00-12:00',
    source_urls = '["https://southafricafirm.com/gauteng/wollies-animal-shelter-65816", "https://www.africabizinfo.com/ZA/wollies-animal-project-079-916-4602", "https://wollies.org/contact-us/"]'
WHERE slug = 'wollies-animal-shelter-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wolvaardt Inc Attorneys is a law firm offering commercial law, litigation and mediation, insolvency, property law and conveyancing, family and matrimonial law, estates, trusts, personal injury and notarial services from its Pretoria offices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun by appointment only'
WHERE slug = 'wolvaardt-inc-attorneys-pretoria-offices-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Women Lead Fleet Management is a women-led fleet solutions company supplying and financing tractors, agricultural implements, material handling equipment and commercial vehicles, with a dedicated parts department for equipment support.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 07:30-14:00, Sun Closed'
WHERE slug = 'women-lead-fleet-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Women''s Choice Clinic is a healthcare clinic based in Trevenna, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'women-s-choice-clinic-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonder Park Dry Cleaners is a dry-cleaning outlet located inside Wonderpark Shopping Centre on the corner of Brits Road and Heinrich Avenue in Karenpark.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://wonderparkcentre.co.za/docs/WONDERPARK%20STORE%20DIRECTORY_Nov%202021.pdf"]'
WHERE slug = 'wonder-park-dry-cleaners-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonder''s Hair Studio is a hair salon offering balayage, blow dry, hair colouring, hair extensions and weaves, highlights, keratin treatments, perms and permanent straightening, plus children''s haircuts.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'wonders-hair-studio-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonderboom Bird Park & Aquarium is a pet shop offering a wide range of exotic birds, fish, snakes and reptiles, with staff providing professional advice and care guidance for pet owners.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/wonderboom-bird-park-amp-aquarium"]'
WHERE slug = 'wonderboom-bird-park-aquarium-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonderboom Car Service is an auto repair workshop holding a 5-star MIWA grading and RMI membership, offering minor and major car servicing and diagnostic problem-solving, plus a free drop-off service within a 5km radius.',
    description_enriched_at = datetime('now')
WHERE slug = 'wonderboom-car-service-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonderboom South Emergency Plumbers is a 24/7 emergency plumbing service handling burst pipes, water leaks, blocked drains, toilet malfunctions and faulty hot water systems for residents and businesses in Wonderboom South.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.qckresponse24.co.za/", "https://leaderr.co/directory/wonderboom-south-emergency-plumbers-0182/"]'
WHERE slug = 'wonderboom-south-emergency-plumbers-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonderland Jewellery is a jewellery retailer based in Wonderboom, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wonderland-jewellery-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonderpark Shine Maids & Care is a domestic cleaning and maid service based in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wonderpark-shine-maids-care-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonders Christian Preschool is a faith-based preschool on Boshoff Street in The Orchards offering early learning in small classes with a focus on social, cognitive and emotional development.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.thiaenterprise.co.za/", "https://pretoria.co.za/place/wonders-christian-preschool"]'
WHERE slug = 'wonders-christian-preschool-thia-s-business-enterprise-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wonkru is a commercial property and office space provider based in Bergtuin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wonkru-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wood and Laser Creations is a printing services business based in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wood-and-laser-creations-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wood@Ease supplies wooden cupboard doors and components for kitchen and interior design, including solid wooden tops, exposed panels, turned legs, cornices, mouldings and floating shelves for contractors, kitchen designers and interior decorators.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:15-16:15, Fri 07:15-15:00, Sat-Sun Closed'
WHERE slug = 'wood-ease-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woodcentre has supplied wood board products since 1993, stocking melamine boards, high-pressure laminates, veneers, MDF, chipboard, plywood and PVC board, with in-house cutting, edging, and melamine and veneer pressing services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-15:30, Sat-Sun Closed'
WHERE slug = 'woodcentre-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woodgrain Custom Creativ is a furniture and homeware business based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'woodgrain-custom-creativ-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woodhill College is a Curro group primary school teaching Grade 1 to Grade 7 through project-based learning, with Robotics offered throughout the school, classes capped at 25 learners, and aftercare available until 17:30.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-14:30, Fri 07:30-13:00'
WHERE slug = 'woodhill-college-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woodmatrix is a furniture and homeware supplier based in Koedoespoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'woodmatrix-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woodpecker Playgrounds has manufactured and installed custom wooden jungle gyms and outdoor play equipment across Gauteng for over 23 years, offering standard SABS-treated models as well as fully custom-designed units with swings, slides, sand pits and climbing structures.',
    description_enriched_at = datetime('now')
WHERE slug = 'woodpecker-playgrounds-jungle-gyms-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Woolworths store trades from Jubilee Mall in Hammanskraal, on the corner of Jubilee Road and Harry Gwala Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 08:00-18:00, Sat 09:00-18:00, Sun 09:00-15:00'
WHERE slug = 'woolworths-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Woolworths store trades from Kenny Shopping Centre on Lanham Street in Bronkhorstspruit.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 07:30-17:00, Tue-Fri 09:00-17:00, Sat 08:00-15:00, Sun 09:00-14:00'
WHERE slug = 'woolworths-bronkhorstspruit' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Woolworths store trades from Blu Valley Mall, on the corner of Bothrill Avenue and Rooihuiskraal Road in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-blu-valley-mall-the-reeds' AND description_enriched_at IS NULL;

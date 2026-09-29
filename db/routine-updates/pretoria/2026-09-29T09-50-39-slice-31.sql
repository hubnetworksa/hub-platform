-- Description enrichment sweep (job 4) -- slice 31
-- 50 businesses: 32 researched, 18 reworded, 9 with hours found.

UPDATE businesses
SET description = 'Theron''s Meat Products is a family-run meat processing factory shop in Pretoria West, manufacturing sausages, bacon, hams and other smoked meats using traditional wood-smoke methods since 1983, with wholesale pricing open to the public.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 08:00-13:00'
WHERE slug = 'theron-s-meat-products-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thina Group is a business consulting firm operating out of Knoppieslaagte, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'thina-group-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Think Big Marketing is a marketing and advertising business based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'think-big-marketing-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Think Smart Built-In Systems is a specialist supplier and installer of central vacuum systems for homes, offices and commercial buildings in Die Wilgers, offering both dry and wet-and-dry systems from brands such as Drainvac and Hayden Super Vac, plus installation and after-sales support.',
    description_enriched_at = datetime('now')
WHERE slug = 'think-smart-built-in-systems-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thinkroom Consulting is an SME development consulting firm working with African entrepreneurs across more than 30 countries, offering an online training platform, a structured enterprise-acceleration programme and go-to-market strategy services for high-growth businesses, from its Midstream Estate office.',
    description_enriched_at = datetime('now')
WHERE slug = 'thinkroom-consulting-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Third Edition Printing, Branding and Signage is a printing and signage business based in Kilner Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'third-edition-printing-branding-and-signage-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This is not my business!!! is an electronics and appliances business based in Eldo Glen, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'this-is-not-my-business-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thogwa Medicals and Pharmaceuticals is a distributor of medical and pharmaceutical equipment in Tijger Valley, supplying diagnostic and monitoring gear such as blood pressure monitors, stethoscopes and pulse oximeters alongside dental, physiotherapy and veterinary instruments and disposable medical supplies.',
    description_enriched_at = datetime('now')
WHERE slug = 'thogwa-medicals-and-pharmaceuticals-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thoka Properties is an estate agency, established in 2018 and registered with the PPRA, handling sales and lettings of residential, commercial, industrial, retail and agricultural property as well as vacant land across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'thoka-properties-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tholo Group of Companies is a security services provider based in Wapadrand offering alarm systems, armed response and security guard services.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.tholoconsultants.com/", "https://www.procompare.co.za/providers/tholo-group-1"]'
WHERE slug = 'tholo-group-of-companies-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Three38 is a business automation and consulting firm in Midstream Estate that helps businesses simplify operations, improve customer experience and drive growth through strategy sessions aimed at eliminating operational waste.',
    description_enriched_at = datetime('now')
WHERE slug = 'three38-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thrive CFO is a cloud-based accounting and virtual CFO firm serving consultancies, agencies and professional-services businesses with monthly bookkeeping, payroll, tax and financial-advisory services using platforms such as Xero and Syft Analytics.',
    description_enriched_at = datetime('now')
WHERE slug = 'thrive-cfo-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thrive Productions is an industrial supply and manufacturing business based on a plot in Kameeldrift East, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'thrive-productions-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thuba-Aga Renovations is a building and construction renovations business based in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'thuba-aga-renovations-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thulima Event Management is an events and function-venue business operating out of Southdowns Ridge Office Park, Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'thulima-event-management-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thunder Bay Spur is a family-friendly Spur Steak Ranches restaurant in Jubilee Mall, Hammanskraal, serving the chain''s steaks, burgers and ribs alongside vegan and vegetarian options.',
    description_enriched_at = datetime('now')
WHERE slug = 'thunder-bay-spur-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thunder Ridge Spur is a Spur Steak Ranches family restaurant branch in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'thunder-ridge-spur-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thuso Business Consulting is a professional-services firm in Pretoria Central offering accounting, tax, management accounting and business-advisory services, with client accounting work spanning football clubs, schools and sports professionals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00'
WHERE slug = 'thuso-business-consulting-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thuthukani Technology Solutions (Pty) Ltd is part of the Thuthukani ICT holding group, an entirely black-owned and managed South African technology business established in 1998, operating from Midstream Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'thuthukani-technology-solutions-pty-ltd-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ThutoKhumo is a business consulting company based in Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'thutokhumo-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiaan is a Power BI-focused business intelligence company based in Erasmusrand, Pretoria, building interactive reports and visual-analytics dashboards that connect multiple data sources.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.drivatic.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1840147"]'
WHERE slug = 'tiaan-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TianClaassens (Pty) Ltd is an independent business consulting practice in Brooklyn, Pretoria, advising on strategic and risk issues in financing and developing large-scale infrastructure projects, with particular focus on the municipal and social-infrastructure sector.',
    description_enriched_at = datetime('now')
WHERE slug = 'tianclaassens-pty-ltd-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger Food Brands Ltd operates a manufacturing facility in Waltloo as part of Tiger Brands, a major South African food and beverage company known for brands such as Oros, focused on providing affordable, quality nutrition.',
    description_enriched_at = datetime('now')
WHERE slug = 'tiger-food-brands-ltd-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger Graphix & Advertising is a one-stop signage business in Booysens offering graphic design, digital printing, illuminated and 3D perspex signs, vehicle branding, promotional displays and large-format vinyl printing.',
    description_enriched_at = datetime('now')
WHERE slug = 'tiger-graphix-advertising-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tigercubs is a farming and agricultural-services company operating since 2012 across Limpopo, Gauteng, North West and Mpumalanga, supplying animal feeds, fertilisers, seeds, live animals and irrigation equipment alongside technical advisory and training on crop and animal production.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'tigercubs-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tigre Aluminium Profiles Pretoria sells architectural aluminium window and door systems direct to the public from its Waltloo premises.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/p/Tigre-Aluminium-Profiles-Pretoria-100065744792560/"]'
WHERE slug = 'tigre-aluminium-profiles-pretoria-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tileba Pharmacy is a dispensing pharmacy and family clinic in Nina Park Square Shopping Centre, part of the Arrie Nel Pharmacy Group, offering prescription dispensing alongside general family clinic services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:30-18:00, Sun 09:00-17:00'
WHERE slug = 'tileba-pharmacy-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tileba Vleismark is a family-run butchery supplying fresh beef, lamb, pork and chicken alongside boerewors, droewors, biltong and game processing from field to freezer, with braai packs made up for groups of 4, 8 or 16.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-14:00'
WHERE slug = 'tileba-vleismark-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tileba Vleismark is a family-run butchery in Tileba Shopping Centre supplying fresh beef, lamb, pork and chicken alongside boerewors, droewors, biltong and game processing from field to freezer, with braai packs made up for groups of 4, 8 or 16.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-14:00',
    source_urls = '["https://www.worldofmeats.co.za/view/tileba-vleismark-cc", "https://www.brabys.com/za/gauteng/pretoria/tileba/butchers-retail/tileba-meat-market", "http://tilebavleis.co.za/"]'
WHERE slug = 'tileba-vleismark-tileba' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timac AGRO South Africa is a subsidiary of Groupe Roullier supplying agricultural plant-nutrition products including water-soluble and NPK fertilisers, biostimulants and soil conditioners, alongside a smaller range of livestock health supplements.',
    description_enriched_at = datetime('now')
WHERE slug = 'timac-agro-south-africa-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timber Maintenance specialises in caring for wooden decks, windows, garage doors, balustrades, doors, roof structures and pergolas in and around Wapadrand, offering annual and bi-annual preventative treatment as well as roof-structure compliance assessments, with about 15 years in the trade.',
    description_enriched_at = datetime('now')
WHERE slug = 'timber-maintenance-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timber Structures log homes and nutec is a building and construction business specialising in timber log homes and nutec structures, based in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'timber-structures-log-homes-and-nutec-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timberware is a timber supplier in Koedoespoort Industrial serving DIY enthusiasts, builders and artisans with wood sheets, solid timber and PAR timber, plus precision planing, sanding and joining services, and is part of the Bron Joineries family.',
    description_enriched_at = datetime('now')
WHERE slug = 'timberware-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timeless Journey (Pty) Ltd is a creative agency in Amberfield, Centurion, offering graphic design, website design and e-commerce, social-media management and corporate branding and signage.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'timeless-journey-pty-ltd-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timeless Mouldings is an industrial supplier and manufacturer based in Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'timeless-mouldings-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timeless Technologies (JHB) is part of the TimeTech Group, which specialises in thermal-imaging surveillance technology for maritime, outdoor and security applications, based in Willow Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'timeless-technologies-jhb-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tin Man Digital is a digital agency in Waterkloof Glen offering strategy, UX/UI design, software and web development including SaaS products and enterprise system integration, and performance marketing, with clients including major automotive and financial brands.',
    description_enriched_at = datetime('now')
WHERE slug = 'tin-man-digital-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tintingers Inc Attorneys is a law firm in Nieuw Muckleneuk, Pretoria, that has been providing legal services since 1999.',
    description_enriched_at = datetime('now')
WHERE slug = 'tintingers-inc-attorneys-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiny Homes (Pty) Ltd manufactures and delivers prefab, steel-framed, insulated tiny homes from its Centurion showroom, including folding X-Fold units, expandable homes, nature and apple cabins, glamping capsules and safari tents, typically delivered within about 90 days of deposit.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:00, Fri 08:00-13:00'
WHERE slug = 'tiny-homes-pty-ltd-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiny and Chikiza is a building and construction business based in Amandasig, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'tiny-and-chikiza-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tip Top Wendys is an industrial supplier and manufacturing business based in Klerksoord, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tip-top-wendys-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tissue & Toilet Paper Factory Shop is a factory-direct tissue and toilet paper outlet based in Laudium, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tissue-toilet-paper-factory-shop-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tit Bits Bazaar is a books and stationery business based in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tit-bits-bazaar-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Titan Africa is a South African supplier of sublimation and engraving blanks plus printing and engraving equipment, including textile, DTF, eco-solvent and UV printers, laser engravers and heat presses, from its Derdepoort premises.',
    description_enriched_at = datetime('now')
WHERE slug = 'titan-africa-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Titan Ice Computers is a computer and IT services business based in Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'titan-ice-computers-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Titan Reinforcing Steel supplies, cuts, bends, delivers and installs reinforcing steel for the construction and mining industries from Kameeldrift East, Pretoria, also manufacturing welded mesh in-house alongside rod, wire, fencing and construction plastics.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-15:00'
WHERE slug = 'titan-reinforcing-steel-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Titancrete Readymix is a ready-mix concrete and building-construction supplier based at a quarry plot in Donkerhoek, Pretoria East.',
    description_enriched_at = datetime('now')
WHERE slug = 'titancrete-readymix-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Titanium Link Group is a technology company in East Lynne offering data-warehouse and analytics setup, cybersecurity and penetration testing, network-security risk assessments, IT equipment supply and support, and design and installation of radio and TV broadcasting and RF/VSAT systems.',
    description_enriched_at = datetime('now')
WHERE slug = 'titanium-link-group-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Titanium VC 1 (RF) (Pty) Ltd is a business consulting company operating from Southdowns Ridge Office Park, Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'titanium-vc-1-rf-pty-ltd-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tlopo is a construction and general-services company, established in 2002 in Lyttelton, offering architectural design and turnkey building projects, civil and concrete construction, road-works assessment, plumbing and electrical services.',
    description_enriched_at = datetime('now')
WHERE slug = 'tlopo-lyttelton' AND description_enriched_at IS NULL;

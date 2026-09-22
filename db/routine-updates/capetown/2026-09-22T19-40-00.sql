UPDATE businesses
SET description = 'Afrox is a supplier of industrial, medical and specialty gases and welding products, and its Epping branch (Afrox Gas and Gear) sells gas cylinders, welding consumables such as rods, wire and electrodes, and welding/cutting equipment including regulators and torches.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://www.afrox.co.za/shop/en/za/gas"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a branch of CTM, a national tile and sanitaryware retailer, selling tiles, bathroom fittings and accessories from its showroom in Northgate Business Park, Brooklyn.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://www.openhours-southafrica.com/en/cape-town/ctm-paarden-eiland-northgate"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is a long-established commission fresh produce market in Epping, one of the oldest and largest in South Africa, connecting fruit and vegetable producers with wholesale buyers such as retailers, hawkers and hoteliers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 04:00-10:00, Sat 04:00-17:00',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://opening-hours.co.za/0633026/Cape_Town_Market,_Epping"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell operates a distribution facility (Green Park) in Epping Industria; formed in 2000 by the merger of Stellenbosch Farmers'' Winery and Distillers Corporation, the company''s brand portfolio has included Amarula, Bain''s Cape Mountain Whisky, Nederburg, Drostdy-Hof, Durbanville Hills, Jacobsdal and Fleur du Cap.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://esat.sun.ac.za/index.php/Distell"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies'' Cape Town branch, in Northgate Estate, Brooklyn, is part of a distributor of electronic security equipment established in 1946, supplying intruder-detection and alarm systems, access control equipment, and analogue and IP camera systems.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://elvey.co.za/"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite is a Cape Town based manufacturer of semi-custom composite and fibreglass parts for the marine industry, handling everything from design and tooling through to finished production.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://za.linkedin.com/company/hybrid-composite"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a family-owned packaging manufacturer in Ndabeni with an on-site showroom and print & copy shop, hand-making paper carriers and boxes as well as offering short-run printing, vinyl-cut decals, stickers and rubber stamps.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30',
    source_urls = '["https://www.merrypak.co.za/about-us/visit-our-showroom/", "https://www.cybo.com/ZA-biz/merrypak-print", "https://www.merrypak.co.za/about-us/visit-our-print-copy-shop/"]'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare''s Ndabeni site is a facility of the Purina pet care division of Nestle, a multinational pet food company.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/nestle-purina-pet-care/603291", "https://sabusinesslistings.co.za/listings/nestle-purina-petcare-pty-ltd-t-a-pet-products/", "https://en.wikipedia.org/wiki/Nestl%C3%A9_Purina_PetCare"]'
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group is South Africa''s oldest metal recycling company, in operation since 1919, originally founded as Wolfe Barnett''s SA Metal and Machinery Company in Woodstock; its Epping plant is the largest scrap metal processing facility in the country, recycling ferrous and non-ferrous metals bought from industrial, commercial and private sources.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/about-us/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

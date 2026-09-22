UPDATE businesses
SET description = 'Afrox Epping is an industrial and welding gas supplier, stocking gas cylinders for oxygen and other industrial gases, welding consumables such as rods, wire and electrodes, and gas/welding equipment including regulators and cutting torches.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://www.afrox.co.za/shop/en/za/gas"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a tile and sanitaryware retailer in Northgate Business Park, Brooklyn, part of the CTM chain, stocking a range of tiles and bathroom products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://www.ctm.co.za/storefinder"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is a long-established commission fresh produce market in Epping, one of the oldest and largest in South Africa, connecting fruit and vegetable producers with wholesale buyers such as retailers, hawkers and hoteliers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 04:00-10:00, Sat 04:00-17:00',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://opening-hours.co.za/0633026/Cape_Town_Market,_Epping"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell operates a facility in Epping Industria; the company is a producer and marketer of wines, spirits, ciders and ready-to-drinks, with a brand portfolio that has included Amarula, Savanna, Hunter''s Dry and Nederburg.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://en.wikipedia.org/wiki/Distell"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies'' Cape Town branch, in Northgate Estate, Brooklyn, is part of a distributor of electronic security equipment established in 1946, supplying intruder-detection and alarm systems, access control equipment, and analogue and IP camera systems.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://www.hsbd.co.za/supplier.aspx?acc=268"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite is a Cape Town based manufacturer of semi-custom composite and fibreglass parts for industries including marine, oil and gas, automotive, water sports, furniture and military, handling everything from design to tooling and product delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://www.comitescapetown.com/hybrid-composite/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a family-owned packaging manufacturer in Ndabeni, litho printing, silkscreening, embossing, foiling, die-cutting and hand-assembling paper carriers, boxes and custom packaging.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat 08:00-12:30',
    source_urls = '["https://www.merrypak.co.za/about-us/visit-our-showroom/", "https://www.cybo.com/ZA-biz/merrypak-print", "https://www.whodoyou.com/biz/354233/merrypak-cape-town-wc"]'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare''s Ndabeni site is a facility of the global pet food company, part of Nestle''s Purina pet care division, supplying pet foods and related products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/nestle-purina-pet-care/603291", "https://sabusinesslistings.co.za/listings/nestle-purina-petcare-pty-ltd-t-a-pet-products/", "https://en.wikipedia.org/wiki/Nestl%C3%A9_Purina_PetCare"]'
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group is South Africa''s oldest and largest metal recycling company, over a century old, with a steel shredding plant on Christian Avenue in Epping Industria that processes ferrous and non-ferrous scrap metal purchased from industrial, public-sector and private sources.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/about-us/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

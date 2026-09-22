UPDATE businesses
SET description = 'Afrox Epping Gas and Gear supplies industrial, medical and specialty gases -- including LPG, dry ice and food-grade CO2 for beverage dispensing -- along with welding and gas control equipment, as part of the Linde Group''s South African gases and welding network, in Epping.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://www.afrox.co.za/en/contact/location_maps/western_cape/index.html"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is the Brooklyn branch of the CTM tile and bathroom retail chain, operating from the Northgate Business Park alongside other tile and sanitaryware suppliers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://www.ctm.co.za/storefinder"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is the largest and oldest fresh produce market in the Western Cape, trading fruit and vegetables through market agents to registered buyers -- including informal traders and spaza shops across the city -- and is the only privatised fresh produce market in South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 05:00-22:00, Sat 05:00-20:00, Sun Closed',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://www.getaway.co.za/food/food-culture/stories-from-the-floor-of-cape-town-market/"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell Green Park is a beverage bottling and distribution facility in Epping Industria operated by Distell, one of Africa''s leading producers of wines, spirits, ciders and ready-to-drink beverages.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://www.airportproperty.co.za/new-premises-for-distell-in-epping-industrial-park/"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies'' Cape Town branch, based in the Northgate Estate in Brooklyn, distributes electronic security equipment -- including intruder detection, access control, CCTV and fire control systems -- to installers across the region, as part of the Hudaco Group.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://www.hsbd.co.za/supplier.aspx?acc=268"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite designs and manufactures semi-custom composite parts for the marine industry, specialising in super-yacht deck-access equipment, with in-house CAD design, CNC machining and composite curing capability at its Ndabeni workshop.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://hybridcomposite.co.za/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a family-owned packaging manufacturer in Ndabeni, producing paper carrier bags and boxes by hand in small quantities alongside an on-site print and copy shop.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.merrypak.co.za/about-us/visit-our-showroom/", "https://www.cybo.com/ZA-biz/merrypak-print", "https://www.yellosa.co.za/company/181456/merry-pak-and-print"]'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare operates a pet food production and distribution facility in Ndabeni, part of the global Purina pet care business.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/nestle-purina-pet-care/603291", "https://sabusinesslistings.co.za/listings/nestle-purina-petcare-pty-ltd-t-a-pet-products/", "https://craft.co/nestle-purina-pet-care/locations"]'
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group is South Africa''s oldest and largest metal recycling company, processing ferrous and non-ferrous scrap metal at its Epping plant -- the largest of its kind in the country -- and operating its own steel mill producing reinforcing bar for the construction industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/about-us/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

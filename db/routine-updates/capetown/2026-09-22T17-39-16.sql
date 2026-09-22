UPDATE businesses
SET description = 'Afrox is South Africa''s largest supplier of industrial, medical and welding gases, and this Epping Industria branch stocks welding equipment, gas cylinders, regulators, cutting torches and safety accessories for trade and industrial customers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://www.afrox.co.za/shop/en/za/equipment"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a branch of CTM, part of the Italtile group and South Africa''s largest specialist tile and bathroom retailer, stocking tiles, sanitaryware, taps and bathroom fittings in Brooklyn.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://en.wikipedia.org/wiki/Italtile"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is a long-established, statutorily regulated fresh produce market in Epping, one of South Africa''s oldest and largest, where registered agents sell produce delivered by thousands of producers to registered buyers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 04:00-10:00, Sat 04:00-17:00',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://opening-hours.co.za/0633026/Cape_Town_Market,_Epping"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell operates its Green Park Distribution Centre from this Epping Industria site, offering direct delivery and collection of its wine, cider and spirits products to trade customers in the greater Cape Town area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://heycompanies.co.za/0251703/Distell"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies, established in 1946 and a member of the Hudaco Group, distributes electronic security equipment including alarms, CCTV and access control systems, and this Brooklyn branch also provides technical support and installer training.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00',
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://www.hsbd.co.za/supplier.aspx?acc=268"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite designs and manufactures semi-custom composite parts for the marine industry from its Ndabeni workshop, specialising in super yacht deck access equipment and also serving the oil & gas, automotive and water sports sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://www.comitescapetown.com/hybrid-composite/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a family-owned packaging manufacturer with a Ndabeni factory and showroom, producing custom printed boxes, paper carriers and packaging through litho printing, silkscreen, foiling and die-cutting, alongside an on-site copy and print shop.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat 08:00-12:30',
    source_urls = '["https://www.merrypak.co.za/about-us/visit-our-showroom/", "https://www.cybo.com/ZA-biz/merrypak-print", "https://business-service-directory.com/za/listing/merry-pak-andamp-print-cc-996990"]'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare is the Cape Town facility of Nestle Purina PetCare, the global pet food and pet care division of Nestle, based in Ndabeni.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/nestle-purina-pet-care/603291", "https://sabusinesslistings.co.za/listings/nestle-purina-petcare-pty-ltd-t-a-pet-products/", "https://en.wikipedia.org/wiki/Nestl%C3%A9_Purina_PetCare"]'
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group is South Africa''s oldest and largest metal recycling company, purchasing, processing and recycling ferrous and non-ferrous scrap metals from industrial, public and private sources at its Epping site without burning or chemical processing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://za.kompass.com/c/sa-metal-group-pty-ltd/zan145503/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

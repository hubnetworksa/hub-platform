-- Job 4: description enrichment sweep -- 9 businesses (full backlog)
UPDATE businesses
SET description = 'Afrox''s Epping Industria branch supplies industrial, medical and LPG gases, welding products and gas control equipment, operating as part of the Linde Group, one of South Africa''s largest gases and welding suppliers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://www.afrox.co.za/en/contact/location_maps/western_cape/index.html"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a branch of CTM, South Africa''s largest specialist tile and bathroom retailer, stocking a wide range of tiles, wooden flooring and sanitaryware from its Northgate Business Park showroom in Brooklyn.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://www.ctm.co.za/storefinder"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market at Gunners Circle is one of South Africa''s oldest and largest fresh produce markets, connecting thousands of producers with retail buyers, wholesalers and informal traders, and offers secure cold storage including dedicated banana ripening rooms.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 05:00-22:00, Sat 05:00-20:00, Sun Closed',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://www.yep.co.za/biz/store/iyp/15920987_4"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell operates a production and distribution facility for wine, spirits and other beverages at its Bofors Circle site in Epping Industria, one of several major manufacturers based in this industrial area of Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://www.africanadvice.com/1142586/Wineries/Cape_Town/Distell_Ltd/"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies, established in 1946 and a member of the Hudaco Group, distributes electronic security equipment including alarm panels, CCTV, access control and fire detection systems to installers and monitoring companies from its Brooklyn branch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://www.securitysa.com/supplier.aspx?buyersguideid=9&acc=268&p=14"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite is a Cape Town-based manufacturer of semi-custom composite parts, specialising in deck-access equipment for superyachts and serving the marine, oil & gas, automotive and water-sports sectors from its Ndabeni workshop.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://hybridcomposite.co.za/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a family-owned packaging manufacturer with a showroom, factory and print-and-copy shop in Ndabeni, producing litho-printed, silkscreened and die-cut packaging alongside wedding, party and craft supplies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat 08:00-12:30, Sun Closed'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare''s Ndabeni premises serve as an industrial supplier and distribution base in Cape Town for the Purina pet-food and pet-care brand.',
    description_enriched_at = datetime('now')
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group''s Epping plant is the largest scrap-metal processing site of South Africa''s oldest and largest metal recycling company, handling ferrous metals such as iron and steel alongside non-ferrous metals including aluminium, copper and brass.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/about-us/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

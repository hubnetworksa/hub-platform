-- Job 4: description enrichment sweep -- full backlog (9 businesses)
UPDATE businesses
SET description = 'Afrox''s Epping branch, part of South Africa''s largest industrial and medical gas supplier, stocks LPG and industrial gas cylinders plus welding equipment and consumables such as rods, wire and electrodes for trade and industrial customers in Epping Industria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://magicpin.com/south-africa/Cape-Town/Epping-Industria/Other/Afrox-Epping-Gas-And-Gear/store/2431687"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a branch of CTM, the flagship retail brand of the JSE-listed Italtile group, selling tiles, sanitaryware, bathroom accessories and taps to retail and trade customers from its showroom in the Northgate Business Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://www.yep.co.za/biz/store/iyp/5785111_2"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is one of South Africa''s oldest and largest fresh produce markets, over 50 years old, handling deliveries from more than 5,500 producers for sale to some 8,000 registered buyers through cold-storage and banana-ripening facilities in Epping.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 05:00-22:00, Sat 05:00-20:00, Sun Closed',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://www.ctmarket.co.za/about-us/trading/"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell''s Green Park facility on Bofors Circle in Epping Industria serves as a distribution and collection centre for the drinks group''s wine, spirits and cider brands, supporting deliveries across greater Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://www.waze.com/live-map/directions/distell-ltd-greenpark-bofors-cir-0215302200-epping-industria-2,-cape-town?to=place.w.12191157.121649423.13662915"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies'' Cape Town branch, part of the Hudaco Group and trading since 1946, distributes electronic security equipment -- including CCTV, access control and alarm systems -- to accredited security installers and integrators from Northgate Estate in Brooklyn.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://elvey.co.za/"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite is a Cape Town-based manufacturer of semi-custom composite parts for the superyacht industry, founded in 2008 and specialising in deck-access equipment, offering design, tooling and production for yacht builders from its Ndabeni workshop.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://hybridcomposite.co.za/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak is a family-owned packaging manufacturer and retailer based in Ndabeni, trading since 1985, supplying boxes, bags, wrapping paper and party supplies from a showroom that also houses a small cafe and a copy-and-print shop.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat 08:00-12:30, Public Holidays 09:00-13:00',
    source_urls = '["https://www.merrypak.co.za/about-us/visit-our-showroom/", "https://www.cybo.com/ZA-biz/merrypak-print", "https://www.findglocal.com/ZA/Cape-Town/140867599340853/Merrypak"]'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare''s Ndabeni site is an industrial facility for the multinational pet-care company, based in the Ndabeni industrial node of Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group is one of South Africa''s oldest and largest scrap metal recyclers, family-owned since 1919, operating a steel-shredding plant on Christian Avenue in Epping Industria that processes ferrous and non-ferrous scrap for local smelting and export.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/about-us/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

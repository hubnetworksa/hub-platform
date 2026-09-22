UPDATE businesses
SET description = 'Afrox EPPING Gas and Gear is the local branch of Afrox, South Africa''s largest supplier of industrial and specialty gases and a member of the Linde Group, stocking LPG, dry ice and gas control equipment such as regulators, cutting torches and flashback arrestors from its Epping Industria site.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://www.afrox.co.za/shop/en/za/equipment/gas-equipment"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a branch of CTM, South Africa''s biggest specialist tile and bathroom retailer with over 80 stores across South Africa and Africa, stocking tiles, wooden flooring and sanitary ware from its Northgate Business Park showroom in Brooklyn.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://www.ctm.co.za/storefinder"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is one of South Africa''s oldest and largest fresh produce markets, over 50 years old, connecting more than 5,500 producers with over 8,000 registered buyers who purchase fruit and vegetables in bulk from its Gunners Circle premises in Epping.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 05:00-22:00, Sat 05:00-20:00, Sun Closed',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://www.yep.co.za/biz/store/iyp/15920987_4"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell was Africa''s leading producer and marketer of spirits, fine wines, ciders and ready-to-drinks -- with brands including Amarula, Nederburg and Savanna -- before its 2023 acquisition by Heineken; this Bofors Circle site is part of its Epping Industria operations in Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://en.wikipedia.org/wiki/Distell"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies, established in 1946 and now part of the Hudaco Group, is one of Africa''s leading distributors of electronic security equipment -- including CCTV, access control and alarm systems -- serving installers and monitoring companies from its Northgate Estate branch in Brooklyn.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://elvey.co.za/"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite, founded in 2008, designs and manufactures semi-custom composite parts for the marine industry, specialising in super yacht deck-access equipment, with a design and production team bringing over 40 years of combined experience to clients across the marine, oil & gas, automotive, watersports, furniture and military sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://www.comitescapetown.com/hybrid-composite/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a family-owned packaging manufacturer employing around 125 staff, offering litho printing, silkscreening, embossing, foiling, UV varnishing and die-cutting alongside a showroom, copy & print shop and in-house cafe at its Morningside Road premises in Ndabeni.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.merrypak.co.za/about-us/visit-our-showroom/", "https://www.cybo.com/ZA-biz/merrypak-print", "https://www.whodoyou.com/biz/354233/merrypak-cape-town-wc"]'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare operates its Cape Town pet-food and pet-care facility from Bayete Road in Ndabeni, as part of Nestle''s Purina division.',
    description_enriched_at = datetime('now')
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group, South Africa''s oldest and largest metal recycler with over 100 years of operation, runs the country''s largest steel-shredding plant on Christian Avenue in Epping Industria, processing scrap purchased from industrial enterprises, scrap dealers and private individuals at up to 120 tons per hour.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/about-us/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

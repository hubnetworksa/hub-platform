UPDATE businesses
SET description = 'Afrox''s Epping Industria branch, trading as Gas & Gear, supplies industrial, medical and LPG gases together with welding equipment -- regulators, cutting torches, flashback arrestors and consumables -- as part of Afrox''s national network, a member of the Linde Group.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://www.afrox.co.za/en/contact/location_maps/western_cape/index.html"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a branch of CTM, the tile, bathroom and kitchen fixture retail chain founded in 1983 and now part of the Italtile Group, based in Northgate Business Park, Brooklyn.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949", "https://www.ctm.co.za/storefinder"]'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is one of South Africa''s oldest and largest fresh produce markets, trading for over 50 years, where registered market agents sell fresh produce from thousands of producers to buyers on a commission basis.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 04:00-10:00, Sat 04:00-17:00, Sun Closed',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://www.yep.co.za/biz/store/iyp/15920987_4", "https://opening-hours.co.za/0633026/Cape_Town_Market,_Epping"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell''s Green Park facility on Bofors Circle in Epping Industria operates as a distribution centre for the group''s wine, spirits and cider brands.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688", "https://www.waze.com/live-map/directions/distell-ltd-greenpark-bofors-cir-0215302200-epping-industria-2,-cape-town"]'
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies'' Cape Town branch, at Northgate Estate in Brooklyn, distributes electronic security equipment -- intruder detection and alarm systems, CCTV cameras, access control equipment and fire control panels -- as part of Elvey, a national distributor established in 1946 and now part of the Hudaco Group.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://za.linkedin.com/company/elvey-security-technologies"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite designs and manufactures semi-custom composite parts for the marine industry from its Ndabeni workshop, founded in 2008 and specialising in deck-access equipment such as flush deck hatches for superyachts, alongside composite work for other sectors including oil & gas and automotive.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://hybridcomposite.co.za/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a family-owned packaging manufacturer in Ndabeni, producing custom printed packaging, paper carriers and boxes in-house -- litho printing, silkscreening, embossing and die-cutting -- alongside a showroom and print & copy shop.',
    description_enriched_at = datetime('now')
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare is an industrial manufacturing business in Ndabeni, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group, founded in Woodstock in 1919, is South Africa''s oldest metal recycling company and remains family-owned into its fourth generation; its Christian Avenue site in Epping Industria includes a steel shredding plant that reduces scrap metal to reusable fragments at up to 120 tons per hour.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/about-us/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;

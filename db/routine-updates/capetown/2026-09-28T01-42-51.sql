-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)

UPDATE businesses
SET description = '1UP Cash & Carry is a retail and wholesale outlet in Epping selling groceries, beverages and household and personal-care goods, and serves as the chain''s flagship store in the Cape Metro.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun 09:00-12:00',
    source_urls = '["https://za.africabz.com/western-cape/1-up-cash-carry-32410", "https://my-catalogue.co.za/stores/epping/1up-cash-and-carry/127-bofors-circle", "https://1uponline.co.za/about_us", "https://my-catalogue.co.za/stores/cape-town/1up-cash-and-carry/127-bofors-circle-epping-mega-store"]'
WHERE slug = '1up-cash-and-carry-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A J North (Pty) Ltd is a South African manufacturer of toiletries and toothbrushes, producing a range of affordable beauty, haircare and household products for over 100 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://botswana.searchinafrica.com/business/5791738/south-africa/western-cape/cape-town/thornton/thor-cir/toiletries/a-j-north-pty-ltd", "https://www.africanadvice.com/1006113/Toiletries/Cape_Town/A_J_North_(PTY)_Ltd/", "https://sabusinesslistings.co.za/listing/a-j-north-pty-ltd-3/"]'
WHERE slug = 'a-j-north-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTP Cartons & Labels manufactures cartons and packaging labels from its Epping premises, forming part of the CTP Packaging group serving the printing and packaging industry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat-Sun Closed',
    source_urls = '["https://ctppackaging.co.za/", "https://za.kompass.com/c/ctp-cartons-labels-epping/zan1692979/", "https://www.yep.co.za/biz/store/ctp-cartons-labels/325903"]'
WHERE slug = 'ctp-cartons-and-labels-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cabstrut supplies cable management and support systems, including cable ladders, trays and strut channelling, for power, data and industrial reticulation projects, from its Ndabeni branch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cabstrut.co.za/contact", "https://www.africanadvice.com/1067089/Cable_Manufacturers_And_Suppliers/Cape_Town/Cabstrut/", "https://za.linkedin.com/company/cabstrut"]'
WHERE slug = 'cabstrut-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Classic Wholesalers is a trade-only wholesaler in Epping supplying general merchandise, with sister branches in Durban, Johannesburg and Gqeberha.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:45-16:00',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/epping-industria/wholesale/classic-wholesalers", "https://za.africabz.com/western-cape/classic-wholesalers-236743", "https://www.classicwholesalers.co.za/contact/"]'
WHERE slug = 'classic-wholesalers-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A dental practice in Kenridge Centre, Durbanville.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-d-bekker-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Global Components is a motor-spares supplier based in Epping Industria.',
    description_enriched_at = datetime('now')
WHERE slug = 'global-components-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Global Parts is a motor-spares supplier in Epping Industria, supplying replacement parts for passenger vehicles to the trade.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30'
WHERE slug = 'global-parts-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Golden Arrow Bus Services, founded in 1861, is Cape Town''s major bus operator running around 1,300 buses across the metro; its Epping premises serve as the company''s head office.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/epping-industria/bus-services/golden-arrow-bus-services-pty-ltd", "https://www.gabs.co.za/legal/GABS_PAIA_MANUAL.pdf", "https://en.wikipedia.org/wiki/Golden_Arrow_Bus_Services"]'
WHERE slug = 'golden-arrow-bus-services-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Grandi Manufacturing is a metal fabrication and engineering company with more than 50 years of experience, specialising in precision metal processing and custom manufacturing including work for the maritime industry, from its Paarden Eiland facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://grandi.co.za/contact-us/", "https://www.brabys.com/za/western-cape/cape-town/paarden-eiland/engineers-contractors/grandi-manufacturing-cc", "https://grandi.co.za/about-us/"]'
WHERE slug = 'grandi-manufacturing-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Auto Panel Repair Centre is a manufacturer-accredited panel beating and spray painting workshop in Ottery, certified by brands including Audi and Volkswagen and offering accident repairs, paint restorations and ADAS recalibrations, including specialised aluminium panel work.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766", "https://autopanel.co.za/about/"]'
WHERE slug = 'auto-panel-repair-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingdom Kidz Educare Academy is a home-based educare centre in Ottery East offering English-medium care and early learning for children from 3 months to pre-Grade R, spanning creche, toddler and preschool stages in small group classes.',
    description_enriched_at = datetime('now')
WHERE slug = 'kingdom-kidz-educare-academy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Meat Hyper & Deli is a butchery and delicatessen in Portland, Mitchells Plain, offering fresh meat cuts and deli products to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'portlands-meat-hyper-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ronwic Motors Panelbeaters is a SAMBRA-accredited panel beating and spray painting workshop in Ottery East, offering collision repairs, chassis straightening, air-conditioning regassing, insurance claims and rustproofing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-14:00, Sat-Sun Closed',
    source_urls = '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298", "https://panelbeatersdirectory.co.za/listing-maps-hours.php?listings_id=1140", "https://sambra.biz/item/ronwic-motors/"]'
WHERE slug = 'ronwic-motors-panelbeaters-ottery' AND description_enriched_at IS NULL;

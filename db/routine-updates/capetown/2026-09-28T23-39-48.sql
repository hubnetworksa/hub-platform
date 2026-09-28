-- Job 4: description enrichment sweep (4 businesses, full backlog this run)

UPDATE businesses
SET description = 'Ronwic Motors Panelbeaters is a factory-approved panelbeating and spray-painting workshop in Ottery East, offering collision repairs, chassis straightening, air-conditioning regassing, and insurance and private claims work.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298", "https://sambra.biz/item/ronwic-motors/"]'
WHERE slug = 'ronwic-motors-panelbeaters-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Auto Panel Repair Centre is an Audi- and Volkswagen-approved panel beating and spray-painting workshop in Ottery, offering accident repairs, paint restorations, and ADAS recalibrations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766", "https://panelbeatersdirectory.co.za/listing.php?listings_id=26"]'
WHERE slug = 'auto-panel-repair-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingdom Kidz Educare Academy is a family-run daycare and crèche in Ottery, offering an English-medium early learning programme for children from three months to five years old in a home-like setting.',
    description_enriched_at = datetime('now')
WHERE slug = 'kingdom-kidz-educare-academy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Meat Hyper & Deli is a butchery and delicatessen in Portlands, Mitchells Plain, manufacturing quality meat products and serving the community since 1985.',
    description_enriched_at = datetime('now')
WHERE slug = 'portlands-meat-hyper-portland' AND description_enriched_at IS NULL;

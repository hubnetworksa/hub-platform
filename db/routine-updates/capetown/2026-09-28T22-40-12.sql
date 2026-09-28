UPDATE businesses
SET description = 'Auto Panel Repair Centre is a panel beating and spray painting workshop in Ottery, approved by Hollard Insurance to carry out accident and collision repairs on a range of vehicle makes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766", "https://www.panelbeatersezyfind.co.za/western-cape/cape-town/ottery/6917/auto-panel-repair-centre-in-PanelBeaters.aspx"]'
WHERE slug = 'auto-panel-repair-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingdom Kidz Educare Academy is a home-based educare centre in Ottery East offering creche, toddler and pre-Grade R care for children from 3 months to 5 years in a family-oriented setting.',
    description_enriched_at = datetime('now')
WHERE slug = 'kingdom-kidz-educare-academy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Meat Hyper & Deli is a butchery and delicatessen in Portland, Mitchells Plain, trading since 1985 and known for its range of processed meats including polony, viennas, salami, pressed beef and pastrami.',
    description_enriched_at = datetime('now')
WHERE slug = 'portlands-meat-hyper-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ronwic Motors Panelbeaters is a factory-approved panel beating and spray painting workshop in Ottery East offering collision repairs, chassis straightening, air-conditioning regassing, insurance claims work and rustproofing, with approvals from Ford, Mazda, Chevrolet, Opel, Isuzu, TATA and Great Wall Motors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-14:00, Sat-Sun Closed',
    source_urls = '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298", "https://panelbeatersdirectory.co.za/listing-maps-hours.php?listings_id=1140"]'
WHERE slug = 'ronwic-motors-panelbeaters-ottery' AND description_enriched_at IS NULL;

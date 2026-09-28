UPDATE businesses
SET description = 'Auto Panel Repair Centre is a panel-beating and spray-painting workshop on Shawcamp Road in Ottery, handling accident and insurance repair work for local motorists.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766", "https://panelbeatersdirectory.co.za/listing.php?listings_id=26"]'
WHERE slug = 'auto-panel-repair-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingdom Kidz Educare Academy is a home-based educare centre in Ottery East offering full-day care and early learning for children aged three months to five years in a small, family-oriented setting.',
    description_enriched_at = datetime('now')
WHERE slug = 'kingdom-kidz-educare-academy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Meat Hyper & Deli is a long-established butchery and delicatessen on the corner of Silversands and Merrydale Roads in Portland, Mitchells Plain, trading for more than 30 years and offering a range of fresh and processed meat products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://portlandsmeat.co.za/", "https://www.facebook.com/p/Portlands-Meat-Hyper-Deli-100066890422860/", "https://plainsman.co.za/news/2022-03-09-portland-butchery-gutted-by-fire/"]'
WHERE slug = 'portlands-meat-hyper-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ronwic Motors Panelbeaters is a factory-approved panel-beating and spray-painting workshop on Basil Crescent in Ottery East, handling collision repairs, chassis straightening and insurance claims for a range of vehicle brands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-14:00, Sat-Sun Closed',
    source_urls = '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298", "https://panelbeatersdirectory.co.za/listing-maps-hours.php?listings_id=1140"]'
WHERE slug = 'ronwic-motors-panelbeaters-ottery' AND description_enriched_at IS NULL;

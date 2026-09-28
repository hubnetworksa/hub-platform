UPDATE businesses
SET description = 'Auto Panel Repair Centre is a panelbeating and spraypainting workshop in Ottery, Cape Town, carrying out autobody and collision repairs on all vehicle makes with a 3-year workmanship warranty.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766", "https://autopanel.co.za/about/"]'
WHERE slug = 'auto-panel-repair-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingdom Kidz Educare Academy is a daycare and crèche in Ottery East offering an English-medium early learning programme for babies from 3 months through preschoolers up to age 5, spanning crèche, toddler and preschool stages.',
    description_enriched_at = datetime('now')
WHERE slug = 'kingdom-kidz-educare-academy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Meat Hyper & Deli is a butchery and delicatessen in Portland, Mitchells Plain, manufacturing and selling a wide range of beef and chicken deli products -- including polonies, viennas, salami, pastrami and pressed meats -- in bulk since 1985.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://portlandsmeat.co.za/", "https://www.facebook.com/p/Portlands-Meat-Hyper-Deli-100066890422860/", "https://www.worldofmeats.co.za/view/portlands-meat-hyper-and-deli:portlands"]'
WHERE slug = 'portlands-meat-hyper-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ronwic Motors Panelbeaters is a panelbeating and spraypainting workshop in Ottery East handling collision repairs, chassis straightening, repolishes, aircon regassing, rustproofing and insurance claims for all vehicle makes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:30-15:00, Sat-Sun Closed',
    source_urls = '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298", "https://panelbeatersdirectory.co.za/listing-maps-hours.php?listings_id=1140"]'
WHERE slug = 'ronwic-motors-panelbeaters-ottery' AND description_enriched_at IS NULL;

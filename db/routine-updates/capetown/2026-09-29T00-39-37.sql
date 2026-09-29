UPDATE businesses
SET description = 'All Road Tyres is a tyre dealer and reclaimer established in 2001, supplying quality reclaimed tyres to the truck industry from its plant in Killarney Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:45',
    source_urls = '["https://africa.michelin.com/en/auto/dealer-locator/cape-town/all-road-tyres-1148125078", "https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/tyre-dealers/allroad-tyres", "https://www.sayellow.com/view/south-africa/all-road-tyres-in-cape-town"]'
WHERE slug = 'all-road-tyres-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bang K is a modern Asian restaurant with a Thai influence on York Road in Muizenberg, serving dishes such as crispy Thai hake with roasted chilli and tamarind, with a hidden outdoor courtyard offering glimpses of the sea.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/bang-k/", "https://www.eatout.co.za/venue/bang-k/", "https://www.eatout.co.za/article/review-bang-ks-fusion-modern-asian-flavours-muizenberg/"]'
WHERE slug = 'bang-k-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Boxer Dunoon is a discount supermarket at the corner of Potsdam Road and Winning Way in Dunoon, part of the Boxer Superstores chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 08:00-17:00',
    source_urls = '["https://my-catalogue.co.za/stores/dunoon/boxer/corner-of-potsdam-road-m5-winning-way", "https://promotheus.co.za/dunoon/boxer/corner-of-potsdam-road-m5-winning-way", "https://www.tiendeo.co.za/stores/cape-town/cnr-of-potsdam-road-mfive-and-winning-way-dunoon/49811"]'
WHERE slug = 'boxer-dunoon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Brand Collective is a multi-branded fashion and footwear store at Mainstream Mall in Hout Bay, stocking urban streetwear brands for men, women and kids.',
    description_enriched_at = datetime('now')
WHERE slug = 'brand-collective-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Appliances is a long-established appliance store in Montague Gardens selling shop-soiled and scratch-and-dent fridges, freezers, washing machines and tumble dryers with a guarantee, plus repairs to appliances of all makes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/cape-town-appliances-81842", "https://leaderr.co/directory/cape-town-appliances-7449/", "https://capetownappliances.co.za/"]'
WHERE slug = 'cape-town-appliances-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Surfing is a surf school and shop on Victoria Avenue in Hout Bay, founded in 2001 and one of South Africa''s longest-running surf schools, offering surf and SUP lessons, coaching, rentals and retail.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capetownsurfing.com/pages/contact-us", "https://discoverhoutbay.co.za/listing/cape-town-surfing/", "https://capetownsurfing.com/pages/about-us"]'
WHERE slug = 'cape-town-surfing-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cell C is a mobile network store at Westgate Mall in Mitchells Plain, offering phones, SIM cards and mobile contracts.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://www.tiendeo.co.za/stores/mitchells-plain/cell-c-shop--westgate-mall-corner-morgenster-road-and-vanguard-drive/39671", "https://za.africabz.com/western-cape/cell-c-westgate-mall-mitchells-plain-179735", "https://www.westgate.co.za/store/15927/cell-c"]'
WHERE slug = 'cell-c-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Big Bay is a supermarket at Seaside Village Shopping Centre in Big Bay, Bloubergstrand, part of the Checkers chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-20:00, Sat 08:00-20:00, Sun 09:00-20:00',
    source_urls = '["https://southafricafirm.com/western-cape/checkers-big-bay-7672", "https://my-catalogue.co.za/stores/big-bay/checkers/seaside-village-cnr-cormorant-rd-and-otto-du-plessis-dr", "https://www.openhours-southafrica.com/en/cape-town/checkers-big-bay"]'
WHERE slug = 'checkers-big-bay-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Eden on the Bay is a pharmacy and health, beauty and homeware retailer inside Eden on the Bay Mall in Big Bay, Bloubergstrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-pharmacy-eden-on-the-bay-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Seaside Village is a pharmacy and health, beauty and homeware retailer at Seaside Village Shopping Centre in Bloubergstrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-pharmacy-seaside-village-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elda Panelbeaters is a SAMBRA-accredited panel beating and spray-painting workshop in Ladanna, handling both passenger and commercial vehicle body repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/panelbeaters-spraypainters/elda-panelbeaters-pty-ltd", "https://www.africanadvice.com/1089976/Panel_Beaters_And_Spray_Painters/Limpopo/Elda_Panelbeaters_(PTY)_Ltd/", "https://sambra.biz/item/elda-panel-beaters/"]'
WHERE slug = 'elda-panelbeaters-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meetse Civils & Construction is a civil engineering contractor in Ladanna specialising in reinforced concrete work, also trading as Meetse Civils & Concrete Pumps for concrete-pumping and construction-machinery rental services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/meetse-civils-construction/127806", "https://polokwane.infoisinfo.co.za/card/meetse-civils-construction/294415", "https://www.facebook.com/MeetseCivils/"]'
WHERE slug = 'meetse-civils-construction-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Sport is the sport and outdoor-lifestyle retail arm of the Mr Price Group, stocking value-priced sporting apparel, footwear and equipment across major sport codes at its Mall of the North branch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/mr-price-sport", "https://mrpricegroup.com/mr-price-sport/"]'
WHERE slug = 'mr-price-sport-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mugg & Bean is a Famous Brands coffee-shop and restaurant franchise, founded in Cape Town in 1996, known for all-day breakfasts, hearty meals and its famously oversized muffins; this branch trades inside Mall of the North.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://locations.muggandbean.co.za/restaurants-MalloftheNorth-MuggBeanMallofTheNorth", "https://www.tripadvisor.co.za/Restaurant_Review-g312624-d17796337-Reviews-Mugg_Bean_Mall_of_The_North-Polokwane_Limpopo_Province.html", "https://www.muggandbean.co.za/about-us/"]'
WHERE slug = 'mugg-and-bean-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mugg & Bean is a Famous Brands coffee-shop and restaurant franchise, founded in Cape Town in 1996, known for all-day breakfasts, hearty meals and its famously oversized muffins; this branch trades inside The Greenery shopping centre.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://locations.muggandbean.co.za/restaurants-TheGreenery-MuggBeanPolokwaneGreenery", "https://propertywheel.co.za/2023/10/polokwanes-11-000m2-the-greenery-shopping-centre-opens-its-doors/", "https://www.muggandbean.co.za/about-us/"]'
WHERE slug = 'mugg-bean-the-greenery-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MyFace Beauty and Stylist is a full-service beauty salon in Seshego offering hair, nails and skincare treatments, including facials, precision haircuts, manicures/pedicures and bridal makeup.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-17:00'
WHERE slug = 'myface-beauty-and-stylist-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank operates a full-service bank branch at Mall of the North, offering everyday banking, account and card services alongside on-site ATMs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00',
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/nedbank", "https://openhours-southafrica.com/en/polokwane/nedbank-mall-of-the-north"]'
WHERE slug = 'nedbank-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Nedbank ATM is a standalone self-service cash and banking point inside the Food Zone building at Ivy Park Centre, giving Ivy Park shoppers access to withdrawals and other ATM banking services without needing a full branch visit.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-atm-foodzone-ivy-park-ivy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank operates a bank branch at Shop 54 in Savannah Mall, offering everyday banking, account and card services to shoppers in Fauna Park and the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oak Tree Flower Market is a florist and event-flower supplier on Schoeman Street in Polokwane, offering fresh flower arrangements, wreaths, and bridal and event floral services with delivery and in-store collection.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/p/Oak-Tree-Flower-Market-Polokwane-100077211397782/", "https://www.onlineflowershop.co.za/florists/07286-polokwane/fccedfcccieddhadabi.htm", "https://www.procompare.co.za/providers/oak-tree-flower-market-polokwane"]'
WHERE slug = 'oak-tree-flower-market-polokwane-central' AND description_enriched_at IS NULL;

-- Job 4: description enrichment sweep, batch 2 (10 records)

UPDATE businesses
SET description = 'Cash Crusaders Lansdowne is a branch of the secondhand retail and buy-back chain, trading in electronics, appliances, tools and other new and used goods at its store on the corner of Jan Smuts and Lansdowne Road.',
    description_enriched_at = datetime('now'),
    hours = 'Retail Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun/PH 09:00-14:00',
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/corner-jan-smuts-lansdowne-road-lansdowne", "https://yandex.com/maps/?text=Cash%20Crusaders%20Lansdowne%20Cape%20Town", "https://www.tiendeo.co.za/stores/cape-town/cash-crusaders-shop-corner-jan-smuts-lansdowne-road-lansdowne-cape-town/22204"]'
WHERE slug = 'cash-crusaders-lansdowne-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CelluCity at The Point Mall is a mobile phone and accessories retailer in Sea Point, offering the latest smartphones, contracts and device repairs.',
    description_enriched_at = datetime('now')
WHERE slug = 'cellucity-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Checkers is a supermarket branch inside The Point Mall in Sea Point, offering groceries, fresh produce and everyday essentials for shoppers in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'checkers-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Checkers is a supermarket branch inside Gordon''s Bay Shopping Centre on Sir Lowry''s Pass Road, offering groceries, fresh produce and everyday essentials to the Gordon''s Bay community.',
    description_enriched_at = datetime('now'),
    hours = 'Wed 09:00-21:00, all other days 08:00-21:00',
    source_urls = '["https://my-catalogue.co.za/stores/gordon-s-bay/checkers/gordon-s-bay-shopping-centre-sir-lowry-s-pass-road", "https://clicks.co.za/store/Gordons-Bay-/1871", "https://www.checkers.co.za/store-directory-and-leaflets/store-details/82802"]'
WHERE slug = 'checkers-gordons-bay-mall-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Hyper at Helderberg Centre is a large-format supermarket in Somerset West offering a wide range of groceries, fresh produce and household goods for the Helderberg community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-19:00, Sun/PH 09:00-17:00',
    source_urls = '["https://helderbergcentre.com/stores/", "https://my-catalogue.co.za/stores/somerset-west/checkers/helderberg-centre-cnr-de-beers-avenue-forsyth-road", "https://www.checkers.co.za/store-directory-and-leaflets/store-details/39168"]'
WHERE slug = 'checkers-hyper-helderberg-centre-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers LiquorShop at The Point Mall is a liquor store in Sea Point stocking wine, beer and spirits for shoppers at the centre.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 11:00-16:00, Mon 09:00-20:00, Tue 08:30-20:00, Wed-Sat 09:00-20:00',
    source_urls = '["https://south-africa.searchinafrica.com/business/6120949/south-africa/western-cape/cape-town/sea-point/regent-rd/liquor-stores/checkers-liquor-shop", "http://charlesfox.co.za/stockist/checkers-liquorshop-sea-point/", "https://thepointmall.co.za/merchant/checkers-liquor-store-sea-point/"]'
WHERE slug = 'checkers-liquor-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chops Biltong at Riverlands Mall is a biltong and droewors specialist offering a range of beef and game biltong, biltong chips, nuts and dried fruit.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://riverlands.capetown/mall/", "https://www.brabys.com/za/chops-biltong", "https://chopsbiltong.co.za/"]'
WHERE slug = 'chops-biltong-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CityROCK is an indoor rock climbing gym in Paarden Eiland offering bouldering and lead climbing walls, coaching and gear rental for climbers of all levels.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:00, Fri-Sun 09:00-18:00, Public Holidays 09:00-18:00',
    source_urls = '["https://za.africabz.com", "https://absolutelylife.co.za", "https://cityrock.co.za/cape-town/"]'
WHERE slug = 'cityrock-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Clicks pharmacy and health store is located inside Gardens Shopping Centre, offering health, beauty and pharmacy services to the surrounding City Bowl neighbourhoods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:00-17:00, Sun/PH 09:00-15:00'
WHERE slug = 'clicks-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Clicks pharmacy and health store is located at Waterstone Village in Somerset West, offering health, beauty and pharmacy services to the Helderberg community.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 09:00-15:00, Mon-Tue 08:30-19:00, Wed 09:00-19:00, Thu-Fri 08:30-19:00, Sat 08:00-18:00'
WHERE slug = 'clicks-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

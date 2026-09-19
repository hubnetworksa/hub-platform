-- Job 4: description enrichment sweep, checkpoint 2/2 (10 businesses)

UPDATE businesses
SET description = 'Cash Crusaders Lansdowne is a branch of Cash Crusaders, a Cape Town-founded (1996) secondhand retail chain buying, selling and pawning electronics, tools, appliances and other used goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/corner-jan-smuts-lansdowne-road-lansdowne", "https://yandex.com/maps/?text=Cash%20Crusaders%20Lansdowne%20Cape%20Town", "https://www.tiendeo.co.za/stores/cape-town/cash-crusaders-shop-corner-jan-smuts-lansdowne-road-lansdowne-cape-town/22204"]'
WHERE slug = 'cash-crusaders-lansdowne-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CelluCity at The Point is a branch of South Africa''s largest independent Vodacom retailer, established in 1994, selling phones and accessories from major brands and offering in-store cellphone repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://the-hub.cellucity.co.za/locations/", "https://za.africabz.com/western-cape/cellucity-222203", "https://my-catalogue.co.za/retailers/cellucity"]'
WHERE slug = 'cellucity-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers at The Point is a full-range Checkers supermarket in Sea Point, one of the larger Checkers branches in central Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-21:00',
    source_urls = '["https://wanderlog.com/place/details/2002596/checkers-sea-point", "https://www.africanadvice.com/1099752/Supermarkets_And_Grocery_Stores/Cape_Town/Checkers_-_Sea_Point/", "https://thepointmall.co.za/merchant/checkers-sea-point/"]'
WHERE slug = 'checkers-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Gordon''s Bay Mall is a full-range Checkers supermarket serving Gordon''s Bay from the town''s own shopping centre on Sir Lowry''s Pass Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-21:00, Wed 09:00-21:00, Thu-Sun 08:00-21:00',
    source_urls = '["https://my-catalogue.co.za/stores/gordon-s-bay/checkers/gordon-s-bay-shopping-centre-sir-lowry-s-pass-road", "https://clicks.co.za/store/Gordons-Bay-/1871", "https://www.checkers.co.za/store-directory-and-leaflets/store-details/82802"]'
WHERE slug = 'checkers-gordons-bay-mall-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Hyper at Helderberg Centre is a large-format Checkers hypermarket serving Somerset West with a full grocery, fresh produce and household range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-19:00, Sun and public holidays 09:00-17:00',
    source_urls = '["https://helderbergcentre.com/stores/", "https://my-catalogue.co.za/stores/somerset-west/checkers/helderberg-centre-cnr-de-beers-avenue-forsyth-road", "https://www.checkers.co.za/Western-Cape/Somerset-West/store-details/39168"]'
WHERE slug = 'checkers-hyper-helderberg-centre-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers LiquorShop at The Point is a Checkers-branded liquor store in Sea Point stocking beer, wine and spirits.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 11:00-18:00, Mon-Sat 09:00-20:00',
    source_urls = '["https://south-africa.searchinafrica.com/business/6120949/south-africa/western-cape/cape-town/sea-point/regent-rd/liquor-stores/checkers-liquor-shop", "http://charlesfox.co.za/stockist/checkers-liquorshop-sea-point/", "https://thepointmall.co.za/merchant/checkers-liquor-store-sea-point/"]'
WHERE slug = 'checkers-liquor-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chops Biltong at Riverlands Mall sells traditional South African biltong -- beef and game, in slices, sticks and chips -- along with droewors, nuts and dried fruit.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://riverlands.capetown/mall/", "https://www.brabys.com/za/chops-biltong", "https://chopsbiltong.co.za/"]'
WHERE slug = 'chops-biltong-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CityROCK in Paarden Eiland is the biggest indoor climbing gym in the southern hemisphere, with 2,500m2 of lead and top-rope climbing walls, a bouldering area, automatic belay walls, a gear shop and an in-house cafe.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-21:00, Fri-Sun and public holidays 09:00-18:00',
    source_urls = '["https://za.africabz.com", "https://absolutelylife.co.za", "https://cityrock.co.za/cape-town/"]'
WHERE slug = 'cityrock-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks at Gardens Shopping Centre is a Clicks pharmacy and health, beauty and homeware store on Mill Street in Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:00-17:00, Sun and public holidays 09:00-15:00',
    source_urls = '["https://clicks.co.za/store/Gardens-Centre/112", "https://za.africabz.com/western-cape/clicks-23717", "https://www.tiendeo.co.za/stores/cape-town/clicks-gardens-centre-mill-street/27794"]'
WHERE slug = 'clicks-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks at Waterstone Village is a Clicks pharmacy and health, beauty and homeware store serving Somerset West and the Helderberg area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-19:00, Wed 09:00-19:00, Thu-Fri 08:30-19:00, Sat 08:00-18:00, Sun 09:00-15:00',
    source_urls = '["https://www.waterstonevillage.co.za", "https://clicks.co.za/store/Waterstone-Village/163", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=239989"]'
WHERE slug = 'clicks-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

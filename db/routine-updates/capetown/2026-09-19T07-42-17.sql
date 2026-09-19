-- Job 4: description enrichment sweep, batch 2 of 2 (10 records)
UPDATE businesses
SET description = 'Cash Crusaders Lansdowne, at the corner of Jan Smuts and Lansdowne Road, buys and sells second-hand goods including electronics, tools and other used merchandise.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/corner-jan-smuts-lansdowne-road-lansdowne", "https://yandex.com/maps/?text=Cash%20Crusaders%20Lansdowne%20Cape%20Town", "https://cashcrusaders.co.za/locate-a-store/store/13/lansdowne"]'
WHERE slug = 'cash-crusaders-lansdowne-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CelluCity at The Point Mall in Sea Point is a mobile phone and gadget retailer on the mall''s ground floor near Entrance 1, offering smartphones, tablets and accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://the-hub.cellucity.co.za/locations/", "https://za.africabz.com/western-cape/cellucity-222203", "https://thepointmall.co.za/stores-list/cellucity/"]'
WHERE slug = 'cellucity-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers at The Point Mall in Sea Point is one of the larger Checkers supermarkets in Cape Town, on the corner of Regent and St Andrews Roads, stocking groceries, fresh produce and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:00-21:00',
    source_urls = '["https://wanderlog.com/place/details/2002596/checkers-sea-point", "https://www.africanadvice.com/1099752/Supermarkets_And_Grocery_Stores/Cape_Town/Checkers_-_Sea_Point/", "https://thepointmall.co.za/merchant/checkers-sea-point/"]'
WHERE slug = 'checkers-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Gordon''s Bay Mall is a supermarket in the Gordon''s Bay Shopping Centre on Sir Lowry''s Pass Road, stocking groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-21:00, Wed 09:00-21:00, Thu-Sun 08:00-21:00',
    source_urls = '["https://my-catalogue.co.za/stores/gordon-s-bay/checkers/gordon-s-bay-shopping-centre-sir-lowry-s-pass-road", "https://clicks.co.za/store/Gordons-Bay-/1871", "https://gordonsbay.travel/places/checkers-gordons-bay-mall/"]'
WHERE slug = 'checkers-gordons-bay-mall-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Hyper at Helderberg Centre in Somerset West is a large-format hypermarket on the corner of De Beers Avenue and Forsyth Road, stocking groceries, homeware and general merchandise.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-19:00, Sun 09:00-17:00',
    source_urls = '["https://helderbergcentre.com/stores/", "https://my-catalogue.co.za/stores/somerset-west/checkers/helderberg-centre-cnr-de-beers-avenue-forsyth-road", "https://www.checkers.co.za/Western-Cape/Somerset-West/store-details/39168"]'
WHERE slug = 'checkers-hyper-helderberg-centre-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Liquor at The Point Mall in Sea Point sells wine, spirits and beer from its Regent Road premises.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-20:00, Tue 08:30-20:00, Wed-Sat 09:00-20:00, Sun 11:00-16:00',
    source_urls = '["https://south-africa.searchinafrica.com/business/6120949/south-africa/western-cape/cape-town/sea-point/regent-rd/liquor-stores/checkers-liquor-shop", "http://charlesfox.co.za/stockist/checkers-liquorshop-sea-point/", "https://thepointmall.co.za/merchant/checkers-liquor-store-sea-point/"]'
WHERE slug = 'checkers-liquor-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chops Biltong at Riverlands Mall in Observatory sells traditional South African biltong, droewors and dried snacks, part of a family-run biltong business that opened its first shop in Fish Hoek in 1994.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://riverlands.capetown/mall/", "https://www.brabys.com/za/chops-biltong", "https://chopsbiltong.co.za/index.php/about-us/"]'
WHERE slug = 'chops-biltong-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CityROCK in Paarden Eiland is an indoor rock-climbing gym with high walls, bouldering, automatic belay walls, a gear shop and a yoga studio, having relocated from Observatory to Paarden Eiland in 2018.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-21:00, Fri 09:00-18:00, Sat-Sun 10:00-18:00',
    source_urls = '["https://za.africabz.com", "https://absolutelylife.co.za", "https://cityrock.co.za/cape-town/"]'
WHERE slug = 'cityrock-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks at Gardens Centre on Mill Street is a pharmacy and health-and-beauty retailer serving the Gardens area.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Fri 09:00-17:00, Sat 08:00-17:00'
WHERE slug = 'clicks-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks at Waterstone Village, on the corner of Main Road and the R44 in Somerset West, is a pharmacy and health-and-beauty retailer serving the Helderberg area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-19:00, Wed 09:00-19:00, Thu-Fri 08:30-19:00, Sat 08:00-18:00, Sun 09:00-15:00'
WHERE slug = 'clicks-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy and health, beauty and personal care retailer with a store on Voortrekker Road in Bellville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:00-13:00, Sun 09:00-13:00'
WHERE slug = 'clicks-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Die Boer Restaurant Teater is a restaurant and live-music theatre in Durbanville, serving South African and international dishes before performances.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 18:00-23:00, Sun 11:30-18:00'
WHERE slug = 'die-boer-restaurant-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Essential Health Pharmacy Clara Anna is a member of the Essential Health Pharmacy Group, based in the Clara Anna Fontein retail centre in Durbanville.',
    description_enriched_at = datetime('now')
WHERE slug = 'essential-health-pharmacy-clara-anna-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nu-Sight Optometrists is an optometry practice in the Shoprite Centre on Voortrekker Road in Bellville, offering eye tests and eyewear.',
    description_enriched_at = datetime('now')
WHERE slug = 'nu-sight-optometrists-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay is a supermarket inside Tyger Valley Shopping Centre in Bellville, stocking groceries, fresh produce and household goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00',
    source_urls = '["https://vymaps.com/ZA/Pick-N-Pay-Tygervalley-Shopping-Centre-T6485162/", "https://www.yep.co.za/biz/store/iyp/17258575_2", "https://www.tygervalley.co.za/store/pick-n-pay/5041"]'
WHERE slug = 'pick-n-pay-tyger-valley-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Holland Bakery specialises in traditional Dutch-style baked goods, operating from the Old Mutual Building at the corner of Durban and Voortrekker Roads in Bellville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun 09:00-17:00',
    source_urls = '["https://www.tripadvisor.co.za/ShowUserReviews-g312656-d17734290-r689264023-The_Holland_Bakery-Bellville_Western_Cape.html", "https://www.yep.co.za/biz/store/iyp/6552747_2", "https://hollandbakery.co.za/"]'
WHERE slug = 'the-holland-bakery-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tjopshop is a butchery in Parow Centre specialising in free-range Karoo lamb.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-17:00, Sun Closed'
WHERE slug = 'tjopshop-parow-centre-parow' AND description_enriched_at IS NULL;

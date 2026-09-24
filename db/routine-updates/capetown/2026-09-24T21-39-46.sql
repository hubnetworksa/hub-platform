-- Job 4: description enrichment sweep (full backlog of 7 businesses)
UPDATE businesses
SET description = 'Clicks is a South African retail pharmacy chain offering health, beauty and personal care products; this branch operates from 130 Voortrekker Road in Bellville''s CBD.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:00-13:00, Sun 09:00-13:00',
    source_urls = '["https://clicks.co.za/store/Bellville/109", "https://za.africabz.com/western-cape/clicks-pharmacy-41361", "https://my-catalogue.co.za/stores/bellville/clicks/130-voortrekker-road"]'
WHERE slug = 'clicks-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Die Boer Restaurant Teater is a dinner theatre in Durbanville that combines a restaurant with live stage entertainment, serving a meal before each show with service pausing during the performance and resuming afterwards.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1057715-d3600478-Reviews-Die_Boer-Durbanville_Western_Cape.html", "https://dieboer.com/", "https://www.lekkeslaap.co.za/attractions/die-boer-theatre"]'
WHERE slug = 'die-boer-restaurant-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Essential Health Pharmacy Clara Anna is a branch of the Essential Health Pharmacy Group, an independent chain of community pharmacies, serving the Clara Anna Fontein area of Durbanville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-18:00, Fri 08:00-19:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'essential-health-pharmacy-clara-anna-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nu-Sight Optometrists is an optometry practice in Bellville offering eye tests, spectacles and contact lenses from its premises in the Shoprite Centre on Voortrekker Road.',
    description_enriched_at = datetime('now')
WHERE slug = 'nu-sight-optometrists-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay is a supermarket outlet inside Tyger Valley Shopping Centre in Bellville, offering groceries and everyday household essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-tyger-valley-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Holland Bakery is a Dutch bakery that has served Bellville since the 1970s, known for traditional Dutch treats such as stroopwafels and bossche bollen alongside savoury bites like bitterballen.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://www.tripadvisor.co.za/ShowUserReviews-g312656-d17734290-r689264023-The_Holland_Bakery-Bellville_Western_Cape.html", "https://www.yep.co.za/biz/store/iyp/6552747_2", "https://hollandbakery.co.za/"]'
WHERE slug = 'the-holland-bakery-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tjopshop is a butchery inside Parow Centre specialising in free-range Karoo lamb, raised without growth hormones or routine antibiotics, as a registered producer of authentic Karoo lamb.',
    description_enriched_at = datetime('now')
WHERE slug = 'tjopshop-parow-centre-parow' AND description_enriched_at IS NULL;

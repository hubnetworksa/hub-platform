UPDATE businesses
SET description = 'COFI is an all-day restaurant and bar in Savannah Mall, Fauna Park, serving a wide-ranging menu of bakery items, bistro dishes, pizza, burgers, seafood and tapas alongside coffee and cocktails in a lively, music-driven setting with outdoor seating.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:00-02:00',
    source_urls = '["https://za.near-place.com/cofi-savannah-mall-shop-32-savannah-mall-thabo-mbeki-st-polokwane", "https://www.tripadvisor.com/Restaurant_Review-g312624-d28049713-Reviews-Co_fi_Polokwane-Polokwane_Limpopo_Province.html", "https://www.eatout.co.za/venue/co-fi-polokwane/"]'
WHERE slug = 'cofi-fauna-park' AND description_enriched_at IS NULL;

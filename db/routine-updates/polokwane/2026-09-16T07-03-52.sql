UPDATE businesses
SET description = 'COFI is a restaurant and cafe at Savannah Mall in Fauna Park, serving an eclectic menu of bakery items, bistro dishes, seafood, steak and tapas alongside coffee, with outdoor seating and a bar on site.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-02:00',
    source_urls = '["https://za.near-place.com/cofi-savannah-mall-shop-32-savannah-mall-thabo-mbeki-st-polokwane", "https://www.tripadvisor.com/Restaurant_Review-g312624-d28049713-Reviews-Co_fi_Polokwane-Polokwane_Limpopo_Province.html", "https://mindtrip.ai/restaurant/polokwane-limpopo/cofi-savannah-mall/re-bqMgxWRG"]'
WHERE slug = 'cofi-fauna-park' AND description_enriched_at IS NULL;

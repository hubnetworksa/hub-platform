UPDATE businesses
SET description = 'Caffe Rossini is an Italian-style café at Savannah Mall, Fauna Park, known for its authentic Italian coffees alongside breakfasts, paninis, fresh salads and pastas.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:30, Sat-Sun 09:00-13:00',
    source_urls = '["https://www.sa-venues.com/things-to-do/limpopo/caffe-rossini-polokwane/", "https://www.tripadvisor.co.za/Restaurant_Review-g312624-d11768582-Reviews-Caffe_Rossini_s-Polokwane_Limpopo_Province.html", "https://www.sluurpy.co.za/polokwane/restaurant/5035823/caffe-rossini-s"]'
WHERE slug = 'caffe-rossini-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mugg & Bean Savannah Mall is a casual coffee shop and restaurant chain outlet in Fauna Park, serving all-day breakfasts, lunches and specialty coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://locations.muggandbean.co.za/restaurants-SavannahMall-MuggBeanPolokwane", "https://www.tripadvisor.com/Restaurant_Review-g312624-d5821592-Reviews-or60-Mugg_Bean-Polokwane_Limpopo_Province.html", "https://locations.muggandbean.co.za/restaurants-SavannahMall-MuggBeanSavannahMall"]'
WHERE slug = 'mugg-bean-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Savannah Mall is a family restaurant chain outlet in Fauna Park, serving all-day breakfasts and classic diner-style meals.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Mon 07:00-14:30, Tue-Fri 07:00-17:30, Sat 07:00-17:00'
WHERE slug = 'wimpy-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

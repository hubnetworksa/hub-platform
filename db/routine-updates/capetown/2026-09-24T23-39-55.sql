UPDATE businesses
SET description = 'Blasters Family Restaurant is a fully licensed restaurant at the Cape Gate Decor Centre in Brackenfell, serving breakfast, lunch, and dinner in a family-oriented setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Fri 11:00-22:00, Sat 09:00-22:00, Sun 10:00-17:00',
    source_urls = '["https://cape-town-south-africa.bizfax.co.za/blasters-family-restaurant.html", "https://za.polomap.com/cape-town/21450", "https://www.hungryfoody.com/za/blasters-family-restaurant-cape-gate/"]'
WHERE slug = 'blasters-family-restaurant-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers is a supermarket in the Okavango Crossing shopping centre in Kraaifontein, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'checkers-okavango-crossing-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Hyper is a large-format supermarket inside Cape Gate Shopping Centre in Brackenfell, stocking a wide range of groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'checkers-hyper-cape-gate-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Edgars is a department store at N1 City Mall in Goodwood, stocking clothing, footwear, and accessories for the family.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun 09:00-14:00'
WHERE slug = 'edgars-n1-city-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Game is a general merchandise retailer inside Cape Gate Shopping Centre in Brackenfell, selling homeware, electronics, and everyday goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-17:00, Tue-Sun 09:00-20:00',
    source_urls = '["https://www.tiendeo.co.za/stores/brackenfell/game-shop-l-cape-gate-regional-shopping-centre-brackenfell/3458", "https://southafricafirm.com/western-cape/game-cape-gate-32713", "https://my-catalogue.co.za/stores/brackenfell/game/cape-gate-regional-shopping-centre-cnr-de-bron-okavango-road"]'
WHERE slug = 'game-cape-gate-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Virgin Active Okavango is a gym in the Okavango Crossing centre in Kraaifontein, offering fitness equipment and group exercise classes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat 06:00-17:00, Sun 06:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/virgin-active-okavango-81824", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=394765", "https://www.virginactive.co.za/gyms/okavango"]'
WHERE slug = 'virgin-active-okavango-crossing-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths at N1 City Mall in Goodwood stocks clothing and lifestyle products for the family.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:30-17:00, Sun 09:00-17:00'
WHERE slug = 'woolworths-n1-city-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food at Okavango Crossing in Kraaifontein is a supermarket offering the retailer''s range of food, ready meals, and grocery essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 08:00-19:00, Thu 08:00-18:00, Fri 08:00-19:00, Sat 07:30-18:30, Sun 08:00-18:00',
    source_urls = '["https://za.africabz.com/western-cape/woolworths-okavango-crossing-55136", "https://wanderlog.com/place/details/12429512/woolworths-food-okavango-crossing", "https://my-catalogue.co.za/stores/cape-town/woolworths/okavango-crossing-mall-cnr-okavango-langeberg-roads-kraaifontein"]'
WHERE slug = 'woolworths-food-okavango-crossing-kraaifontein' AND description_enriched_at IS NULL;

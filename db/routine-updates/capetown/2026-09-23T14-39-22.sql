UPDATE businesses
SET description = 'Cafe Orca is a seafood restaurant in Melkbosstrand known for West Coast dishes such as Cajun calamari tentacles, peri-peri chicken livers and grilled West Coast sole, with dinner reservations recommended.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Sat 12:00-15:00 & 17:30-20:30, Sun 12:00-15:00, Mon-Tue Closed'
WHERE slug = 'cafe-orca-melkbosstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Table Bay Mall is a pharmacy and health, beauty and homeware retailer inside Table Bay Mall, Bloubergstrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Table Bay Mall is a pharmacy and wellness retailer located inside Table Bay Mall, Bloubergstrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'dis-chem-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Doodles Beachfront Restaurant is a family-friendly restaurant in Bloubergstrand open since 1991, serving seafood, steaks and pizzas with panoramic views of Table Mountain and the Atlantic Ocean, plus an indoor play area for children.',
    description_enriched_at = datetime('now'),
    hours = 'Breakfast 09:00-11:30, Lunch/Dinner 12:00-23:00, daily'
WHERE slug = 'doodles-beachfront-restaurant-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Good Thyme Cafe is an all-day breakfast cafe inside Stodels Garden Centre in Milnerton, serving dishes such as poached eggs and milkshakes, with an outdoor play area and pet-friendly seating.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-17:00, Sun 09:00-17:00'
WHERE slug = 'good-thyme-cafe-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Milnerton is a fried-chicken fast-food restaurant on Koeberg Road in Milnerton, part of the KFC chain, offering dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-milnerton-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ons Huisie is a West Coast-cuisine restaurant in a restored beachfront building in Bloubergstrand dating from the early 1900s, declared a National Monument in 1973.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-22:00'
WHERE slug = 'ons-huisie-restaurant-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Table Bay Mall is a supermarket inside Table Bay Mall, Bloubergstrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Blue Peter Hotel is a historic seafront hotel and restaurant in Bloubergstrand dating back to the late 19th century, known for sundowners and sea views, with two restaurants and two bars overlooking the Atlantic.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-blue-peter-hotel-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Virgin Active Table Bay Mall is a gym and health club inside Table Bay Mall, Bloubergstrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'virgin-active-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

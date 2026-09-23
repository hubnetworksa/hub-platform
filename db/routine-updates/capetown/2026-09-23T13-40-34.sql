UPDATE businesses
SET description = 'Cafe Orca is a seafood restaurant on Melkbosstrand''s Beach Road, specialising in local mussels, calamari and freshly caught line fish, with a discounted two-course seafood lunch special on weekdays.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Sat 12:00-15:00 & 17:30-20:30, Sun 12:00-15:30, Mon-Tue Closed',
    source_urls = '["https://www.cafeorca.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g667022-d2415694-Reviews-Cafe_Orca-Melkbosstrand_Western_Cape.html", "https://www.eatout.co.za/venue/cafe-orca/"]'
WHERE slug = 'cafe-orca-melkbosstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Table Bay Mall is a pharmacy, health and beauty store branch inside Table Bay Mall in Bloubergstrand, offering a pharmacy dispensary alongside health, beauty and wellness products.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Table Bay Mall is a pharmacy inside Table Bay Mall in Bloubergstrand stocking pharmaceuticals, vitamins, skincare, baby care and beauty products, with an in-store clinic offering health services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-18:00'
WHERE slug = 'dis-chem-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Doodles Beachfront Restaurant has served Bloubergstrand since 1991, offering an extensive menu of seafood, steaks, pizzas and vegetarian options with panoramic views of Table Mountain and the Atlantic Ocean, plus an indoor play area for children.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-23:00',
    source_urls = '["https://doodles.co.za/", "https://www.capetownwithkids.com/places/doodles-beachfront/", "https://restauranthub.co/listings/doodles-beachfront/"]'
WHERE slug = 'doodles-beachfront-restaurant-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Good Thyme Cafe is a plant-nursery cafe set inside the Stodels Garden Centre complex in Milnerton, serving breakfast, lunch and dinner with a deck overlooking the outdoor plant displays and a kids'' play area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-17:00, Sun 09:00-17:00',
    source_urls = '["https://www.facebook.com/goodthymecafe/", "https://www.tripadvisor.com/Restaurant_Review-g312665-d19240618-Reviews-Good_Thyme_Cafe-Milnerton_Western_Cape.html", "https://www.capetownwithkids.com/good-thyme-cafe-milnerton/"]'
WHERE slug = 'good-thyme-cafe-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Milnerton is a branch of the fast-food chicken chain on Koeberg Road, serving the Milnerton area with dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 07:00-23:00, Fri-Sat 07:00-00:00'
WHERE slug = 'kfc-milnerton-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ons Huisie is a heritage-listed restaurant in a beach cottage dating to the early 1900s, declared a National Monument in 1973, serving traditional West Coast cuisine on the Bloubergstrand shoreline.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-22:00',
    source_urls = '["https://onshuisie.co.za/", "https://www.capetownwithkids.com/ons-huisie-restaurant-bloubergstrand/", "https://www.eatout.co.za/venue/ons-huisie/", "https://sahistory.org.za/place/ons-huisie-bloubergstrand-cape-town"]'
WHERE slug = 'ons-huisie-restaurant-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Table Bay Mall is a full-line supermarket branch inside Table Bay Mall in Bloubergstrand, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Blue Peter Hotel is one of Bloubergstrand''s oldest hospitality sites, tracing back to the late 19th century and taking its current name in 1949 as it became known for seafood dining with sea views.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://bluepeter.co.za/enquire-now/", "https://redplanet.travel/hub/The-Blue-Peter-Hotel-8-Popham-St-Bloubergstrand-Cape-Town-7441-South-Africa", "https://www.blaauwberg.net/history/history_blue_peter.php"]'
WHERE slug = 'the-blue-peter-hotel-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Virgin Active Table Bay Mall is a full-service health club in Bloubergstrand offering cardio and weight-training zones, a swimming pool, yoga and group classes, plus personal training and biokinetics services.',
    description_enriched_at = datetime('now')
WHERE slug = 'virgin-active-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

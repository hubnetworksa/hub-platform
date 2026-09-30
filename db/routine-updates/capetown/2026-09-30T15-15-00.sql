UPDATE businesses
SET description = 'OK Furniture Gugulethu is a furniture and homeware retailer trading inside Gugulethu Square.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-furniture-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Cell Makhaza is a mobile phone and accessories retailer trading inside Makhaza Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 08:30-15:30, Sun 09:00-13:00'
WHERE slug = 'pep-cell-makhaza-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Makhaza is a supermarket trading inside Makhaza Shopping Centre, with an attached liquor shop.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 08:00-16:00'
WHERE slug = 'shoprite-makhaza-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siki''s Koffee Kafe is an independent coffee shop in Khayelitsha''s Village 1 South serving its own signature-blend coffee and home-baked muffins, and doubling as a community hub for local entrepreneurs and creatives with free WiFi.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g2427234-d14169358-Reviews-Siki_s_Koffee_Kafe-Khayelitsha_Western_Cape.html", "https://www.facebook.com/SikisKoffeeKafe/", "https://www.foodformzansi.co.za/siki-is-bringing-coffee-culture-to-the-kasi/"]'
WHERE slug = 'sikis-koffee-kafe-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths is a South African fashion and homeware retailer, with this branch trading inside Gugulethu Square.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun 09:00-16:00'
WHERE slug = 'truworths-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vodacom Shop Express Gugulethu is a mobile network retailer selling Vodacom contracts, airtime and devices, trading inside Gugulethu Square.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-17:00, Tue-Fri 09:00-18:00, Sat 09:00-14:00'
WHERE slug = 'vodacom-shop-express-gugulethu-gugulethu' AND description_enriched_at IS NULL;

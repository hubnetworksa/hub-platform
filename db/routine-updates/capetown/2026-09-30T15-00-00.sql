UPDATE businesses
SET description = 'Ackermans is a South African value fashion retailer selling clothing, footwear and homeware for the whole family, with this branch trading inside Gugulethu Square.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun 09:00-14:00'
WHERE slug = 'ackermans-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ackermans is a South African value fashion retailer selling clothing, footwear and homeware for the whole family, with this branch trading inside Makhaza Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 08:30-15:00, Sun 09:00-14:00'
WHERE slug = 'ackermans-makhaza-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beta-Kem Pharmacy is an independent pharmacy trading inside Station Plaza in Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'beta-kem-pharmacy-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cashbuild Makhaza is a building materials and hardware retailer inside Makhaza Shopping Centre, stocking building supplies and home-improvement products and offering services including free local delivery, glass cutting, and plan reading and costing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-16:00, Sun 08:00-14:00'
WHERE slug = 'cashbuild-makhaza-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Makhaza is a health, beauty and pharmacy retailer inside Makhaza Shopping Centre, with an in-store dispensing pharmacy.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 09:00-17:00, Thu-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-14:00'
WHERE slug = 'clicks-makhaza-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dalmans Discount Hardware is a hardware store on the corner of 10th Avenue and Bravo Street in Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'dalmans-discount-hardware-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Foschini is a South African fashion retailer selling clothing, footwear and accessories, trading inside Gugulethu Square.',
    description_enriched_at = datetime('now')
WHERE slug = 'foschini-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Gugulethu Square is a branch of the fast-food chain serving fried chicken, burgers and other quick-service meals, trading inside Gugulethu Square.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 06:00-22:00'
WHERE slug = 'kfc-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mitchells Plain Oral Health Centre is a public dental and oral health facility operated by the Western Cape Department of Health, located within the Melomed Mitchells Plain building on Symphony Walk.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00'
WHERE slug = 'mitchells-plain-oral-health-centre-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price is a South African value fashion and homeware retailer, with this branch trading inside Gugulethu Square.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed'
WHERE slug = 'mr-price-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

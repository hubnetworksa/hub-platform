-- Job 4: description enrichment sweep
UPDATE businesses
SET description = 'Goldies Deli is a kosher deli and market in Sea Point serving breakfast, sandwiches, salads and fresh-baked pastries, along with kosher classics such as kichel, herring and hummus with fresh rye and sourdough bread, and has been operating since 1992.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-18:00, Fri 08:30-16:00, Sun 08:30-15:00',
    source_urls = '["https://www.eatout.co.za/venue/goldies-deli/", "https://www.yep.co.za/biz/store/goldies-deli/287188", "https://www.facebook.com/p/Goldies-Deli-Market-100063521115116/"]'
WHERE slug = 'goldies-deli-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stud. The Burger Shop is a burger restaurant in Sea Point, part of a small chain with branches elsewhere in the Western Cape, serving burgers made from high-quality ingredients including a fully plant-based option.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 12:00-22:00, Fri-Sat 12:00-00:00, Sun 12:00-22:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g15134971-d25180343-Reviews-Stud-Sea_Point_Western_Cape.html", "https://www.foodandhome.co.za/entertaining/stud-the-burger-shop-sea-point", "https://www.ubereats.com/za/store/stud-the-burger-shop-sea-point/1rJF4bRORe2q2sHtu3A5pA", "https://www.studtheburgershop.co.za/branches"]'
WHERE slug = 'stud-the-burger-shop-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Walmer Estate Primary School is a public primary school in Walmer Estate, Cape Town, with roughly 280 learners and a staff of nine teachers, classified as a Quintile 5 fee-paying school.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/walmer-estate-primary-school/", "https://www.school-register.co.za/school/walmer-estate-primary-school/", "https://www.schools4sa.co.za/school-profile/walmer-estate-prim/"]'
WHERE slug = 'walmer-estate-primary-school-walmer-estate' AND description_enriched_at IS NULL;

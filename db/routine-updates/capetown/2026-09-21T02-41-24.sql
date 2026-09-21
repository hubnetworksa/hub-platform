-- Job 4: description enrichment sweep, batch 1 of 2 (records 1-10)
UPDATE businesses
SET description = 'BarStaurant is a family-friendly restaurant and bar occupying the historic Glencairn Hotel in Glencairn, with sea-view dining, a children''s play area, and separate woodfired and sushi kitchens alongside its main menu.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 08:00-20:00, Sun-Mon 08:00-17:00'
WHERE slug = 'barstaurant-glencairn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Blended Health Cafe & Catering is a plant-based cafe inside the EAT.SURF.YOGA Lifestyle Centre in Glencairn, serving a mostly vegan breakfast, lunch and tea menu alongside fresh juices and smoothies, and providing catering for weddings, corporate functions and private events since 2014.',
    description_enriched_at = datetime('now')
WHERE slug = 'blended-health-cafe-and-catering-glencairn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clovelly Country Club is an 18-hole golf course established in 1932 in the Silvermine Valley near Fish Hoek, with fairways routed among coastal sand dunes and water hazards fed by the Silvermine River, making it one of the oldest golf clubs in South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://clovellygolfclub.co.za/contact/", "https://www.leadingcourses.com/clubs/africa+south-africa+western-cape/clovelly-country-club", "https://www.top100golfcourses.com/golf-course/clovelly"]'
WHERE slug = 'clovelly-country-club-clovelly' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dixies Restaurant and Pub is a long-standing seafood, pizza and grill restaurant on the False Bay coastline near Simon''s Town, with indoor and outdoor seating overlooking the water and an extensive wine list.',
    description_enriched_at = datetime('now')
WHERE slug = 'dixies-restaurant-and-pub-glencairn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Minimark Summer Greens is a neighbourhood convenience store in Summer Greens offering everyday grocery essentials alongside in-store butchery and bakery counters.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-minimark-summer-greens-summer-greens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Old Cape Wine Shop is a boutique wine store at Imhoff Farm in Kommetjie, stocking a curated selection of close to 1,000 bottles spanning a wide range of Cape wine regions and cultivars.',
    description_enriched_at = datetime('now')
WHERE slug = 'old-cape-wine-shop-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA Table View is a stationery, art and craft supply store inside Tableview Shopping Centre, stocking fine art materials, scrapbooking and craft supplies, student learning guides and general office supplies.',
    description_enriched_at = datetime('now')
WHERE slug = 'pna-table-view-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Parklands Piazza Pharmacy is a pharmacy in the Piazza Centre on Parklands Main Road, Parklands, providing dispensing and everyday health and wellness services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'parklands-piazza-pharmacy-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Tableview is a supermarket branch of the retail chain inside Tableview Shopping Centre in Table View, offering fresh produce and general groceries on the corner of Blaauwberg and Otto du Plessis roads.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-tableview-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pisces Divers is a PADI Five Star IDC dive centre in Simon''s Town, operating for around 20 years and offering the full range of PADI training from Discover Scuba to Instructor level, plus equipment rental, sales and servicing, and boat dives to nearby wreck and reef sites.',
    description_enriched_at = datetime('now')
WHERE slug = 'pisces-divers-simons-town' AND description_enriched_at IS NULL;

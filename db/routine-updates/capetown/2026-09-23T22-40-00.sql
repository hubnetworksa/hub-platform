UPDATE businesses
SET description = 'Eastlake Barber Shop is a barbershop inside Eastlake Shopping Centre in Marina Da Gama, offering men''s haircuts, beard trims, head shaves and hot towel shaves.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 08:00-15:00'
WHERE slug = 'eastlake-barber-shop-marina-da-gama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nonny''s Bakery & Cafe is a small township bakery and cafe on Masiphumelele''s Main Road, open since 2012 and serving fresh-baked cakes, muffins and light lunches such as pies, stews, toasted sandwiches and burgers, with garden seating out back.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capepointroute.co.za/blog/attraction/nonnys-bakery-and-cafe-in-masi/", "https://masicorp.wordpress.com/2013/04/10/nonnys-bakery-and-cafe-one-of-masiphumeleles-newest-small-businesses/", "https://medium.com/@K2Share/today-we-are-going-to-tell-you-about-nonnys-bakery-caf%C3%A9-which-the-ambassadors-of-knowledge2share-c42dad79ac52"]'
WHERE slug = 'nonnys-bakery-cafe-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Civic Centre is a community hall on the corner of Carina Close and Oakley Place in Ocean View, available for hire for functions and community gatherings.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-view-civic-centre-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Clinic is a district-level public health facility on Carina Close in Ocean View, providing outpatient care, emergency services and specialist referrals to the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-view-clinic-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shin Thai Asian Kitchen is a Thai and sushi restaurant inside Eastlake Shopping Centre in Marina Da Gama, open for dinner seven nights a week with takeaway available and a bring-your-own-wine policy.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d6032287-Reviews-Shin_Thai_Asian_Kitchen-Muizenberg_Western_Cape.html", "https://www.dining-out.co.za/md-menu/Shin-Thai-Asian-Kitchen-Marina-Da-Gama/4353", "https://www.mrdfood.com/food-delivery/restaurant/shin-thai-asian-kitchen-sushi-muizenberg/17103"]'
WHERE slug = 'shin-thai-asian-kitchen-marina-da-gama' AND description_enriched_at IS NULL;

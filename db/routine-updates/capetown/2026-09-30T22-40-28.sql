UPDATE businesses
SET description = 'Blue Downs Clinic is a City of Cape Town public health clinic on Bentley Street offering family planning, immunisation and vaccination services, HIV testing and treatment (including ARVs), and TB treatment to the Blue Downs community.',
    description_enriched_at = datetime('now')
WHERE slug = 'blue-downs-clinic-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy, health and beauty retailer with a store inside Blue Downs Shopping Centre, offering a full in-store pharmacy alongside its usual retail range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-18:00, Wed 09:00-18:00, Thu-Fri 08:30-18:00, Sat 08:00-16:00, Sun 09:00-14:00'
WHERE slug = 'clicks-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Domino''s Pizza is a pizza delivery and takeaway outlet operating from Blue Downs Shopping Centre, part of the national Domino''s Pizza chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'dominos-pizza-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC is a fried chicken and fast-food restaurant operating from Blue Downs Shopping Centre, part of the national KFC chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medirite Pharmacy is a pharmacy and health store operating from Blue Downs Shopping Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'medirite-pharmacy-blue-downs' AND description_enriched_at IS NULL;

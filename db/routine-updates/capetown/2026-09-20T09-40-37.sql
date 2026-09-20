UPDATE businesses
SET description = 'Empire Cafe is a breakfast and lunch spot on York Road in Muizenberg, known for its organic coffee, an ever-changing menu, and sea-view balcony seating in a converted vintage building.',
    description_enriched_at = datetime('now')
WHERE slug = 'empire-cafe-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fish Hoek Fisheries is a takeaway shop on Main Road in Fish Hoek known for its freshly made fish and chips, including hake, calamari and prawns.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Thu 07:00-20:00, Fri Closed, Sat 07:00-20:00, Sun-Mon Closed'
WHERE slug = 'fish-hoek-fisheries-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Marhaba Khan''s Take Aways is a takeaway outlet inside Delft Mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'marhaba-khans-take-aways-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Furniture is a furniture and homeware retailer inside Delft Mall, part of the OK Furniture chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-furniture-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Cell is a mobile phone and accessories retailer inside Delft Mall, part of the PEP Cell chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-cell-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simon''s Town Boat Company runs boat-based eco cruises from the Town Pier in Simon''s Town, taking visitors past the Boulders penguin colony, a seal colony at Partridge Point and along the cliffs toward Cape Point, with whale and dolphin sightings in season.',
    description_enriched_at = datetime('now')
WHERE slug = 'simons-town-boat-company-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sleepmasters is a bedding and furniture retailer inside Delft Mall, part of the Sleepmasters chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'sleepmasters-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Surf Emporium is a surf school and shop at Surfers Corner in Muizenberg, offering accredited surfing and stand-up paddleboarding lessons for all skill levels alongside equipment rental and retail.',
    description_enriched_at = datetime('now')
WHERE slug = 'surf-emporium-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Corner Surf Shop is a surf shop on Main Road in Muizenberg, trading since 1971 and considered Africa''s oldest surf shop, with a small museum of vintage surfboards and South Africa''s first surf-report line.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:30-17:30'
WHERE slug = 'the-corner-surf-shop-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Lighthouse Cafe is a French Provencal-style coastal cafe on St Georges Street in Simon''s Town serving breakfast, brunch, lunch and dinner.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-lighthouse-cafe-simons-town' AND description_enriched_at IS NULL;

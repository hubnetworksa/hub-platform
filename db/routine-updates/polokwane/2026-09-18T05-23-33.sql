UPDATE businesses
SET description = 'Komatsu Southern Africa''s Polokwane branch, on Yster Street in Ladanna, supplies and services heavy earthmoving equipment -- including dozers, excavators, wheel loaders, graders, and rigid and articulated dump trucks -- for the region''s mining and construction industries.',
    description_enriched_at = datetime('now')
WHERE slug = 'komatsu-southern-africa-ladanna' AND description_enriched_at IS NULL;

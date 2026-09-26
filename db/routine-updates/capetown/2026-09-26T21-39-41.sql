UPDATE businesses
SET description = 'Kleinberg Primary School is a primary school serving the Ocean View community in Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'kleinberg-primary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masiphumelele High School is a secondary school serving the Masiphumelele community in Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'masiphumelele-high-school-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Secondary School is a secondary school serving the Ocean View community in Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-view-secondary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukhanyo Primary School is a primary school serving the Masiphumelele community in Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'ukhanyo-primary-school-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Coffee Station & Bakery is a coffee shop and bakery inside The Village Hub in Scarborough, serving fresh coffee and freshly baked pastries such as croissants and muffins from early morning.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-coffee-station-and-bakery-scarborough' AND description_enriched_at IS NULL;

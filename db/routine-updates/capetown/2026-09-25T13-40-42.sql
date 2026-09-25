-- Job 4: description enrichment sweep (7 businesses, full backlog this run)

UPDATE businesses
SET description = 'Boxer Superstores Philippi is a supermarket inside The Junxion Mall in Philippi East, stocking everyday groceries and household essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'boxer-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FreshStop Delft is a forecourt convenience store operating at the Caltex service station on the corner of Main Road and Vuurlelie Crescent in Roosendal, Delft, offering quick meals, coffee and grocery essentials for motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'freshstop-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Wetton is a fried chicken and fast-food outlet inside Lansdowne Corner Shopping Centre in Lansdowne.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-wetton-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Delft is a drive-thru fast-food restaurant inside Delft Mall, serving the chain''s usual burger, chicken and breakfast menu to the Delft area.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:00-23:00'
WHERE slug = 'mcdonalds-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s The Junxion is a drive-thru fast-food restaurant inside The Junxion Mall, serving the chain''s usual burger, chicken and breakfast menu to the Philippi area.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:00-21:00'
WHERE slug = 'mcdonalds-the-junxion-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Family Philippi is a supermarket inside The Junxion Mall in Philippi East, stocking groceries and household essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-family-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is a supermarket inside Delft Mall, Delft, stocking groceries and household essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00'
WHERE slug = 'shoprite-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Seshego Circle is a McDonald''s restaurant that opened at Seshego Circle Shopping Centre in September 2026, bringing the fast-food chain''s dine-in and drive-thru service to Seshego for the first time with a community launch event.',
    description_enriched_at = datetime('now')
WHERE slug = 'mcdonalds-seshego-circle-seshego' AND description_enriched_at IS NULL;

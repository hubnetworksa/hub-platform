UPDATE businesses
SET description = 'Woolworths Brackenfell Corner is a Woolworths supermarket inside Brackenfell Corner Shopping Centre in Brackenfell.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-brackenfell-corner-brackenfell' AND description_enriched_at IS NULL;

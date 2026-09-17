UPDATE businesses
SET description = 'FNB Platinum Park is a bank branch located inside Platinum Park Shopping Centre in Bendor Park, offering everyday retail banking services to the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'fnb-platinum-park-bendor-park' AND description_enriched_at IS NULL;

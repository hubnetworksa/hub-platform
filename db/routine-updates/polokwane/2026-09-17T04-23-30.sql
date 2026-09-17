UPDATE businesses
SET description = 'TOPS at SPAR Paledi is a liquor store inside Paledi Mall in Mankweng, stocking beer, wine and spirits.',
    description_enriched_at = datetime('now')
WHERE slug = 'tops-at-spar-paledi-mankweng' AND description_enriched_at IS NULL;

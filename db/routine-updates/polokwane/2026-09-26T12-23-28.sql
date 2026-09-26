UPDATE businesses
SET description = 'A standalone FNB automated teller machine at Cycad Centre in Bendor Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'fnb-atm-cycad-centre-bendor-park' AND description_enriched_at IS NULL;

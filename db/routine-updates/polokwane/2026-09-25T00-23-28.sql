UPDATE businesses
SET description = 'A standalone Absa ATM located within Cycad Centre, Bendor Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'absa-atm-cycad-centre-bendor-park' AND description_enriched_at IS NULL;

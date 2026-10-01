UPDATE businesses
SET description = 'African Bank Seshego Circle is a bank branch inside the Seshego Circle Shopping Centre on Ditlou Street, serving banking customers in Seshego, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'african-bank-seshego-circle-seshego' AND description_enriched_at IS NULL;

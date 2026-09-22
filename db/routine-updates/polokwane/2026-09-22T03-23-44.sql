UPDATE businesses
SET description = 'Absa Bank Seshego is a bank branch on Kwena Moloto Street in Seshego, offering everyday banking, ATM and teller services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'absa-bank-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seshego Medical Depot is a pharmaceutical wholesaler and distributor on Main Road in Seshego, supplying medical and pharmaceutical stock to healthcare providers in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'seshego-medical-depot-seshego' AND description_enriched_at IS NULL;

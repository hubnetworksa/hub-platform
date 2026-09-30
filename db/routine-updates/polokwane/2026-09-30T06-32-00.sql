-- Job 4: description enrichment sweep, checkpoint 2 of 2 (records 11-15)
UPDATE businesses
SET description = 'Pick n Pay Qualisave Limpopo Mall is a Pick n Pay supermarket trading inside Limpopo Mall in Polokwane Central, stocking groceries, fresh produce and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-qualisave-limpopo-mall-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prime Spine is a Bendor chiropractic practice treating sport-related injuries, headaches, neck and back pain, neurological pain and paediatric ailments.',
    description_enriched_at = datetime('now')
WHERE slug = 'prime-spine-chiropractic-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Polokwane is a full-service branch on Landdros Mare Street in the CBD, offering everyday banking, loans and business banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:30, Sat 08:30-11:00, Sun Closed',
    source_urls = '["https://www.callupcontact.com/b/Banks/Standard_Bank_Polokwane/41614", "https://bankcodesfinder.com/south-africa-bank-branch-codes/standard_bank_of_s_a_ltd/polokwane", "https://www.openhours-southafrica.com/en/polokwane/standard-bank-polokwane-branch"]'
WHERE slug = 'standard-bank-polokwane-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers is a flame-grilled burger and chicken outlet trading from the Engen Greycorp filling station forecourt on Grobler Street in the CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'steers-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths Limpopo Mall is a Truworths fashion and clothing store trading from Shop 37 inside Limpopo Mall on Rissik Street.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-20:00, Sun Closed'
WHERE slug = 'truworths-limpopo-mall-polokwane-central' AND description_enriched_at IS NULL;

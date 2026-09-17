UPDATE businesses
SET description = 'A Capitec Bank branch inside Seshego Circle Centre, offering everyday retail banking services to the Seshego community.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-seshego-circle-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A dental surgery in Seshego Circle Centre offering general and cosmetic dental treatment, with an emphasis on personalised, stress-free patient care.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.near-place.com/dr-kgadi-mailula-dental-surgery-17c-seshego-circle-centre-seshego-b", "https://b2bhint.com/en/company/za/dr-kgadi-mailula-dental-surgery--K2016112177", "https://www.africanadvice.com/1448239/Dental_Practitioners/Limpopo/Dentist_in_Polokwane_(Dr_Kgadi_Mailula_Dental)/", "https://www.cylex.net.za/company/dr-kgadi-mailula-dental-23685840.html"]'
WHERE slug = 'dr-kgadi-mailula-dental-surgery-seshego' AND description_enriched_at IS NULL;

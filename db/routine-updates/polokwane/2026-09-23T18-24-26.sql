UPDATE businesses
SET description = 'Cure-O-Pharm is an independent pharmacy in Polokwane Central trading as part of The Local Choice Group of Pharmacies, offering dispensing and general pharmacy services on Thabo Mbeki Street.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-20:00, Sat 08:00-17:00, Sun Closed',
    source_urls = '["https://thelocalchoice.co.za/cure-o-pharm/", "https://nationalbusinesspages.co.za/business-directory/10074/cure-o-pharm/", "https://opening-hours.co.za/01189016/The_Local_Choice_Pharmacy_Cure-O-Pharm"]'
WHERE slug = 'cure-o-pharm-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TPM Attorneys Inc is a Polokwane commercial and civil litigation practice based in the Thabakgolo Building on Landdros Mare Street, handling business and company law, family and matrimonial law, labour law, debt collection, and cyber/data-protection (POPIA) matters across Limpopo.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=2269", "https://tpmattorneys.co.za/", "https://tpmattorneys.co.za/terms"]'
WHERE slug = 'tpm-attorneys-inc-polokwane-central' AND description_enriched_at IS NULL;

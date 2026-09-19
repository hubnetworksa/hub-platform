UPDATE businesses
SET description = 'AMM Accountants is an accounting and tax advisory firm in Polokwane, providing accounting, audit and broader business administrative support services to local clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ammaccountant.co.za/contact-us/", "https://www.facebook.com/ammccountants/", "https://www.ammaccountant.co.za/services/"]'
WHERE slug = 'amm-accountants-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'J.M Rampora Attorneys is a law firm in Lebowakgomo offering a broad range of legal services, including criminal and civil litigation, contracts, debt collection, conveyancing, administration of deceased estates, notarial work and labour law.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.directory101.co.za/legaldir/index.php?page=item&id=181", "https://b2bhint.com/en/company/za/jm-rampora-attorneys--K2020621772", "https://www.southafricanlawyer.co.za/law-firm/jm-rampora-attorneys/limpopo/"]'
WHERE slug = 'rampora-attorneys-lebowakgomo' AND description_enriched_at IS NULL;

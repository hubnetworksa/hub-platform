UPDATE businesses
SET description = 'AECOM SA (Pty) Ltd is the Polokwane branch of AECOM, a global infrastructure consulting firm offering civil, structural, mechanical and electrical engineering services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nearfinderza.com/business/limpopo/polokwane/aecom-sa-pty-ltd_95920+9.html", "https://www.dnb.com/business-directory/company-profiles/aecom-sa-(pty)-ltd.7c9b6edbc1447da2efc9f8ee52be578b", "https://aecom.com/en-za/"]'
WHERE slug = 'aecom-sa-welgelegen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Asian Cuisine Cycad Centre is an Indian, Pakistani and Asian fusion restaurant and takeaway based in Cycad Centre, Bendor Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 10:15-20:15, Tue-Sun 10:15-20:45'
WHERE slug = 'asian-cuisine-cycad-centre-bendor-park' AND description_enriched_at IS NULL;

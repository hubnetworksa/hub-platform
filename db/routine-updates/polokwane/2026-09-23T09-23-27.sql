UPDATE businesses
SET description = 'Grace and Hope Special School is a public special-needs school in Seshego Zone 1, providing education for learners with additional learning needs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://heyschools.co.za/0784704/Grace_and_Hope_Special_School_Seshego", "https://www.school-register.co.za/school/grace-and-hope-special-school/", "https://www.schoolguide.co.za/schools/special-needs-schools/grace-and-hope-centre.html"]'
WHERE slug = 'grace-and-hope-special-school-seshego-zone-1' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mponegele Primary School is a public primary school in Seshego Zone 1, serving the local community with foundation and intermediate phase education.',
    description_enriched_at = datetime('now')
WHERE slug = 'mponegele-primary-school-seshego-zone-1' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank Paledi Mall is a full-service Nedbank bank branch located within the Twin City Paledi Shopping Centre in Mankweng.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-paledi-mall-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Medicross Kraaifontein is an optometry practice based at the Medicross medical centre in Kraaifontein, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'spec-savers-medicross-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VisagieVos Inc is an attorneys'' and legal services firm based in Goodwood, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'visagievos-inc-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yusria Cornelius Incorporated is an attorneys'' firm based in Goodwood, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'yusria-cornelius-incorporated-goodwood' AND description_enriched_at IS NULL;

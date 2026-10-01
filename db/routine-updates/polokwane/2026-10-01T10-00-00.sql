UPDATE businesses
SET description = 'Excelens Optical lab is an optical laboratory in the Polokwane central business district, serving the optical trade from Plein Street.',
    description_enriched_at = datetime('now')
WHERE slug = 'excelens-optical-lab-polokwane-central' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'F and R Frozen is a frozen foods supplier on Rupee Avenue in Superbia, Polokwane, selling frozen groceries.',
    description_enriched_at = datetime('now')
WHERE slug = 'f-and-r-frozen-superbia' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'Malahlela Attorneys is a law firm on Turmeric Street in Ivy Park, Polokwane, offering legal services to local clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'malahlela-attorneys-ivy-park' AND description_enriched_at IS NULL;

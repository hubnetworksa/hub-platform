UPDATE businesses
SET description = 'Abacas Electrical Solution is an electrical contractor based in Tafelsig, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'abacas-electrical-solution-tafelsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Be-Dazzle Hair Beauty and Slimming Salon is a hair and beauty salon in Strandfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'be-dazzle-hair-beauty-and-slimming-salon-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Coniston Motors is a fuel station at the corner of Military Road and Prince George Drive in Steenberg.',
    description_enriched_at = datetime('now')
WHERE slug = 'coniston-motors-steenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JEM Hair and Beauty Studio is a hair and beauty salon in Strandfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'jem-hair-and-beauty-studio-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steenberg Pharmacy is a pharmacy in Steenberg, based in the Somerset Building on Military Road.',
    description_enriched_at = datetime('now')
WHERE slug = 'steenberg-pharmacy-steenberg' AND description_enriched_at IS NULL;

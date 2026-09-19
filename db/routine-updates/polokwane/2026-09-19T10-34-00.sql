UPDATE businesses
SET description = 'SUPERSPAR Game Centre is a supermarket in Polokwane offering groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-19:00, Sun 08:00-14:00'
WHERE slug = 'superspar-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Side Step is a footwear retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'side-step-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skechers is a footwear retailer inside Mall of the North, Bendor, selling performance and lifestyle shoes.',
    description_enriched_at = datetime('now')
WHERE slug = 'skechers-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sleepmasters is a bed and mattress retailer inside Savannah Mall, Fauna Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun 09:00-13:00'
WHERE slug = 'sleepmasters-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet is a hair and beauty salon and spa inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'sorbet-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers is an optometry and eyewear practice inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'spec-savers-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sport Scene is a sportswear and sneaker retailer inside Savannah Mall, Fauna Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'sport-scene-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sportscene is a sportswear and sneaker retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'sportscene-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Mall of the North is a bank branch inside Mall of the North, Bendor, offering everyday banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:30-17:00, Tue-Thu 09:00-17:00, Fri 08:30-17:00, Sat 08:30-12:00'
WHERE slug = 'standard-bank-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ster-Kinekor Mall of the North is a multiplex cinema inside Mall of the North, Bendor, screening a range of movie releases.',
    description_enriched_at = datetime('now')
WHERE slug = 'ster-kinekor-bendor' AND description_enriched_at IS NULL;

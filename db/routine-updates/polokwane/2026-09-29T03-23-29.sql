UPDATE businesses
SET description = 'Eyecatchers Optometrists is an optometry practice based at Medpark Medical Centre on Jorissen Street, offering eye examinations, contact lens fittings and a range of eyewear to the Polokwane Central community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'eyecatchers-optometrists-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Eyecatchers Optometrists branch trades from Shop U8A in Mall of the North, providing eye tests, spectacles and contact lenses to shoppers in Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'eyecatchers-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price is a fashion and homeware retail chain, with this branch trading from Shop 03 in Turfloop Plaza, offering clothing, footwear and accessories to Mankweng shoppers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-14:00, Tue-Sat 09:00-18:00, Sun 08:30-17:00'
WHERE slug = 'mr-price-turfloop-plaza-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Romeo & Juliet Florist & Gifts is a flower and gift shop trading from Shop 16 in Kirkade Arcade on Schoeman Street, offering floral arrangements and gifts to customers in Polokwane Central.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-12:30, Sun Closed'
WHERE slug = 'romeo-juliet-florist-gifts-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Torga Optical has traded from Shop 29 in Limpopo Mall since December 1998, offering eye examinations, spectacles and contact lenses using German precision lens technology.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00'
WHERE slug = 'torga-optical-limpopo-mall-polokwane-central' AND description_enriched_at IS NULL;

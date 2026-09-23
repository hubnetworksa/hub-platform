UPDATE businesses
SET description = 'Eastlake Barber Shop is a barbershop in Eastlake Shopping Centre, Marina Da Gama, offering haircuts and grooming for men and boys.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 08:00-15:00'
WHERE slug = 'eastlake-barber-shop-marina-da-gama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nonny''s Bakery & Cafe has served Masiphumelele since 2012 with freshly baked cakes and muffins alongside light lunches such as pies, stews with rice or pap, toasted sandwiches and burgers, with garden seating out back.',
    description_enriched_at = datetime('now')
WHERE slug = 'nonnys-bakery-cafe-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Civic Centre is a City of Cape Town-run community venue in Ocean View available for hire for weddings, award ceremonies, parties, year-end functions and corporate meetings.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-view-civic-centre-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Clinic is a public healthcare facility in Ocean View offering general medical care, chronic disease management and maternity and paediatric services.',
    description_enriched_at = datetime('now')
WHERE slug = 'ocean-view-clinic-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shin Thai Asian Kitchen is a Thai and sushi restaurant in Eastlake Shopping Centre, Marina Da Gama, serving dishes such as curries, pad thai and sushi rolls for dine-in and takeaway.',
    description_enriched_at = datetime('now')
WHERE slug = 'shin-thai-asian-kitchen-marina-da-gama' AND description_enriched_at IS NULL;

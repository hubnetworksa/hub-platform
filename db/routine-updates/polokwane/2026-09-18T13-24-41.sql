-- Job 4: description enrichment sweep -- clears the remaining backlog (6 businesses)

UPDATE businesses
SET description = 'Becker Attorneys is a business-law firm in Bendor serving small and medium enterprises and individuals, with practice areas spanning arbitration, mediation and conciliation, commercial and consumer law, estates, trusts and wills, and litigation.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00'
WHERE slug = 'becker-attorneys-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Greywies Nu-Clean Dry Cleaners offers dry cleaning and laundry services from its Market Street premises in Polokwane Central.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-17:00, Fri 07:00-17:30, Sat 07:00-13:00'
WHERE slug = 'greywies-nu-clean-dry-cleaners-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Legends Barbershop is a barbershop inside Mall of the North offering haircuts, shaves and grooming services to shoppers in Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-17:00'
WHERE slug = 'legends-barbershop-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Legends Barbershop is a barbershop in Polokwane Central offering men''s haircuts, head shaves and beard trims.',
    description_enriched_at = datetime('now')
WHERE slug = 'legends-barbershop-polokwane-central-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Russells Polokwane Market Street is a furniture and homeware store in Polokwane Central, part of the Russells retail chain found across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'russells-polokwane-market-street-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Mankweng Service Centre is a bank branch at Tintis Square offering everyday banking services to the Mankweng community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:30, Sat 08:30-11:00'
WHERE slug = 'standard-bank-mankweng-service-centre-mankweng' AND description_enriched_at IS NULL;

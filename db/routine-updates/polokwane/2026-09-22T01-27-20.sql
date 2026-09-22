-- Job 4: description enrichment sweep, checkpoint 3/3 (4 businesses -- clears the backlog)
UPDATE businesses
SET description = 'Rakoma Travel is a corporate travel agency in Bendor, Polokwane, arranging business flights, accommodation and travel-policy-compliant bookings, part of the Rakoma Group.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 09:00-15:00'
WHERE slug = 'rakoma-travel-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Polygraph Professionals CC is a polygraph testing service in Capricorn, Polokwane, offering pre-employment screening, periodic staff honesty audits, forensic investigations and dispute-resolution polygraph tests.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-polygraph-professionals-cc-capricorn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vodacom Shop Polokwane Schoeman Street is a Vodacom-branded mobile retailer in the Rentmeester Building, Polokwane Central, selling phones, contracts and airtime.',
    description_enriched_at = datetime('now')
WHERE slug = 'vodacom-shop-schoeman-street-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'iJuici Market Street Factory Shop is a fruit-juice concentrate factory outlet in Polokwane Central, operated by Granor Passi, selling its juice and beverage range direct from the factory.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'ijuici-market-street-factory-shop-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LZ Makwela Accountants provides accounting, tax, bookkeeping and business regulatory compliance services to small and medium-sized businesses in the Polokwane area, and assists construction companies with CIDB registration.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 10:00-14:00, Sun Closed'
WHERE slug = 'lz-makwela-accountants-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MNC Dental Clinic is a dental practice operating from Mall@Lebo in Lebowakgomo, offering dental care to the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'mnc-dental-clinic-lebowakgomo' AND description_enriched_at IS NULL;

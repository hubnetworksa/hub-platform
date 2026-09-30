UPDATE businesses
SET description = 'Ensemble Security is a private security company based in Dalmada, providing 24-hour security services to clients across manufacturing, finance, retail and education sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ensemblesecurity.co.za/contact-us/", "https://www.zoominfo.com/c/ensemble-security/1326158376", "https://ensemblesecurity.co.za/"]'
WHERE slug = 'ensemble-security-dalmada' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dalmada Kwekery is a plant nursery just outside Polokwane on the Tzaneen road, supplying plants, trees and pots to the surrounding farming community.',
    description_enriched_at = datetime('now')
WHERE slug = 'dalmada-kwekery-dalmada' AND description_enriched_at IS NULL;

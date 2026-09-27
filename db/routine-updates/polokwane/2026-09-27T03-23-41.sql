UPDATE businesses
SET description = 'Mayfair Gearbox Polokwane is a gearbox, clutch and differential repair specialist that has served Annadale for more than 15 years as part of a national franchise with branches across South Africa. It also handles minor vehicle servicing, with repair work backed by a 6-month or 10,000km guarantee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:00, Fri 07:30-13:00',
    source_urls = '["https://members.rmi.org.za/listing/mayfair-gearbox-polokwane/", "https://www.motors24.co.za/portfolio/mayfair-gearbox/", "https://mayfairpolokwane.co.za/"]'
WHERE slug = 'mayfair-gearbox-annadale' AND description_enriched_at IS NULL;

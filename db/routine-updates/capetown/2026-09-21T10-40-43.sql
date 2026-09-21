UPDATE businesses
SET description = 'Debonairs Pizza is a pizza delivery and takeaway restaurant inside Macassar Shopping Centre, the local Macassar branch of the well-known South African pizza chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-20:00, Fri-Sat 08:30-21:00, Sun 08:30-18:00'
WHERE slug = 'debonairs-pizza-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Lwandle Migrant Labour Museum is a township heritage museum in Lwandle, housed in a preserved former migrant-labour hostel and opened in 2000, documenting the history of hostel life and forced removals under apartheid through exhibits including personal artefacts, workplace stories, and the preserved Hostel 33.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://lwandlemuseum.co.za/contact-us/", "https://d7.westerncape.gov.za/facility/lwandle-migrant-labour-museum", "https://www.capetownmuseum.org.za/lwandle", "https://groundup.org.za/article/cape-towns-only-township-based-museum/"]'
WHERE slug = 'lwandle-migrant-labour-museum-lwandle' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a value clothing and homeware retailer with a branch inside Macassar Shopping Centre, part of the national PEP chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:00-15:00, Sun 09:00-13:00'
WHERE slug = 'pep-macassar-shopping-centre-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Express at Shell Firgrove is a 24-hour convenience store attached to the Shell filling station on Old Main Road in Firgrove, offering groceries, snacks and essentials to travellers along that route.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'spar-express-at-shell-firgrove-firgrove' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Firgrove is a branch of the SPAR supermarket chain on the corner of the R102 and Main Road in Firgrove, stocking groceries and everyday essentials for the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-firgrove-firgrove' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Macassar is a branch of the Shoprite supermarket chain at the corner of Hospital and Burg Streets in Macassar Shopping Centre, stocking groceries and household essentials for the Macassar community.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-macassar-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Firgrove is a liquor store attached to the SPAR supermarket on the corner of the R102 and Main Road in Firgrove, part of the national TOPS at SPAR chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'tops-at-spar-firgrove-firgrove' AND description_enriched_at IS NULL;

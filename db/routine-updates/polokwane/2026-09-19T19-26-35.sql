UPDATE businesses
SET description = 'Tony Turner Agencies is a family-owned business, established in 1994, that exports, sells and distributes irrigation and construction products -- piping, fittings, industrial hoses, irrigation equipment and plastic sheeting -- from Ladine.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ttagencies.co.za/contact-us/", "https://www.cylex.net.za/company/tony-turner-agencies-17580856.html", "https://ttagencies.co.za/about-us/"]'
WHERE slug = 'tony-turner-agencies-ladine' AND description_enriched_at IS NULL;

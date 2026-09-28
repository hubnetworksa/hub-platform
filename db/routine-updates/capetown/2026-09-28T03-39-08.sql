UPDATE businesses
SET description = 'Footgear is a shoe store located inside Eerste Rivier Shopping Centre, Eerste River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 08:30-18:00, Sat 08:30-17:00, Sun 09:00-15:00'
WHERE slug = 'footgear-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PnP Clothing is a clothing retailer inside Eerste Rivier Shopping Centre, Eerste River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00'
WHERE slug = 'pnp-clothing-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PnP Liquor is a liquor store inside Eerste Rivier Shopping Centre, Eerste River.',
    description_enriched_at = datetime('now')
WHERE slug = 'pnp-liquor-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PnP Supermarket is a Pick n Pay branded supermarket inside Eerste Rivier Shopping Centre, Eerste River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00'
WHERE slug = 'pnp-supermarket-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Richelles Wedding Dresses is a bridal boutique with a collection of more than 100 wedding dresses available to try on, offering both dress hire and custom-designed gowns tailored for each bride.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-20:00, Sat 09:00-18:00',
    source_urls = '["https://richellesweddingdresses.wordpress.com/contact-us/", "https://connecto.co.za/business/RICHELLEDRESS", "https://www.weddingdirectory.co.za/wedding-guide-wedding-suppliers/richelles-wedding-dresses-bridal-dresses-flowergirl-dresses-in-western-cape-durbanville"]'
WHERE slug = 'richelles-wedding-dresses-eversdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Cedar is a supermarket serving the Bothasig community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-21:00'
WHERE slug = 'spar-cedar-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Pinelands is a supermarket inside Central Square, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-20:00, Sun 08:00-20:00'
WHERE slug = 'spar-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPK Engineering Supplies is a Paarden Eiland-based supplier of engineering cutting tools and machinery to the local manufacturing and engineering industry, also exporting equipment to countries elsewhere in Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.spk-sa.co.za/", "https://www.yep.co.za/biz/store/s-p-k-engineering-supplies/216767", "http://www.spk-sa.co.za/about.html"]'
WHERE slug = 'spk-engineering-supplies-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Bothasig is a supermarket inside Bothasig Square, Bothasig.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-19:00, Fri 10:00-19:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'shoprite-bothasig-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Kuils River is a supermarket inside Kuilsriver Shopping Centre, Kuils River.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-kuils-river-2' AND description_enriched_at IS NULL;

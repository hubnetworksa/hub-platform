UPDATE businesses
SET description = 'Makanye Super Market and Cash and Carry is a cash-and-carry grocery and wholesale store serving the Ga-Makanye area of Mankweng.',
    description_enriched_at = datetime('now')
WHERE slug = 'makanye-super-market-and-cash-and-carry-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masethe B.H Optometrists is an optometry practice providing eye examinations and optical dispensing from the Usave Complex in Ga-Maja Village, Mankweng, and is a recognised provider on several medical aid optometry networks.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/optometry/GEMS-Optometry-Network-Providers---Limpopo.pdf", "https://www.medpages.info/sf/index.php?page=person&personcode=394829", "https://nearmedoctors.com/business/masethe-b-h-optometrists-excellent-optometrist-near-you-in-mankweng/"]'
WHERE slug = 'masethe-bh-optometrists-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Plumb is a PIRB-registered plumbing contractor in Polokwane with over 20 years of experience, handling solar and electrical geyser installations, burst pipes, blocked drains and general plumbing repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.polokwaneplumber.co.za/", "https://www.polokwane.info/directory/companies/clientCategoryListing?objId=515", "https://www.aiyellow.com/proplumb/", "https://www.procompare.co.za/providers/plumber-polokwane"]'
WHERE slug = 'pro-plumb-flora-park' AND description_enriched_at IS NULL;

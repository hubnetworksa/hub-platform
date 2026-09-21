UPDATE businesses
SET description = 'FAW Polokwane, part of the BB Group dealer network, is an authorised FAW dealership in Nirvana selling and servicing a range of FAW commercial trucks, including freight carriers, tippers and truck-tractors.',
    description_enriched_at = datetime('now')
WHERE slug = 'faw-polokwane-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Iveco Polokwane, operated by the BB Group, is an authorised Iveco dealership in Nirvana offering commercial vehicle sales alongside a workshop with qualified artisans handling mechanical repairs.',
    description_enriched_at = datetime('now')
WHERE slug = 'iveco-polokwane-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SI Hardware Polokwane is a hardware and building-supplies store in Nirvana stocking DIY, construction and home-improvement products, and is also an authorised distributor for JoJo water tanks.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 07:30-13:00',
    source_urls = '["https://www.facebook.com/sihpolokwane/posts/38-gypsum-street-nirvanapolokwane015-590-0497/443584203086038/", "https://opening-hours.co.za/03848826/SI_Hardware_Polokwane", "https://www.jojo.co.za/distributor/si-hardware-and-sons-cc-polokwane/"]'
WHERE slug = 'si-hardware-polokwane-nirvana' AND description_enriched_at IS NULL;

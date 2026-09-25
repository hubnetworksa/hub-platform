UPDATE businesses
SET description = 'Avenue Hardware & Motor Spares is a hardware store on 5th Avenue in Grassy Park, also stocking motor spares.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:45-16:45, Fri 07:45-11:30 & 14:30-16:45, Sat 07:45-12:45, Sun Closed'
WHERE slug = 'avenue-hardware-and-motor-spares-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Busy Corner Butchery is a halaal butchery on the corner of Victoria Road and Reddy Avenue in Grassy Park, trading since 1956. Alongside meat and poultry it stocks groceries, frozen vegetables, spices and braai essentials, with a hot foods section and coffee corner.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/2584a27893738fc839ddfb16d003e61c/busy-corner-butchery-grassy-park/grassy-park/business-organizations", "https://www.cylex.net.za/company/busy-corner-butchery-grassy-park-23806571.html", "https://southernmail.co.za/news/2024-09-25-busy-corner-butcher-where-people-have-been-meating-for-68-years/"]'
WHERE slug = 'busy-corner-butchery-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dilshaad Oosthuizen Physiotherapy is a physiotherapy practice in Key Shopping Centre, Grassy Park, offering physiotherapy treatment alongside acupuncture and dry needling.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-18:30, Sat-Sun Closed',
    source_urls = '["https://www.fresha.com/lvp/dilshaad-oosthuizen-physiotherapy-victoria-road-cape-town-7r6YwX", "https://www.medpages.info/sf/index.php?page=person&personcode=433483", "https://www.procompare.co.za/providers/dilshaad-oosthuizen-physiotherapy"]'
WHERE slug = 'dilshaad-oosthuizen-physiotherapy-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Grassy Park Pharmacy is a pharmacy in the Nazraf Centre on Victoria Road, Grassy Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'grassy-park-pharmacy-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maggaard''s Multichem Pharmacy is a pharmacy in the Prince Park Centre at the corner of Prince George Drive and 5th Avenue, Grassy Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'maggaards-multichem-pharmacy-grassy-park' AND description_enriched_at IS NULL;

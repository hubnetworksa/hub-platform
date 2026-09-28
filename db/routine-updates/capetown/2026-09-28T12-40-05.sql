UPDATE businesses
SET description = 'Heideveld Secondary School is a government secondary school in Heideveld offering Grades 8 to 12, established in 1978.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/heideveld/secondary-school/heideveld-secondary-school", "https://www.searchinafrica.com/business/4820816/south-africa/western-cape/heideveld/waterberg-rd/secondary-school/schools/heideveld-secondary-school", "https://en.wikipedia.org/wiki/Heideveld_Secondary_School"]'
WHERE slug = 'heideveld-secondary-school-heideveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nando''s Grassy Park is a drive-thru branch of the South African flame-grilled peri-peri chicken chain, offering dine-in, takeaway and drive-thru service on the corner of Prince George Drive and 5th Avenue.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 10:00-22:00, Fri-Sat 10:00-23:00, Sun 10:00-22:00',
    source_urls = '["https://www.brabys.com/za/western-cape/grassy-park/takeaway-foods/nandos", "https://www.sayellow.com/view/south-africa/nandos-grassy-park-drive-thru-in-cape-town", "https://store.nandos.co.za/details/grassy-park-drive-thru"]'
WHERE slug = 'nandos-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pedros Grassy Park is a branch of the flame-grilled chicken chain serving dine-in and takeaway meals, with outdoor seating, on the corner of Victoria Road and Klip Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 10:00-22:00, Thu-Sat 10:00-23:00, Sun 10:00-22:00',
    source_urls = '["https://restaurants-in-cape-town.co.za/restaurants/pedros-grassy-park/", "https://restaurantguru.com/Pedros-Grassy-Park-Cape-Town", "https://menupedros.co.za/locations/pedros-grassy-park/"]'
WHERE slug = 'pedros-grassy-park' AND description_enriched_at IS NULL;

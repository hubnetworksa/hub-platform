UPDATE businesses
SET description = 'Block & Chisel is a furniture and homeware store on Kloof Street in Gardens, offering indoor and outdoor furniture, rugs, mirrors and decor in contemporary, English country and French Provencal styles, from a brand that has been designing and manufacturing furniture since 1987.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:30, Sun Closed'
WHERE slug = 'block-and-chisel-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Engen False Bay 1 Stop is a fuel station and convenience-store forecourt on the N2 at Macassar, on the route toward Somerset West, housing a Woolworths Food and a Wimpy alongside its fuel bays.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'engen-false-bay-1-stop-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hacienda Coastal Mexican is a Baja-style Mexican restaurant on Bree Street in the Cape Town CBD, serving tacos and homemade tortillas alongside dishes such as crispy Baja lobster tacos and charcoal-grilled octopus.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:30',
    source_urls = '["https://www.eatout.co.za/venue/hacienda-coastal-mexican/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d24138375-Reviews-Hacienda_Coastal_Mexican-Cape_Town_Central_Western_Cape.html", "https://hacienda.co.za/"]'
WHERE slug = 'hacienda-coastal-mexican-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Macassar Pottery is a community ceramic design and manufacturing studio in Macassar, established in 2010 and co-owned by its employees, known for handcrafted pottery and instruments such as the Udu drum, and for training local youth in pottery skills.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Attraction_Review-g7158557-d7052058-Reviews-Proudly_Macassar_Pottery-Macassar_Western_Cape.html", "https://macassarpottery.com/", "https://commongoodfirst.com/story/macassar-pottery/"]'
WHERE slug = 'macassar-pottery-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maru Korean Steakhouse is a Korean restaurant on Bree Street in the Cape Town CBD, serving Korean-style steak, fried chicken and other Korean dishes, with a daily Magic Hour food and drinks special from 4pm to 5:30pm.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:30'
WHERE slug = 'maru-korean-steakhouse-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southern Sun Cape Sun is a 368-room hotel on Strand Street in the Cape Town CBD, a short walk from Long Street, with an on-site gym and swimming pool.',
    description_enriched_at = datetime('now')
WHERE slug = 'southern-sun-cape-sun-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tonic Design is a furniture and interior design showroom on Kloof Street in Gardens, known for sofas, cabinetry and other interior pieces, with room sets that include artwork from a collaboration with a Cape Town art gallery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 10:00-14:00, Sun Closed',
    source_urls = '["https://tonicdesign.co.za/pages/contact", "https://www.sadecor.co.za/supplier/tonic-design/", "https://visi.co.za/tonic-cape-town-showroom/"]'
WHERE slug = 'tonic-design-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy False Bay Engen 1 Stop is a Wimpy family restaurant at the Engen False Bay 1 Stop forecourt on the N2 in Macassar, serving breakfasts, burgers and other Wimpy menu items around the clock.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'wimpy-false-bay-engen-1-stop-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food at the Engen False Bay 1 Stop is a convenience grocery store on the N2 in Macassar, offering fresh groceries, snacks and ready meals for travellers on the highway.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'woolworths-food-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Workshop17 Kloof Street is a coworking and serviced office space on Kloof Street in Gardens, offering hot-desking, private offices and meeting rooms for members.',
    description_enriched_at = datetime('now')
WHERE slug = 'workshop17-kloof-street-gardens' AND description_enriched_at IS NULL;

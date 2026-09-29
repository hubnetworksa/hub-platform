UPDATE businesses
SET description = 'Noluthando Day Care Centre is an early childhood day care centre in Imizamo Yethu, Hout Bay, caring for young children and offering early learning during the day.',
    description_enriched_at = datetime('now')
WHERE slug = 'noluthando-day-care-centre-imizamo-yethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAH The Animal Hospital and Vetshop in Table View is a full-service veterinary practice with an on-site theatre and a retail vetshop stocking pet food, treats and toys, offering wellness check-ups, vaccinations, dental care and emergency treatment.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savet.co.za/vet/tah-the-animal-hospital-and-vetshop-table-view", "https://za.polomap.com/cape-town/25460", "https://tah.co.za/table-view/"]'
WHERE slug = 'tah-animal-hospital-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Cutting Room is an owner-run unisex hair and image studio in Fish Hoek, established in 2005, with an adjoining clothing boutique and a small coffee shop where clients can relax with Wi-Fi while they wait.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/the-cutting-room-230879", "https://www.fresha.com/lvp/the-cutting-room-kommetjie-road-cape-town-q8QZ4q", "https://thecuttingroom.co.za/"]'
WHERE slug = 'the-cutting-room-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Dental People is a dental practice in Centre Point Shopping Centre, Milnerton, offering general and emergency dentistry, implants, veneers, teeth whitening, crowns and bridges, positioned as an affordable cash practice that also accepts select medical aid plans.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:30, Sat 09:00-12:00'
WHERE slug = 'the-dental-people-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Factory Shop is a discount general retail store in Montague Gardens selling a wide range of household and everyday goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'the-factory-shop-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Green Room is a vibey restaurant and bar in Kommetjie serving Mexican and steakhouse-style food including nachos and craft beer, with breakfast, lunch, dinner and brunch menus and vegetarian and vegan options.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/the-green-room-107374", "https://www.facebook.com/greenroomkommetjie/", "https://www.tripadvisor.co.za/Restaurant_Review-g1214290-d2271339-Reviews-or45-The_Green_Room-Kommetjie_Western_Cape.html"]'
WHERE slug = 'the-green-room-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timbercity Montague Gardens is a hardware and building materials store, part of the Timbercity chain, stocking timber, building supplies and hardware.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'timbercity-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tortuga Loca is a sustainability-focused Mexican and Latin American restaurant in Muizenberg with a laid-back, surf-culture atmosphere, reclaimed wood furnishings and colourful murals, offering vegetarian and vegan options.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 12:00-22:30, Mon Closed',
    source_urls = '["https://za.africabz.com/western-cape/tortuga-loca-336033", "https://www.tripadvisor.co.za/Restaurant_Review-g1509162-d23865039-Reviews-Tortuga_Loca-Muizenberg_Western_Cape.html", "https://www.eatout.co.za/venue/tortuga-loca/"]'
WHERE slug = 'tortuga-loca-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vet-Clin is a veterinary clinic in Table View offering walk-in consultations, vaccinations, surgery and a retail pet food range.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/business/4993418/south-africa/western-cape/milnerton/table-view/blaauberg-rd/veterinary-clinics-hospitals/vet-clin", "https://2pos.co.za/53452/10118", "https://vetclin.co.za/"]'
WHERE slug = 'vet-clin-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Walsh Fireplaces is a Retreat-based business that has been making custom, built-to-order fireplaces for decades, specialising in traditional firebrick built-in fireplaces and mantle pieces, and in refurbishing and repairing Victorian fireplaces and marble mantlepieces.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'walsh-fireplaces-retreat' AND description_enriched_at IS NULL;

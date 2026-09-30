-- Job 4: description enrichment sweep, batch 2 of 2 (6 records)

UPDATE businesses
SET description = 'Neovision Panorama is an optometry practice inside the Panorama Healthcare Centre, offering eye tests and eyewear to patients in Panorama.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-12:00, Sun Closed'
WHERE slug = 'neovision-panorama-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Norma-Jean''s Beauty Salon and Tattoo Parlor is a beauty salon and tattoo studio on Van Riebeeck Road in Kuils River, offering hair removal, facials, skincare, makeup and threading alongside tattoo services.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 09:00-18:00, Sat 08:00-15:00, Sun-Mon Closed'
WHERE slug = 'norma-jeans-beauty-salon-and-tattoo-parlor-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Panorama Veterinary Clinic & Specialist Centre is a veterinary practice on Uys Krige Drive in Panorama, providing consultations and round-the-clock emergency veterinary care.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-19:00, Sat 08:00-13:00, Sun Closed (24-hour emergency service available)',
    source_urls = '["https://panoramavet.co.za/contact/", "http://textmap.co.za/3/15042", "https://savet.co.za/vet/panorama-veterinary-clinic-and-specialist-centre"]'
WHERE slug = 'panorama-veterinary-clinic-specialist-centre-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Point-S Kuilsriver is a family-owned tyre and car service centre on Van Riebeeck Road in Kuils River, offering tyres, wheel alignment and balancing, brakes, shocks, suspension and battery services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'point-s-kuilsriver-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salon Jean Paul Kuilsriver is a hair salon in the Shoprite Centre on Van Riebeeck Road in Kuils River, offering colouring, braiding, extensions, keratin treatments and other hair services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:00-16:00, Sun 08:30-14:00'
WHERE slug = 'salon-jean-paul-kuilsriver-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Welgemoed Guesthouse is a 10-room guesthouse in Welgemoed styled in classic Cape colonial decor, offering an outdoor pool, 24-hour front desk, free WiFi and parking, a short walk from Bellville Golf Club.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thewelgemoedguesthouse.co.za/", "https://www.lekkeslaap.co.za/accommodation/the-welgemoed-guest-house", "https://www.expedia.com/Cape-Town-Hotels-The-Welgemoed-Guest-House.h13134270.Hotel-Information"]'
WHERE slug = 'the-welgemoed-guesthouse-welgemoed' AND description_enriched_at IS NULL;

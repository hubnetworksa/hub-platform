UPDATE businesses
SET description = 'Compass Bakery is a bakery in Kommetjie, Cape Town, with a factory shop serving the local area.',
    description_enriched_at = datetime('now')
WHERE slug = 'compass-bakery-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scratch Patch & Mineral World is a gem and mineral attraction near Glencairn where visitors can dig through tumbled semi-precious stones to keep, alongside a mineral display and a cave-themed mini-golf course.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:45, Sat-Sun 09:00-17:00',
    source_urls = '["https://www.scratchpatch.co.za/contact/", "https://www.scratchpatch.co.za/mineral-world/", "https://www.sa-venues.com/things-to-do/westerncape/scratch-patch-at-simons-town/", "https://www.atlasobscura.com/places/scratch-patch-cape-town"]'
WHERE slug = 'scratch-patch-and-mineral-world-glencairn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tokai Forest Guest House is a guest house in Dennendal offering standard rooms, a family suite and a self-catering unit, set against Tokai Forest with an outdoor pool and views toward the Constantiaberg mountains.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://tokaiforestguesthouse.co.za/contact/", "https://constantiavalley.com/tokai-forest-guest-house/", "https://www.hotelplanner.com/Hotels/301096/Reservations-Tokai-Forest-Guest-House-Cape-Town-19-Dennendal-East-Ave-Tokai-7945"]'
WHERE slug = 'tokai-forest-guest-house-dennendal' AND description_enriched_at IS NULL;

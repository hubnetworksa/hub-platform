UPDATE businesses
SET description = 'Atlas Trading Company is Cape Town''s oldest spice store, family-run in Bo-Kaap since 1946, specialising in Cape Malay, Indian and Thai spice blends with more than 150 signature mixes plus its own exclusive creations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://atlastradingonline.com/pages/about-us", "https://www.capetownmagazine.com/atlas", "https://www.facebook.com/atlastradingcompanyza/posts/atlas-trading-company-established-in-1946-cape-towns-oldest-spice-store/654715846700469/"]'
WHERE slug = 'atlas-trading-company-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Biesmiellah is a family-run, strictly halaal restaurant in Bo-Kaap that has served traditional Cape Malay dishes such as bredies, denningvleis and bobotie for more than four decades.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 12:00-22:00, Fri-Sat 12:00-23:30, Sun Closed'
WHERE slug = 'biesmiellah-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bo-Kaap Deli is a neighbourhood cafe and deli on Church Street blending Cape Malay influences with modern comfort food, known for its koeksisters, artisanal breads and coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 08:30-16:30, Fri-Sat 08:00-22:00'
WHERE slug = 'bo-kaap-deli-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bo-Kaap Kombuis is a family-run restaurant on August Street serving traditional Cape Malay cuisine, run by locals born and raised in Bo-Kaap.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 12:00-16:00 & 18:00-21:30, Sun 12:00-15:00, Mon Closed'
WHERE slug = 'bo-kaap-kombuis-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bo-Kaap Museum, part of Iziko Museums, has occupied a late-18th-century house on Wale Street since 1978, furnished to depict the lifestyle of a 19th-century Cape Muslim family and telling the story of the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-17:00, Sun Closed'
WHERE slug = 'bo-kaap-museum-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ground Art Caffe is a coffee bar and micro-gallery on Strand Street, pairing quality espresso from a barista trained by Truth Coffee Roasting Company with rotating local artwork that changes monthly.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-15:00, Fri 08:00-15:00, Sat 07:30-14:00, Sun 08:00-13:00',
    source_urls = '["https://za.africabz.com/western-cape/ground-art-caffe-1419", "https://insideguide.co.za/cape-town/restaurants/ground-art-caffe/", "https://www.groundartcaffe.co.za/"]'
WHERE slug = 'ground-art-caffe-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lion''s Bread is an artisan bakery that began in a Bo-Kaap garage in 2024, focused on slow-fermented sourdough made with South African grains alongside pastries and cafe-style snacks.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 07:30-15:00, Sat 08:00-13:00, Sun-Mon Closed'
WHERE slug = 'lions-bread-bo-kaap' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lume Beauty Atelier on Chiappini Street is a medispa offering hair styling, a nail bar, skin rejuvenation and body treatments across several private treatment rooms, using premium product lines including Biologique Recherche and Oribe.',
    description_enriched_at = datetime('now')
WHERE slug = 'lume-beauty-atelier-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riva is a family-owned Italian fish restaurant on Napier Street whose menu changes daily depending on the best fish available from local fishermen and markets.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 18:00-22:30, Sun Closed'
WHERE slug = 'riva-de-waterkant' AND description_enriched_at IS NULL;

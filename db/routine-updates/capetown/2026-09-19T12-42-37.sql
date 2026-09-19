UPDATE businesses
SET description = 'Kauai is a health-focused quick-service cafe inside 3 Arts Village in Plumstead, serving wraps, salads, smoothies and barista coffee alongside all-day breakfast options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-20:00, Fri 07:30-21:00, Sat 07:30-20:00, Sun 07:30-19:00',
    source_urls = '["https://restaurants-in-cape-town.co.za/restaurants/kauai-3-arts/", "https://www.sluurpy.co.za/plumstead/restaurant/8614218/kauai-3-arts", "https://locations.kauai.co.za/HealthyFood-CapeTown-KAUAI3Arts"]'
WHERE slug = 'kauai-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kenwyn Martial Arts Centre is a dojo in Kenwyn that has offered Karate and Ryukyu Kobudo (Okinawan weaponry) instruction since 2001, running classes for fitness, self-defence and traditional martial arts training.',
    description_enriched_at = datetime('now')
WHERE slug = 'kenwyn-martial-arts-centre-kenwyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'L''Atelier Optometrist is a boutique vision and contact lens practice inside Cape Quarter Lifestyle Village in De Waterkant, with more than 17 years of experience in personalised eyewear and vision care.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://www.prjctwrks.com/portfolio/l-atelier-cape-quarter/", "https://www.favrspecs.com/en/opticians/in/cape-town/373/latelier-optometrist/20776/", "https://magicpin.com/south-africa/Cape-Town/De-Waterkant/Healthcare/Latelier-Optometrist/store/23248cc"]'
WHERE slug = 'latelier-optometrist-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Belle Bistro & Bakery is a bistro and bakery on the Camps Bay Promenade, serving breakfast through dinner with ocean views along the Camps Bay beachfront.',
    description_enriched_at = datetime('now')
WHERE slug = 'la-belle-bistro-bakery-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Frontiere & Zimborders is a business consulting office inside The Point in Sea Point, part of a group specialising in cross-border trade infrastructure and border-post management, including South Africa''s Beitbridge crossing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thepointmall.co.za/la-frontiere-zimborders/", "https://www.lafrontieregroup.com/contact/", "https://www.zimborders.com/services/"]'
WHERE slug = 'la-frontiere-zimborders-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Marzocco South Africa is the official South African distributor for La Marzocco espresso machines, handmade in Florence since 1927, based at The Old Biscuit Mill in Woodstock.',
    description_enriched_at = datetime('now')
WHERE slug = 'la-marzocco-south-africa-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lacoste is a French sportswear and fashion store inside Victoria Wharf Shopping Centre at the V&A Waterfront, on the mall''s Upper Level in the Quays District.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-21:00'
WHERE slug = 'lacoste-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Le Pickle is a smash-burger restaurant inside Cape Quarter Lifestyle Village in De Waterkant, founded in 2025, serving halaal-friendly beef, lamb, chicken and vegetarian burgers made with house-baked buns, pickles and sauces.',
    description_enriched_at = datetime('now')
WHERE slug = 'le-pickle-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lee''s Chinese is a Chinese restaurant inside Sherwood Shopping Centre in Bergvliet, serving dine-in and takeaway meals.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:00-20:00'
WHERE slug = 'lees-chinese-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Left Field Tattoo is a tattoo and piercing studio inside Cape Quarter Square in De Waterkant, offering tattooing, ear piercing, body piercing and tattoo removal services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-17:00, Sat 10:00-16:00, Sun Closed'
WHERE slug = 'left-field-tattoo-de-waterkant' AND description_enriched_at IS NULL;

-- Job 4: description enrichment sweep, batch 2/2 (10 records)

UPDATE businesses
SET description = 'Apnisleep is a dental sleep clinic inside The Point in Sea Point, treating snoring and obstructive sleep apnea with custom oral appliances using digital scans, CBCT imaging and 3D-printed devices, working alongside ENT surgeons, pulmonologists and sleep physicians across Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'apnisleep-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Artformes is a contemporary African sculpture gallery and publishing house at The Old Biscuit Mill in Woodstock, founded in 2021, focused on sculptural mediums such as clay and ceramics that have often been overlooked in contemporary African art.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://theoldbiscuitmill.co.za/tenants/artformes/", "https://www.artformes.com/", "https://www.artformes.com/about/"]'
WHERE slug = 'artformes-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Asian Mart is an Asian grocery store inside Riverlands Mall in Observatory, stocking Asian food products, cooking condiments and equipment, snacks, sweets, and beverages.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://riverlands.capetown/mall/", "https://www.tiktok.com/@_daiyabrahams_/video/7510253367176777016", "https://riverlands.capetown/shop/"]'
WHERE slug = 'asian-mart-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Atlantic Meat is a butchery inside Golden Acre Shopping Centre in Cape Town CBD.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:00-19:00, Sat 06:00-17:00, Sun Closed'
WHERE slug = 'atlantic-meat-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'AuTerra Jewellery is a Cape Town studio, founded in 2011, handcrafting contemporary gold and silver jewellery from recycled e-waste and Fairmined-certified metals, from its studio above Fledglings Restaurant at The Old Biscuit Mill in Woodstock.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:30-17:00, Sat 09:30-15:00, Sun Closed',
    source_urls = '["https://theoldbiscuitmill.co.za/tenants/auterra/", "https://auterra.co.za/", "https://auterra.co.za/pages/connect"]'
WHERE slug = 'auterra-jewellery-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BASI Pilates Academy is a Pilates studio inside The Point in Sea Point, within walking distance of the Sea Point promenade, requiring bookings at least 48 hours in advance.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thepointmall.co.za/merchant/basi-pilates/", "https://basipilatescapetown.co.za/", "https://livinglifepilates.com/"]'
WHERE slug = 'basi-pilates-academy-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BOA Beauty Bar is a beauty salon inside Riverlands Mall in Observatory, part of a small South African beauty bar chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:45-18:30, Sat 09:15-18:00, Sun 09:15-17:00'
WHERE slug = 'boa-beauty-bar-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BUC Fitness Club is a boutique fitness gym on the 3rd floor of The Point in Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 05:30-21:00, Sat 06:00-19:00',
    source_urls = '["https://thepointmall.co.za/merchant/buc/", "https://www.beautynailhairsalons.com/ZA/Cape-Town/32641009522/BUC-Fitness-Club---World-Class-Boutique-Fitness-Club", "https://www.bucfitnessclub.com/"]'
WHERE slug = 'buc-fitness-club-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Baraka Gifts & Décor is a gift and homeware shop inside Cape Quarter Lifestyle Village in De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'baraka-gifts-decor-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bare Laser Hair Removal Specialist is a laser hair removal clinic inside Cape Quarter in De Waterkant, part of the Bare SA laser hair removal chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'bare-laser-hair-removal-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

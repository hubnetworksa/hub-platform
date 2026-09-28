UPDATE businesses
SET description = 'African Experience is a craft and gift shop in Noordhoek Farm Village, Noordhoek, offering hand-made African crafts including Carrol Boyes silverware, textiles, ceramics, woven baskets and other decor items sourced largely from local Cape Town suppliers.',
    description_enriched_at = datetime('now')
WHERE slug = 'african-experience-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cheyne''s is a Pacific Rim-inspired restaurant on Main Road in Hout Bay, serving sea, land and earth dishes in shareable, tapas-style portions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 18:00-23:00, Thu-Sat 12:00-15:00 & 18:00-23:00, Sun Closed'
WHERE slug = 'cheynes-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Compass Bakery is a bakery at Heron Park on Kommetjie Road in Kommetjie, serving the Cape Point route area with freshly baked bread, pastries and other baked goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun 09:00-15:00',
    source_urls = '["https://www.thinklocal.co.za/biz/compass-bakery-kommetjie", "https://www.yellosa.co.za/company/503131/compass-bakery-pty-ltd", "https://www.netpages.co.za/Kommetjie/Compass+Bakery-150322.html"]'
WHERE slug = 'compass-bakery-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hout Bay Dental Studio is a dental practice at Joslyn Place on Victoria Avenue in Hout Bay, offering general dentistry services to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 09:00-12:00'
WHERE slug = 'hout-bay-dental-studio-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hout Bay Family Medical Centre is a general practice at the corner of Brighton Street and Albert Road in Hout Bay, offering family-orientated healthcare including women''s health, paediatric and heart/ECG services, with an on-site PathCare laboratory.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 09:00-13:00, Sun 09:00-12:00',
    source_urls = '["https://houtbaymedical.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=289623", "https://houtbaymedical.co.za/clinic/"]'
WHERE slug = 'hout-bay-family-medical-centre-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ndoro is a craft and gift shop in Noordhoek Farm Village, Noordhoek, stocking hand-painted ceramics, jewellery and beadwork alongside other African arts and crafts sourced from Zimbabwe, South Africa, Ghana, Zambia and Madagascar.',
    description_enriched_at = datetime('now')
WHERE slug = 'ndoro-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Indian Oven is a North Indian restaurant at Shop 8, Red Sails Building in Hout Bay, serving authentic Indian cuisine.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 12:00-22:00, Mon Closed'
WHERE slug = 'the-indian-oven-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wharfside Grill is a seafood and grill restaurant at Mariner''s Wharf in Hout Bay harbour.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 12:00-21:30'
WHERE slug = 'wharfside-grill-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wheeler''s Pharmacy & Medical Depot is an independent community pharmacy in The Passageway on Main Road in Hout Bay, established in 1991 and offering dispensary and health-shop services to the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:30-18:00, Sun & Public Holidays 09:00-18:00',
    source_urls = '["https://www.wheelerspharmacy.com/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88571", "https://www.wheelerspharmacy.com/our-story"]'
WHERE slug = 'wheelers-pharmacy-medical-depot-hout-bay' AND description_enriched_at IS NULL;

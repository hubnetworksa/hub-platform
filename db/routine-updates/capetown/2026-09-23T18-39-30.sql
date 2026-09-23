-- Job 4: description enrichment sweep (8 businesses; compass-bakery-kommetjie skipped, see agent-log)
UPDATE businesses
SET description = 'African Experience is a craft store in Noordhoek Farm Village stocking hand-made African crafts, textiles, ceramics, woven baskets and Carrol Boyes silverware, and is a founding member of Proudly South African.',
    description_enriched_at = datetime('now')
WHERE slug = 'african-experience-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cheyne''s is a modern Asian and Pacific Rim fusion restaurant in Hout Bay, set in a Balinese-inspired garden and linked to the adjoining Asian street-food venue Lucky Bao.',
    description_enriched_at = datetime('now')
WHERE slug = 'cheynes-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hout Bay Dental Studio is a general dental clinic in Hout Bay offering routine and cosmetic dental care to local patients and visitors to the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 09:00-12:00'
WHERE slug = 'hout-bay-dental-studio-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hout Bay Family Medical Centre is a family-orientated general practice in Hout Bay providing GP consultations and healthcare services to patients of all ages.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 09:00-13:00, Sun 09:00-12:00, Public Holiday 09:00-12:00'
WHERE slug = 'hout-bay-family-medical-centre-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ndoro is a craft and gift shop in Noordhoek Farm Village specialising in African arts and crafts, hand-painted ceramics, jewellery and beadwork sourced from Zimbabwe, South Africa and other African countries.',
    description_enriched_at = datetime('now')
WHERE slug = 'ndoro-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Indian Oven is a North Indian restaurant in Hout Bay''s Red Sails Building serving tandoori-oven starters, curries and naan.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 12:00-22:00, Mon Closed',
    source_urls = '["https://www.indianoven.co.za/contact", "https://discoverhoutbay.co.za/listing/the-indian-oven/", "https://www.tripadvisor.com/Restaurant_Review-g469392-d7317301-Reviews-The_Indian_Oven_Hout_Bay-Hout_Bay_Western_Cape.html"]'
WHERE slug = 'the-indian-oven-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wharfside Grill is a harbourside restaurant at Mariner''s Wharf in Hout Bay Harbour, serving grilled seafood and other dishes with views over the working harbour.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 12:00-20:30, Sat-Sun 10:00-20:30',
    source_urls = '["https://www.marinerswharf.co.za/wharfside-grill-restaurant/", "https://www.tripadvisor.com/Restaurant_Review-g469392-d2364521-Reviews-The_Wharfside_Grill-Hout_Bay_Western_Cape.html", "https://www.capetown.travel/listing/wharfside-grill-at-mariners-wharf/"]'
WHERE slug = 'wharfside-grill-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wheeler''s Pharmacy & Medical Depot is a retail pharmacy in Hout Bay''s Main Road Passageway offering dispensing services, health products and a linked health shop.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:30-18:00, Sun and Public Holidays 09:00-18:00',
    source_urls = '["https://www.wheelerspharmacy.com/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88571", "https://all-opening-hours.co.za/02056520/Wheeler''s_Pharmacy_&_Health_Shop"]'
WHERE slug = 'wheelers-pharmacy-medical-depot-hout-bay' AND description_enriched_at IS NULL;

-- Job 4: description enrichment sweep (5 businesses, clears remaining backlog)

UPDATE businesses
SET description = 'Amanee Beauty Salon is a nail and beauty salon in Three Anchor Bay offering acrylic nails, eyelash extensions, threading, microblading, and waxing alongside manicures and pedicures.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 10:00-17:00, Sun Closed'
WHERE slug = 'amanee-beauty-salon-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ashby Manor Guest House is a restored Victorian guest house in Fresnaye offering double, twin and triple rooms, some with sea views, along with an onsite spa offering Swedish massage and a rooftop terrace.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Hotel_Review-g1233430-d7702718-Reviews-Ashby_Manor_Guest_House-Fresnaye_Western_Cape.html", "https://southafricafirm.com/western-cape/ashby-manor-guest-house-3781", "https://www.booking.com/hotel/za/ashby-manor-guest-house.html"]'
WHERE slug = 'ashby-manor-guest-house-fresnaye' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ginger & Lime Food Studio is a food studio in Fresnaye offering interactive cooking classes and food-focused events.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 18:30-22:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'ginger-lime-food-studio-fresnaye' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simunye Primary Health Care Centre is a community-oriented general practice on the Atlantic Seaboard in Three Anchor Bay, staffed by family practitioners including some with specialised experience in HIV/TB management, public health and emergency medicine.',
    description_enriched_at = datetime('now'),
    hours = 'Every day 08:00-20:00',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=237439", "https://simunyehealthcare.com/contact/", "https://simunyehealthcare.com/seapoints-health-hub-simunye-primary-health-care/"]'
WHERE slug = 'simunye-primary-health-care-centre-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The One 8 Hotel is a 4-star boutique hotel in Three Anchor Bay on the Atlantic Seaboard, featuring a heated swimming pool, Jacuzzi and fitness room, with air-conditioned rooms offering free WiFi and satellite TV.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sa-venues.com/visit/theone8hotel/map.php", "https://www.theone8.com/contact/", "https://www.sa-venues.com/visit/theone8hotel/"]'
WHERE slug = 'the-one-8-hotel-three-anchor-bay' AND description_enriched_at IS NULL;

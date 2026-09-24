UPDATE businesses
SET description = 'Citivet Tamboerskloof is a small-animal veterinary practice offering consultations, emergency care, and on-site x-ray and laboratory facilities, with a second branch in Camps Bay.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:00, 15:30-18:00, Sat 09:00-13:00',
    source_urls = '["https://www.yellowpages.net.za/phone_27-214230113_emergency-veterinarian-service_Cape-Town_ZA434863.html", "https://www.citivet.net/contact-us/", "https://www.findmy.co.za/services/business/citivet-tamboerskloof/13272"]'
WHERE slug = 'citivet-tamboerskloof-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Knead Bakery & Cafe is an artisan bakery and neighbourhood cafe inside Lifestyle on Kloof, baking bread and pastries fresh on-site and serving breakfast, light meals, and coffee, with gluten-free options available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/knead-kloof-street/", "https://www.lifestyleonkloofct.co.za/browse-directory/1344/knead/", "https://www.kneadbakery.co.za/"]'
WHERE slug = 'knead-bakery-cafe-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mooi Hair Salon is a hair and beauty salon on Upper Orange Street offering cuts, tints, and highlights alongside a full grooming suite and nail services.',
    description_enriched_at = datetime('now'),
    hours = 'Tue 08:30-18:00, Wed-Fri 08:30-19:00, Sat 07:00-15:30',
    source_urls = '["https://www.fresha.com/lvp/mooi-hair-salon-upper-orange-street-cape-town-bx64vX", "https://mooihairsalon.co.za/2021/07/01/contact-us/", "https://www.findmy.co.za/services/business/mooi-hair-salon-cape-town/6551"]'
WHERE slug = 'mooi-hair-salon-oranjezicht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tamboers Winkel is a coffee shop and wine bar just off Kloof Street, known for its own-blend coffee, an all-day breakfast menu, and charcuterie and cheese platters served from 4pm alongside an extensive by-the-glass wine list.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-22:00, Sat 07:00-14:00, Sun 08:00-14:00',
    source_urls = '["https://www.eatout.co.za/venue/tamboers-winkel/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d4430137-Reviews-Tamboers_Winkel-Cape_Town_Central_Western_Cape.html", "https://coffeeshopblues.co.za/tamboers-winkel-tamboerskloof/"]'
WHERE slug = 'tamboers-winkel-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vadivelu is a modern South Indian restaurant on Kloof Street serving curries and dosas with a strong vegetarian and vegan selection; the restaurant is cashless, accepting cards only.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:00',
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/vadivelu/", "https://www.capetownetc.com/cape-town/restaurants/vadivelu-on-kloof-street/", "https://www.vadivelu.co.za/"]'
WHERE slug = 'vadivelu-gardens' AND description_enriched_at IS NULL;

-- Job 4: description enrichment sweep (7 businesses, full backlog)

UPDATE businesses
SET description = 'Anchor Bay Workation is an upmarket guest house in Three Anchor Bay with nine en-suite rooms, air conditioning and a dedicated co-working area featuring plug-in monitors, a soundproof meeting pod and complimentary Wi-Fi, aimed at travellers combining work and leisure. Guests also have access to a library, terrace and lobby fireplace, a short walk from Three Anchor Bay beach.',
    description_enriched_at = datetime('now')
WHERE slug = 'anchor-bay-workation-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bayflowers Guesthouse is a boutique guest house in a quiet Three Anchor Bay cul-de-sac, offering rooms with Atlantic Ocean, pool or garden views, a private terrace or balcony, a communal lounge with TV, on-site parking and a daily buffet breakfast.',
    description_enriched_at = datetime('now')
WHERE slug = 'bayflowers-guesthouse-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chinchilla Rooftop Cafe & Bar is a rooftop cocktail bar and restaurant on the second floor of The Promenade in Camps Bay, serving a continental menu of sushi, seafood platters and crudites alongside an extensive wine and whisky selection, with live DJs at sunset on weekends.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue Closed, Wed-Thu 16:00-22:00, Fri-Sun 12:00-22:00',
    source_urls = '["https://www.kovecollection.co.za/chinchilla/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d13190557-Reviews-Chinchilla_Rooftop_Cafe_Bar-Camps_Bay_Western_Cape.html", "https://www.therooftopguide.com/rooftop-bars-in-cape-town/chinchilla.html"]'
WHERE slug = 'chinchilla-rooftop-cafe-and-bar-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maartens Guesthouse is a stately Fresnaye bed and breakfast with a rooftop terrace and lush garden, set on the slopes of Lions Head between Camps Bay and the city bowl, with a tranquil salt-water swimming pool, free Wi-Fi and parking, and flat-screen TVs in every room.',
    description_enriched_at = datetime('now')
WHERE slug = 'maartens-guesthouse-fresnaye' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plant is an entirely vegan cafe inside The Promenade on Victoria Road in Camps Bay, serving breakfast through dinner with dishes from nachos and hand-crafted burgers to Asian tapas, including a vegan bobotie and seitan bao buns.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-21:00'
WHERE slug = 'plant-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Walden Suites is a stylish Fresnaye villa built in 1923, offering nine guest rooms with king, queen or twin beds, high ceilings and Atlantic Ocean views, plus a 17-metre lap pool and a continental breakfast, in a quiet spot sheltered from the wind.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-walden-suites-fresnaye' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Traders is one of four on-site dining and bar venues at The Bay Hotel in Camps Bay, alongside the hotel''s Tides breakfast restaurant, Bistro @ The Bay and Caamil''s Bar, and is highlighted by guests as one of the hotel''s bar venues with beachfront views.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thebayhotel.com/contact/", "https://www.campsbayapartments.com/camps-bay-restaurants/", "https://thebayhotel.com/restaurants/"]'
WHERE slug = 'traders-camps-bay' AND description_enriched_at IS NULL;

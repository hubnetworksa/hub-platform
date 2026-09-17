UPDATE businesses
SET description = 'Lindekroon Guest House is a cosy seven-room bed and breakfast in Hospital Park, with garden-view en-suite rooms featuring DStv, tea and coffee facilities, a hearty included breakfast, a boardroom for up to 12 people, and secure parking.',
    description_enriched_at = datetime('now')
WHERE slug = 'lindekroon-guest-house-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jorene''s Guest House is an owner-run seven-room guest house in Hospital Park offering en-suite rooms, most with kitchenette facilities, plus a swimming pool, dining hall, braai facilities and secure parking, a short walk from Peter Mokaba Stadium.',
    description_enriched_at = datetime('now')
WHERE slug = 'jorenes-guest-house-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Lofts Overnight Accommodation is a four-star graded guesthouse in Polokwane''s CBD offering lofts, an economy unit, standard and twin rooms across 15 sleeping rooms, plus a conference facility for up to 22 people and a cash bar and restaurant, a few minutes from Peter Mokaba Stadium.',
    description_enriched_at = datetime('now'),
    hours = 'Check-in 14:00-19:00, Check-out 10:00'
WHERE slug = 'the-lofts-overnight-accommodation-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Le Bistrot de Jan is a French bistro inside the InterContinental Table Bay hotel at the V&A Waterfront, serving classic bistro dishes such as steak Florentine and whole sole meuniere in a nostalgic, chandelier-lit dining room.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-15:00, 18:00-22:00'
WHERE slug = 'le-bistrot-de-jan-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Marble is a fire-driven fine-dining restaurant on the top floor of the historic Union Castle Building at the V&A Waterfront, with a rooftop bar and wrap-around views over the harbour.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-16:00, 17:00-22:00'
WHERE slug = 'marble-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tang is a Cape Town restaurant and bar serving pan-Asian dishes inspired by Japanese izakaya and Cantonese eatery traditions, at the V&A Waterfront.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-23:00'
WHERE slug = 'tang-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Waterside is a smart-casual restaurant on the V&A Waterfront harbour, part of the La Colombe restaurant group, offering indoor and outdoor deck dining with a reduced menu and a tasting menu option.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-14:00, 18:30-20:30'
WHERE slug = 'the-waterside-va-waterfront' AND description_enriched_at IS NULL;

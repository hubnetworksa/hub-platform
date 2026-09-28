UPDATE businesses
SET description = 'KFC Khaya Corner is a fast-food and takeaway restaurant at Khaya Corner shopping centre in Mandela Park, Khayelitsha.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-khaya-corner-mandela-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Khaya B&B Mandalay is a bed and breakfast guesthouse offering overnight accommodation in Mandalay, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'khaya-b-and-b-mandalay-mandalay' AND description_enriched_at IS NULL;

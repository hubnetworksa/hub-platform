UPDATE businesses
SET description = 'Tambourine is a small-plates restaurant on Harrington Street offering a seasonal, contemporary South African tasting menu of local meats, Cape fish and foraged ingredients, including plant-based dishes sourced from a regenerative farming project in Khayelitsha.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Thu 18:00-22:30, Fri-Sat 12:00-15:00 & 18:00-22:30, Sun-Mon Closed'
WHERE slug = 'tambourine-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medellin Harrington is a double-storey gentlemen''s grooming parlour on Harrington Street offering haircuts and styling, hot towel shaves, manicures, pedicures and massages.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-18:00, Sun & Public Holidays 10:00-15:00'
WHERE slug = 'medellin-harrington-district-six' AND description_enriched_at IS NULL;

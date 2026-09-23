UPDATE businesses
SET description = 'Taxila Secondary School is a public high school in Nirvana, Polokwane, teaching Grade 8 to Grade 12 with specialised streams in Sciences, Commerce, Humanities and Technology, and is recognised as one of Limpopo''s highest-performing public high schools, having posted a 95.6% matric pass rate in 2024.',
    description_enriched_at = datetime('now')
WHERE slug = 'taxila-secondary-school-nirvana' AND description_enriched_at IS NULL;

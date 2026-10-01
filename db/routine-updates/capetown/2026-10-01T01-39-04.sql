UPDATE businesses
SET description = 'Wizard Pets is a pet supply wholesaler and retailer in Grassy Park, offering leashes, harnesses, puppy kits, and scratch and puppy toys, with shipping available for customers outside Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'wizard-pets-grassy-park' AND description_enriched_at IS NULL;

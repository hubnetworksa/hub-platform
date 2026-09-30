UPDATE businesses
SET description = 'Motis Furniture Wholesalers is a furniture wholesaler based in Superbia, Polokwane, supplying furniture to the local area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-20:00, Sun Closed'
WHERE slug = 'motis-furniture-wholesalers-superbia' AND description_enriched_at IS NULL;

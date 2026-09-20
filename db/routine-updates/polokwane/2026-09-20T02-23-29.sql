UPDATE businesses
SET description = 'Virgin Active Polokwane is a full-service health club at the Pietersburg Sports Node in Polokwane, offering cardio and strength training areas, a swimming pool, a steam room, and a supervised kids'' facility for children aged 6 weeks to 7 years, alongside in-club personal training services.',
    description_enriched_at = datetime('now')
WHERE slug = 'virgin-active-polokwane-polokwane-central' AND description_enriched_at IS NULL;
